<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Logout Page</h1>
	<form method='post' action="/customLogout">
		<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button>로그아웃</button>
	</form>
</body>
</html>