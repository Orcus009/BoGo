<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/noticeWrite.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<form method="post" action="NoticeWrite">
	<table>
		<thead>
			<tr>
				<th><input type="text" name="title" placeholder="제목" required></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><textarea name="content" rows="20" placeholder="글내용" required></textarea></td>
			</tr>
		</tbody>
	</table>
	<input type="submit" class="submit" style="cursor:pointer" value="등록">
</form>
<jsp:include page="footer.jsp"/>
</body>
</html>