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
       					<div class="form-group">
       						<label>Bno</label>
       						<input  class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
       					</div>
       					<div class="form-group">
       						<label>Title</label>
       						<input  class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
       					</div>
       					<div class="form-group">
       						<label>Text area</label>
       						<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>
       					</div>
       					<div class="form-group">
       						<label>Writer</label>
       						<input  class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
       					</div>
       					<button data-oper="modify" class="btn btn-default" >Modify</button>
       					<button data-oper="list" class="btn btn-default" >List</button>
       					<form id="operForm" action="/board/modify" method="get">
       						<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
       						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
       						<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
       						<input type='hidden' name="type" value="${pageMaker.cri.type}">
       						<input type='hidden' name="keyword" value="${pageMaker.cri.keyword}">
       					</form>
       				</div>
       			</div>
       		</div>
        <div class="row">
       		<div class="col-lg-12">
       			<div class="panel panel-default">
       				<div class="panel-heading">
       					<i class="fa fa-comments fa-fw"></i>Reply
       				</div>
       				<div class="panel-body">
       					<ul class="chat">
       						<li class="left clearfix" data-rno='13'>
       							<div>
       								<div class="header">
       									<strong class="primary-font">user00</strong>
       									<small class="pull-right text-muted">2018-01-01 13:13</small>
       								</div>
       								<p>Good job!</p>
       							</div>
       						</li>
       					</ul>
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
  <script type="text/javascript" src="../resources/js/reply.js"></script>
  <script>
  	var bnoValue ='<c:out value="${board.bno}"/>';
  	var replyUL = $(".chat");
  		showList(1); //페이지번호
  		function showList(page){
  			replyService.getList({bno:bnoValue, page: page || 1}, function(list){
  				var str="";
  				if(list == null || list.length == 0){
  					replyUL.html("");
  					return;
  				}
  				
  				for(var i=0, len=list.length || 0; i<len; i++){
  					str+="<li class='left clearfix' data-rno='" +list[i].rno+"'>";
  					str+="<div><div class='header'><strong class='primary-font'>" + list[i].replyer +"</strong>";
  					str+="        <small class='pull-right text-muted'>" + list[i].replyDate +"</small></div>";
  					str+="     <p>"+list[i].reply+"</p></div></li>";
  				}
  				replyUL.html(str);
  			});
  		}
  	
  	/*
  	//등록
  	replyService.add({reply: "JS Test", replyer: "tester", bno:bnoValue}, 
  					  function(result){
  					 	alert("result:" + result);
  						});
  	*/
  	/*
  	// 댓글 리스트
  	replyService.getList({bno: bnoValue, page:1}, 
  		function(list){
  		for(var i=0, len=list.length||0; i<len; i++){
  			console.log(list[i]);
  		}
  	});
  	*/
  	/*
  	//삭제
  	replyService.remove(12, function(count){
  		console.log(count);
  		if(count==="success"){
  			alert("remove");
  		}
  	}, function(err){
  		alert('error...');
  	});
  	*/
  	/*
  	//수정
  	replyService.update({
  		rno: 13,
  		bno: bnoValue,
  		reply: "Modify Reply ....."
  		}, function(result){
  			alert("수정완료....");
  		});
  	*/
  	/*
  	//댓글 조회 처리
  	replyService.get(10, function(data){
  		console.log(data);
  	});
  	*/
  </script>
  <script type="text/javascript">
  $(document).ready(function(){
	  console.log(replyService);
  });
  
	$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list");
		operForm.submit();
	});
	});
	</script>

</body>
</html>