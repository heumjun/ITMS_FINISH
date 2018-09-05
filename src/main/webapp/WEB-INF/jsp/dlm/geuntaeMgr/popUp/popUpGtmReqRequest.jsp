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
	border: 1px solid #000;
}

table {
	font-family: '굴림';
	font-size: 11px;
	font-weight: 100;
}

.btn-group-sm > .btn, .btn-sm {
	padding: .2rem .5rem;
}

.ui-datepicker{
		font-size : 11px;
		width : 170px; 
}
/* .ui-datepicker select.ui-datepicker-month{
				width:30%;  
				font-size: 13px;
				
}
.ui-datepicker select.ui-datepicker-year{
				width:40%;     
				font-size: 13px; 
				
} */



</style>

<form id="application_form" name="application_form" >
<input type="hidden" id="p_user_name" name="p_user_name" value="${loginUser.name}" />
<input type="hidden" id="p_rank" name="p_rank" value="${loginUser.rank}" />
<input type="hidden" id="p_vac_name" name="p_vac_name" value="" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${loginUser.seq_id}" />
<input type="hidden" id="bonusDay" name="bonusDay" value="${bonusDay}" />
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb" style="margin-bottom: 0px;">
		<li class="breadcrumb-item"><a href="#">휴가 신청</a></li>
	</ol>
	<div style="float: right; margin: -38px 0px 4px 0">
		<button type="button" id="btnSave" class="btn btn-primary btn-sm" >저장</button>
		<button type="button" id="btnClose" class="btn btn-primary btn-sm" >닫기</button>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="80"/>
			<col width="150"/>
			<tbody>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">신청자</th>
					<td><input type="text" class="common" id="p_login_id" name="p_login_id" alt="아이디" style="width:120px;" disabled="disabled" value="${loginUser.name}" /></td>
				</tr>
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">휴가종류</th>
					<td>
						<select id="p_vac_type" name="p_vac_type"  onchange="javascript:vacTypeChange(this.value);" style="width:120px; font-size: 13px; font-weight: 100;">
						</select>
					</td>
				</tr>
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">휴가신청기간</th>
					<td>
						<input type="text" class="common" id="p_vac_start_date" name="p_vac_start_date" alt="시작일"  onchange="javascript:vacReqDayChage();" style="width:120px;" value="" />
						~
						<input type="text" class="common" id="p_vac_end_date" name="p_vac_end_date" alt="종료일" onchange="javascript:vacReqDayChage();" style="width:120px;" value="" />
					</td>
				</tr>	
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">휴가신청일수</th>
					<td>
						<input type="text" class="common" id="p_vac_req_day" name="p_vac_req_day" alt="이름"  style="width:120px;" value="" readonly="readonly" />
					</td>
				</tr>
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">신청사유</th>
					<td>
						<input type="text" class="common" id="p_vac_req_reason" name="p_vac_req_reason" alt="시작일"  style="width:300px;" value="" />
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

var date = new Date();

var holidayStr = '';
var gon = {};

//달력 셋팅
$(function() {
	
	var holidays = [];
	
	$.ajax({
		url: 'dlm.geuntaeMgr.getDatePickerHoliday.do',
		method : 'POST',
		dataType: 'json',
		success: function(data) {
			$(data).each(function(i) {
				holidays.push($(this).attr('holiday'));
				
				if(i == 0) { 
					holidayStr = $(this).attr('holidaystr');
				} else {
					holidayStr += "," + $(this).attr('holidaystr');
				}
            });
			gon["holiday"] = holidayStr.split(",");
        },
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code : " + request.status + "\r\nmessage : " + request.reponseText + "\r\nerror : " + error);
			}
		}
	});
	
  	$( "#p_vac_start_date, #p_vac_end_date" ).datepicker({
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
	    //beforeShowDay: DisableSpecificDates,
	    beforeShowDay: function(date){
	    	
	    	var m = date.getMonth();
	    	var d = date.getDate();
	    	var y = date.getFullYear();
	     	
	    	var currentdate = y + '-' + (m + 1) + '-' + d;
	    	
	    	for (var i = 0; i < holidays.length; i++) {
	    		
	    		if ($.inArray(currentdate, holidays) != -1 ) {
	    			return [false];
	    		}
	    	}
	    	
	    	var weekenddate = $.datepicker.noWeekends(date);
	    	return weekenddate; 
	    }
	    
  	});
  	
 	// 휴가종류 SelectBox
	getAjaxHtml($("#p_vac_type"), "dlm.geuntaeMgr.vacTypeSelectBoxDataList.do?sb_type=sel&p_query=getVacTypeSelectBoxDataList", null, null);
  	
});

$(document).ready(function(){
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save();
	} );
	
	$("#btnClose").click(function() {
		self.close();
	});
});

function fn_save() {
	
	var args = window.dialogArguments;
	var result = true;
	var message = "";
	var bonusDay = $("#bonusDay").val();
	
	$("#p_vac_name").val( $("#p_vac_type option:selected").text() );

	if($("#p_vac_type").val() == '') {
    	alert("휴가종류를 선택하세요!");
    	return false;
	}

	if($("#p_vac_start_date").val() == '') {
    	alert("휴가신청 기간 시작일을 입력하세요!");
    	return false;		
	}
	
	if($("#p_vac_end_date").val() == '') {
    	alert("휴가신청 기간 종료일을 입력하세요!");
    	return false;		
	}

	if($("#p_vac_req_day").val() == '') {
    	alert("휴가신청일수를 입력하세요!");
    	return false;		
	}
	
	if($("#p_vac_type").val() == 'VAC_BAN' || $("#p_vac_type").val() == 'VAC_YEAR') {
		if(bonusDay > 0) {
			result = false;
			message = "대체휴가가 남아있습니다.\n먼저 사용해주세요. (" + bonusDay +"일)";
		}
	} else if($("#p_vac_type").val() == 'VAC_BON') {
		if(($("#p_vac_req_day").val() * 1) > (bonusDay * 1)) {
			result = false;
			message = "사용가능한 대체휴가일은 " + bonusDay + "일 입니다.";
		}
	}
	
	if (!result) {
    	alert(message);
    	return false;
    }
	
	var url = "dlm.geuntaeMgr.saveGtmReqInfo.do";
	var formData = fn_getFormData('#application_form');

	if ( confirm( '휴가신청을 하시겠습니까?' ) != 0 ) {
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

function vacTypeChange(type) 
{
	if(type == 'VAC_BAN')   
	{
		$("#p_vac_req_day").attr("readonly" , true); 
	}
	else
	{
		$("#p_vac_req_day").attr("readonly" , false);
	}	
	
	vacReqDayChage();
}

function vacReqDayChage() {
	
	var result = true;
	var message = "";
	
	var strDate1 = $("#p_vac_start_date").val();
    var strDate2 = $("#p_vac_end_date").val();
    
    if(strDate1 != '' && strDate2 != '') {
    	
    	var arr1 = strDate1.split('-');
	    var arr2 = strDate2.split('-');
	    
	    var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	    var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	    
	    if(arr1[0] != arr2[0]) {
	    	result = false;
	    	message = '시작년도와 종료년도가 같아야합니다.\n년도별  각각 신청 하시기 바랍니다.';
	    	$("#p_vac_start_date").val('');
	    	$("#p_vac_end_date").val('');
	    }
	    
    	if($("#p_vac_type").val() == 'VAC_BAN') {
    		
    		if(strDate1 != strDate2) {
    			result = false;
    			message = '반차 사용시 휴가 시작일과 종료일이 같아야 합니다.';
    			$("#p_vac_end_date").focus();
    		}
    		
    	} else {
    	    if(dat1.getTime() > dat2.getTime()) {
    	    	result = false;
    	    	message = "종료일은 시작일보다 이후 날짜로 선택하세요.";
    	    	$("#p_vac_end_date").focus();
    	    }
    	}
    	
    	if (!result) {
	    	alert(message);
	    	return false;
	    }
    	
		var count = calculateDays(strDate1, strDate2);
		
		if($("#p_vac_type").val() == 'VAC_BAN') 
		{
			$("#p_vac_req_day").val('0.5');
		}
		else 
		{
			$("#p_vac_req_day").val(count);
		}
    }
	
}


</script>
