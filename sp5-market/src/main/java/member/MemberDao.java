package member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
public class MemberDao {
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Member selectById(String id) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where id = ?",
				new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException{ 
				Member member = new Member(
					rs.getString("id"),
					rs.getString("password"),
					rs.getString("name"),
					rs.getString("gender"),
					rs.getString("birth"),
					rs.getString("email"),
					rs.getString("phone"),
					rs.getString("address"),
					rs.getTimestamp("resist_day").toLocalDateTime());
				return member;
			}
		}, id);
		
		return results.isEmpty() ? null : results.get(0);
	}
	
	public Collection<Member> selectAll(){
		List<Member> results = jdbcTemplate.query("select * from MEMBER",
				new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException{ 
				Member member = new Member(
					rs.getString("id"),
					rs.getString("password"),
					rs.getString("name"),
					rs.getString("gender"),
					rs.getString("birth"),
					rs.getString("email"),
					rs.getString("phone"),
					rs.getString("address"),
					rs.getTimestamp("resist_day").toLocalDateTime());
				return member;
			}
		});
		
		return results;
	}
	
	public int count() {
		Integer count = jdbcTemplate.queryForObject(
				"select count(*) from MEMBER", Integer.class);
		return count;
	}
	
	//PreparedStatement의 set 메서드를 사용해서 직접 인덱스 파라미터의 값을 설정
	public void insert(Member member) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MEMBER (id, password, name, gender, birth, email, phone, address, regist_day) values(?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, member.getGender());
				pstmt.setString(5, member.getBirth());
				pstmt.setString(6, member.getEmail());
				pstmt.setString(7, member.getPhone());
				pstmt.setString(8, member.getAddress());
				pstmt.setTimestamp(9, Timestamp.valueOf(member.getRegiserDateTime())); 
				return pstmt;
			}
		}); 
	}
	
	public void update(Member member) {
		jdbcTemplate.update(
				"update MEMBER set password=?, name=?, gender=?, birth=?, email=?, phone=?, address=? where id=? ",
				member.getPassword(), member.getName(), member.getGender(), member.getBirth(), member.getEmail(), member.getPhone(), member.getAddress(), member.getId());
	}
	
	public void delete(Member member) {
		jdbcTemplate.update("delete from MEMBER where id=?",member.getId());
	}
	
	
}
