package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import admin.vo.CategoryVO;
import admin.vo.ProductOptionVO;
import admin.vo.ProductVO;
import conn.GetConn;

public class ProductDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	CategoryVO categoryVO = null;
	ProductVO productvo = null;
	ProductOptionVO productOptionVO = null;
	
	// 중복되는 상품인지 체크
	public int productCheck(int cate_idx, String name) {
		int res = 0;
		try {
			sql = "SELECT * FROM product WHERE cate_idx = ? and name = ?	";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cate_idx);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {  // 상품이 이미 있으면 res = 1
				res = 1;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return res;
	}
	
	// 상품테이블에 데이터 등록
	public void setProductRegister(int idx, String name) {
		try {
			sql = "INSERT INTO product VALUES (default, ?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		}
	}
	
	// 상품 테이블의 IDX 가져오기
	public int getProductIdx(int cate_idx, String name) {
		int product_idx = 0;
		
		try {
			sql = "SELECT idx FROM product WHERE cate_idx = ? and name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cate_idx);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product_idx = rs.getInt("idx");
			}
			
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return product_idx;
	}
	
	// 카테고리 idx 찾기
	public int getCategoryIdx(String mainCategory, String middleCategory) {
		int cate_idx = 0;
		
		try {
			sql = "SELECT * FROM category WHERE main_name = ? and middle_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mainCategory);
			pstmt.setString(2, middleCategory);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cate_idx = rs.getInt("idx");
			}
			
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return cate_idx;
	}
	
	// productOption 테이블에 옵션 등록
	public int setProductOptionRegister(int product_idx, int price, String color, String size, int cnts, String photo,String content) {
		int res = 0;
		try {
			sql = "INSERT INTO productOption VALUES(default, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_idx);
			pstmt.setInt(2, price);
			pstmt.setString(3, color);
			pstmt.setString(4, size);
			pstmt.setInt(5, cnts);
			pstmt.setString(6, photo);
			pstmt.setString(7, content);
			pstmt.executeUpdate();
			res = 1;
			
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		} 
		return res;
	}

	
}
