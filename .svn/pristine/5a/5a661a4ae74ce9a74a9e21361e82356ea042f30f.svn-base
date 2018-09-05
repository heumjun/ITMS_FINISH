<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	//치환 변수 선언합니다.
	pageContext.setAttribute("crcn", "\n"); //Space, Enter
	pageContext.setAttribute("br", "<br />"); //br 태그
%> 
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<style>
.endbox {
	position: relative;
	text-align: right;
	left: -10px;
	height:22px;
}

table th {
	text-align: left;
}

.required {
	background-color: #FFFFA2;
	text-transform: uppercase;
	border: 1px solid #000;
}

.common {
	border: 1px solid #000;
	font-size: 11px; 
	font-weight: 100;
}

textarea
{
  border:1px solid #999999;
  width:100%;
  margin:5px 0;
  padding:3px;
}

</style>

<form id="application_form" name="application_form" enctype="multipart/form-data" method="post">
<div class="container-fluid">
	<div style="float: right; margin: 10px 0px 10px 0">
		<button type="button" id="btnClose" class="btn btn-primary btn-sm" >닫기</button>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="*"/>
			<tbody>
				<tr>	
					<td>
						<textarea name="ckeditor" id="ckeditor"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</form>
<!-- /.container-fluid-->
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/commonDateUtil.js"></script>
<script type="text/javascript" src="/js/jqueryAjax.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
var date = new Date(); 

$(function(){
    
    CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'600px',
        filebrowserImageUploadUrl: '/community/imageUpload.do', //여기 경로로 파일을 전달하여 업로드 시킨다.
    });
     
     
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
      
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    
});

$(document).ready(function() {
	

	$("#btnClose").click(function() {
		window.close();
	});
	
	// Insert Text into CKEDITOR
	CKEDITOR.instances.ckeditor.setData();  //  에디터에 내용 초기화(비우기)
	setTimeout(function() {
		CKEDITOR.instances.ckeditor.document.getBody().setHtml("${fn:replace(mailNotice.contents, crcn, br)}");
		// html 코드를 정상적으로 에디터에 추가하기 위한 방법
	}, 1000);
	
	// 에디터 비활성화
	CKEDITOR.config.readOnly = true;
	// 에디터 툴바삭제
	CKEDITOR.config.removePlugins = 'toolbar';
	
});

</script>
