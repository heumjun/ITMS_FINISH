<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<style>
.endbox {
	position: relative;
	text-align: right;
	left: -10px;
}

table th {
	text-align: center;
}

.required {
	background-color: #FFFFA2;
	text-transform: uppercase;
	border: 1px solid #000;
}

.common {
	font-family: '굴림';
	border: 1px solid #000;
	style="font-size: 13px; font-weight: 100;"
}

table {
	font-family: '굴림';
	font-size: 11px;
	font-weight: 100;
}

.btn-group-sm > .btn, .btn-sm {
	padding: .2rem .5rem;
}

.red_txt {
	color: #ea2020;
	text-decoration: underline;
	height: 25px;
	font-weight: bold;
	font-size: 13px;
}

</style>
<title>Excel Import</title>
</head>
<body>
<form id="application_form" name="application_form" enctype="multipart/form-data" action="dlm.geuntaeMgr.popUpGtmReqInfoExcelImportAction.do" method="post">
	<div class="container-fluid">
		<div class="table-responsive" style="margin-top: 10px;">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="10%"/>
			<col width="*"/>
				<tr>
					<td>
						<div  class="red_txt">※ Warning</div>
						- 업로드 가능한 파일의 확장자는 <b><u>.xls .xlsx</u></b>입니다.<br />
						- 다운받은 파일의 양식을  <b><u>변경할 경우 오류가 발생</u></b> 합니다.<br />
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td>
						<input type="file" name="fileName" id="fileExl" class="common" size="51" multiple />
					</td>
				</tr>
			</table>
		</div>
		<div style="float: right; margin: 0px 0px 10px 0">
			<button type="button" id="btnExlUp" class="btn btn-primary btn-sm" >업로드</button>
			<button type="button" id="btnClose" class="btn btn-primary btn-sm" >취소</button>
		</div>
	</div>
</form>
<script src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/commonTextUtil.js" charset='utf-8'></script>

<script type="text/javascript" >
	$(document).ready(function(){
		//Close 버튼 클릭.
		$("#btnClose").click(function(){
			self.close();
		});
		//엑셀 업로드 클릭
		$("#btnExlUp").click(function(){
			
			var file = $("#fileExl").val().toLowerCase();
			
			var formData = fn_getFormData('#application_form');
			
			if(!isExcelFile(file)){
				return false;	
			} else {
				
				var form = $('#application_form');
				form.encoding = "multipart/form-data";
				form.action = "dlm.geuntaeMgr.popUpGtmReqInfoExcelImportAction.do";
				
				form.submit();
			}
			
		});
		
	});
	
	//엑셀 파일 체크
	var isExcelFile = function(file) {
		if(file == "" || ( file.indexOf(".xls") < 0 && file.indexOf(".xlsx") < 0) ){
			alert("Enter a file or Check the file format");
			return false;
		}else{
			return true;
		}
	}
	
</script>
</body>
</html>