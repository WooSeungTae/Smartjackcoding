<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn Page</title>
<style>
table.login{
	position: relative;
	float: right;
	border-color: black;
}

table.login tr{
	background-image: none;
	border-color: black;
}

table.login tr td{
	color: black;
	font-weight: bold;
}


.log{
	float: right;
	width: 20%;
	padding: 100px 5% 0px 0px;

}
.vd{
	float : left;
	width: 70%;

}
</style>

</head>
<body>


	<c:if test="${logCheck==0 }">
		<script type="text/javascript">
			alert("패스워드가 잘못되었습니다.")
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
		</script>
	</c:if>
	<c:if test="${logCheck==1 }">
		<script type="text/javascript">
			alert("${sessionName}님 환영합니다.")
		</script>
	</c:if>
	<c:if test="${logCheck==-1 }">
		<script type="text/javascript">
			alert("존재하지 않는 ID 입니다..")
			document.getElementById("id").value = "";
			document.getElementById("pwd").value = "";
			document.getElementById("id").focus();
		</script>
	</c:if>

	<c:import url="/header"></c:import>
	<div>
	<section class="log">
	<c:choose>
		<c:when test="${sessionId==null}">
	<form action="loginCheck" method="post">
	<table class="login" border="0.5"> 
	<tr><td><input type="text" name = "id" placeholder="아이디" style="height: 25px;"></td>
	<td rowspan="2" ><input type="submit" value="로그인" style="height: 70px; font-weight: bolder;"></td></tr>
	<tr><td><input type="text" name = "pwd" placeholder="비밀번호" style="height: 25px;"></td></tr>
	<tr><td><a href="memberRegister" style="text-decoration: none; color: black;">회원가입</a></td><td></td></tr>	
	</table>
	</form>
		</c:when>
		<c:otherwise>
		<table class="login" border="0.5"> 
		</table>
		</c:otherwise>
	</c:choose>
	</section>
	<section class="vd">
	<h4 class="login">
	<video width="80%;" style="padding: 0 0 0 30px;" src="https://smartjackwp.com/video/labmanager.mp4" muted autoplay loop></video>
	</h4>
	</section>
	</div>

<c:import url="/footer"></c:import>
	

</body>
</html>