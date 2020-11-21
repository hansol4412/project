package member;

public class MemberDeleteService {
	private MemberDao memberDao;

	public MemberDeleteService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void deleteMember(String id) {
		Member member = memberDao.selectById(id);
		if(member == null) {
			throw new MemberNotFoundException();
		}
		memberDao.delete(member);
	}
	
}