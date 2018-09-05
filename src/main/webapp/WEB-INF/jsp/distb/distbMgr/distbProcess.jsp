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
<input type="hidden" id="icui_seq_id" name="icui_seq_id" value="${loginUser.seq_id }" />
<input type="hidden" id="approvalAdmin" name="approvalAdmin" value="${approvalAdmin }" />
<input type="hidden" id="p_seq_id" name="p_seq_id" value="" />
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">배포처리</a></li>
	</ol>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<col width="80">
		<col width="500">
		<col width="80">
		<col width="120">
		<col width="80">
		<col width="120">
		<col width="*"/>
		<tbody>
			<tr>
				<th style="font-size: 13px; font-weight: 100;">제목</th>
				<td><input type="text" class="common" id="p_title" name="p_title" alt="제목"  style="width:480px;" value="" /></td>
				
				<th style="font-size: 13px; font-weight: 100;">등록자</th>
				<td><input type="text" class="common" id="p_user_name" name="p_user_name" alt="등록자"  style="width:100px;" value="" /></td>
				
				<th style="font-size: 13px; font-weight: 100;">상태</th>
				<td>
					<select id="p_sel_status" name="p_sel_status" class="common" style="width:100px;">
						<option value="">전체</option>
						<option value="R">신청</option>
						<option value="N">처리대기</option>
						<option value="S">처리완료</option>
						<option value="X">처리불가</option>
					</select>
				</td>
				
				<td>
					<div class="button endbox">
						<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
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

<script type="text/javascript">
var idRow;
var idCol;
var kRow;
var kCol;
var resultData = [];

var jqGridObj = $('#jqGridList');

$(document).ready(function(){
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'distb.distbMgr.distbProcessList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', 'TERM', '구분', 'STATUS', '상태', '제목', 'CHARGE', '담당자', '신청자', 'created_by', '등록일', 'OPER'],
	    colModel : [
					{name:'seq_id', index:'seq_id', width:50, align:'center', sortable:false, title:false, hidden:true},
					{name:'term', index:'term', width:50, align:'center', sortable:false, title:false, hidden:true},
					{name:'term_name', index:'term_name', width:50, align:'center', sortable:false, title:false},
					{name:'status', index:'status', width:50, align:'center', sortable:false, title:false, hidden:true},
					{name:'status_name', index:'status_name', width:50, align:'center', sortable:false, title:false},
					{name:'title', index:'title', width:300, align:'left', sortable:false, title:false},
					{name:'charge', index:'charge', width : 80, align:'center', sortable:false, hidden:true},
					{name:'charge_name', index:'charge_name', width : 80, align:'center', sortable:false},
					{name:'user_name', index:'user_name', width : 80, align:'center', sortable:false},
					{name:'created_by', index:'created_by', width : 80, align:'center', hidden: true},
					{name:'create_date', index:'create_date', width : 80, align:'center', sortable:false},
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
	    multiselect: false,
	    rownumbers: true,
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
			
		},
		gridComplete : function() {
			$("#jqGridList td").css("cursor","pointer");
		},
		ondblClickRow: function(row_id, iCol, cellcontent, e) {
			
			var loginId = $("#loginId").val();
			
			var cm = $(this).jqGrid( "getGridParam", "colModel" );
			var colName = cm[iCol];
			
			
			if(row_id != null) 
            {
				
                var item = $('#jqGridList').jqGrid('getRowData',row_id);
                var disabled = 'Y';
                
                // 로그인사용자 비교 
                if(loginId == item.created_by) {
                	disabled = 'N';
                }
                
                var sUrl = "distb.distbMgr.popUpDistbProcessUpdate.do?p_seq_id=" + item.seq_id + "&p_disabled=" + disabled + "&p_charge=" + item.charge + "&p_status=" + item.status;
        		
                var screenW = screen.availWidth;  	// 스크린 가로사이즈
        		var screenH = screen.availHeight; 	// 스크린 세로사이즈
        		var popW = 700; 					// 띄울창의 가로사이즈
        		var popH = 750; 					// 띄울창의 세로사이즈
        		var posL=( screenW-popW ) / 2;   	// 띄울창의 가로 포지션 
        		var posT=( screenH-popH ) / 2;   	// 띄울창의 세로 포지션 
        		
        		popupWin = window.open(sUrl, window, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no,'
            		    + 'width='+popW+', height='+popH+', top='+posT+', left='+posL);
        		
        		setTimeout(function(){
        			popupWin.focus();
        		 }, 200);
        		
            }
		}
	}); //end of jqGrid

	// jqGrid 크기 동적화
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
});


//검색
function fn_search() {
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var sUrl = "distb.distbMgr.distbProcessList.do";
	jqGridObj.jqGrid( "clearGridData" );
	jqGridObj.jqGrid( 'setGridParam', {
		url : sUrl,
		mtype : 'POST',
		datatype : 'json',
		page : 1,
		postData : fn_getFormData( "#application_form" )
	} ).trigger( "reloadGrid" );
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
