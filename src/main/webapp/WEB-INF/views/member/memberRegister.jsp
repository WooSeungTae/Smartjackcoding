<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">

table.register{
	margin: auto;
	color: black;
	text-shadow: 1px 1px 2px gray;
	text-align: left;
	font-size: 1.5em;
}

h1.register {
	font-size: 5.0em;
	color: black;
	text-align: center;
	text-shadow: 1px 1px 3px gray;
	cursor:pointer;
}
h1.register a {
	font-size: 1.0em;
	color: black;
	text-align: center;
	text-shadow: 1px 1px 3px gray;
	cursor:pointer;
	text-decoration: none;
	}	
	
.textStyle{
	color: black;
	font-weight :bold;
	font-size: 1.0em;
	width: 450px;
	height : 45px;
	text-align: center;
	cursor:pointer;
}
hr.register {
	width : 450px;
	height: 2px;
	background-color: black;

}

footer.register{
	text-align: center;
	color: black;
	font-size: 1.5em;
	font-family: Gabriola;
	font-stretch: wider;
	font-style : italic;
	font-weight : bold;
	text-shadow: 1px 1px 3px gray;

}

/*주소검색 css*/
#checkOutButton {
  background-color: #e9e9e9; 
  border: none;
  color: black;
  padding: 8px 10px 10px 10px;
  text-align: center;
  font-size: 18px;
  font-weight : 900;
  border-radius: 8px;
  margin: 10px 0 0 0;
}

</style>
</head>
<body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	function register(){
		if(document.getElementById("id").value==""){
			alert('아이디를 입력하세요');
			document.getElementById("id").focus();
		}else if(document.getElementById("pwd").value==""){
			alert('비밀번호를 입력하세요');
			document.getElementById("pwd").focus();
		}else if(document.getElementById("pwdchek").value==""){
			alert('비밀번호를 재확인하세요');
			document.getElementById("pwd").focus();
		}else if(document.getElementById("name").value==""){
			alert('이름을 입력하세요');
			document.getElementById("name").focus();
		}else if(document.getElementById("addrFirst").value==""){
			alert('주소를 검색해주세요');
			document.getElementById("addrFirst").focus();
		}else if(document.getElementById("addrSecond").value==""){
			alert('나머지 주소를 입력해주세요');
			document.getElementById("addrSecond").focus();
		}else if(document.getElementById("tel").value==""){
			alert('전화번호를 입력하세요');
			document.getElementById("tel").focus();
		}else if(document.getElementById("birth").value==""){
			alert('생년월일을 입력하세요');
			document.getElementById("birth").focus();
		}else {
			fo.submit();
		}
	}

	function compare(){
		if(document.getElementById('pwd').value==document.getElementById('pwdchek').value){
			document.getElementById('check').innerHTML="일치합니다.!!"
		}else {
			document.getElementById('check').innerHTML="비밀번호 재확인해주세요!! 불일치!!"
			document.getElementById('pwd').value="";
			document.getElementById('pwdchek').value="";
			document.getElementById('pwd').focus();
		}
	}
	
	/*주소검색*/
	function addrsearch(){
	   new daum.Postcode({
	       oncomplete: function(data) {
	    	   document.getElementById("addrFirst").value=data.jibunAddress;
	    	   console.log(data.jibunAddress);
	    /*
               alert(data.userSelectedType) // (J : 지번 , R : 도로명)
               alert(data.jibunAddress)     // (지번 풀주소 반환)
              alert(data.sido);            // 시반환(서울특별시)
              alert(data.sigungu);         // 구반환(은평구) 
              alert(data.bname);           // 동반환(갈현동)
              alert(data.postcode);        // 우편번호 반환(6자리)
              alert(data.zonecode);        // 우편번호 반환(5자리)
              */
	       },
	       //shorthand : false 
	   }).open();
	}
		
	</script>
	<c:import url="/header"></c:import>
	<c:choose>
		<c:when test="${regCheck==1 }">
			<script type="text/javascript">
				alert("회원가입 성공 하였습니다. 회원이 되신것들 축하드립니다.")
				location.href = "main"
			</script>
		</c:when>
		<c:when test="${regCheck==0 }">
			<script type="text/javascript">
				alert("회원가입 실패하였습니다. 다시한번 확인해 주시기 바랍니다.")
				location.href = "memberRegister"
			</script>
		</c:when>
	</c:choose>
	<hr class="register">
<form id = "fo" action="memberRegisterCheck" method="post">
<table class="register">
<tr><td>아이디</td></tr>
<tr><td><input type="text" id = "id" name = "id" class = "textStyle" placeholder="사용하실 ID를 입력해주세요."><br><br></td></tr>
<tr><td>비밀번호</td></tr>
<tr><td><input type="text" id = "pwd" name = "pwd" class = "textStyle" placeholder="영문+숫자"><br><br></td></tr>
<tr><td>비밀번호 재확인</td></tr>
<tr><td><input onchange="compare()" type="text" id = "pwdchek" name = "pwdchek" class = "textStyle" placeholder="패스워드를 다시 입력해 주세요."><br>
<label id ="check" style="float: right; color: red; font-size: 0.8em;"></label></td></tr>
<tr><td><br>이름</td></tr>
<tr><td><input type="text" id = "name" name = "name" class = "textStyle" placeholder="이름을  입력해 주세요."><br><br></td></tr>
<tr><td>주소</td></tr>
<tr><td><input type="text" style="width: 350px;" id = "addrFirst" name = "addrFirst" class = "textStyle">&nbsp;<span id="checkOutButton" onclick='addrsearch()'>주소검색</span></td></tr>
<tr><td><input type="text" id = "addrSecond" name = "addrSecond" class = "textStyle" placeholder="나머지주소입력해주세요."><br><br></td></tr>
<tr><td>전화번호</td></tr>
<tr><td><input type="text" id = "tel" name = "tel" class = "textStyle" placeholder="휴대폰 번호 '-'표 없이  입력해 주세요."><br><br></td></tr>
<tr><td>생년월일</td></tr>
<tr><td><input type="text" id = "birth" name = "birth" class = "textStyle" placeholder="생년월일 예)2020.01.01"><br><br></td></tr>
<tr><th style="background-color: black; color: white; height: 50px; text-align: center;" onclick="register()">가입하기</th></tr>
</table>
</form>
<br>
<hr class="register" >
<c:import url="/footer"></c:import>

</body>
</html>