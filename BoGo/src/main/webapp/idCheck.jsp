<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReserVook</title>
</head>
<body>
	<div class="wrap">
		<div class="out">
			<div class="in">
				<div><h3>아이디 중복검사</h3></div>
				<div>
					<form method="post" action="idCheckProc">
						<div class="input-box">
						<input type="text" class="id"name="id" maxlength="14" onKeyup="this.value=this.value.replace(/[^0-9A-Za-z]/g,'');" required autofocus autocomplete="off" placeholder="중복검사 버튼을 눌러주세요">
						<label for="username">아이디</label>
						</div>
					<input type="submit" value="중복확인" class="checkBtn">
					</form>
				</div>
			</div>
		</div>
	</div>
<script src="resources/joinScript.js"></script>
</body>
</html>