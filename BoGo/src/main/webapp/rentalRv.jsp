<%@page import="car.CarDto"%>
<%@page import="car.CarDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
CarDao dao = CarDao.getInstance();
ArrayList<CarDto> list = dao.getCarRv();
%>
<nav>
	<ul>
		<li><a href="rentalAll.jsp">전체</a></li>
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
<table>
	<thead>
		<tr>
			<th>사진</th>
			<th>이름</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
		
		<%for(CarDto car : list){ %>
			<tr>
				<td><img src="resources/img/<%=car.getCarName() %>.png"></td>
				<td><a href="carDetail.jsp?carName=<%=car.getCarName()%>"><%=car.getCarName()%></a></td>
				
				<td><%=car.getCarPrice() %></td>
			</tr>
		<%} %>
	</tbody>
</table>
<jsp:include page="footer.jsp"/>
</body>
</html>