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
       			 <h1 class="mt-4">Board Register</h1>
       		</div>
       	</div>
       <div class="col-lg-12">
       		<div class="panel panel-default">
       			<div class="panel-heading">Board Register</div>
       			<div class="panel-body">
       					<form role="form" action="/board/register" method="post">
       					<div class="form-group">
       						<label>Title</label>
       						<input  class="form-control" name="title">
       					</div>
       					<div class="form-group">
       						<label>Text area</label>
       						<textarea class="form-control" rows="3" name="content"></textarea>
       					</div>
       					<div class="form-group">
       						<label>Writer</label>
       						<input  class="form-control" name="writer">
       					</div>
       					<button type="submit" class="btn btn-default">Submit Button</button>
       					<button type="reset" class="btn btn-default">Reset Button</button>
       					</form>
       				</div>
       			</div>
       			<!-- 파일 -->
       			<div class='bigPictureWrapper'>
					<div class='bigPicture'>
					</div>
				</div> 
       			<div class="row">
			      	<div class="col-lg-12">
			      		<div class="panel panel-default">
			      		
			      		<div class="panel-heading">File Attach</div>
			      		<div class="panel-body">
			      			<div class="form-group uploadDiv">
			      				<input type="file" name="uploadFile" multiple>
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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script> 
			
	<script>
		$(document).ready(function(e){
			var formObj = $("form[role='form']");
			$("button[type='submit']").on("click", function(e){
				e.preventDefault();
				console.log("submit clicked");
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
			});	 //$("button[type='submit']").on("click", function(e){
			
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
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url: '/deleteFile',
					data: {fileName : targetFile, type : type},
						type: 'post',
						dataType : 'text',
						success : function(result) {
							alert("result");
							targetLi.remove();
						}
				});  //$.ajax({
			}); //$(".uploadResult").on("click", "button", function(e){
		}); //$(document).ready(function(e){
	</script>
</body>
</html>