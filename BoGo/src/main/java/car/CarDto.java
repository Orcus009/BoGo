package car;

public class CarDto {

	private String carkind;
	private String carName;
	private String carNum;
	private int seatCnt;
	private int carPrice;
	
	public CarDto(String carKind, String carName, String carNum, int seatCnt, int carPrice) {
		super();
		this.carkind = carKind;
		this.carName = carName;
		this.carNum = carNum;
		this.seatCnt = seatCnt;
		this.carPrice = carPrice;
	}

	public String getCarkind() {
		return carkind;
	}

	public void setCarkind(String carkind) {
		this.carkind = carkind;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public int getSeatCnt() {
		return seatCnt;
	}

	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}

	public int getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	
}
