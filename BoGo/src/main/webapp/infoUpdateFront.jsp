<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h2>패스워드 입력</h2>
<form action="UpdatePwCheck">
	<input type="password" name="password" autocomplete="off" placeholder="비밀번호">
	<input type="submit" value="제출">
</form>
<jsp:include page="footer.jsp" />
</body>
</html>