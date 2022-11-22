<%@page import="notice.NoticeDto"%>
<%@page import="notice.NoticeDao"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<%
	String log = (String)session.getAttribute("log");
	
	UserDao uDao = UserDao.getInstance();
	UserDto user = uDao.getUserInfo(log);
	
	int at = -1;
	if(log != null)
		at = user.getAccountType();
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto notice = null;
	
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("no") != null){
		int no = Integer.parseInt(request.getParameter("no"));
		notice = dao.getNoticeOne(no); 
	%>
	
	<form method="post" name="form">
		<input type="hidden" name="noticeNo" id="noticeNo" value="<%=no%>">
		<input type="text" name="title" value="<%=notice.getTitle() %>"<%if(log != null && log.equals("Owner")) {%><%} %>>
		<textarea rows="20" name="content" <%if(log == null){%>readonly<%} %>><%=notice.getContent() %></textarea>
		<input type="button" onclick="location.href='notice'" value="글목록">
	
		<% 
		if(at == 7){
			%>
			<input type="submit" onclick="javascript: form.action='NoticeDelete';" value="삭제">
			<input type="submit" onclick="javascript: form.action='NoticeUpdate';" value="수정">
		<%} %>
	</form>
	<%} 
	else {
		response.sendRedirect("notice");
	}%>
<jsp:include page="footer.jsp" />
</body>
</html>