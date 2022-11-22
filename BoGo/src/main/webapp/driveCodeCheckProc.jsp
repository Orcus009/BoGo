<%@page import="user.UserDao"%>
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
<!--<h3>운전면허증 확인 결과</h3>
//	<%	
//		if(driveCodeCheck == null){
//			out.println("<p>사용 가능한 ID</p>");
//			out.println("<a class='check' href='javascript:apply(\"" + id + "\")'>적용</a>");
//		} else {
//			out.println("<p>사용 불가능한 ID</p>");
//		}
//	%>
	<hr>
	<div class="closeBtn">
		<a href="javascript:history.back()" class="reSearch">재검사</a>
		<a href="javascript:window.close()" class="close">창닫기</a>
	</div>
	<script>
	function driveCodeCheck{
         const room_name = $('#roomName').val();
         const accCode = $('#acc_code').val();
         const check_in = $('#checkIn').val();
         const check_out = $('#checkOut').val();
         const personnel_num = $('#personnel').val();
         location.href= `book?check_in=` + check_in +`&check_out=` + check_out + `&personnel_num=` 
                + personnel_num + `&accCode=` + accCode + `&room_name=` + room_name;
	}
	</script> -->	
</div>
</body>
</html>