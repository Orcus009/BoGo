<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/delete.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h1>회원 탈퇴</h1>
<form method="post" action="DeleteCom" name="DelForm" onsubmit="return check()">
	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">아이디</label>
		<input type="text" style="display: inline-block;" class="username_input" name="id" id="id" autocomplete="off" placeholder="아이디를 입력" required> 
	</div>
	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">비밀번호</label>
		<input type="password" style="display: inline-block;" id="password" name="password" autocomplete="off" placeholder="비밀번호를 입력" required> 
	</div>
	<div style="text-align: center;">
		<input type="submit" class="submit-btn" style="display: inline-block; cursor:pointer" value="입력">
	</div>
</form>
<jsp:include page="footer.jsp" />
</body>
</html>