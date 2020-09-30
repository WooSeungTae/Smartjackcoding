<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#insertbutton {
	background-color: #e9e9e9;
	border: none;
	color: black;
	padding: 8px 10px 10px 10px;
	text-align: center;
	font-size: 18px;
	font-weight: 900;
	border-radius: 8px;
	margin: 10px 0 0 0;
}

.imgspace {
	width: 75%;
	float: left;
}

.uploadspace {
	width: 25%;
	float: right;
	
}

.imgsize img {
	width: 30%;
	height: 500px;
	float: left;
	display: block;
	margin: 3% 3% 0 0;
}

.imgsize {
	border-width: 2px;
	border-color: black;
}

#filetitle {
	color: black;
	font-weight: bold;
	font-size: 18px;
	width: 90%;
	height: 45px;
	text-align: center;
	cursor: pointer;
	border: 1px solid #e9e9e9;
	border-radius: 10px;
	background-color: #e9e9e9;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: black;
	font-size: 18px;
	width:93px;
	text-align:center;
	font-weight: bold;
	line-height: normal;
	vertical-align: middle;
	background-color: #e9e9e9;
	cursor: pointer;
	border: 1px solid #e9e9e9;
	border-radius: 10px;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox label:hover {
	background-color: gray;
}

.filebox label:active {
	background-color: black;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#uploadfile").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".imgup img").attr("src", data.target.result);
					$("#imgview").val('imgview');
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
	});
	
	function register(){
		if(document.getElementById("filetitle").value==""){
			alert('이미지 제목을 입력해 주세요');
			document.getElementById("filetitle").focus()
		}else if(document.getElementById("uploadfile").value==""){
			alert('파일을 선택해주세요');
			document.getElementById("uploadfile").focus()
		}else {
				fo.submit();
			}
	}
</script>
</head>
<body>
	<c:import url="/header"></c:import>
	<div>
		<section class="imgspace">
			<c:forEach var="allList" items="${allList}">
				<div class="imgsize">
				<img src="/smartjacktest/image/${allList.savename}" onclick="window.open('pop?savename=${allList.savename}','','width=600,height=900,location=no,status=no,scrollbars=yes');">
				</div>
			</c:forEach>
		</section>
		<c:choose>
			<c:when test="${sessionId!=null}">
				<section class="uploadspace">
					<div style="text-align: right; padding: 8% 5% 0 0;">
						<form id="fo" action="fileupload" method="post"
							enctype="multipart/form-data">
							<input type="text" id="filetitle" name="filetitle"
								placeholder="이미지 제목 입력"><br> <br>
							<div style="text-align: right;">
								<div class="filebox">
									<label for="uploadfile">파일 선택</label> <input type="file"
										id="uploadfile" name="uploadfile">
								</div>
								<input type="button" id="insertbutton" value="이미지  삽입" onclick="register()">
							</div>
						</form>
					</div>
					<aside class="imgup">
						<img src="" id="imgview" style="width: 100%">
					</aside>
				</section>
			</c:when>
			<c:otherwise>
				<section class="uploadspace"></section>
			</c:otherwise>
		</c:choose>
	</div>
	<c:import url="/footer"></c:import>
</body>
</html>