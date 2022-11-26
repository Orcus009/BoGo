<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="rent.RentDao"%>
<%@page import="car.CarDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="car.CarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/carDetail.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<%
String carName = (String)request.getParameter("carName");

CarDao dao = CarDao.getInstance();
CarDto list = dao.getCarName(carName);
%>

<img src="resources/img/<%=list.getCarName() %>.png" class="carImg">
<div class="info">
	<ul>
		<li class="top">차랑명 : <%=list.getCarName()%></li>
		<li>번호판 : <%=list.getCarNum() %></li>
		<li>탑승인원 : <%=list.getSeatCnt() %>인승</li>
		<li>가격 : <%=list.getCarPrice() %>원 (1일 기준)</li>
	</ul>
</div>
<div class="menus">
	<div class="menu">
		<a class="btn" data-sec="startDate" href="#">예약하러 가기</a>
	</div>
</div>
<div>
<%
HttpSession sessionCheck = request.getSession();
String log = (String)sessionCheck.getAttribute("log");
RentDao rent = RentDao.getInstance();
%>
<section>
	<form class="reserve" method="post">
	
	<div class="wrap">
		<h2>예약 날짜</h2>
		<input id="startDate" required name="startDate" type="date">
	</div>
	
	<div class="wrap">
		<h2>종료 날짜</h2>
		<input id="endDate" required name="endDate" type="date">
		<h3>※차량을 1일 안으로 대여할 경우 원 가격의 70%로 대여</h3>
	</div>
	
	<div class="wrap">
		<h2>애완동물 탑승 여부</h2>
		<label>Yes</label><input type="radio" required name="animal" value="20000"/>
		<label>No</label><input type="radio" required name="animal" value="0"/>
		<h3>애완동물 동반 탑승 시 20000원 별도.</h3>
	</div>
	
	<div class="wrap">
		<h3>※주의※</h3>
		<h3>Yes에 체크를 안하고 애완동물 동반 탑승 적발 시 60000원 과태료 발생</h3>
	</div>
	
	<div class="wrap">
		<h2>자차보험 : 15000원 별도</h2>
	</div>
	
	<input id="reserve" type="button" value="대여 예약" style="cursor:pointer" onclick="checkRental()">
    <%
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    
    boolean check = rent.checkRent(carName, startDate, endDate);
    %>
    
    <input type="hidden" id="carName" name="carName" value="<%=list.getCarName()%>">
	<input type="hidden" id="check" value="<%=check%>">
	<input type="hidden" id="log" value="<%=log%>">
	<input type="hidden" id="carPrice" name="carPrice" value="<%=list.getCarPrice()%>">
	
	</form>
</section>
</div>
<jsp:include page="footer.jsp" />
<script src="resources/carDetail.js"></script>
</body>
</html>