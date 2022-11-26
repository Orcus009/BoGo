<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@page import="notice.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/notice.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section>
	<%
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.getNoticeAll();
	
	int pageNum = 1;
	if(request.getParameter("page") != null){
		pageNum = Integer.parseInt(request.getParameter("page"));
	}
	
	int pageCnt = list.size() / 10;
	if(list.size() == 0 || list.size() % 10 > 0){
		pageCnt ++;
	}
	
	System.out.println(pageCnt);
	
	// 스타트 번호
	int startNum = list.size() - 1 - (pageNum - 1) * 10;
	int cnt = 10;
	if(list.size() - (pageNum - 1) * 10 < 10){
		cnt = list.size() % 10;
	}
	int endNum = startNum - cnt;
	
	String log = (String)session.getAttribute("log");
	
	UserDao uDao = UserDao.getInstance();
	UserDto user = uDao.getUserInfo(log);
	
	int at = -1;
	if(log != null)
		at = user.getAccountType();
	%>
	<div class="notice"><h1>공지사항</h1></div>
	<%if(at == 7) {%>
		<button class="NoticeWrite" onclick="location.href='noticeWrite'">글 작성</button>
	<%} %>
	<input type="hidden" name="page" value="<%=pageNum %>">
	<table class="notice_table">
		<thead>
			<tr>
				<th class="title">제목</th>
				<th class="id">아이디</th>
				<th class="regDate">등록 날짜</th>
				<th class="modDate">수정 날짜</th>
			</tr>
		</thead>
		<tbody>
			<%for(int i = startNum ; i > startNum - 10 ; i --){ 
				if(i > endNum){
				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
			%>
				<tr>
					<td class="title"><a href="noticeRead?no=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle() %></a></td>
					<td class="id">운영자</td>
					<td class="regDate"><%=sdf.format(list.get(i).getRegDate()) %></td>
					<td class="modDate"><%=sdf.format(list.get(i).getModDate()) %></td>
				</tr>
				<%} else {%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			<%}} %>
		</tbody>
	</table>
	<div class="pageBtn">
		<%for(int i = 0 ; i < pageCnt ; i ++) {
			int num = i + 1;%>
		<a href = "http://localhost:8081/BoGo/notice?page=<%=num %>"><%=num %></a>
		<%} %>
	</div>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>