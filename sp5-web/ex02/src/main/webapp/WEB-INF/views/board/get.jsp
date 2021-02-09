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
       	<!-- 파일 -->
       	<div class='bigPictureWrapper'>
			<div class='bigPicture'>
			</div>
		</div> 
		  
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-heading">Files</div>
				<div class="panel-body">
					<div class="uploadResult">
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</div>    
		
				
       	<!-- 댓글 -->
        <div class="row">
       		<div class="col-lg-12">
       			<div class="panel panel-default">
       				<div class="panel-heading">
       					<i class="fa fa-comments fa-fw"></i>Reply
       					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
       				</div>
       				<div class="panel-body">
       					<ul class="chat">
       					<!--  
       						<li class="left clearfix" data-rno='13'>
       							<div>
       								<div class="header">
       									<strong class="primary-font">user00</strong>
       									<small class="pull-right text-muted">2018-01-01 13:13</small>
       								</div>
       								<p>Good job!</p>
       							</div>
       						</li>
       					-->
       					</ul>
       				</div>
       				<div class="panel-footer">

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
  <!-- 모달창 -->
  
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       	<div class="modal-dialog">
       		<div class="modal-content">
       			<div class="modal-header">
       				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
       				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="modalCloseBtn">&times;</button>
       			</div>
       			
       			<div class="modal-body">
       				<div class="form-group">
       					<label>Reply</label>
       					<input class="form-control" name="reply" value="New Reply"/>
       				</div>
       				<div class="form-group">
       					<label>Replyer</label>
       					<input class="form-control" name="replyer" value="replyer"/>
       				</div>
       				<div class="form-group">
       					<label>Reply Date</label>
       					<input class="form-control" name="replyDate" value=""/>
       				</div>
       			</div>
       			
       			<div class="modal-footer">
       				<button id = "modalModBtn" type="button" class="btn btn-warning">Modify</button>
       				<button id = "modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
       				<button id = "modalRegisterBtn" type="button" class="btn btn-default">Register</button>
       				<button id = "modalCloseBtn" type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
       			</div>
       		</div>
       	</div>
   </div>	
   				
<%@include file="../includes/footer.jsp" %>
  <script type="text/javascript" src="../resources/js/reply.js"></script>
  <script>
  $(document).ready(function(){
  	var bnoValue ='<c:out value="${board.bno}"/>';
  	var replyUL = $(".chat");
  		showList(1); //페이지번호
  		
  		function showList(page){
  			replyService.getList({bno:bnoValue, page: page || 1}, function(replyCnt, list){
  				console.log("replyCnt: "+ replyCnt);
  				console.log("list: " + list);
				if(page==-1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
  				var str="";
  				if(list == null || list.length == 0){
  					//replyUL.html("");
  					return;
  				}
  				for(var i=0, len=list.length || 0; i<len; i++){
  					str+="<li class='left clearfix' data-rno='" +list[i].rno+"'>";
  					str+="<div><div class='header'><strong class='primary-font'>" + list[i].replyer +"</strong>";
  					str+="        <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) +"</small></div>";
  					str+="     <p>"+list[i].reply+"</p></div></li>";
  				}
  				replyUL.html(str);
  				showReplyPage(replyCnt);
  			}); 
  		}//end showList
  		
  		var modal = $(".modal");
  		var modalInputReply = modal.find("input[name='reply']");
  		var modalInputReplyer = modal.find("input[name='replyer']");
  		var modalInputReplyDate = modal.find("input[name='replyDate']");
  		
  		var modalModBtn = $("#modalModBtn");
  		var modalRemoveBtn = $("#modalRemoveBtn");
  		var modalRegisterBtn = $("#modalRegisterBtn");
  		
  		$("#addReplyBtn").on("click", function(e){
  			modal.find("input").val("");
  			modalInputReplyDate.closest("div").hide();
  			modal.find("button[id != 'modalCloseBtn']").hide();
  			modalRegisterBtn.show();
  			$(".modal").modal("show");
  		});
  		
  		//댓글 추가 처리
  		modalRegisterBtn.on("click", function(e){
	  			var reply = {
	  				reply: modalInputReply.val(),
	  				replyer:modalInputReplyer.val(),
	  				bno: bnoValue
	  			};
	  			replyService.add(reply, function(result){
	  				alert(result);
	  				modal.find("input").val("");
	  				modal.modal("hide");
	  				
	  				showList(-1);
	  			});
	  		});
  		
  		//댓글 조회 처리
  		$(".chat").on("click", "li", function(e){
  			var rno = $(this).data("rno");
  			replyService.get(rno, function(reply){
  				modalInputReply.val(reply.reply);
  				modalInputReplyer.val(reply.replyer);
  				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
  				modal.data("rno", reply.rno);
  				
  				modal.find("button[id != 'modalCloseBtn']").hide();
  	  			modalModBtn.show();
  	  			modalRemoveBtn.show();
  	  			$(".modal").modal("show");
  			});
  		});
  		
  		//댓글 수정 처리
  		modalModBtn.on("click", function(e){
	  			var reply = {
	  				rno: modal.data("rno"),
	  				reply: modalInputReply.val()
	  			};
	  			replyService.update(reply, function(result){
	  				alert(result);
	  				modal.modal("hide");
	  				showList(pageNum);
	  			});
	  		});
  	
  		//댓글 삭제 처리
  		modalRemoveBtn.on("click", function(e){
  			var rno = modal.data("rno");
	  			replyService.remove(rno, function(result){
	  				alert(result);
	  				modal.modal("hide");
	  				showList(pageNum);
	  			});
	  		});
  		
  		var pageNum=1;
  		var replyPageFooter = $(".panel-footer");
  		
  		function showReplyPage(replyCnt){
  			var endNum = Math.ceil(pageNum/10.0)*10;
  			var startNum = endNum-9;
  			var prev = startNum !=1;
  			var next = false;
  			if(endNum * 10 >= replyCnt){
  				endNum = Math.ceil(replyCnt/10.0);
  			}
  			if(endNum * 10 < replyCnt){
  				next=true;
  			}
  			var str = "<ul class='pagination pull-right'>";
  			if(prev){
  				str+= "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
  			}
  			
  			for(var i = startNum; i<=endNum; i++){
  				var active = pageNum==i? "active":"";
  				str+= "<li class='page-item  "+active+" '><a class='page-link' href='" +i+ "'>"+i+"</a></li>";
  			}
  			
  			if(next){
  				str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
  			}
  			str +="</ul></div>";
  			console.log(str);
  			replyPageFooter.html(str);
  		}
  		
  		replyPageFooter.on("click","li a",function(e){
  			e.preventDefault();
  			console.log("page click");
  			var targetPageNum = $(this).attr("href");
  			console.log("targetPageNum: "+targetPageNum);
  			pageNum = targetPageNum;
  			showList(pageNum);
  		});
  		
  });
  
  	

  </script>
  <script type="text/javascript">
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
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div></li>";
				  }
				  else{
						str += "<li data-path='" + attach.uploadPath + "'";
						str += "data-uuid='"+attach.uuid +"' data-filename ='" + attach.fileName+"'data-type='" +attach.fileType+"'"
						str += " ><div>";
						str += "<span>"+attach.fileName+"</span>"
						str += "<img src='/resources/img/attach.png'>";
						str += "</div></li>";
				  }
				});// $(arr).each(function(i, attach){
					$(".uploadResult ul").html(str);
		  }); //  $.getJSON("/board/getAttachList", {bno:bno}, function(arr){
			  $(".uploadResult").on("click","li", function(e){
				  console.log("view image");
				  var liObj = $(this);
				  var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid") +"_"+liObj.data("filename"));
				  if(liObj.data("type")){
					  showImage(path.replace(new RegExp(/\\/g),"/"));
				  }
				  else{
					  self.location="/download?fileName="+path;
				  }
				});
			  function showImage(fileCallPath){
					//alert(fileCallPath);
					$(".bigPictureWrapper").css("display","flex").show();
					$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%', height: '100%'}, 1000);
					$(".bigPictureWrapper").on("click", function(e){
						$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
						setTimeout(()=> {
							$(this).hide();
						},1000)
					});
				} //function showImage(fileCallPath){
	 })(); //end function()
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