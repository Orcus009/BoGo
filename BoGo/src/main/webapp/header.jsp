<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/header.css">
<title>Insert title here</title>
</head>
<body>
<a href="index"><img src="resources/img/BoGo.png" class="img"></a>
    <%
	HttpSession sessionCheck = request.getSession();
	String log = (String)sessionCheck.getAttribute("log");
	%>
</body>
</html>