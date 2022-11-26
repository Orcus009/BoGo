<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/infoUpdateFront.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h2 style=" text-align: center;">정보 수정을 위해서 패스워드를 입력바랍니다</h2>
<form action="UpdatePwCheck" style=" text-align: center;">
	<input type="password" style=" display: inline-block;" name="password" autocomplete="off" placeholder="비밀번호"><br>
	<input type="submit" style="display: inline-block; cursor:pointer" value="입력">
</form>
<jsp:include page="footer.jsp" />
</body>
</html>