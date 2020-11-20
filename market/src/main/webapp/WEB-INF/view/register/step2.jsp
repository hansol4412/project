<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
	<h2>회원 정보 입력</h2>
	<form action="step3" method="post">
	<p>
		<label>아이디:<br>
		<input type="text" name="id" id="id">
		</label>
	</p>
	<p>
		<label>비밀번호:<br>
		<input type="text" name="password" id="password">
		</label>
	</p>
	<p>
		<label>비밀번호 확인:<br>
		<input type="text" name="confirmPassword" id="confirmPassword">
		</label>
	</p>
	<p>
		<label>이름:<br>
		<input type="text" name="name" id="name">
		</label>
	</p>
	<p>
		<label>성별:<br>
		<input type="checkbox" name="gender" value="남"> 남
		<input type="checkbox" name="gender" value="여"> 여
		</label>
	</p>
	<p>
		<label>생일:<br>
		<input type="text" name="birth" id="birth">
		</label>
	</p>
	<p>
		<label>이메일:<br>
		<input type="text" name="eamil" id="email">
		</label>
	</p>
	<p>
		<label>전화번호:<br>
		<input type="text" name="phone" id="phone">
		</label>
	</p>
	<p>
		<label>주소:<br>
		<input type="text" name="address" id="address">
		</label>
	</p>
	

	<input type="submit" value="가입 완료">
	</form>
</body>
</html>