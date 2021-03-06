package member;

public class ChangePasswordService {
	private MemberDao memberDao;

	public ChangePasswordService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void changePassword(String id, String oldPassword, String newPassword) {
	Member member = memberDao.selectById(id);
	if(member == null) {
		throw new MemberNotFoundException();
	}
	member.changePassword(oldPassword, newPassword);
	memberDao.update(member);
	}
	
}
