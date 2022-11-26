<%@page import="rent.RentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rent.RentDao"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/rentHistory.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
HttpSession sessionCheck = request.getSession();
String log = (String)session.getAttribute("log");

UserDao uDao = UserDao.getInstance();
UserDto user = uDao.getUserInfo(log);

RentDao dao = RentDao.getInstance();
ArrayList<RentDto> list1 = dao.getRentAll();
ArrayList<RentDto> list2 = dao.getRentUserId(log);

int at = -1;
if(log != null)
	at = user.getAccountType();
%>
<div class="history">
	<table>
		<thead>
			<tr>
				<%if(at == 7) {%>
				<th>아이디</th>
				<th>차량</th>
				<th>대여 신청 날짜</th>
				<th>대여 시작 날짜</th>
				<th>대여 종료 날짜</th>
				<th>가격</th>
				<%} else if(at == 1){%>
				<th>차량</th>
				<th>대여 신청 날짜</th>
				<th>대여 시작 날짜</th>
				<th>대여 종료 날짜</th>
				<th>가격</th>
				<%} %>
			</tr>
		</thead>
		<tbody>
			<%if(at == 7) {%>
			<%for(RentDto rent1 : list1){ %>
			<tr>
				<td><%=rent1.getUser_id() %></td>
				<td><%=rent1.getCar() %></td>
				<td><%=rent1.getRentalDate() %></td>
				<td><%=rent1.getStartDate() %></td>
				<td><%=rent1.getEndDate() %></td>
				<td><%=rent1.getPrice() %></td>
			</tr>
			<%}} 
			else if(at == 1) {%>
			<%for(RentDto rent2 : list2){ %>
			<tr>
				<td><%=rent2.getCar() %></td>
				<td><%=rent2.getRentalDate() %></td>
				<td><%=rent2.getStartDate() %></td>
				<td><%=rent2.getEndDate() %></td>
				<td><%=rent2.getPrice() %></td>
			</tr>
			<%}} %>
		</tbody>
	</table>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>