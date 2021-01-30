<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Simple Sidebar - Start Bootstrap Template</title>
  
  <!-- Bootstrap core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/css/simple-sidebar.css" rel="stylesheet">
</head>
<body>

  <div class="d-flex" id="wrapper">
 <%@include file="../includes/header.jsp" %> 
    <!-- Page Content -->
    <div id="page-content-wrapper">
     
    <!-- 위 메뉴 -->
      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
      	<!-- 메뉴 토글 -->
        <button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>


		<!-- 위 메뉴의 오른쪽 -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            
            <!-- 드롭다운 -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
		              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
		                <a class="dropdown-item" href="#">Action</a>
		                <a class="dropdown-item" href="#">Another action</a>
		                <div class="dropdown-divider"></div>
		                <a class="dropdown-item" href="#">Something else here</a>
		              </div>		
            </li>
          </ul>
        </div>
      </nav>
      
		<!-- 본문 -->
      <div class="container-fluid">
        <div class="row">
       		<div class="col-lg-12">
       			 <h1 class="mt-4">Board Read</h1>
       		</div>
       </div>
       <div class="col-lg-12">
       		<div class="panel panel-default">
       			<div class="panel-heading">Board Read Page</div>
       			<div class="panel-body">
       			<form role="form" action="/board/modify" method="post">
       			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
       			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
       			<input type='hidden' name="type" value="${pageMaker.cri.type}">
       			<input type='hidden' name="keyword" value="${pageMaker.cri.keyword}">
       					<div class="form-group">
       						<label>Bno</label>
       						<input  class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
       					</div>
       					<div class="form-group">
       						<label>Title</label>
       						<input  class="form-control" name="title" value='<c:out value="${board.title}"/>'>
       					</div>
       					<div class="form-group">
       						<label>Text area</label>
       						<textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
       					</div>
       					<div class="form-group">
       						<label>Writer</label>
       						<input  class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
       					</div>
       					<div class="form-group">
       						<label>RegDate</label>
       						<input  class="form-control" name="regDate" 
       							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly="readonly">
       					</div>
       					<div class="form-group">
       						<label>Update Date</label>
       						<input  class="form-control" name="updateDate" 
       							value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>' readonly="readonly">
       					</div>
       					<button type="submit" data-oper="modify" class="btn btn-default" >Modify</button>
       					<button type="submit" data-oper="remove" class="btn btn-default" >Remove</button>
       					<button type="submit" data-oper="list" class="btn btn-default" >List</button>
       			</form>
       			</div>
       		</div>
       </div>
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->
<%@include file="../includes/footer.jsp" %>
  <script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			}else if(operation === 'list'){
				//move to list
				//self.location="/board/list";
				formObj.attr("action", "/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
		});
	});
	 </script>
</body>
</html>