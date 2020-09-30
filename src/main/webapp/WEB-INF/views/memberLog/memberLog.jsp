<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h1.mem {
	font-size: 2.0em;
	color: black;
	font-family: Gabriola;
	text-align: center;
	text-shadow: 1px 1px 3px gray;
	}

table.views{
	margin: auto;
	border-color: #050099;
	box-shadow: 5px 5px 5px black;
}

#first{
	background-color: black;
	color :white;
}

table.views tr:nth-child(2n+1) {
	background-color: white;
	color : black;
}

table.views tr:nth-child(2n) {
	background-color: #FAF4C0;
	color : black;
}

table.views th {
	width: 300px;
	height: 40px;
	font-size: 1.5em;
}
</style>

</head>
<body>
	<c:import url="/header"></c:import>
	<h1 class="mem"> = 로그인 정 보 = </h1>
	<table class="views" border="1">
	<tr id='first'><th>아이디</th><th>이름</th><th>접속시간</th><th>종료시간</th></tr>
	<c:choose>
		<c:when test="${loglist!=null}">
		<c:forEach var="loglist" items="${loglist}">
		<tr><th>${loglist.getId()}</th>
		<th>${loglist.getName()}</th>
		<th>${loglist.getJointime()}</th>
		<th>${loglist.getOuttime()}</th></tr>
		</c:forEach>
		</c:when>
	</c:choose>	
	</table>
	<c:import url="/footer"></c:import>
	
</body>
</html>