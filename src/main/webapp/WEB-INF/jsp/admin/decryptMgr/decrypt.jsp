<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>ITMS</title>
<!-- Bootstrap core CSS-->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/css/font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="/css/sb-admin.css" rel="stylesheet">
</head>

<body class="body_bg">
	<form id="login_form" name="login_form">
		<div class="container" style="margin-top: 200px;">
			<div class="card card-login mx-auto mt-5">
				<div class="card-header">비밀번호 확인</div>
				<div class="card-body">
					<form>
						<div class="form-group">
							<input class="form-control" style="margin-top: 2px;" id="p_name" name="p_name" type="text" placeholder="이름">
						</div>
						<div class="form-group">
							<input class="form-control" id="p_id" name="p_id" type="text" placeholder="아이디">							 
						</div>
						<a class="btn btn-primary btn-block" href="javascript:passwdConfirm();">비밀번호 확인</a>
						<br />
						<div class="form-group">
							<input class="form-control" style="margin-top: 2px;" id="p_password" name="p_password" type="text" disabled="disabled"> 
						</div>
					</form>
					<br />
				</div>
			</div>
		</div>
	</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/jqueryAjax.js"></script>
<script type="text/javascript">
function passwdConfirm() {
	
	$.ajax({
		type : 'POST',
		url : 'admin.decryptMgr.passwdConfirm.do',
		data : $("#login_form").serialize(),
		dataType : 'json',
		success : function(data) {
 			if(data.result == 'success') {
				$("#p_password").val(data.password);
			} else {
				alert(data.resultMsg);	
			}
		},
		error : function(xhr, status, error) {
			alert('시스템 오류입니다.\n전산담당자에게 문의해주세요.');
		}
	});
}

</script>



</html>
