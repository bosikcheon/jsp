package study2.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DbTestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	DbTestVO vo = null;
	
	public DbTestDAO() {
		String url = "jdbc:mysql://localhost:3306/javagroup";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("Databse 연동 실패 : " + e.getMessage());
		}
	}
	
	// 사용하지 않는 객체 반납(conn, pstmt, rs)
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	// 개별 자료 검색...1건 검색
	public DbTestVO getDbTestSearch(int idx) {
		try {
			sql = "select * from hoewon where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 전체 자료 출력
	public ArrayList<DbTestVO> getDbTestList(String name) {
		ArrayList<DbTestVO> vos = new ArrayList<DbTestVO>();
		try {
			if(name.equals("")) {
				sql = "select * from hoewon order by idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select * from hoewon where name = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 자료 등록
	public int setDbInputOk(DbTestVO vo) {
		int res = 0;
		try {
			sql = "insert into hoewon values (default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getAddress());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 개인 정보 수정처리
	public int setDbUpdateOk(DbTestVO vo) {
		int res = 0;
		try {
			sql = "update hoewon set name=?,age=?,gender=?,address=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getAddress());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 정보 삭제처리
	public int setDbDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from hoewon where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
