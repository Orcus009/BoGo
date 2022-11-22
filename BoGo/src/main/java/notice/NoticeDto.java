package notice;

import java.sql.Timestamp;

public class NoticeDto {

	private int no;
	private String user_id;
	private String title;
	private String content;
	private Timestamp regDate;
	private Timestamp modDate;
	private int accountType;
	
	// 공지 읽기
	public NoticeDto(int no, String user_id, String title, String content, Timestamp regDate, Timestamp modDate, int accountType) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.accountType = accountType;
	}
	
	// 공지 쓰기
	public NoticeDto(String title, String content, String user_id) {
		super();
		this.title = title;
		this.content = content;
		this.user_id = user_id;
	}
	
	// 공지 업뎃
	public NoticeDto(String title, String content, int no) {
		super();
		this.title = title;
		this.content = content;
		this.no = no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Timestamp getModDate() {
		return modDate;
	}

	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}

	public int getAccountType() {
		return accountType;
	}

	public void setAccountType(int accountType) {
		this.accountType = accountType;
	}
	
}
