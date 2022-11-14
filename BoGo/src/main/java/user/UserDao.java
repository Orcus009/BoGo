package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBManager;

public class UserDao {
	
	private String url;
	private String user;
	private String password;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	private UserDao() {
		this.url = "jdbc:mysql://database-1.c8ifb1k7bahn.ap-northeast-2.rds.amazonaws.com:3306/BoGo";
		this.user = "admin";
		this.password = "Yj8XCs2X9!7F";
		
		this.conn = null;
		this.pstmt = null;
		this.stmt = null;
		this.rs = null;
	}
	
	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	// CRUD
	// Create(계정 생성)
	public void createUser(UserDto user) {
		String sql = "INSERT INTO `user` VALUES(?, ?, ?, ?, ?, ?, ?);";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, user.getId());
			this.pstmt.setString(2, user.getPw());
			this.pstmt.setString(3, user.getName());
			this.pstmt.setString(4, user.getPhNum());
			this.pstmt.setString(5, user.getAddress());
			this.pstmt.setString(6, user.getDriveCode());
			this.pstmt.setInt(7, user.getAccountType());
			
			this.pstmt.execute();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Read
	// 이름과 번호로 ID 찾기
	public String getUserId(String name, String phNum) {
		String sql = "select * from `user` where `name` = ?, phNum = ?";
		
		String nameCk = name;
		String phNumCk = phNum;
		String idCk = "";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, nameCk);
			this.pstmt.setString(2, phNumCk);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				idCk = this.rs.getString(1);
			}
			
			else {
				idCk = null;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return idCk;
	}
	
	// 패스워드 찾기
	public String getUserPw(String id, String driveCode) {
		String sql = "select * from `user` where id = ?, driveCode = ?";
		
		String idCk = id;
		String driveCodeCk = driveCode;
		String pwCk = "";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, idCk);
			this.pstmt.setString(2, driveCodeCk);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				pwCk = this.rs.getString(2);
			}
			
			else {
				pwCk = null;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return pwCk;
	}
	
	// ID 중복검사
	public String userIdCheck(String id) {
		String sql = "select * from `user` where id=?";
		String idCheck = id;
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, idCheck);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				idCheck = id;
			} else {
				idCheck = null;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) { 
				e.printStackTrace();
			}
		}
		return idCheck;
	}
	
	
	// Update(회원정보 수정)
	public void updateUser(UserDto userDto) {
		
		String sql = "update `user` set pw = ?, `name` = ?, phNum = ?, address = ? where driveCode = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(2, userDto.getPw());
			this.pstmt.setString(3, userDto.getName());
			this.pstmt.setString(4, userDto.getPhNum());
			this.pstmt.setString(5, userDto.getAddress());
			this.pstmt.setString(6, userDto.getDriveCode());
			this.pstmt.execute();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Delete
	// 계정 삭제
	public void userDelete(String id) {
		String sql = "delete from `user` where id = '" + id + "';";
		System.out.println("sql : " + sql);
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.stmt = this.conn.createStatement();
			StringBuffer sb = new StringBuffer();
			sb.append(sql);
			int deleteCount = stmt.executeUpdate(sb.toString());
			if(deleteCount == 0) {
				System.out.println("삭제된 레코드가 없습니다");
			} else {
				System.out.println(deleteCount + "개의 레코드가 삭제되었습니다");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
