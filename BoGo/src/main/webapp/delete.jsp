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
<h1>회원 탈퇴</h1>
<form method="post" action="DeleteCom" name="DelForm" onsubmit="return check()">
	<div class="input-box">
		<input type="text" class="username_input" name="id" id="id" autocomplete="off" placeholder="아이디를 입력" required> 
		<label for="username">아이디</label>
	</div>
	<div class="input-box">
		<input type="password" id="password" name="password" autocomplete="off" placeholder="비밀번호를 입력" required> 
		<label for="username">비밀번호</label>
	</div>
	<input type="submit" value="회원탈퇴">
</form>
<jsp:include page="footer.jsp" />
</body>
</html>