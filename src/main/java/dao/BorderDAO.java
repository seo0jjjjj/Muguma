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

import javax.swing.border.Border;

import dto.BorderDTO;

public class BorderDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	BorderDTO border = new BorderDTO();
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
	///글 쓰기 
	public void setBorder(BorderDTO border) {
		connect();
		try {
			sql="insert into Border values (?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, border.getBid());
			pstmt.setString(2, border.getTitle());
			pstmt.setString(3, border.getUserID());
			pstmt.setString(4, border.getContent());
			pstmt.setString(5, border.getDate());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
	}
	
	///모든 글 출력 
	public BorderDTO getBorder() {
		connect();
		try {
			sql="select * from Border";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				border.setBid(rs.getInt("bid"));
				border.setTitle(rs.getString("title"));
				border.setUserID(rs.getString("userID"));
				border.setContent(rs.getString("content"));
				border.setDate(rs.getString("data"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return border;
	}
}
