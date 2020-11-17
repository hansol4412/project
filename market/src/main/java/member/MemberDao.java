package member;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
	public void insert(Member member) {
		
	}
	
	public void update(Member member) {
		
	}
	
	public void delete(Member member) {
		
	}
	
	
}
