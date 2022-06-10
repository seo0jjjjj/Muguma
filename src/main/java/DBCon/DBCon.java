package DBCon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private static Connection conn;
	
	private DBCon() {} 
	
	public static Connection getConnection() {
		if(conn!=null) {
			return conn;
		}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","gudtlr1004");
		} catch (ClassNotFoundException e) {
			System.out.println(e); // 드라이버 
		} catch (SQLException e) {
			System.out.println(e); // SQL 
		}
		
		return conn;
	}
}
