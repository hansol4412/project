package member;
import java.time.LocalDateTime;
public class MemberRegisterService {
	private MemberDao memberDao;

	public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public String regist(RegisterRequest req) {
		Member member = memberDao.selectById(req.getId());
		if(member != null) {
			throw new DuplicateMemberException("dup id : " + req.getId());
		}
		
		Member newMember = new Member(req.getId(), req.getPassword(), req.getName(), req.getGender(),
									req.getBirth(), req.getEmail(), req.getPhone(), req.getAddress(),
									LocalDateTime.now());
		memberDao.insert(newMember);
		return newMember.getId();
	}	
}
