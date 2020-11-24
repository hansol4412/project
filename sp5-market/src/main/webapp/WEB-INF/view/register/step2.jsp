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
		<input type="radio" name="gender" value="남"> 남
		<input type="radio" name="gender" value="여"> 여
		</label>
	</p>
	<p>
		<label>생일:<br>
		<input type="text" name="birthyy" id="birthyy" maxlength="4">
		<select name="birthmm">
			<option value="">월</option>
			<option value="01">1</option>
			<option value="02">2</option>
			<option value="03">3</option>
			<option value="04">4</option>
			<option value="05">5</option>
			<option value="06">6</option>
			<option value="07">7</option>
			<option value="08">8</option>
			<option value="09">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<input type="text" name="birthdd" id="birthyy" maxlength="2">
		</label>
	</p>
	<p>
		<label>이메일:<br>
		<input type="text" name="eamil1" id="email1">@
		<select name="email2">
			<option>naver.com</option>
			<option>hanmail.net</option>
			<option>gmail.com</option>
			<option>nate.com</option>
		</select>
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
	
	<input type="reset" value="취소">
	<input type="submit" value="가입 완료">
	</form>
</body>
</html>