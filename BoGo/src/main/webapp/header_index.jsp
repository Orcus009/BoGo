<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/header_index.css">
<title>Insert title here</title>
</head>
<body>
    <%
	HttpSession sessionCheck = request.getSession();
	String log = (String)sessionCheck.getAttribute("log");
	if(log == null){%>
		<nav>
	        <ul>
	            <li><a href="notice">공지사항</a></li>
	        </ul>
	    </nav>
    <%} 
    else {%>
		<nav>
		    <ul>
		        <li><a href="rentalAll">차량대여</a></li>
		        <li><a href="notice">공지사항</a></li>
		    </ul>
		</nav>
   	<%} %>
</body>
</html>