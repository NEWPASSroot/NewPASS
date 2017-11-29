<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Log out</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("login.jsp");
	%>
</body>
</html>