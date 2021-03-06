<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<button id='login' type="button" class="btn btn-default pull-right">
			<a href="/customLogout">Logout</a>
		</button>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<button id='login' type="button" class="btn btn-default pull-right">
			<a href="/customLogin">Login</a>
		</button>
	</sec:authorize>
	
</body>
</html>