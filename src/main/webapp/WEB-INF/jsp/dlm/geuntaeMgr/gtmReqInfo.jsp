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
</style>

<form id="application_form" name="application_form" >
<input type="hidden" id="loginId" name="loginId" value="${loginId }" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${loginUser.seq_id }" />
<input type="hidden" id="approvalAdmin" name="approvalAdmin" value="${approvalAdmin }" />
<input type="hidden" id="p_seq_id" name="p_seq_id" value="" />
<input type="hidden" id="status" name="status" value="" />
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<div class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">근태신청 및 관리</a></li>
	</div>
	
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<col width="70">
		<col width="90">
		<col width="70">
		<col width="110">
		<col width="70">
		<col width="110">
		<col width="*"/>
		<tbody>
			<tr>
				<th style="font-size: 13px; font-weight: 100;">사용자명</th>
				<td><input type="text" class="common" id="p_name" name="p_name" alt="이름"  style="width:90px;" value="" /></td>
				<th style="font-size: 13px; font-weight: 100;">휴가종류</th>
				<td>
					<select id="p_vac_type" name="p_vac_type"  style="width:120px; font-size: 13px; font-weight: 100;">
					</select>
				</td>
				<th style="font-size: 13px; font-weight: 100;">승인상태</th>
				<td>
					<select id="p_status" name="p_status"  style="width:120px; font-size: 13px; font-weight: 100;">
					</select>
				</td>
				<td>
					<div class="button endbox">
						<button type="button" id="btnSearch"   class="btn btn-primary btn-sm" >조회</button>
						<button type="button" id="btnRequest"  class="btn btn-primary btn-sm" >신청</button>
						<button type="button" id="btnDelete"   class="btn btn-primary btn-sm" >취소</button>
						<button type="button" id="btnCancel"   class="btn btn-primary btn-sm" >승인취소요청</button>
						<button type="button" id="btnApproval" class="btn btn-success btn-sm" >승인</button>
						<button type="button" id="btnRestore"  class="btn btn-danger  btn-sm" >반려</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="table-responsive">
		<table id="jqGridList"></table>
		<div id="btnjqGridList"></div>
	</div>
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
<script src="/js/jqueryAjax.js"></script>

<script type="text/javascript">
var idRow;
var idCol;
var kRow;
var kCol;
var resultData = [];

var jqGridObj = $('#jqGridList');

$(function() {
	
	// 휴가종류 SelectBox
	getAjaxHtml($("#p_vac_type"), "dlm.geuntaeMgr.vacTypeSelectBoxDataList.do?sb_type=sel&p_query=getVacTypeSelectBoxDataList", null, null);
	
	// 승인상태 SelectBox
	getAjaxHtml($("#p_status"), "dlm.geuntaeMgr.statusSelectBoxDataList.do?sb_type=sel&p_query=getStatusSelectBoxDataList", null, null);	
});

$(document).ready(function(){
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'dlm.geuntaeMgr.gtmReqInfoList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', '아이디', '이름', '휴가CODE', '휴가종류', '신청일자', '시작일', '종료일', '휴가신청일수', '신청사유', 'STATUS', '상태', '승인자', '승인일', 'OPER'],
	    colModel : [
					{name:'seq_id',index:'seq_id', width:55, hidden : true},
					{name:'icui_seq_id',index:'icui_seq_id', width:55, excel:'아이디', editable : false, hidden: true},
					{name:'user_name',index:'user_name', width:30, align:'center', editable : true},
					{name:'vac_type', index:'vac_type', width:50, align:'center', sortable:true, title:false, hidden: true},
					{name:'vac_type_name', index:'vac_type_name', width:50, align:'center', sortable:true, title:false, hidden: false},
					{name:'req_date',index:'req_date', width:40, sortable:false, align:'center', editable : true},
					{name:'vac_start_date',index:'vac_start_date', width:40, sortable:false, align:'center', editable : true},
					{name:'vac_end_date',index:'vac_end_date', width:40, sortable:false, align:'center', editable : true},
					{name:'vac_req_day',index:'vac_req_day', width:40, sortable:false, align:'center', editable : true},
					{name:'vac_req_reason',index:'vac_req_reason', width:150, sortable:false, align:'left', editable : true, hidden: false},
					{name:'status',index:'status', width:50, sortable:false, align:'center', editable : true, hidden: true},
					{name:'status_name',index:'status_name', width:40, sortable:false, align:'center', editable : true},
					{name:'vac_approver',index:'vac_approver', width:80, sortable:false, align:'center', editable : true, hidden: true},
					{name:'vac_approve_date',index:'vac_approve_date', width:50, sortable:false, align:'left', editable : true, hidden: true},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    autowidth: true,
	    cellEdit : false,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit:true,
	    multiselect: true,
	    rownumbers: false,
	    pager: $('#btnjqGridList'),
	    rowList:[100,500,1000],
	    recordtext: '내용 {0} - {1}, 전체 {2}',
	    emptyrecords:'조회 내역 없음',
	    rowNum : 100, 
		beforeEditCell :  function(rowid, cellname, value, iRow, iCol) {
	    	idRow=rowid;
	    	idCol=iCol;
	    	kRow = iRow;
	    	kCol = iCol;
		},
		beforeSaveCell : chmResultEditEnd,
		jsonReader : {
	        root: "rows",
	        page: "page",
	        total: "total",
	        records: "records",  
	        repeatitems: false,
	    },        
	    //imgpath: 'themes/basic/images',
	    onPaging: function(pgButton) {
	    	
    		var pageIndex         = parseInt($(".ui-pg-input").val());
   			var currentPageIndex  = parseInt(jqGridObj.getGridParam("page"));// 페이지 인덱스
   			var lastPageX         = parseInt(jqGridObj.getGridParam("lastpage"));  
   			var pages = 1;
   			var rowNum 			  = 100;	   

   			if (pgButton == "user") {
   				if (pageIndex > lastPageX) {
   			    	pages = lastPageX
   			    } else pages = pageIndex;
   				
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
   			else if(pgButton == 'next'){
   				pages = currentPageIndex+1;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			} 
   			else if(pgButton == 'last'){
   				pages = lastPageX;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
   			else if(pgButton == 'prev'){
   				pages = currentPageIndex-1;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
   			else if(pgButton == 'first'){
   				pages = 1;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
 	   		else if(pgButton == 'records') {
   				rowNum = $('.ui-pg-selbox option:selected').val();     
   			}
   			
   			$(this).jqGrid("clearGridData");
   			$(this).setGridParam({datatype: 'json',page:''+pages, rowNum:''+rowNum}).triggerHandler("reloadGrid"); 		
		 },		
		 loadComplete: function (data) {
			var $this = $(this);
			if ($this.jqGrid('getGridParam', 'datatype') === 'json') {
			    $this.jqGrid('setGridParam', {
			        datatype: 'local',
			        data: data.rows,
			        pageServer: data.page,
			        recordsServer: data.records,
			        lastpageServer: data.total
			    });
			
			    this.refreshIndex();
			
			    if ($this.jqGrid('getGridParam', 'sortname') !== '') {
			        $this.triggerHandler('reloadGrid');
			    }
			} else {
			    $this.jqGrid('setGridParam', {
			        page: $this.jqGrid('getGridParam', 'pageServer'),
			        records: $this.jqGrid('getGridParam', 'recordsServer'),
			        lastpage: $this.jqGrid('getGridParam', 'lastpageServer')
			    });
			    this.updatepager(false, true);
			}
			
			var rows = $(this).getDataIDs();
			for ( var i = 0; i < rows.length; i++ ) {
				
				var item = jqGridObj.jqGrid( 'getRowData', rows[i] );
				
				if(item.status == 'B' || item.status == 'CS') {
					$("tr#" + rows[i] + ".jqgrow > td > input.cbox").attr("disabled", true);	
				}
			}
		},
		gridComplete : function() {
			
			var rows = jqGridObj.getDataIDs();
			for( var i = 0; i < rows.length; i++ ) {
				
				var status = jqGridObj.getCell( rows[i], "status" );
				
				if(status == 'R' || status == 'C') {
					jqGridObj.jqGrid( 'setCell', rows[i], 'status_name', '', { background : '#6DFF6D'} );
				} else if(status == 'B' || status == 'CS') {
					//jqGridObj.jqGrid( 'setCell', rows[i], 'status_name', '', { background : 'red'} );
					jqGridObj.setRowData(rows[i], false, {background : "#dfdfdf"});
				} else {
					jqGridObj.setRowData(rows[i], false, {background : "#87CEFA"});
				}
			}
		},
		beforeSelectRow:function(rowid, e) {   
			var cbsdis = $("tr#"+rowid+".jqgrow > td > input.cbox:disabled", jqGridObj[0]);
	        if (cbsdis.length === 0) {
	            return true;    // allow select the row
	        } else {
	            return false;   // not allow select the row
	        }
		},
		onSelectAll: function(aRowids,status) {
			if (status) {
	            // uncheck "protected" rows
	            var cbs = $("tr.jqgrow > td > input.cbox:disabled", jqGridObj[0]);
	            cbs.removeAttr("checked");

	            //modify the selarrrow parameter
	            jqGridObj[0].p.selarrrow = jqGridObj.find("tr.jqgrow:has(td > input.cbox:checked)")
	                .map(function() { return this.id; }) // convert to set of ids
	                .get(); // convert to instance of Array
	        }
		 },
	}); //end of jqGrid
	
	// jqGrid 크기 동적화
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	
	$( "#jqGridList" ).jqGrid( 'setGroupHeaders', {
		useColSpanStyle : true, 
		groupHeaders : [ { startColumnName : 'req_date', numberOfColumns : 4, titleText : '휴가신청'}]
	} );
	
	if($("#loginId").val() == $("#approvalAdmin").val()) {
		$("#btnApproval").show();
		$("#btnRestore").show();
		
		/* $("#btnRequest").hide();
		$("#btnDelete").hide();
		$("#btnCancel").hide(); */
	} else {
		$("#btnApproval").hide();
		$("#btnRestore").hide();
	}
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
	// 신청버튼
	$( "#btnRequest" ).click( function() {
		var sUrl = "dlm.geuntaeMgr.popUpGtmReqRequest.do";
		window.showModalDialog( sUrl, window, "dialogWidth:500px; dialogHeight:230px; center:on; scroll:off; status:off");
	} );
	
	// 승인버튼
	$("#btnApproval").click(function(){
		fn_statusChange('S');
	});
	
	// 반려버튼
	$("#btnRestore").click(function(){
		fn_statusChange('B');
	});
	
	// 취소버튼
	$("#btnDelete").click(function(){
		gtmReqDelete();
	});
	
	// 승인취소요청버튼
	$("#btnCancel").click(function(){
		gtmReqCancel();
	});
	
});


//검색
function fn_search() {
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var sUrl = "dlm.geuntaeMgr.gtmReqInfoList.do";
	jqGridObj.jqGrid( "clearGridData" );
	jqGridObj.jqGrid( 'setGridParam', {
		url : sUrl,
		mtype : 'POST',
		datatype : 'json',
		page : 1,
		postData : fn_getFormData( "#application_form" )
	} ).trigger( "reloadGrid" );
}

// 상태가 승인일때 승인취소요청
function gtmReqCancel() {
	
	var result = true;
	// 확인 메세지
	var confirmMsg = '';
	// 선택항목 체크에 대한 메세지
	var resultMsg = '';
	
	// 체크한 것만 배열에 담음 
	var p_seq_id = new Array();
	var selarrrow = jqGridObj.jqGrid('getGridParam', 'selarrrow');
	
	if(selarrrow.length > 0) {
		
		// 각 ROW 별로 상태에 따라 작업
		for (var i = 0; i < selarrrow.length; i++) 
		{
			var item  = $('#jqGridList').jqGrid('getRowData', selarrrow[i]);
			p_seq_id.push(item.seq_id);
			
			if(item.icui_seq_id != $("#p_icui_seq_id").val()) {
				result = false;
				resultMsg = '선택항목의 신청자가 본인일때만 승인취소 가능합니다.';
			}
			
			if(item.status != 'S') 
			{
				result = false;
				resultMsg = '선택항목의 상태가 승인일때만 승인취소 가능합니다.';
			}
			
		}
		
		$("#status").val('C');
		$("#p_seq_id").val(p_seq_id);
		
	} else {
		result = false;
		resultMsg = "행을 선택해 주세요.";
	}
	
	if (!result) {
    	alert(resultMsg);
    	return false;
    }
	
	var url = "dlm.geuntaeMgr.saveGtmReqApproveProcess.do";
	var formData = fn_getFormData('#application_form');
	
	if ( confirm( '승인취소요청 하시겠습니까?' ) != 0 ) {
		$.post( url, formData, function( data ) {
			alert(data.resultMsg);
			if ( data.result == 'success' ) {
				fn_search();
			}
		}, "json" ).error( function () {
			alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
		} );
	}
}

// 상태가 신청일때는 바로 삭제
function gtmReqDelete() {
	
	var result = true;
	// 확인 메세지
	var confirmMsg = '';
	// 선택항목 체크에 대한 메세지
	var resultMsg = '';
	
	// 체크한 것만 배열에 담음 
	var p_seq_id = new Array();
	var selarrrow = jqGridObj.jqGrid('getGridParam', 'selarrrow');
	
	if(selarrrow.length > 0) {
		
		// 각 ROW 별로 상태에 따라 작업
		for (var i = 0; i < selarrrow.length; i++) 
		{
			var item  = $('#jqGridList').jqGrid('getRowData', selarrrow[i]);
			p_seq_id.push(item.seq_id);
			
			if(item.icui_seq_id != $("#p_icui_seq_id").val()) {
				result = false;
				resultMsg = '선택항목의 신청자가 본인일때만 삭제 가능합니다.';
			}
			
			if(item.status != 'R') 
			{
				result = false;
				resultMsg = '선택항목의 상태가 신청일때만 삭제 가능합니다.';
			}
			
		}
		
		$("#status").val(status);
		$("#p_seq_id").val(p_seq_id);
		
	} else {
		result = false;
		resultMsg = "행을 선택해 주세요.";
	}
	
	if (!result) {
    	alert(resultMsg);
    	return false;
    }
	
	var url = "dlm.geuntaeMgr.gtmReqDeleteProcess.do";
	var formData = fn_getFormData('#application_form');
	
	if ( confirm( '삭제 하시겠습니까?' ) != 0 ) {
		$.post( url, formData, function( data ) {
			alert(data.resultMsg);
			if ( data.result == 'success' ) {
				fn_search();
			}
		}, "json" ).error( function () {
			alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
		} );
	}
}

// 요청에 따른 승인 Process
function fn_statusChange(status) {
	
	var result = true;
	// 확인 메세지
	var confirmMsg = '';
	// 선택항목 체크에 대한 메세지
	var resultMsg = '';
	
	// 체크한 것만 배열에 담음 
	var p_seq_id = new Array();
	var selarrrow = jqGridObj.jqGrid('getGridParam', 'selarrrow');
	
	if(selarrrow.length > 0) {
	
		// 각 ROW 별로 상태에 따라 작업
		for (var i = 0; i < selarrrow.length; i++) 
		{
			var item  = $('#jqGridList').jqGrid('getRowData', selarrrow[i]);
			p_seq_id.push(item.seq_id);
			
			if(status == 'S') {
				confirmMsg = '승인';
			}
			else if(status == 'B') 
			{
				confirmMsg = '반려';
			}
			
			if(item.status == 'R' && status == 'S') 
			{
				status = 'S';
			} 
			else if(item.status == 'R' && status == 'B') 
			{
				status = 'B';
			} 
			else if(item.status == 'C' && status == 'S') 
			{
				status = 'CS';
			} 
			else if(item.status == 'C' && status == 'B') 
			{
				result = false;
				resultMsg = '선택항목의 상태가 승인취소요청에\n대해서 반려할 수 없습니다.';
			}
			
			if(item.status != 'R' && item.status != 'C') 
			{
				result = false;
				resultMsg = '선택항목의 상태가 신청 or 승인취소요청일때만 ' + confirmMsg + ' 가능합니다.';
			}
			
		}
		
		$("#status").val(status);
		$("#p_seq_id").val(p_seq_id);
		
	} else {
		result = false;
		resultMsg = "행을 선택해 주세요.";
	}
	
	if (!result) {
    	alert(resultMsg);
    	return false;
    }
	
	var url = "dlm.geuntaeMgr.saveGtmReqApproveProcess.do";
	var formData = fn_getFormData('#application_form');
	
	if ( confirm( confirmMsg + ' 하시겠습니까?' ) != 0 ) {
		$.post( url, formData, function( data ) {
			alert(data.resultMsg);
			if ( data.result == 'success' ) {
				fn_search();
			}
		}, "json" ).error( function () {
			alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
		} );
	}
}


//afterSaveCell oper 값 지정
function chmResultEditEnd( irowId, cellName, value, irow, iCol ) {
	var item = $( '#jqGridList' ).jqGrid( 'getRowData', irowId );
	if( item.oper != 'I' ){
		item.oper = 'U';
		$( '#jqGridList' ).jqGrid('setCell', irowId, cellName, '', { 'background' : '#6DFF6D' } );
	}
	$( '#jqGridList' ).jqGrid( "setRowData", irowId, item );
	$( "input.editable,select.editable", this ).attr( "editable", "0" );
}

</script>
