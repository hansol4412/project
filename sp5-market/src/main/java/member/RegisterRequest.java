package member;

import java.time.LocalDateTime;

public class RegisterRequest {
	private String id;
	private String password;
	private String confirmPassword;
	private String name;
	private String gender;
	private String birthyy;
	private String birthmm;
	private String birthdd;
	private String birth;
	private String email1;
	private String email2;
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	private String phone;
	private String address;
	private LocalDateTime regiserDateTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	// �깮�씪
	public void setBirthyy(String birthyy) {
		this.birthyy = birthyy;
	}
	
	public void setBirthmm(String birthmm) {
		this.birthmm = birthmm;
	}
	
	public void setBirthdd(String birthdd) {
		this.birthdd = birthdd;
	}
	public String getBirthyy() {
		return birthyy;
	}
	public String getBirthmm() {
		return birthmm;
	}
	public String getBirthdd() {
		return birthdd;
	}
	public String getBirth() {
		return birthyy +"-"+ birthmm +'-'+birthdd;
	}
	
	//�씠硫붿씪
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	public String getEmail1() {
		return email1;
	}
	public String getEmail2() {
		return email2;
	}
	public String getEmail() {
		return email1 +"@"+email2;
	}
	
	//�쟾�솕踰덊샇 
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPhone1() {
		return phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public String getPhone() {
		return phone1 +"-" + phone2 + "-" + phone3;
	}
	

	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public LocalDateTime getRegiserDateTime() {
		return regiserDateTime;
	}
	public void setRegiserDateTime(LocalDateTime regiserDateTime) {
		this.regiserDateTime = regiserDateTime;
	}
	
	public boolean isPasswordEqualsToConfirmPassword() {
		return password.equals(confirmPassword);
	}
	
}

