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
	// 유저 정보
	public UserDto getUserInfo(String id) {
		UserDto user = null;
		String sql = "select * from `user` where id = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String pw = this.rs.getString(2);
				String name = this.rs.getString(3);
				String phNum = this.rs.getString(4);
				String address = this.rs.getString(5);
				String driveCode = this.rs.getString(6);
				int accountType = this.rs.getInt(7);
				
				user = new UserDto(id, pw, name, phNum, address, driveCode, accountType);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	// pw 확인
	public String getUserPwDel(String pw) {
		String sql = "select * from `user` where pw=?";
		String pwCheck = pw;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, pwCheck);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				pwCheck = pw;
			}
			
			else {
				pwCheck = null;
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
		
		return pwCheck;
	}
	
	// ID 확인
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
		
		String sql = "UPDATE `user` SET pw=?, `name`=?, phNum=?, address=?, driveCode=? WHERE id=?;";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, userDto.getPw());
			this.pstmt.setString(2, userDto.getName());
			this.pstmt.setString(3, userDto.getPhNum());
			this.pstmt.setString(4, userDto.getAddress());
			this.pstmt.setString(5, userDto.getDriveCode());
			this.pstmt.setString(6, userDto.getId());
			
			this.pstmt.execute();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
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
