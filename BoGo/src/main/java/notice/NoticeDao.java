package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class NoticeDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url;
	private String user;
	private String password;
	
	private NoticeDao() {
		this.url="jdbc:mysql://database-1.c8ifb1k7bahn.ap-northeast-2.rds.amazonaws.com:3306/BoGo";
		this.user="admin";
		this.password="Yj8XCs2X9!7F";
	}
	
	private static NoticeDao instance = new NoticeDao();
	
	public static NoticeDao getInstance() {
		return instance;
	}
	
	// 공지 번호
	private int noGene() {
		String sql = "select max(`no`) from notice";
		int no = 0;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				no = this.rs.getInt(1);
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
		return ++no;
	}
	
	// 공지 작성
	public void createNotice(NoticeDto notice) {
		String sql = "insert into notice values(?, ?, ?, ?, ?, ?, ?)";
		int no = noGene();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			
			this.pstmt.setInt(1, no);
			this.pstmt.setString(2, notice.getUser_id());
			this.pstmt.setString(3, notice.getTitle());
			this.pstmt.setString(4, notice.getContent());
			
			Timestamp now = new Timestamp(System.currentTimeMillis());
			
			this.pstmt.setTimestamp(5, now);
			this.pstmt.setTimestamp(6, now);
			this.pstmt.setInt(7, 7);
			
			this.pstmt.execute();
			System.out.println("공지 등록 성공");
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
	
	// 공지 목록
	public ArrayList<NoticeDto> getNoticeAll(){
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		String sql = "select * from notice order by `no` ASC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.rs = pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				String user_id = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Timestamp regDate = this.rs.getTimestamp(5);
				Timestamp modDate = this.rs.getTimestamp(6);
				int accountType = this.rs.getInt(7);
				
				NoticeDto notice = new NoticeDto(no, user_id, title, content, regDate, modDate, accountType);
				list.add(notice);
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
	
	// 공지 읽기
	public NoticeDto getNoticeOne(int no) {
		NoticeDto notice = null;
		String sql = "select * from notice where `no` = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.rs = pstmt.executeQuery();
			
			if(this.rs.next()) {
				String title = this.rs.getString(2);
				String user_id = this.rs.getString(3);
				String content = this.rs.getString(4);
				Timestamp regDate = this.rs.getTimestamp(5);
				Timestamp modDate = this.rs.getTimestamp(6);
				int accountType = this.rs.getInt(7);
				
				notice = new NoticeDto(no, title, user_id, content, regDate, modDate, accountType);
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
		return notice;
	}
	
	// 공지 수정
	public void updateNotice(NoticeDto notice) {
		String sql = "update notice set title = ? , content = ?, modDate = ? where `no` = ?";
		
		int no = notice.getNo();
		String title = notice.getTitle();
		String content = notice.getContent();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			
			this.pstmt.setString(1, title);
			this.pstmt.setString(2, content);
			
			Timestamp now = new Timestamp(System.currentTimeMillis());
			
			this.pstmt.setTimestamp(3, now);
			this.pstmt.setInt(4, no);
			
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
	
	// 공지 삭제
	public void deleteNotice(int no) {
		String sql = "delete from notice where `no` = ?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
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
	
}
