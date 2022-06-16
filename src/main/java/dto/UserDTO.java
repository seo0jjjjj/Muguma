package dto;
///User 테이블의 DTO 각 항목들의 선언과 getter setter
public class UserDTO {

	private int uid;
	private String userID; //varchar(20), key 
	private String userPassword; //varchar(20),
	private String userName; //varchar(20),
	private String userEmail; //varchar(20),
	private String userTel; //varchar(12),
	private String userAddress; //varchar(50),
	private String Sex; //varchar(5),
	private String authority;
	
	public int getUid() { 
		return uid; //setter
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
