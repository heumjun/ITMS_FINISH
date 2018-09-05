<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
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

<form id="application_form" name="application_form" >
<input type="hidden" id="p_seq_id" name="p_seq_id" value="${notice.seq }" />
<input type="hidden" id="p_noti_flag" name="p_noti_flag" value="N" />
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
					<th style="font-size: 13px; font-weight: 100;">제목</th>
					<td><input type="text" class="common" id="p_title" name="p_title" alt="제목" style="width:100%;" value="${notice.title}" /></td>
				</tr>
				
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">공지기간</th>
					<td>
						<input type="text" class="common" id="p_noti_start_date" name="p_noti_start_date" alt="시작일"  style="width:120px;" value="${notice.noti_start_date}" />
						~
						<input type="text" class="common" id="p_noti_end_date" name="p_noti_end_date" alt="종료일" style="width:120px;" value="${notice.noti_end_date}" />
					</td>
				</tr>
				
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">공지여부</th>
					<td>
						<input type="checkbox" id="noti_flag_chk" name="noti_flag_chk" alt="공지여부" value="" onchange="javascript:fn_notiFlag_chk();"/>
					</td>
				</tr>	
				
				<tr>	
					<th style="font-size: 13px; align="right" valign="top">공지내용</th>
					<td>
						<textarea class="common" id="p_contents" name="p_contents" cols="1" rows="35" alt="공지내용">${notice.contents}</textarea>
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
<script type="text/javascript">

//달력 셋팅
$(function() {
	
  	$( "#p_noti_start_date, #p_noti_end_date" ).datepicker({
    	dateFormat: 'yy-mm-dd',
    	prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    //minDate: 0,
  	});
  	
});

$(document).ready(function() {
	
	var notiFlag = "${notice.noti_flag}";
	
	if( notiFlag == 'Y') {
		$("#noti_flag_chk").attr("checked", true);
		$("#p_noti_flag").val("Y");
	} 
	
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save();
	});
	
	$("#btnClose").click(function() {
		self.close();
	});
	
});

function fn_save() {
	
	var args = window.dialogArguments;
	var result = true;
	var message = "";
	
	if(uniqeValidation()) {
		
		var strDate1 = $("#p_noti_start_date").val();
	    var strDate2 = $("#p_noti_end_date").val();
	    
		if(strDate1 != '' && strDate2 != '') {
	    	
	    	var arr1 = strDate1.split('-');
		    var arr2 = strDate2.split('-');
		    
		    var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		    var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		    
		    if(dat1.getTime() > dat2.getTime()) {
		    	result = false;
		    	message = "종료일은 시작일보다 이후 날짜로 선택하세요.";
		    	$("#p_noti_end_date").focus();
		    }
		}
		
		if (!result) {
	    	alert(message);
	    	return false;
	    }
		
		var url = "infoSharing.noticeMgr.saveNotice.do";
		var formData = fn_getFormData('#application_form');
	
		if ( confirm( '저장 하시겠습니까?' ) != 0 ) {
			$.post( url, formData, function( data ) {
				alert(data.resultMsg);
				if ( data.result == 'success' ) {
					args.fn_search();
					self.close();
				}
			}, "json" ).error( function () {
				alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
			} );
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

function fn_notiFlag_chk() {
	if ($("#noti_flag_chk").is(":checked")) {
	    $("#p_noti_flag").val("Y");
	} else {
		$("#p_noti_flag").val("N");
	}
}

</script>
