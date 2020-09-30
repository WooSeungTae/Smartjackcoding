<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

div.header {
	margin : auto;
	text-align : right;
	display : flex; flex-flow : column;
	top : 2%;
	
}

h1.header {
	font-size: 5.0em;
	color: black;
	text-align: center;
	text-shadow: 1px 1px 3px gray;

	}
	
h1.header a {
	font-size: 1.0em;
	color: black;
	text-align: center;
	text-shadow: 1px 1px 3px gray;
	cursor:pointer;
	text-decoration: none;
	}	
	

header.header{
	
	text-align: right;
	color: black;
	font-size: 2.5em;
	font-weight: bold;
	text-shadow: 1px 1px 3px gray;
	padding: 0 5% 0 0;
	
}


header.header a{
	position : static;
	right : 20%;
	color: black;
	font-size: 0.7em;
	margin : 10px;
	padding : 10px;
	font-weight: bold;
	text-shadow: 1px 1px 3px gray;
	text-decoration: none;
	cursor:pointer;
}

hr.header {
	width : 100%;
	height: 2px;
	background-color: black;
}

body{

	width : 80%;
	margin: auto;
	padding : 0 0 12% 0;
}


</style>
</head>
<body>
<div class="header">
<h1 class="header"><a href="/smartjacktest/main">Smart jack Test WEB</a></h1>
<hr class="header">
<header class="header">
<a href="/smartjacktest/main"> HOME </a>
<a href="/smartjacktest/galleryview"> GALLERY </a>
<c:choose>
	<c:when test="${sessionId!=null}">
	<a href="/smartjacktest/memberlog"> 로그기록 </a>
	<a href="/smartjacktest/logout"> 로그아웃 </a>
	</c:when>
	<c:otherwise>
	<a href="/smartjacktest/login"> 로그인 </a>
	</c:otherwise>
</c:choose>

</header>
<hr class="header">
</div>
</body>
</html>