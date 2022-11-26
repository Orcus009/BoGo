<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/rentCheck.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<%
	HttpSession sessionCheck = request.getSession();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Timestamp now = new Timestamp(System.currentTimeMillis());
	String timeNow = sdf.format(now);
	request.setCharacterEncoding("utf-8");
	
	String user_id = (String)sessionCheck.getAttribute("log");
	String carName = request.getParameter("carName");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String rentalDate = timeNow;
	int carPrice = Integer.parseInt(request.getParameter("carPrice"));
	int animal = Integer.parseInt(request.getParameter("animal"));
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	Date sdf11 = sdf1.parse(startDate);
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	Date sdf22 = sdf2.parse(endDate);
	
	long diffDays = (sdf22.getTime() - sdf11.getTime())/(1000*24*60*60);
	
	if(startDate.equals(endDate)) {
		carPrice = (int)(carPrice * 0.7 + animal + 15000);
	}
	else { 
		carPrice = (int)(carPrice * diffDays + animal + 15000);
	}
	
%>

<section>
	<form method="post" action="RentAction">
		<input type="hidden" id="user_id" name="user_id" value="<%=user_id %>">
		<input type="hidden" id="carName" name="carName" value="<%=carName %>">
		<input type="hidden" id="rentalDate" name="rentalDate" value="<%=rentalDate %>">
		<input type="hidden" id="startDate" name="startDate" value="<%=startDate %>">
		<input type="hidden" id="endDate" name="endDate" value="<%=endDate %>">
		<input type="hidden" id="carPrice" name="carPrice" value="<%=carPrice %>">

		<div class="checkBox">
			<input type="hidden" id="user_id" name="user_id" value="<%=user_id%>">
			<div class="box">
				<h2>차량 명</h2>
				<div class="carName"><%=carName %></div>
			</div>
			<div class="box">
				<h2>예약을 한 날짜</h2>
				<div class="rentalDate"><%=rentalDate %></div>
			</div>
			<div class="box">
				<h2>렌트 시작 날짜</h2>
				<div class="startDate"><%=startDate %></div>
			</div>
			<div class="box">
				<h2>렌트 종료 날짜</h2>
				<div class="endDate"><%=endDate %></div>
			</div>
			<div class="box">
				<h2>가격</h2>
				<div class="carPrice"><%=carPrice %>원</div>
			</div>
			<div class="box">
	        	<input type="submit" value="대여 예약" style="cursor:pointer" class="submit-btn">
			</div>
		</div>
	</form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>