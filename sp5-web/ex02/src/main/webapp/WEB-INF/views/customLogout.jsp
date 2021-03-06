<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/vendor/bootstrap/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../resources/vendor/bootstrap/css/blue.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-box-body">
		   <p class="login-box-msg">Logout Page</p>
			   <form role="form" method="post" action="/customLogout">
					<fieldset>
          				<a href="/list" class="btn-btn-lg btn-success btn-block">logout</a>
					</fieldset>
					<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
  		</div>
	</div>
	
	
	
	
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
  	<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
  	<script>
  	$(".btn-success").on("click", function(e){
  		e.preventDefault();
  		$("form").submit();
  	});
  	</script>
  	<c:if test="${param.logout != null }">
  		<script>
  			$(document).ready(function(){
  				alert("로그아웃하였습니다.");
  			});
  		</script>
  	</c:if>
</body>
</html>