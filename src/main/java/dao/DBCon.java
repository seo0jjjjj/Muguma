package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

///CONN을
public class DBCon {

	private static DBCon instance;
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	final String JDBC_URL = "com.mysql.jdbc.Driver";

	
	// static block을 이용한 singleton
	static {
		try {
			instance = new DBCon();
		} catch (Exception e) {
			throw new RuntimeException("Exception singleton 인스턴스 생성 오류");
		}
	}
	
	private DBCon() {
		initConnection(); //MYSQL 연결
	}

	public static DBCon getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		return conn;
	}
	public void dispose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	private void initConnection() {
		try {
			Class.forName(JDBC_URL);
			conn = DriverManager.getConnection("jdbc:mysql://localhost/muguma_db", "root", "hoseo1234");
		} catch (ClassNotFoundException e) {
			System.out.println(e); // 드라이버
		} catch (SQLException e) {
			System.out.println(e); // SQL
		}
		System.out.println("done connect init");
}

}
