package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import Beans.UserBean;

public class userDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	void connect() {
		this.conn = DBCon.getConnection();
	}
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	boolean insertDB() {}
	
	boolean updateDB(UserDTO userDTO) {
		connect();
		String sql = "update table set "
	}
	
	boolean deleted(int ab_id) {}
	
	boolean getDB(int ab_id) {}
	
	ArrayList<E> getDBList() {}
	
}
