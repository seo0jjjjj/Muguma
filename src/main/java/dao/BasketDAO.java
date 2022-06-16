package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import date.DateManager;
import dto.BasketDTO;

///장바구니(Basket)의 db를 사용하여 조회 조작하는 싱글톤클래스 
public class BasketDAO {
	Connection conn = null; //Connection
	PreparedStatement pstmt = null; //PreparedStatemnet

	private static BasketDAO instance; // 싱글톤 패턴

	private BasketDAO() {
	}// 싱글톤 패턴

	static {
		try {
			instance = new BasketDAO();
		} catch (Exception e) {
			throw new RuntimeException("Exception BasketDAO 인스턴스 생성 오류");
		}
	}// 싱글톤 패턴

	public static BasketDAO getInstance() {
		return instance;
	}// 싱글톤인스턴스를 가져오는 메서드

	// db 연결
	private void connect() {
		this.conn = DBCon.getInstance().getConnection();

		System.out.println("[BasketDAO] Connection 초기화완료");
	}// DBCon의 Connection을 가져오는 메서드

	// db 연결 해제
	private void disconnect() {
		System.out.println("[BasketDAO] Disconnect 진행");
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

	}// DBCon과 pstmt를 연결 해제하는 메서드

	// BasketDTO를 DB 테이블에 INSERT 하는 메서드
	public boolean insertDB(BasketDTO basketDTO) {
		connect();
	
		String sql = "insert into basket(uid,pid,userName,date) values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);

			System.out.println("▶ DB에 Insert 요청");
			pstmt.setInt(1, basketDTO.getUid()); // 가입시 기존 uid+1 부여
			pstmt.setInt(2, basketDTO.getPid());
			pstmt.setString(3, basketDTO.getUserName());
			pstmt.setString(4, DateManager.getDate());

			pstmt.executeUpdate();
			System.out.println("[BasketDAO] InsertDB"); // 가입시 기존 uid+1 부여
			System.out.println("\t ▶ uid :" + basketDTO.getUid()); // 가입시 기존 uid+1 부여
			System.out.println("\t ▶ pid :" + basketDTO.getPid());
			System.out.println("\t ▶ userName :" + basketDTO.getUserName());
			System.out.println("\t ▶ date :" + DateManager.getDate());

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
	//DB 테이블에서 해당 항목을 삭제하는 메서드
	public boolean deleteBasket(int uid, int pid) {
		connect();
		String sql = "delete from basket where uid=? AND pid=?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, pid);

			pstmt.executeUpdate();

			// sql에러
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	//DB 테이블에서 해당 UID에 해당하는 릴레이션 삭제함.
	public boolean deleteBasketbyUid(int uid) {
		connect();
		String sql = "delete from basket where uid=?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);

			pstmt.executeUpdate();

			// sql에러
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	//DB 테이블에서 해당 UID에 해당하는 투플을 삭제함.
	public BasketDTO getDB(int uid) {

		connect();
		String sql = "select * from basket where uid=?";
		BasketDTO basketDTO = new BasketDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				basketDTO.setUid(rs.getInt("uid"));
				basketDTO.setPid(rs.getInt("pid"));
				basketDTO.setUserName(rs.getString("userPassword"));
				basketDTO.setDate(rs.getString("date"));
			} else {
				basketDTO = null;
				rs.close();
				System.out.println("[basketDAO] uid에 맞는 basket존재x");
			}
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return basketDTO;
	}

	//모든 릴레이션 인스턴스를 ArrayList로 가져옴.
	public ArrayList<BasketDTO> getDBList(int uid) {
		connect();
		ArrayList<BasketDTO> datas = new ArrayList<>();
		String sql = "select * from basket where uid=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				BasketDTO basketDTO = new BasketDTO();
				basketDTO.setUid(rs.getInt("uid"));
				basketDTO.setPid(rs.getInt("pid"));
				basketDTO.setUserName(rs.getString("userName"));
				basketDTO.setDate(rs.getString("date"));
				datas.add(basketDTO);
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
