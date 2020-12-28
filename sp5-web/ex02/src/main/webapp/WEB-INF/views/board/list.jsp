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
       			 <h1 class="mt-4">Tables</h1>
       		</div>
       </div>
       <div class="col-lg-12">
       		<div class="panel panel-default">
       			<div class="panel-heading">Board List Pages
       				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
       			</div>
       			<div class="panel-body">
       				<table class="table table-striped table-bordered table-hover">
       					<thead>
       						<tr>
       							<th>#번호</th>
       							<th>제목</th>
       							<th>작성자</th>
       							<th>작성일</th>
       							<th>수정일</th>
       						</tr>
       					</thead>
       					<c:forEach items="${list}" var="board">
       						<tr>
       							<td><c:out value="${board.bno}"/></td>
       							<td><c:out value="${board.title}"/></td>
       							<td><c:out value="${board.writer}"/></td>
       							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
       							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
       						</tr>
       					</c:forEach>
       				</table>
       				<!-- Modal 추가 -->
       				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       					<div class="modal-dialog">
       						<div class="modal-content">
       							<div class="modal-header">
       								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
       								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
       							</div>
       							<div class="modal-body">처리가 완료되었습니다.</div>
       							<div class="modal-footer">
       								<button type="button" class="btn btn-default" data-dismis="modal">Close</button>
       								<button type="button" class="btn btn-primary">Save change</button>
       							</div>
       						</div>
       					</div>
       				</div>
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
    $(document).ready(function() {
    	var result = '<c:out value="${result}"/>';
    	checkModal(result);
    
    	
    function checkModal(result){
    	if(result===''){
    		return;
    	}
    	if(parseInt(result)>0){
    		$(".modal-body").html("게시글 "+ parseInt(result) +"번이 등록되었습니다.");
    	}
    	$("#myModal").modal("show");
    }
    
    $("#regBtn").on("click", function(){
    	self.location="/board/register";
    });
    
    });
   </script>

</body>

</html>