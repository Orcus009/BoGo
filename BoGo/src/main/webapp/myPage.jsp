<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/myPage.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h1>My Page</h1>
<div style=" text-align: center;">
	<div class="info"><a href="infoUpdateFront">개인정보 수정</a></div><br>
	<div class="delete"><a href="delete">계정 탈퇴</a></div><br>
	<div class="history"><a href="rentHistory.jsp">차량 대여 내역</a></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>