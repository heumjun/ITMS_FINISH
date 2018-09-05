<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/ui.jqgrid.css" type="text/css" />
<link rel="stylesheet" href="/css/jquery-ui.min.css">
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
<input type="hidden" id="approvalAdmin" name="approvalAdmin" value="${approvalAdmin }" />
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">공지사항</a></li>
	</ol>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<col width="80">
		<col width="300">
		<col width="80">
		<col width="200">
		<col width="80">
		<col width="100">
		<col width="*"/>
		<tbody>
			<tr>
				<th style="font-size: 13px; font-weight: 100;">제목</th>
				<td><input type="text" class="common" id="p_title" name="p_title" alt="제목"  style="width:300px;" value="" /></td>

				<th style="font-size: 13px; font-weight: 100;">공지기간</th>
				<td>
					<input type="text" class="common" id="p_start_date" name="p_start_date" alt="시작일"  style="width:80px;" value="" />
					~
					<input type="text" class="common" id="p_end_date" name="p_end_date" alt="종료일"  style="width:80px;" value="" />
				</td>
								
				<th style="font-size: 13px; font-weight: 100;">공지여부</th>
				<td>
					<select id="p_noti_flag" name="p_noti_flag" style="width:80px; font-size: 13px; font-weight: 100;">
						<option value="">전체</option>
						<option value="Y">사용</option>
						<option value="N">비사용</option>
					</select>
				</td>

				<td>
					<div class="button endbox">
						<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
						<button type="button" id="btnRegiste" class="btn btn-primary btn-sm" >등록</button>
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
<!-- <script src="/js/sb-admin.min.js"></script> -->
<!-- Custom scripts for this page-->
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/commonDateUtil.js" charset='utf-8'></script>
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

//달력 셋팅
$(function() {
	$( "#p_start_date, #p_end_date" ).datepicker({
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
	    beforeShow: function() {
	        setTimeout(function(){
	            $('.ui-datepicker').css('z-index', 99999999999999);
	        }, 0);
	    }
  	});
});

$(document).ready(function(){
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'infoSharing.noticeMgr.noticeList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', '제목', '시작일', '종료일', '공지여부', '<input type="checkbox" id="chkNoti_flag" onclick="checkBoxHeader(event, this)"/> 공지여부', 'NOTI_FLAG_CHANGED', 'OPER'],
	    colModel : [
					{name:'seq_id', index:'seq_id', width:50, align:'center', sortable:false, title:false, hidden:true},
					{name:'title', index:'title', width:300, align:'left', sortable:false, title:false, formatter:titleFormatter},
					{name:'noti_start_date', index:'month', width:80, align:'center', sortable:false, title:false},
					{name:'noti_end_date', index:'chasu', width:80, align:'center', sortable:false, title:false},
					{name:'noti_flag', index:'noti_flag', width : 60, align:'center', hidden : false},
					{name:'noti_flag_test', index:'noti_flag_test', width:60, align:'center', sortable:false, editable:true, edittype:'checkbox', formatter:"checkbox", editoptions:{ value : "Y:N" }, formatoptions:{ disabled : false }, hidden:true},
					{name:'noti_flag_changed', index:'noti_flag_changed', width : 25, hidden : true},
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
		onCellSelect: function(row_id) {
			if(row_id != null) 
            {
                var item = $('#jqGridList').jqGrid('getRowData',row_id);
                var sUrl = "infoSharing.noticeMgr.popUpNoticeRegiste.do?p_seq_id=" + item.seq_id;
        		window.showModalDialog( sUrl, window, "dialogWidth:1000px; dialogHeight:680px; center:on; scroll:off; status:off");
            }
		}
	}); //end of jqGrid

	// jqGrid 크기 동적화
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	
	$( "#jqGridList" ).jqGrid( 'setGroupHeaders', {
		useColSpanStyle : true, 
		groupHeaders : [ { startColumnName : 'noti_start_date', numberOfColumns : 2, titleText : '공지기간'}]
	} );
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
	// 등록버튼
	$("#btnRegiste").click(function() {
		var sUrl = "infoSharing.noticeMgr.popUpNoticeRegiste.do";
		window.showModalDialog( sUrl, window, "dialogWidth:1000px; dialogHeight:680px; center:on; scroll:off; status:off");
	});
	
});

//검색
function fn_search() {
	
	var result = true;
	var message = "";
	
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var strDate1 = $("#p_start_date").val();
    var strDate2 = $("#p_end_date").val();
    
    if(strDate1 != '' && strDate2 != '') {
    	var arr1 = strDate1.split('-');
	    var arr2 = strDate2.split('-');
	    
	    var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	    var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	    
	    if(dat1.getTime() > dat2.getTime()) {
	    	result = false;
	    	message = "종료일은 시작일보다 이후 날짜로 선택하세요.";
	    	$("#p_end_date").focus();
	    }
	    
    } else if(strDate1 != '' && strDate2 == '') {
    	result = false;
    	message = "종료일을 선택하세요.";
    	$("#p_end_date").focus();
    } else if(strDate1 == '' && strDate2 != '') {
    	result = false;
    	message = "시작일을 선택하세요.";
    	$("#p_start_date").focus();
    }
    
    if (!result) {
    	alert(message);
    	return false;
    }
	
	var sUrl = "infoSharing.noticeMgr.noticeList.do";
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
