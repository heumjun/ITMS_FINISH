<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/ui.jqgrid.css" type="text/css" />
<link rel="stylesheet" href="/css/redmond/jquery-ui-1.10.4.custom.css" type="text/css" />
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

.common, select {
	font-family: '굴림';
	border:1px solid #999999;
    width:100%;
    margin:5px 0;
    padding:3px;
}

table {
	font-family: '굴림';
	font-size: 11px;
	font-weight: 100;
}

.btn-group-sm > .btn, .btn-sm {
	padding: .2rem .5rem;
}

textarea
{
  border:1px solid #999999;
  width:100%;
  margin:5px 0;
  padding:3px;
}

</style>
<form id="application_form" name="application_form" >
<input type="hidden" id="p_seq_id" name="p_seq_id" value="${seq_id}" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${icui_seq_id}" />
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">게시글 등록</a></li>
	</ol>
	<div style="float: right; margin: 10px 0px 10px 0">
		
	</div>
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    	<col width="80">
		<col width="1000">
		<col width="*"/>
		<tr>
			<th>제목</th>
			<td>
		       <input type="text" id="p_title" name="p_title" style="width:800px;" class="common" value="${title}"/>
		    </td>
		    <td>
		    	<div class="button endbox">
					<button type="button" id="btnSave" class="btn btn-primary btn-sm" >저장</button>
					<button type="button" id="btnList" class="btn btn-primary btn-sm" >목록</button>
				</div>
		    </td>
		</tr>
		<tr>	
			<th align="right" valign="top">내용</th>
			<td colspan="2">
				<input type="hidden" id="p_content" name="p_content" value="" />
				<textarea class="common" id="ckeditor" name="ckeditor" cols="1" rows="30" alt="내용">${contents}</textarea>
			</td>
		</tr>
    </table>
</div>
</form>
<!-- /.container-fluid-->
<!-- Bootstrap core JavaScript-->
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<!-- <script src="/js/jquery-easing/jquery.easing.min.js"></script> -->
<!-- Custom scripts for all pages-->
<script src="/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->

<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/commonTextUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/jquery.jqGrid.min.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/jqgrid/i18n/grid.locale-en.js" charset='utf-8'></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

$(function(){
	
    CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'500px',
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

$(document).ready(function(){
	
    $("#btnSave").click(function(){
        
        //에디터 내용 가져옴
        var contents = CKEDITOR.instances.ckeditor.getData().replace(/(\r\n|\n|\r)/gm,'');;
        $("#p_content").val(contents); 
        
        //널 검사
        if($("#p_title").val().trim() == ""){
            alert("제목을 입력하세요.");
            $("#p_title").focus();
            return false;
        }
        
        var formData = fn_getFormData('#application_form');
         
      	//ajax 호출
        if ( confirm( '저장 하시겠습니까?' ) != 0 ) {
	        $.ajax({
	            url         :   "infoSharing.boardMgr.boardMgrSave.do",
	            dataType    :   "json",
	            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	            type        :   "post",
	            data        :   formData,
	            success     :   function(data){
	            	alert(data.resultMsg);
	    			if ( data.result == 'success' ) {
	    				location.href = "infoSharing.boardMgr.boardMgr.do";
	    			}
	            },
	            error       :   function(request, status, error){
	            	alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
	            	location.href = "infoSharing.boardMgr.boardMgr.do";
	            }
	        });
        }
        
    });
	
	$("#btnList").click(function() {
	    location.href = "infoSharing.boardMgr.boardMgr.do";
	});
});
</script>
