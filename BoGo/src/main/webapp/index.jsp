<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/index.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header_index.jsp"/>
    <%
	HttpSession sessionCheck = request.getSession();
	String log = (String)sessionCheck.getAttribute("log");
	String logPw = (String)sessionCheck.getAttribute("logPw");
	
	if(log == null){%>
	<a href="index"><img src="resources/img/BoGo.png"></a>
    <div class="login">
    	<form action="LoginCom" method="post">
    		<input type="text" name="id" autocomplete="off" placeholder="아이디"><br>
    		<input type="password" name="password" autocomplete="off" placeholder="비밀번호"><br>
    		<input type="submit" value="로그인" class="submit-btn" style="cursor:pointer">
    	</form>
    	<div class="links">
    		<a href="join">회원가입</a><br>
    	</div>
    <%} 
    else {%>
    	<a href="index"><img src="resources/img/BoGo.png"></a>
    	<div class="box">
    		<h3 class="box">현재 로그인 중</h3>
    		<h3 class="box">BoGo 렌트카 사이트에 오신 것을 환영합니다.</h3>
    		<a href="LogoutCom" class="box">로그아웃</a><br>
    		<a href="myPage" class="box">마이페이지</a>
    	</div>
   	<%} %>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>