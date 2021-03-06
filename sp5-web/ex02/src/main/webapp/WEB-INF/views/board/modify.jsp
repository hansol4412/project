<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
   <style>
	.uploadResult{
		width:100%;
		background-color: gray;
	}
	.uploadResult ul{
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	.uploadResult ul li{
		list-style: none;
		padding: 10px;
	}
	.uploadResult ul li img{
		width: 20px;
	}
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top:0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255,255,255,0.5);
	}
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.bigPicture img{
		width: 600px;
	}
</style>
</head>
<body>

  <div class="d-flex" id="wrapper">
 <%@include file="../includes/header.jsp" %> 
    <!-- Page Content -->
    <div id="page-content-wrapper">
     
  
      
		<!-- 본문 -->
      <div class="container-fluid">
        <div class="row">
       		<div class="col-lg-12">
       			 <h1 class="mt-4">Board Read <%@include file="../includes/login.jsp" %></h1>
       		</div>
       </div>
       <div class="col-lg-12">
       		<div class="panel panel-default">
       			<div class="panel-heading">Board Read Page</div>
       			<div class="panel-body">
       			<form role="form" action="/board/modify" method="post">
       			<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
       					<sec:authentication property="principal" var="pinfo"/>
       						<sec:authorize access="isAuthenticated()">
       							<c:if test="${pinfo.username eq board.writer}">
       								<button type="submit" data-oper="modify" class="btn btn-default" >Modify</button>
       								<button type="submit" data-oper="remove" class="btn btn-default" >Remove</button>
       							</c:if>
       						</sec:authorize>
       					<button type="submit" data-oper="list" class="btn btn-default" >List</button>
       			</form>
       			</div>
       		</div>
       			<div class="row">
			      	<div class="col-lg-12">
			      		<div class="panel panel-default">
			      		<div class="panel-heading">Files</div>
			      		<div class="panel-body">
			      			<div class="form-group uploadDiv">
			      				<input type="file" name="uploadFile" multiple="multiple">
			      			</div>
			      			<div class='uploadResult'>
			      				<ul>
			      				</ul>
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
			}else if(operation === 'modify'){
				var str="";
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'/>";
				});//$(".uploadResult ul li").each(function(i, obj){
					formObj.append(str).submit();
			}
			formObj.submit();
		});
	});
	 </script>
	 <script>
	 $(document).ready(function(){
		 (function(){
			 var bno = '<c:out value="${board.bno}"/>';
			  $.getJSON("/board/getAttachList", {bno:bno}, function(arr){
				  console.log(arr);
				  
				  var str ="";
				  
				  $(arr).each(function(i, attach){
					  if(attach.fileType){
						  var fileCallPath = encodeURIComponent(attach.uploadPath+"/"+attach.uuid +"_"+attach.fileName);
						  	str += "<li data-path='" + attach.uploadPath + "'";
							str += "data-uuid='"+attach.uuid +"' data-filename ='" + attach.fileName+"'data-type='" +attach.fileType+"'"
							str += " ><div>";
							str += "<span>"+attach.fileName+"</span>"
							str += "<button type='button' data-file=\'"+ fileCallPath+"\'data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/display?fileName="+fileCallPath+"'>";
							str += "</div></li>";
					  }
					  else{
							str += "<li data-path='" + attach.uploadPath + "'";
							str += "data-uuid='"+attach.uuid +"' data-filename ='" + attach.fileName+"'data-type='" +attach.fileType+"'"
							str += " ><div>";
							str += "<span>"+attach.fileName+"</span>"
							str += "<button type='button' data-file=\'"+ fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/resources/img/attach.png'>";
							str += "</div></li>";
					  }
					});// $(arr).each(function(i, attach){
						$(".uploadResult ul").html(str);
			  }); //  $.getJSON("/board/getAttachList", {bno:bno}, function(arr){
		 })(); //end function()
		 
		 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;
			function checkExtension(fileName, fileSize){
				if(fileSize>maxSize){
					elert("파일 사이즈 초과");
					return false;
				}
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다");
					return false;
				}
				return true;
			} //function checkExtension(fileName, fileSize){
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue ="${_csrf.token}";
			$("input[type='file']").change(function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);
				}  //for문
				
				$.ajax({
					url: '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data: formData,
						type: 'post',
						dataType : 'json',
						beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						success : function(result) {
							console.log(result);
							showUploadedFile(result);
						}
				});  //$.ajax({
			});	//$("input[type='file']").change(function(e){
			function showUploadedFile(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){return;}
				var uploadUL = $(".uploadResult ul");
				var str="";
				$(uploadResultArr).each(function(i, obj){
					if(obj.image){
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+obj.uuid+"_"+obj.fileName);
						str += "<li data-path='" + obj.uploadPath + "'";
						str += "data-uuid='"+obj.uuid +"' data-filename ='" + obj.fileName+"'data-type='" +obj.image+"'"
						str += " ><div>";
						str += "<span>"+obj.fileName+"</span>"
						str += "<button type='button' data-file=\'"+ fileCallPath+"\'data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div></li>";
					}
					else{
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid +"_"+obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						str += "<li data-path='" + obj.uploadPath + "'";
						str += "data-uuid='"+obj.uuid +"' data-filename ='" + obj.fileName+"'data-type='" +obj.image+"'"
						str += " ><div>";
						str += "<span>"+obj.fileName+"</span>"
						str += "<button type='button' data-file=\'"+ fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<a href='/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.png'></a>";
						str += "</div></li>";
					}
				});//$(uploadResultArr).each(function(i, obj){
				uploadUL.append(str);
			} //function showUploadedFile(uploadResultArr){
				
		 $(".uploadResult").on("click", "button", function(e){
				console.log("delete file");
				if(confirm("Remove this file?")){
					var targetLi = $(this).closest("li");
					targetLi.remove();
				}
			}); //$(".uploadResult").on("click", "button", function(e){
	  	});
	 </script>
</body>
</html>