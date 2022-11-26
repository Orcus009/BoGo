<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/infoUpdate.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h1>정보 수정</h1>
<form action="InfoUpdateCom" method="post">
	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">비밀번호</label>
		<input type="password" style="display: inline-block;" id="password1" name="password1"
			autocomplete="off" onchange="password1Maxlength()"
			placeholder="비밀번호를 입력" required readonly onfocus="this.removeAttribute('readonly');"> 
	</div>
	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">이름</label>
		<input type="text" style="display: inline-block;" name="name" id="name" autocomplete="off"
			onchange="nameMaxCheck()" placeholder="이름을 입력" required>
	</div>

	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">전화 번호</label>
		<input type="text" style="display: inline-block;" id="phone" name="phone" autocomplete="off"
			onchange="phoneMaxCheck()" maxlength="13" placeholder="- 제외 핸드폰 번호를 입력" required> 
	</div>

	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">주소</label>
		<input id="member_post" style="display: inline-block;" type="text" placeholder="우편번호" readonly
			onclick="findAddr()"> 
			<input id="member_addr" name="member_addr" type="text" style="display: inline-block;" placeholder="주소" readonly> <br>
		<input id="member_detailAddr" type="text" style="display: inline-block;" name="member_detailAddr" placeholder="상세 주소">
	</div>

	<div class="input-box" style="text-align: center;">
		<label for="username" style="display: inline-block;">운전면허 번호</label>
		<input type="text" style="display: inline-block;" id="driveCode" name="driveCode" autocomplete="off"
			onchange="driveCodeMaxCheck()" placeholder="운전면허 코드" maxlength=12 required><br>
	</div>
	<div style="text-align: center;">
		<input type="submit" style="display: inline-block; cursor:pointer" value="계정정보 수정" class="submit-btn">
	</div>
</form>
<jsp:include page="footer.jsp" />
</body>
<script src="resources/joinScript.js"></script>
<script src="resources/findAddress.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>