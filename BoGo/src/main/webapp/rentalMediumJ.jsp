<%@page import="car.CarDto"%>
<%@page import="car.CarDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/rentalMediumJ.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
CarDao dao = CarDao.getInstance();
ArrayList<CarDto> list = dao.getCarMediumJ();
%>
<nav>
	<ul>
		<li><a href="rentalAll">전체</a></li>
		<li><a href="rentalSmall">경차/소형</a></li>
		<li class="select"><a href="rentalMediumJ">준중형</a></li>
		<li><a href="rentalMedium">중형</a></li>
		<li><a href="rentalBig">대형</a></li>
		<li><a href="rentalHighClass">고급</a></li>
		<li><a href="rentalInCome">수입차</a></li>
		<li><a href="rentalRv">RV/승합차</a></li>
	</ul>
</nav>
<h1>차량 목록</h1>
<table>
	<thead>
		<tr>
			<th class="table_img">사진</th>
			<th class="table_name">이름</th>
			<th class="table_price">가격</th>
		</tr>
	</thead>
	<tbody>
		
		<%for(CarDto car : list){ %>
			<tr>
				<td><img src="resources/img/<%=car.getCarName() %>.png"></td>
				<td><a href="carDetail?carName=<%=car.getCarName()%>"><%=car.getCarName()%></a></td>
				
				<td><%=car.getCarPrice() %>원</td>
			</tr>
		<%} %>
	</tbody>
</table>
<jsp:include page="footer.jsp"/>
</body>
</html>