<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/grid.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
    <%
	HttpSession sessionCheck = request.getSession();
	String log = (String)sessionCheck.getAttribute("log");
	String logPw = (String)sessionCheck.getAttribute("logPw");
	if(log == null){%>
		<nav>
	        <ul>
	            <li><a href="notice">공지사항</a></li>
	        </ul>
	    </nav>
	    <div class="login">
	    	<form action="LoginCom" method="post">
	    		<input type="text" name="id" autocomplete="off" placeholder="아이디">
	    		<input type="password" name="password" autocomplete="off" placeholder="비밀번호">
	    		<input type="submit" value="로그인" class="submit-btn">
	    	</form>
	    	<div class="links">
	    		<a href="join">회원가입</a><br>
	    </div>
    <%} 
    else {%>
		<nav>
		    <ul>
		        <li><a href="rentalAll.jsp">차량대여</a></li>
		        <li><a href="notice">공지사항</a></li>
		    </ul>
		</nav>
    	<div class="box">
    		<h3>로그인 중</h3>
    		<a href="LogoutCom">로그아웃</a>
    		<a href="myPage">마이페이지</a>
    	</div>
   	<%} %>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>