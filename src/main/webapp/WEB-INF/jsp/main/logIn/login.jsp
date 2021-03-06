<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>ITMS</title>
<!-- Bootstrap core CSS-->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="/css/sb-admin.css" rel="stylesheet">
<style type="text/css">
/*로그인*/
.body_bg {
	background: url(../images/login/bg.jpg) no-repeat ;
	background-size: cover;
}
</style>
</head>

<body class="body_bg" onload="fn_init();">
	<div class="container" style="margin-top: 200px;">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">로그인</div>
			<div class="card-body">
				<form name="login_form" method="post" action="loginCheck.do" autocomplete="off">
					<div class="form-group">
						<label for="exampleInputEmail1">아이디</label> 
						<input class="form-control" id="login_id" name="login_id" type="text" placeholder="" value="" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label> 
						<input class="form-control" id="login_pw" name="login_pw" type="password" placeholder="" value="" />
					</div>
					<a class="btn btn-primary btn-block" href="javascript:loginCheck();">로그인</a>
				</form>
				
				<div class="text-center">
					<a class="small mt-3" href="main.memberJoin.memberJoin.do">회원가입</a> / <a class="small" href="main.passwdInit.passwdInit.do">비밀번호 초기화</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="/js/jquery-1.11.0.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#login_id").focus();

			//key evant 
			$("#login_id").keypress(function(event) {
				if (event.which == 13) {
					loginCheck();
				}
			});
			
			//key evant 
			$("#login_pw").keypress(function(event) {
				if (event.which == 13) {
					loginCheck();
				}
			});

		});

		function fn_init() {
			var errMsg = "${errMessage}";
			if (errMsg != null && errMsg != "") {
				alert(errMsg);
				document.login_form.login_id.focus();
				return;
			}
		}

		function loginCheck() {
			
			var result = true;
			
			if ($("#login_id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#login_id").focus();
				result = false;
				return;
			}
			if ($("#login_pw").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#login_pw").focus();
				result = false;
				return;
			}
			
			if(result) {
				login_form.submit();	
			}
			
		}
	</script>
</body>

</html>
