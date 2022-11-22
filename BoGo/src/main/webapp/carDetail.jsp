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
    <link rel="stylesheet" href="resource/detail.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String carName = (String)request.getParameter("carName");

CarDao dao = CarDao.getInstance();
CarDto list = dao.getCarName(carName);
%>

<div class="info">
	<ul>
		<li><img src="resources/img/<%=list.getCarName() %>.png"></li>
		<li><%=list.getCarName()%></li>
		<li><%=list.getCarNum() %></li>
		<li><%=list.getSeatCnt() %>인승</li>
		<li><%=list.getCarPrice() %>원 (1일 기준)</li>
	</ul>
</div>

<div>
<%
HttpSession sessionCheck = request.getSession();
String log = (String)sessionCheck.getAttribute("log");
RentDao rent = RentDao.getInstance();
%>
	<form class="reserve" method="post">
	<h2>예약 날짜</h2>
	<input id="startDate" name="startDate" type="date" required>
	<script>
	var now_utc = Date.now();
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("startDate").setAttribute("min", today);
	</script>
	
	<h2>종료 날짜</h2>
	<input id="endDate" name="endDate" type="date" required>
	<script>
	var now_utc = Date.now();
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("endDate").setAttribute("min", today);
	</script>
	<h3>※차량을 1일 안으로 대여할 경우 원 가격의 70%로 대여</h3>
	
	<h2>애완동물 탑승 여부</h2>
	<label>Yes</label><input type="radio" name="animal" value="20000"/>
	<label>No</label><input type="radio" name="animal" value="0"/>
	<h3>애완동물 동반 탑승 시 20000원 별도.</h3>
	<h3>※주의※</h3>
	<h3>Yes에 체크를 안하고 애완동물 동반 탑승 적발 시 60000원 과태료 발생</h3>
	
	<h2>자차보험 : 15000원 별도</h2>
	
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
</div>

<script>

function checkRental(){
    const log = document.getElementById('log').value;
    const check = document.getElementById('check');
    console.log(check.value);
    console.log("log" +log);

    if (check.value === true){
    	alert("이미 예약이 잡힌 날짜입니다. 다른 날짜 또는 다른 차량을 선택해주시기 바랍니다.");
    } 
    else {
		const carName = $('#carName').val();
	    const startDate = $('#startDate').val();
	    const endDate = $('#endDate').val();
	    const carPrice = $('#carPrice').val();
	    const animal = $('input:radio[name=animal]:checked').val();
	    location.href= `rentCheck.jsp?startDate=` + startDate + `&endDate=` + endDate + `&carName=` 
	           + carName + `&carPrice=` + carPrice +`&animal=` + animal;
 	}
 }
</script>

</body>
</html>