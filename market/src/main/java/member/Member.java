package member;
import java.time.LocalDateTime;
import member.WrongIdPasswordException;
public class Member {
	private String id;
	private String password;
	private String name;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	private String address;
	private LocalDateTime regiserDateTime;
	
	public Member(String id, String password, String name, String gender, String birth, String email, String phone, String address,
			LocalDateTime regiserDateTime) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.regiserDateTime = regiserDateTime;
	}

	public String getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}
	
	public String getName() {
		return name;
	} 
	
	public String getGender() {
		return gender;
	}

	public String getBirth() {
		return birth;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public LocalDateTime getRegiserDateTime() {
		return regiserDateTime;
	}
	
	public boolean isMatchPassword(String confirmPassword) {
		return this.password.equals(confirmPassword);
	}
	
	public void changePassword(String oldPassword, String newPassword) {
		if(!oldPassword.equals(newPassword)) throw new WrongIdPasswordException();
		else this.password = newPassword;
	}
	
	
	
}
