<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>
	<div class="uploadDiv">
		<input type='file' name='uplaodFile' multiple>
	</div>
	<button id='uploadBtn'>Upload</button>
	
	 
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script> 
	

			
	<script>
		$(document).ready(function(){
			$("#uploadBtn").on("click", function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uplaodFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				for(var i=0; i<files.length; i++){
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					type: 'post',
					url: '/uploadAjaxAction',
					data: formData,
					contentType : false,
					processData : false,
					success : function(result) {
						alert("uploaded");
						}
				});
			});
		});
	</script>
</body>
</html>