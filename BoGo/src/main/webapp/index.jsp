<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<jsp:include page="header.jsp"/>
    <section>
    	<%
		HttpSession sessionCheck = request.getSession();
		String log = (String)sessionCheck.getAttribute("log");
		%>
    </section>
    <jsp:include page="footer.jsp"/>
</body>
</html>