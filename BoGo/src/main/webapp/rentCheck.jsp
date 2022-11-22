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
<title>Insert title here</title>
</head>
<body>
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

	System.out.println(user_id);
	System.out.println(carName);
	System.out.println(startDate);
	System.out.println(endDate);
	System.out.println(rentalDate);
	
	if(startDate.equals(endDate)){
		int price = (int)(carPrice * 0.7);
	}
	else{
		System.out.println(diffDays * carPrice);
		int price = carPrice;
	}
	
	System.out.println(animal);
	
%>
<input type="hidden" id="user_id" name="user_id" value="<%=user_id %>">
<input type="hidden" id="carName" name="carName" value="<%=carName %>">
<input type="hidden" id="rentalDate" name="rentalDate" value="<%=rentalDate %>">
<input type="hidden" id="startDate" name="startDate" value="<%=startDate %>">
<input type="hidden" id="endDate" name="endDate" value="<%=endDate %>">
<%if(startDate.equals(endDate)) {
	int price = (int)(carPrice * 0.7);%>
	<input type="hidden" id="price" name="price" value="<%=price * diffDays + animal%>">
<%} else { 
	int price = carPrice;%> 
	<input type="hidden" id="price" name="price" value="<%=price * diffDays + animal%>">
<%}%>

<section>
	<form method="post" action="RentAction">
		<div class="checkBox">
			<input type="hidden" >
			<div class="box">
				<h2>차량 명</h2>
				<div class="car_name"><%=carName %></div>
			</div>
			<div class="box">
				<h2>예약을 한 날짜</h2>
				<div class="reserve_date"><%=rentalDate %></div>
			</div>
			<div class="box">
				<h2>렌트 시작 날짜</h2>
				<div class="reserve_date"><%=startDate %></div>
			</div>
			<div class="box">
				<h2>렌트 종료 날짜</h2>
				<div class="reserve_date"><%=endDate %></div>
			</div>
			<div class="box">
				<h2>가격</h2>
				<%if(startDate.equals(endDate)) {
					int price = (int)(carPrice * 0.7);%>
					<div class="reserve_date"><%=price + animal %>원</div>
				
				<%} else { 
					int price = carPrice;%> 
					<div class="reserve_date"><%=price * diffDays + animal %>원</div>
				<%}%>
			</div>
			<div class="box">
				<input type="button" value="렌트 예약">
			</div>
		</div>
	</form>
</section>

</body>
</html>