<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
	<p><strong>${registerRequest.name}</strong>님, 회원가입을 완료했습니다.</p>
	
	<p>
		<label>아이디:<br>
		${registerRequest.id}
		</label>
	</p>
	<p>
		<label>비밀번호:<br>
		${registerRequest.password}
		</label>
	</p>
	<p>
		<label>생일:<br>
		${registerRequest.birth}
		</label>
	</p>
	<p>
		<label>이메일:<br>
		${registerRequest.email}
		</label>
	</p>
	<p>
		<label>전화번호:<br>
		${registerRequest.phone}
		</label>
	</p>
	<p>
		<label>주소:<br>
		${registerRequest.address}
		</label>
	</p>
	
	<p><a href="<c:url value='/main'/>">[첫 화면 이동]</a></p>
</body>
</html>