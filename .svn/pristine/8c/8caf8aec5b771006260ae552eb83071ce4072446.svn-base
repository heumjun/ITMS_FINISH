<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/uploadify.css" />
<style>
.endbox {
	position: relative;
	text-align: right;
	left: -10px;
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
	font-family: '굴림';
	border:1px solid #999999;
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

<form id="application_form" name="application_form" enctype="multipart/form-data" method="post">
<input type="hidden" id="p_seq_id" name="p_seq_id" value="" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${loginUser.seq_id }" />
<input type="hidden" id="ref_table_seq_id" name="ref_table_seq_id" value="" />
<div class="container-fluid">
	<div style="float: right; margin: 10px 0px 10px 0">
		<button type="button" id="btnSave" class="btn btn-primary btn-sm" >저장</button>
		<button type="button" id="btnClose" class="btn btn-primary btn-sm" >닫기</button>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="10%"/>
			<col width="*"/>
			<tbody>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">템플릿 제목</th>
					<td><input type="text" class="common" id="p_title" name="p_title" alt="제목" style="width:100%;" value="${notice.title}" /></td>
				</tr>
				
				<tr>	
					<th align="right" valign="top"템플릿 내용</th>
					<td>
						<textarea class="common" id="p_contents" name="p_contents" cols="1" rows="7" alt="내용">${notice.contents}</textarea>
					</td>
				</tr>
				<tr>	
					<th align="right" valign="top">템플릿 선택</th>
					<td>
						<select class="common" id="p_sel_temp" name="p_sel_temp">
						</select>
					</td>
				</tr>
				
				<tr>	
					<th align="right" valign="top"><input type="file" name="fileName" id="fileName" size="51"  multiple="true" /></th>
					<td>
						<div id="some_file_queue" style="height:200px; overflow: auto;"></div>
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
<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<script type="text/javascript">

//File Implode Submit Form 셋팅.
$(function() {
	
	$("#fileName").uploadify({
		buttonText  : '첨부파일',
		//buttonClass : 'some-class',
		auto 		: false,
		method   	: 'post',              //파라미터 전송 방식
		swf     	: '/css/uploadify.swf',
		uploader 	: 'temp.tempMgr.saveTempMgrAttachFile.do',
		height  	: 30,
		width    	: 120,
		queueID  	: 'some_file_queue', 
		fileDataName: 'fileName',
		onSelect 	: function(file) {
            //alert('The file ' + file.name + ' was added to the queue.');
            //$("#aa").append(file.name + "<br />");
        },
        onUploadStart : function(file) {
            $('#fileName').uploadify('settings','formData',{
                'ref_table_seq_id': $('#ref_table_seq_id').val()
            });
        },
        onUploadSuccess : function(file, data, response) {
        	
        },
        onQueueComplete : function(file) {
        	alert("처리가 완료되었습니다.");
        	window.close();
    		opener.fn_search();
        }
	});
}); //function end

$(document).ready(function() {
	
	getAjaxHtml($("#p_sel_temp"), "distb.distbMgr.distbChargeSelectBoxDataList.do?sb_type=sel&p_query=getDistbtempList", null, null);
	
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save();
	});
	
	$("#btnClose").click(function() {
		window.close();
	});
	
});


function fn_save() {
	
	var args = window.dialogArguments;
	var result = true;
	var message = "";
	
	if(uniqeValidation()) {
	
		var url = "temp.tempMgr.saveTempMgr.do";
		var formData = fn_getFormData('#application_form');
		
		if ( confirm( '저장 하시겠습니까?' ) != 0 ) {
			
			$.ajax({
				url:url,
				cache:false,
				data:formData,
				dataType:"json",
				type:'POST',
				success:function(data){
					$('#ref_table_seq_id').val(data.ref_table_seq_id);
					if ( data.result == 'success' ) {
						
						var queueCount = $("#some_file_queue > div").size();
			            if (queueCount < 1) {
			            	alert("처리가 완료되었습니다.");
			            	window.close();
			        		opener.fn_search();
			            } else {
			            	$('#fileName').uploadify('upload', '*');
			            }
						
					}
				},
				error:function(jxhr,textStatus)
				{
					alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
				}  
			});
			
		}
	}
	
}

//필수 항목 Validation
var uniqeValidation = function(){
	var rnt = true;
	$(".common").each(function(){
		if($(this).val() == ""){
			$(this).focus();
			alert($(this).attr("alt")+ "이 누락되었습니다.");
			rnt = false;
			return false;
		}
	});
	return rnt;
}

</script>
