<%@page import="car.CarDto"%>
<%@page import="car.CarDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/rentalAll.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
CarDao dao = CarDao.getInstance();
ArrayList<CarDto> list = dao.getCarAll();
%>
<nav>
	<ul>
		<li class="select"><a href="rentalAll.jsp">전체</a></li>
		<li><a href="rentalSmall.jsp">경차/소형</a></li>
		<li><a href="rentalMediumJ.jsp">준중형</a></li>
		<li><a href="rentalMedium.jsp">중형</a></li>
		<li><a href="rentalBig.jsp">대형</a></li>
		<li><a href="rentalHighClass.jsp">고급</a></li>
		<li><a href="rentalInCome.jsp">수입차</a></li>
		<li><a href="rentalRv.jsp">RV/승합차</a></li>
	</ul>
</nav>
<h1>차량 목록</h1>
<section>
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
				<td class="carimg"><img src="resources/img/<%=car.getCarName() %>.png"></td>
				<td class="carname"><a href="carDetail.jsp?carName=<%=car.getCarName()%>"><%=car.getCarName()%></a></td>
				
				<td class="carprice"><%=car.getCarPrice() %>원</td>
			</tr>
		<%} %>
	</tbody>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>