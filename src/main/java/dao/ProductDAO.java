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
import java.util.List;

import dto.ProductDTO;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql="";
	
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
	/// 상품 삽입
	public void setProduct(ProductDTO product) {
		connect();
		try {
			sql="insert into Product values (?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPid());
			pstmt.setString(2, product.getProductName());
			pstmt.setString(3, product.getProductCategory());
			pstmt.setString(4, product.getPricse());
			pstmt.setString(5, product.getProductDescript());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	/// 모든 상품 출력
	public ProductDTO getProduct() {
		connect();
		ProductDTO product = new ProductDTO();
		try {
			sql="select * from Product";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product.setPid(rs.getInt("pid"));
				product.setProductName(rs.getString("productName"));
				product.setProductName(rs.getString("productCategory"));
				product.setProductName(rs.getString("prise"));
				product.setProductName(rs.getString("productDescript"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return product;
	}
	
	/// 상품 검색 출력 
	public int selectProduct() {
		return -1;
	}
}
