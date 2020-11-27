<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="member.register"/></title>
</head>
<body>
	<p><spring:message code="register.done" arguments="${registerRequest.name}"/></p>
	
	<p>
		<label><spring:message code="id"/>:<br>
		${registerRequest.id}
		</label>
	</p>
	<p>
		<label><spring:message code="password"/>:<br>
		${registerRequest.password}
		</label>
	</p>
	<p>
		<label><spring:message code="birth"/>:<br>
		${registerRequest.birth}
		</label>
	</p>
	<p>
		<label><spring:message code="email"/>:<br>
		${registerRequest.email}
		</label>
	</p>
	<p>
		<label><spring:message code="phone"/>:<br>
		${registerRequest.phone}
		</label>
	</p>
	<p>
		<label><spring:message code="address"/>:<br>
		${registerRequest.address}
		</label>
	</p>
	
	<p><a href="<c:url value='/main'/>">[<spring:message code="go.main"/>]</a></p>
</body>
</html>