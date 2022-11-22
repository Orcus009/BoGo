package car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBManager;

public class CarDao {

	private String url;
	private String user;
	private String password;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private CarDao() {
		this.url = "jdbc:mysql://database-1.c8ifb1k7bahn.ap-northeast-2.rds.amazonaws.com:3306/BoGo";
		this.user = "admin";
		this.password = "Yj8XCs2X9!7F";
		
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static CarDao instance = new CarDao();
	
	public static CarDao getInstance() {
		return instance;
	}
	
	// 차 전체 목록
	public ArrayList<CarDto> getCarAll(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "select * from car order by carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 차량 상세
	public CarDto getCarName(String carName) {
		CarDto car = null;
		String sql = "select * from car where carName = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, carName);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
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
		return car;
	}
	
	// 소형 차량
	public ArrayList<CarDto> getCarSmall(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'small' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 준중형 차량
	public ArrayList<CarDto> getCarMediumJ(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'medium_j' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 중형 차량
	public ArrayList<CarDto> getCarMedium(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'medium' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 대형 차량
	public ArrayList<CarDto> getCarBig(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'big' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 고급 차량
	public ArrayList<CarDto> getCarHighClass(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'highClass' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 수입 차량
	public ArrayList<CarDto> getCarInCome(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'income' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// rv 차량
	public ArrayList<CarDto> getCarRv(){
		ArrayList<CarDto> list = new ArrayList<CarDto>();
		String sql = "SELECT * FROM car WHERE carKind = 'rv' ORDER BY carName ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				String carKind = this.rs.getString(1);
				String carName = this.rs.getString(2);
				String carNum = this.rs.getString(3);
				int seatCnt = this.rs.getInt(4);
				int carPrice = this.rs.getInt(5);
				
				CarDto car = new CarDto(carKind, carName, carNum, seatCnt, carPrice);
				list.add(car);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
