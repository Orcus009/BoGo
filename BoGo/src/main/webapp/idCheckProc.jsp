<%@ page import="user.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<h3>아이디 중복확인 결과</h3>
		<%	
			UserDao dao = UserDao.getInstance();
			String id = request.getParameter("id").trim();
			String idCheck = dao.userIdCheck(id);
			out.println("입력 ID : <Strong>"+ id +"</Strong>" );
			if(idCheck == null){
				out.println("<p>사용 가능한 ID</p>");
				out.println("<a class='check' href='javascript:apply(\"" + id + "\")'>적용</a>");
			} else {
				out.println("<p>사용 불가능한 ID</p>");
			}
		%>
		<hr>
		<div class="closeBtn">
			<a href="javascript:history.back()" class="reSearch">재검색</a>
			<a href="javascript:window.close()" class="close">창닫기</a>
		</div>
	</div>
	<script>
	function apply(id){
		opener.document.regForm.id.value=id;
		window.close();
	}
	
	</script>
</body>
</html>