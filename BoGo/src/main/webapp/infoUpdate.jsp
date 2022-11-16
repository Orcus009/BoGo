<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>정보 수정</h1>
<form action="InfoUpdateCom" method="post">
	<div class="input-box">
		<input type="password" id="password1" name="password1"
			autocomplete="off" onchange="password1Maxlength()"
			placeholder="비밀번호를 입력" required readonly onfocus="this.removeAttribute('readonly');"> 
		<label for="username">비밀번호</label>
	</div>
	<div class="input-box">
		<input type="text" name="name" id="name" autocomplete="off"
			onchange="nameMaxCheck()" placeholder="이름을 입력" required>
		<label for="username">이름</label>
	</div>

	<div class="input-box">
		<input type="text" id="phone" name="phone" autocomplete="off"
			onchange="phoneMaxCheck()" maxlength="13" placeholder="- 제외 핸드폰 번호를 입력" required> 
		<label for="username">전화 번호</label>
	</div>

	<div class="input-box">
		<input id="member_post" type="text" placeholder="우편번호" readonly
			onclick="findAddr()"> 
			<input id="member_addr" name="member_addr" type="text" placeholder="주소" readonly> <br>
		<input id="member_detailAddr" type="text" name="member_detailAddr" placeholder="Detailed Address">
	</div>

	<div class="input-box">
		<input type="text" id="driveCode" name="driveCode" autocomplete="off"
			onchange="driveCodeMaxCheck()" placeholder="운전면허 코드" required><br>
	</div>
	<input type="submit" value="계정정보 수정" class="submit-btn">
</form>
</body>
<script src="resources/joinScript.js"></script>
<script src="resources/findAddress.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>