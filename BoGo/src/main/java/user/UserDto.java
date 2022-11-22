package user;

public class UserDto {
	
	private String id;
	private String pw;
	private String name;
	private String phNum;
	private String address;
	private String driveCode;
	private int accountType;
	
	public UserDto(String id, String pw, String name, String phNum, String address, String driveCode, int accountType) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phNum = phNum;
		this.address = address;
		this.driveCode = driveCode;
		this.accountType = accountType;
	}
	
	
	
	public UserDto(String pw, String name, String phNum, String address, String driveCode, String id) {
		super();
		this.pw = pw;
		this.name = name;
		this.phNum = phNum;
		this.address = address;
		this.driveCode = driveCode;
		this.id = id;
	}



	public String getId() {
		return id;
	}

//	public void setId(String id) {
//		this.id = id;
//	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhNum() {
		return phNum;
	}

	public void setPhNum(String phNum) {
		this.phNum = phNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDriveCode() {
		return driveCode;
	}

//	public void setDriveCode(String driveCode) {
//		this.driveCode = driveCode;
//	}
	
	public int getAccountType() {
		return accountType;
	}

	public void setAccountType(int accountType) {
		this.accountType = accountType;
	}
	
}
