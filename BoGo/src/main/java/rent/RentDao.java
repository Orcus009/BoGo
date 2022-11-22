package rent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class RentDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url;
	private String user;
	private String password;
	
	private RentDao() {
		this.url = "jdbc:mysql://database-1.c8ifb1k7bahn.ap-northeast-2.rds.amazonaws.com:3306/BoGo";
		this.user = "admin";
		this.password = "Yj8XCs2X9!7F";
	}
	
	private static RentDao instance = new RentDao();
	
	public static RentDao getInstance() {
		return instance;
	}
	
	// 운영자용 예약 내역 조회
	public ArrayList<RentDto> getRentAll() {
		ArrayList<RentDto> list = new ArrayList<RentDto>();
		String sql = "SELECT * FROM rent ORDER BY rentalDate ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				String user_id = this.rs.getString(1);
				String car = this.rs.getString(2);
				Timestamp rentalDate = this.rs.getTimestamp(3);
				String startDate = this.rs.getString(4);
				String endDate = this.rs.getString(5);
				int price = this.rs.getInt(6);
				
				RentDto rent = new RentDto(user_id, car, rentalDate, startDate, endDate, price);
				list.add(rent);
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
		return list;
	}
	
	// 이용자 별 예역 내약 조회
	public RentDto getRentUser(String user_id) {
		RentDto rent = null;
		String sql = "SELECT * FROM rent WHERE user_id = ? OREDER BY rentalDate";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, user_id);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				String car = this.rs.getString(2);
				Timestamp rentalDate = this.rs.getTimestamp(3);
				String startDate = this.rs.getString(4);
				String endDate = this.rs.getString(5);
				int price = this.rs.getInt(6);
				
				rent = new RentDto(user_id, car, rentalDate, startDate, endDate, price);
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
		return rent;
	}
	
	// 예약 날짜 대조
	public boolean checkRent(String car, String startDate, String endDate) {
		String sql = "SELECT * FROM rent WHERE((? <= startDate && startDate <= ?) || (? <= endDate && endDate <= ?) || (startDate <= ? && ? <= endDate)) && car = ?";
		boolean check = false;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, startDate);
			this.pstmt.setString(2, endDate);
			this.pstmt.setString(3, startDate);
			this.pstmt.setString(4, endDate);
			this.pstmt.setString(5, startDate);
			this.pstmt.setString(6, endDate);
			this.pstmt.setString(7, car);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				check = true;
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
		return check;
	}
	
	// 대여 예약
	public void createRent(RentDto rent) {
		String sql = "insert into rent values(?, ?, ?, ?, ?, ?)";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			
			this.pstmt.setString(1, rent.getUser_id());
			this.pstmt.setString(2, rent.getCar());
			this.pstmt.setTimestamp(3, rent.getRentalDate());
			this.pstmt.setString(4, rent.getStartDate());
			this.pstmt.setString(5, rent.getEndDate());
			this.pstmt.setInt(6, rent.getPrice());
			
			this.pstmt.execute();
			System.out.println("등록 성공");
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				
			}
		}
	}
	
}
