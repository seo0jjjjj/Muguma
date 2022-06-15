/*
create table product(
	pid int default 1,
    productName varchar(10),
    productCategory varchar(10),
    prise varchar(100),
    productDescript varchar(200),
    primary key(pid)
);
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDTO;
import dto.UserDTO;

// 상품 정보를 가지고 있는 DAO
public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql="";
	private static ProductDAO instance;

	private ProductDAO() {
	}

	static {
		try {
			instance = new ProductDAO();
		} catch (Exception e) {
			throw new RuntimeException("Exception UserDao 인스턴스 생성 오류");
		}
	}

	// 싱글톤
	public static ProductDAO getInstance() {
		return instance;
	}

	public void connect() {
		this.conn = DBCon.getInstance().getConnection();
	}
	// db 연결 해제
	private void disconnect() {
		System.out.println("[ProductDAO] Disconnect 진행");
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
	
	// pid의 최댓값을 구함. (새로운 pid를 부여하기 위함)
	public int last_pid() {
		connect();
		String sql = "select Max(pid) from product";
		int max_pid = -1;
		try {

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			max_pid = rs.getInt("Max(pid)");
			System.out.println(max_pid);
			rs.close();
		}
		// sql에러
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return max_pid;
	}
	
	/// 상품 삽입
	public void insertProduct(ProductDTO product) {
		connect();
		try {
			sql="insert into Product values (?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, last_pid()+1);
			pstmt.setString(2, product.getProductName());
			pstmt.setString(3, product.getProductCategory());
			pstmt.setInt(4, product.getPrice());
			pstmt.setString(5, product.getProductDescript());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	/// 모든 상품 출력
	public ProductDTO getbyPid(int pid) {
		connect();
		ProductDTO product = new ProductDTO();
		try {
			sql="select * from Product where pid=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product.setPid(rs.getInt("pid")); 
				product.setProductName(rs.getString("productName"));
				product.setProductCategory(rs.getString("productCategory"));
				product.setPrice(rs.getInt("price"));
				product.setProductDescript(rs.getString("productDescript"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			product = null;
		} finally {
			disconnect();
		}
		return product;
	}
	
	public ProductDTO getAll() {
		connect();
		ProductDTO product = new ProductDTO();
		try {
			sql="select * from Product";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product.setPid(rs.getInt("pid"));
				product.setProductName(rs.getString("productName"));
				product.setProductCategory(rs.getString("productCategory"));
				product.setPrice(rs.getInt("price"));
				product.setProductDescript(rs.getString("productDescript"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return product;
	}
	//모든 상품의 리스트 출력
	public ArrayList<ProductDTO> getDBList() {
		connect();
		ArrayList<ProductDTO> datas = new ArrayList<>();
		String sql = "select * from product order by pid";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setPid(rs.getInt("pid"));
				product.setProductName(rs.getString("productName"));
				product.setProductCategory(rs.getString("productCategory"));
				product.setPrice(rs.getInt("price"));
				product.setProductDescript(rs.getString("productDescript"));
				datas.add(product);
			
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