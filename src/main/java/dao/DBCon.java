package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

///Connection을 싱글톤으로 구현하는 클래스
public class DBCon {

	private static DBCon instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	final String JDBC_URL = "com.mysql.cj.jdbc.Driver";

	// static block을 이용한 singleton
	static {
		try {
			instance = new DBCon();
		} catch (Exception e) {
			throw new RuntimeException("Exception singleton 인스턴스 생성 오류");
		}
	}

	private DBCon() { // 생성자
		initConnection(); // MYSQL 연결
	}

	public static DBCon getInstance() {
		return instance;
	}

	public Connection getConnection() {
		if (conn == null)
			initConnection();
		return conn;
	}

	public void dispose() {
		if (conn != null) {
			try {
				conn.close();
				conn = null;
				System.out.println("▶ [DBCon] Connection closed 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean initConnection() {
		boolean isCon = false;
		try {
			Class.forName(JDBC_URL);
			conn = DriverManager.getConnection("jdbc:mysql://localhost/muguma_db", "root", "hoseo1234");
			isCon = true; // DB 연결 성공!
			System.out.println("[DBCon] conn 초기화 ");
		} catch (ClassNotFoundException e) {
			System.out.println(e); // 드라이버 연결
			isCon = false;
		} catch (SQLException e) {
			System.out.println(e); // SQL
			isCon = false;
		} finally {
			return isCon;
		}
	}

	
}
