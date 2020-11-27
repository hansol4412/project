<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="member.register"/></title>
</head>
<body>
	<h2><spring:message code="member.info"/></h2>
	<form:form action="step3" modelAttribute="registerRequest">
	<p>
		<label><spring:message code="id"/>:<br>
		<form:input path="id"/>
		</label>
	</p>
	<p>
		<label><spring:message code="password"/>:<br>
		<form:password path="password"/>
		</label>
	</p>
	<p>
		<label><spring:message code="password.confirm"/>:<br>
		<form:password path="confirmPassword"/>
		</label>
	</p>
	<p>
		<label><spring:message code="name"/>:<br>
		<form:input path="name"/>
		</label>
	</p>
	<p>
		<label><spring:message code="gender"/>:<br>
		<form:radiobutton path="gender" value="남" label="남"/>
		<form:radiobutton path="gender" value="여" label="여"/>
		</label>
	</p>
	
	<p>
		<label><spring:message code="birth"/>:<br>
		<form:input path="birthyy"/>
		<form:select path="birthmm" items="${birthM}"/> 
		<form:input path="birthdd"/>
		</label>
	</p>
	
	<p>
		<label><spring:message code="email"/>:<br>
		<form:input path="email1"/>@
		<form:select path="email2" items="${emailT}"/> 
		</label>
	</p>
	<p>
		<label><spring:message code="phone"/>:<br>
		<form:select path="phone1" items="${phoneO}"/> 
		<form:input path="phone2"/>- 
		<form:input path="phone3"/>
		</label>
	</p>
	<p>
		<label><spring:message code="address"/>:<br>
		<form:input path="address"/>
		</label>
	</p>
	<input type="reset" value="<spring:message code="register.reset"/>">
	<input type="submit" value="<spring:message code="register.btn"/>">
	</form:form>
</body>
</html>