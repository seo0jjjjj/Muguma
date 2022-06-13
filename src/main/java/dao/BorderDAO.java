/*
 #게시판 관리 테이블 
create table border(
	bid int default 1,
    title varchar(20),
    userID varchar(10),
    content varchar(200),
    date date,
    primary key(uid)
); 
 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.border.Border;

import dto.BorderDTO;

public class BorderDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql="";
	
	public void connect() {
		this.conn = DBCon.getInstance().getConnection();
	}
	// db 연결 해제
	private void disconnect() {
		System.out.println("[BorderDAO] Disconnect 진행");
		if (pstmt != null) {
			try {
				pstmt.close();
				System.out.println("▶ PreparedStatement Dispose 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				DBCon.getInstance().dispose();
				System.out.println("▶ DBCon에 dispose 요청 완료");
			} catch (Exception e) {
				e.printStackTrace();

			}
		}

	}
	
	//글쓰기 날짜 
	public String getDate() {
		String sql="select now()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return " ";
	}
	
	//글 번호 
	public int getBid() {
		String sql="select bid from border order by bid desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	///글 쓰기 
	public int setBorder(String title,String userID,String content) {
		connect();
		int bid=getBid();
		String date=getDate();
		try {
			sql="insert into Border values (?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setString(2, title);
			pstmt.setString(3, userID);
			pstmt.setString(4, content);
			pstmt.setString(5, date);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return -1;
	}
	
	///모든 글 출력 
	public ArrayList<BorderDTO> getBorder() {
		connect();
		sql="select * from Border";
		ArrayList<BorderDTO> datas=new ArrayList<BorderDTO>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BorderDTO border=new BorderDTO();
				border.setBid(rs.getInt("bid"));
				border.setTitle(rs.getString("title"));
				border.setUserID(rs.getString("userID"));
				border.setContent(rs.getString("content"));
				border.setDate(rs.getString("date"));
				datas.add(border);
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return datas;
	}
}
