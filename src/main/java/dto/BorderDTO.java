package dto;
///Border 테이블의 DTO 각 항목들의 선언과 getter setter
public class BorderDTO {
	private int bid; //bid int default 1,
    private String title; //title varchar(20),
    private String userID; //userID varchar(10),
    private String content; //content varchar(200),
    private String date;//date date,
    
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
    
    
}
