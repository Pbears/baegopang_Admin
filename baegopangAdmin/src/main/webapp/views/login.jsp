<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>배고팡 관리자 사이트</title>
</head>
<style>
div.layer {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	display: -webkit-flex;
	-webkit-align-items: center;
	-webkit-justify-content: center;
	background: black;
}

div#innerDiv{
	background-color: #d2d2d2;
	width: 100%;
	padding: 20px;
}
h3#loginH3{
	text-align: center;
}
</style>
<script>
$(function(){
	$("button#checkId").click(function(){
		if($("input#id").val().trim().length!=0 && $("input#pw").val().trim().length!=0){
			$("form#loginFrm").submit();
		}else{
			alert("아이디와 암호를 확인하세요.");
			$("input#id").val("");
			$("input#pw").val("");
		}
	});
});
</script>
<body>
	<div class="layer">
		<form action="loginProcess.do" method="post" id="loginFrm">
			<div id="innerDiv">
				<div class="form-group">
					<h3 id="loginH3">Baegopang Admin</h3>
				</div>
				<br><br>
				<div class="form-group">
					<label for="exampleInputEmail1">아이디</label> 
					<input type="text" class="form-control" name="id" id="id" placeholder="이메일을 입력하세요">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">암호</label> 
					<input type="password" class="form-control" name="pw" id="pw" placeholder="암호">
				</div>
				<div class="form-group">
					<button id="checkId" class="btn btn-primary form-control">로그인</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>