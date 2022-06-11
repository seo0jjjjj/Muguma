package dto;

public class BasketDTO {
	private int uid; //uid int
	private int pid; //pid int
	private String userName; //userName varchar(10)
	private String date; //date date

	public int getUid() {
		return uid;
	}
	public void setUid(int sid) {
		this.uid = sid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
