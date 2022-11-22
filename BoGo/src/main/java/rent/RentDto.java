package rent;

import java.sql.Timestamp;

public class RentDto {

	private String user_id;
	private String car;
	private Timestamp rentalDate;
	private String startDate;
	private String endDate;
	private int price;
	
	public RentDto(String user_id, String car, Timestamp rentalDate, String startDate, String endDate, int price) {
		super();
		this.user_id = user_id;
		this.car = car;
		this.rentalDate = rentalDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public Timestamp getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(Timestamp rentalDate) {
		this.rentalDate = rentalDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
