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

	private UserDAO() {
	}

	static {
		try {
			instance = new UserDAO();
		} catch (Exception e) {
			throw new RuntimeException("Exception UserDao 인스턴스 생성 오류");
		}
	}

	// 싱글톤
	public static UserDAO getInstance() {
		return instance;
	}

	// db 연결
	private void connect() {
		this.conn = DBCon.getInstance().getConnection();

		System.out.println("[UserDAO] Connection 초기화완료");
	}

	// db 연결 해제
	private void disconnect() {
		System.out.println("[UserDAO] Disconnect 진행");
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

	// uid의 최댓값을 구함. (새로운 uid를 부여하기 위함)
	public int last_uid() {
		connect();
		String sql = "select Max(uid) from user";
		int max_uid = -1;
		try {

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			max_uid = rs.getInt("Max(uid)");
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
		int uid = last_uid() + 1;
		connect();
		//
		String sql = "insert into user(uid,userID,userPassword,userName,userEmail,userTel,userAddress,Sex,authority) values(?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			System.out.println("▶ DB에 Insert 요청");
			pstmt.setInt(1, uid); // 가입시 기존 uid+1 부여
			pstmt.setString(2, userDTO.getUserID());
			pstmt.setString(3, userDTO.getUserPassword());
			pstmt.setString(4, userDTO.getUserName());
			pstmt.setString(5, userDTO.getUserEmail());
			pstmt.setString(6, userDTO.getUserTel());
			pstmt.setString(7, userDTO.getUserAddress());
			pstmt.setString(8, userDTO.getSex());
			pstmt.setString(9, userDTO.getAuthority());
			pstmt.executeUpdate();

			System.out.println("\t ▶ uid :" + uid); // 가입시 기존 uid+1 부여
			System.out.println("\t ▶ userID :" + userDTO.getUserID());
			System.out.println("\t ▶ userPassword :" + userDTO.getUserPassword());
			System.out.println("\t ▶ userName :" + userDTO.getUserName());
			System.out.println("\t ▶ userEmail :" + userDTO.getUserEmail());
			System.out.println("\t ▶ userTel :" + userDTO.getUserTel());
			System.out.println("\t ▶ userAddress :" + userDTO.getUserAddress());
			System.out.println("\t ▶ Sex :" + userDTO.getSex());
			System.out.println("\t ▶authority :" + userDTO.getAuthority());

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
	public boolean updatePW(int uid,String pw) {
		connect();
		String sql = "update user set userPassword=? where uid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, uid);
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
			pstmt.setInt(1, uid);
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
		String sql = "select * from user order by uid";

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

	public int login(String id, String pw) {
		int uid = 0;
		connect();
		String sql = "select * from user where userID=? AND userPassword=?";
		UserDTO userDTO = new UserDTO();
		try {
			// sql문 작성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			ResultSet rs = pstmt.executeQuery();
			// 반환된 sql문 분석
			if (rs.next()) {
				uid = rs.getInt("uid");
				System.out.println("uid:" + uid);

			} else {
				return -1;
			}

			rs.close();
		}
		// 해당 계정이 존재하지 않을 때, 예외 출력
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[UserDAO] 로그인 오류");

		} finally {
			disconnect();
		}
		return uid;
	}

	// 아이디 및 비밀번호찾기 에서 아이디를 찾는 작업
	public String findId(String userEmail) {

		connect();
		String sql = "select * from user where userEmail=?";
		String id = ""; // 아이디를 담는 객체
		try {
			// sql문 작성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);

			ResultSet rs = pstmt.executeQuery();
			// 반환된 sql문 분석
			if (rs.next()) { // id가 존재할경우
				id = rs.getString("userID");
				System.out.println("[UserDAO] 아이디 찾기 성공 (ID:" + id + ")");

			} else { // id가 없음.
				id = "error";
				System.out.println("[UserDAO] 해당 이메일에 존재하는 아이디가 없음.");
			}

			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[UserDAO] findId Exception");

		} finally {
			disconnect();
		}
		return id;
	}

	// 아이디 및 비밀번호찾기 에서 Uid 찾는 작업
	public int findUid (String userEmail, String userID) {
			
			connect();
			String sql = "select * from user where userEmail=? AND userID=?";
			int uid=0; // uid 
			try {
				// sql문 작성
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userEmail);
				pstmt.setString(2, userID);
				
				ResultSet rs = pstmt.executeQuery();
				// 반환된 sql문 분석
				if (rs.next()) {
					uid = rs.getInt("uid");
					System.out.println("[UserDAO] 비밀번호 찾기 성공 (UID:"+uid+")");
					
				} else {
					System.out.println("[UserDAO] 아이디와 이메일에 존재하는 아이디가 없음.");
					uid = -1;
				}

				rs.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				System.out.println("[UserDAO] findUid Exception");

			} finally {
				disconnect();
			}
			return uid;
		}
}
