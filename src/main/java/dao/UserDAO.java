package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.UserDTO;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	private static UserDAO instance;
	private UserDAO() {}
	static {
		try {
			instance = new UserDAO();
		} catch (Exception e) {
			throw new RuntimeException("Exception UserDao 인스턴스 생성 오류");
		}
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	public void connect() {
		this.conn = DBCon.getInstance().getConnection();
	}

	public void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
	}
	//uid의 최댓값을 구함. (새로운 uid를 부여하기 위함)
	public int last_uid() {
		connect();
		String sql = "select Max(uid) from user";
		int max_uid = -1;
		try {
			
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			max_uid =rs.getInt("Max(uid)");
			System.out.println(max_uid);
			rs.close();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return max_uid;
	}
//INSERT문 
	public boolean insertDB(UserDTO userDTO) {
		connect();
		//
		String sql = "insert into user(uid,userID,userPassword,userName,userEmail,userTel,userAddress,Sex,authority) values(?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userDTO.getUid());
			pstmt.setString(2, userDTO.getUserID());
			pstmt.setString(3, userDTO.getUserPassword());
			pstmt.setString(4, userDTO.getUserName());
			pstmt.setString(5, userDTO.getUserEmail());
			pstmt.setString(6, userDTO.getUserTel());
			pstmt.setString(7, userDTO.getUserAddress());
			pstmt.setString(8, userDTO.getSex());
			pstmt.setString(9, userDTO.getAuthority());
			pstmt.executeUpdate();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	

	public boolean updateDB(UserDTO userDTO) {
		connect();
		String sql = "update user set userID=?,userPassword=?,userName=?,userEmail=?,userTel=?,userAddress=?,Sex=?,authority=? where uid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userDTO.getUid());
			pstmt.setString(2, userDTO.getUserID());
			pstmt.setString(3, userDTO.getUserPassword());
			pstmt.setString(4, userDTO.getUserName());
			pstmt.setString(5, userDTO.getUserEmail());
			pstmt.setString(6, userDTO.getUserTel());
			pstmt.setString(7, userDTO.getUserAddress());
			pstmt.setString(8, userDTO.getSex());
			pstmt.setString(9, userDTO.getAuthority());
			pstmt.executeUpdate();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public boolean deleted(int uid) {
		connect();
		String sql = "delete from user where uid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public UserDTO getDB(int uid) {
		connect();
		String sql = "select * from user where uid=?";
		UserDTO userDTO = new UserDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			userDTO.setUid(rs.getInt("uid"));
			userDTO.setUserID(rs.getString("userID"));
			userDTO.setUserPassword(rs.getString("userPassword"));
			userDTO.setUserName(rs.getString("userName"));
			userDTO.setUserEmail(rs.getString("userEmail"));
			userDTO.setUserTel(rs.getString("userTel"));
			userDTO.setUserAddress(rs.getString("userAddress"));
			userDTO.setSex(rs.getString("Sex"));
			userDTO.setAuthority(rs.getString("authority"));
			rs.close();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return userDTO;
	}

	public ArrayList<UserDTO> getDBList() {
		connect();
		ArrayList<UserDTO> datas = new ArrayList<>();
		String sql = "select * from user order by uid desc";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				UserDTO userDTO = new UserDTO();
				userDTO.setUid(rs.getInt("uid"));
				userDTO.setUserID(rs.getString("userID"));
				userDTO.setUserPassword(rs.getString("userPassword"));
				userDTO.setUserName(rs.getString("userName"));
				userDTO.setUserEmail(rs.getString("userEmail"));
				userDTO.setUserTel(rs.getString("userTel"));
				userDTO.setUserAddress(rs.getString("userAddress"));
				userDTO.setSex(rs.getString("Sex"));
				userDTO.setAuthority(rs.getString("authority"));
				datas.add(userDTO);
			}
			rs.close();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;

	}

}
