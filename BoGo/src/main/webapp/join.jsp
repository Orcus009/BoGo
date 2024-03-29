<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/join.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<h1>회원가입</h1>
	<form method="post" action="JoinCom" name="regForm" onsubmit="return check()">
		<div class="input-box" style=" text-align: center;">
			<label for="username" style="display: inline-block;">아이디</label>
			<input type="text" style="display: inline-block;" class="username_input" name="id" id="id"
				autocomplete="off" onchange="idMaxCheck()" readonly
				placeholder="중복검사 버튼을 눌러주세요" required> 
			<div class="overlapBtn">
				<input type="button" style=" display: inline-block;" class="id_overlap_button" onclick="idCheck()" value="중복검사">
			</div>
		</div>
		<div class="input-box" style="text-align: center;">
			<label for="username" style="display: inline-block;">비밀번호</label>
			<input type="password" style="display: inline-block;" id="password1" name="password1"
				autocomplete="off" onchange="password1Maxlength()"
				placeholder="비밀번호를 입력" required readonly onfocus="this.removeAttribute('readonly');"> 
		</div>
		<div class="input-box" style="text-align: center;">
			<label for="username" style="display: inline-block;">비밀번호 확인</label>
			<input type="password" style="display: inline-block;" id="password2" name="password2"
				autocomplete="off" onchange="passwordCheck()"
				placeholder="비밀번호를 다시 입력" required readonly onfocus="this.removeAttribute('readonly');"> 
		</div>
		<div class="input-box" style="text-align: center;">
			<label for="username" style="display: inline-block;">이름</label>
			<input type="text" style="display: inline-block;" name="name" id="name" autocomplete="off"
				onchange="nameMaxCheck()" placeholder="이름을 입력" required>
		</div>

		<div class="input-box" style="text-align: center;">
			<label for="username" style="display: inline-block;">전화 번호</label>
			<input type="text" style=" display: inline-block;" id="phone" name="phone" autocomplete="off"
				onchange="phoneMaxCheck()" maxlength="13" placeholder="- 제외 핸드폰 번호를 입력" required> 
		</div>

		<div class="input-box" style="text-align: center;">
			<label for="address" style="display: inline-block;">주소</label>
			<input id="member_post" type="text" style=" display: inline-block;" placeholder="우편번호" readonly
				onclick="findAddr()"> 
				<input id="member_addr" style="display: inline-block;" name="member_addr" type="text" placeholder="주소" readonly> <br>
			<input id="member_detailAddr" type="text" style="display: inline-block;" name="member_detailAddr" placeholder="상세 주소">
		</div>

		<div class="input-box" style="text-align: center;">
			<label for="username" style=" display: inline-block;">운전면허 번호</label>
		 	<input type="text" id="driveCode" style=" display: inline-block;" name="driveCode" autocomplete="off"
				onchange="driveCodeMaxCheck()" placeholder="운전면허 코드" maxlength=12 required><br>
<!--				
 		<input type="text" class="driveCode_input" id="driveCode" name="driveCode" 
			autocomplete="off" onchange="driveCodeCheck()" readonly
			placeholder="인증검사 버튼을 눌러주세요" required> 
			<label for="driveCode">운전면허 코드</label>
			<div class="overlapBtn">
				<input type="button" class="driveCode_overlap_button" onclick="driveCodeCheck()" value="면허검사">
			</div>
-->
		</div>
		<div style=" text-align: center;">
			<input type="submit" style=" display: inline-block;" value="계정 생성" class="submit-btn">
		</div>
	</form>
<jsp:include page="footer.jsp" />
</body>
<script src="resources/joinScript.js"></script>
<!-- <script src="resources/driveCode.js"></script> -->
<script src="resources/findAddress.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>