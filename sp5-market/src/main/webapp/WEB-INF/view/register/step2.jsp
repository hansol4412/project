<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
	<h2>회원 정보 입력</h2>
	<form:form action="step3" modelAttribute="registerRequest">
	<p>
		<label>아이디:<br>
		<form:input path="id"/>
		</label>
	</p>
	<p>
		<label>비밀번호:<br>
		<form:password path="password"/>
		</label>
	</p>
	<p>
		<label>비밀번호 확인:<br>
		<form:password path="confirmPassword"/>
		</label>
	</p>
	<p>
		<label>이름:<br>
		<form:input path="name"/>
		</label>
	</p>
	<p>
		<label>성별:<br>
		<form:radiobutton path="gender" value="남" label="남"/>
		<form:radiobutton path="gender" value="여" label="여"/>
		</label>
	</p>
	
	<p>
		<label>생일:<br>
		<form:input path="birthyy"/>
		<form:select path="birthmm" items="${birthM}"/> 
		<form:input path="birthdd"/>
		</label>
	</p>
	
	<p>
		<label>이메일:<br>
		<form:input path="email1"/>@
		<form:select path="email2" items="${emailT}"/> 
		</label>
	</p>
	<p>
		<label>전화번호:<br>
		<form:select path="phone1" items="${phoneO}"/> 
		<form:input path="phone2"/>- 
		<form:input path="phone3"/>
		</label>
	</p>
	<p>
		<label>주소:<br>
		<form:input path="address"/>
		</label>
	</p>
	<input type="reset" value="취소">
	<input type="submit" value="가입 완료">
	</form:form>
</body>
</html>