<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><h3>아이디 중복검사</h3></div>
	<div>
		<form method="post" action="driveCodeCheckProc">
			<div class="input-box">
				<input type="text" class="driveCode_name" name="driveCode_name" required autofocus autocomplete="off" placeholder="면허검사 버튼을 눌러주세요">
				<label for="driveCode_name">성명</label>
				
				<input type="text" class="driveCode_birth" name="driveCode_birth" required autofocus autocomplete="off" placeholder="면허검사 버튼을 눌러주세요">
				<label for="driveCode_birth">생년월일(YYMMDD)</label>
				
				<input type="text" class="driveCode_first" name="driveCode_first" required autofocus autocomplete="off" placeholder="면허검사 버튼을 눌러주세요">
				<label for="driveCode_first">첫번째 코드(2자리)</label>
				
				<input type="text" class="driveCode_second" name="driveCode_second" required autofocus autocomplete="off" placeholder="면허검사 버튼을 눌러주세요">
				<label for="driveCode_second">두번쨰 코드(2자리)</label>
				
				<input type="text" class="driveCode_third" name="driveCode_third" required autofocus autocomplete="off" placeholder="면허검사 버튼을 눌러주세요">
				<label for="driveCode_third">세번째 코드(6자리)</label>
				
				<input type="text" class="driveCode_fourth" name="driveCode_fourth" required autofocus autocomplete="off" placeholder="면허검사 버튼을 눌러주세요">
				<label for="driveCode_fourth">네번째 코드(2자리)</label>
			</div>
		<input type="submit" value="면허확인" class="checkBtn"> 
		</form>
	</div>
</body>
</html>