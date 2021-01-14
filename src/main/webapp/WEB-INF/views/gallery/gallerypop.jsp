<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.popuptable {
	margin: auto;
	width: 80%;
	min-width: 800px;
	border-top: 1px solid #ddd;
	border-collapse: collapse;
	
}

.popuptable tr {
	border-bottom: 1px solid #ddd;
	height: 15px;
	padding: 10px;
	margin: 10px;
	}
.popupdiv{
	margin: auto;
}
#viewbutton{
  background-color: #e9e9e9; /* Green */
  border: none;
  color: black;
  padding: 8px 24px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  font-weight : 900;
  border-radius: 8px;
 
}

</style>
<script>
	function delfucn() {
		location.href="filedel?savename=${savename.savename}"
		window.close();
	}

</script>
</head>
<body>
	<div class = "popupdiv">
	<table class="popuptable" style="margin: auto; width: 100%;">
		<tr>
			<th>제목</th>
			<td style="vertical-align: middle;">
				<h3>${savename.filetitle}</h3>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><h3>${savename.name}</h3></td>
		</tr>
		<tr>
			<th>파일크기</th>
			<td><h3>${savename.imagsize}</h3></td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td><h3>${savename.savetime}</h3></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><img src="/smartjacktest/image/${savename.savename}"></td>
		</tr>
	</table>
	<div align="right">
	<c:if test="${sessionId==savename.id }"><input id='viewbutton' type="button" value ="삭제" onclick="delfucn()" ></c:if>  
	<input id='viewbutton' type="button" value ="닫기" onclick="window.close()">
	확인
	</div>
	</div>
</body>
</html>