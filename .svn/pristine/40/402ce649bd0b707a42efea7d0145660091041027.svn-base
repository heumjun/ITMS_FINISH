<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/redmond/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="stylesheet" href="/css/ui.jqgrid.css" type="text/css" />
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

.MyCell{
	font-size: 12px !important;
	font-weight : bold !important;
}

.ui-jqgrid .ui-jqgrid-titlebar {
	height: 30px;
}

</style>

<form id="application_form" name="application_form" >
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">입고 모니터링</a></li>
	</ol>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<col width="*"/>
		<tbody>
			<tr>
				<td>
					<div class="button endbox">
						<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="table-responsive">
		<div id="divList" style="position:relative; float: left; width: 100%;">
			<table id="jqGridList"></table>
			<div id="btnjqGridList"></div>
		</div>	
		<div id="divList1" style="position:relative; float: left; width: 100%; margin-top: 5px;">
			<table id="jqGridList1"></table>
			<div id="btnjqGridList1"></div>
		</div>	
		<div id="divList2" style="position:relative; float: left; width: 100%; margin-top: 5px;">
			<table id="jqGridList2"></table>
			<div id="btnjqGridList2"></div>
		</div>	
		<div id="divList3" style="position:relative; float: left; width: 100%; margin-top: 5px;">
			<table id="jqGridList3"></table>
			<div id="btnjqGridList3"></div>
		</div>	
	</div>
</div>
</form>
<!-- /.container-fluid-->
<!-- Bootstrap core JavaScript-->
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/commonTextUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/jquery.jqGrid.min.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/jqgrid/i18n/grid.locale-en.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/jqueryAjax.js" charset='utf-8'></script>

<script type="text/javascript">
var idRow;
var idCol;
var kRow;
var kCol;
var resultData = [];

var jqGridObj = $('#jqGridList');
var jqGridObj1 = $('#jqGridList1');
var jqGridObj2 = $('#jqGridList2');
var jqGridObj3 = $('#jqGridList3');

$(document).ready(function(){
	jqGridObj.jqGrid({ 
		caption: "입고오류",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'lec.ipgoMgr.ipgoMgrList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ASN_TYPE', 'SHIPMENT_NUM', 'COLUMN_NAME', 'ERROR_MESSAGE', 'ERROR_MESSAGE_NAME', 'TRANSACTION_TYPE', 'TRANSACTION_DATE', 
	                'PROCESSING_STATUS_CODE', 'TRANSACTION_STATUS_CODE', 'QUANTITY', 'PRIMARY_QUANTITY', 'ITEM_DESCRIPTION', 'DOCUMENT_NUM', 
	                'DOCUMENT_LINE_NUM', 'ITEM_NUM', 'PO_HEADER_ID', 'PO_LINE_ID', 'PO_UNIT_PRICE', 'ATTRIBUTE12', 'ATTRIBUTE13', 'ATTRIBUTE14', 
	                'HEADER_INTERFACE_ID', 'PROJECT_ID', 'TASK_ID', 'GROUP_ID', 'VENDOR_ID', 'VENDOR_SITE_ID', 'INTERFACE_TRANSACTION_ID', 'OPER'],
	    colModel : [
					{name:'asn_type',index:'asn_type', width:18, editable : false, align:'center'},
					{name:'shipment_num',index:'shipment_num', width:165, align:'center', editable : false, align:'left'},
					{name:'column_name',index:'column_name', width:55, align:'left', editable : false, align:'left'},
					{name:'error_message',index:'error_message', width:20, editable : false, align:'center'},
					{name:'error_message_name',index:'error_message_name', width:60, sortable:false, align:'left'},
					{name:'transaction_type',index:'transaction_type', width:70, sortable:false, align:'left'},
					{name:'transaction_date',index:'transaction_date', width:35, sortable:false, align:'center'},
					{name:'processing_status_code',index:'processing_status_code', width:35, sortable:false, align:'center'},
					{name:'transaction_status_code',index:'transaction_status_code', width:35, sortable:false, align:'center'},
					{name:'quantity',index:'quantity', width:35, sortable:false, align:'center'},
					{name:'primary_quantity',index:'primary_quantity', width:35, sortable:false, align:'center'},
					{name:'item_description',index:'item_description', width:35, sortable:false, align:'center'},
					{name:'document_num',index:'document_num', width:35, sortable:false, align:'center'},
					{name:'document_line_num',index:'document_line_num', width:35, sortable:false, align:'center'},
					{name:'item_num',index:'item_num', width:35, sortable:false, align:'center'},
					{name:'po_header_id',index:'po_header_id', width:35, sortable:false, align:'center'},
					{name:'po_line_id',index:'po_line_id', width:35, sortable:false, align:'center'},
					{name:'po_unit_price',index:'po_unit_price', width:35, sortable:false, align:'center'},
					{name:'attribute12',index:'attribute12', width:35, sortable:false, align:'center'},
					{name:'attribute13',index:'attribute13', width:35, sortable:false, align:'center'},
					{name:'attribute14',index:'attribute14', width:35, sortable:false, align:'center'},
					{name:'header_interface_id',index:'header_interface_id', width:35, sortable:false, align:'center'},
					{name:'project_id',index:'project_id', width:35, sortable:false, align:'center'},
					{name:'task_id',index:'task_id', width:35, sortable:false, align:'center'},
					{name:'group_id',index:'group_id', width:35, sortable:false, align:'center'},
					{name:'vendor_id',index:'vendor_id', width:35, sortable:false, align:'center'},
					{name:'vendor_site_id',index:'vendor_site_id', width:35, sortable:false, align:'center'},
					{name:'interface_transaction_id',index:'interface_transaction_id', width:35, sortable:false, align:'center'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: true,
	    cellEdit : true,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: false,
	    multiselect: false,
	    rownumbers: true,
	    //pager: $('#btnjqGridList'),
	    rowList:[100,500,1000],
	    recordtext: '내용 {0} - {1}, 전체 {2}',
	    emptyrecords:'조회 내역 없음',
	    rowNum : -1, 
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
			
		}
	}); //end of jqGrid
	
	jqGridObj1.jqGrid({ 
		caption: "XPO_RCV_TRANSACTIONS 이력",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'lec.ipgoMgr.ipgoMgrList1.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ORDER_NUM', 'GUBUN', 'INTERFACE_TRANSACTION_ID', 'GROUP_ID', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY', 'OPER'],
	    colModel : [
					{name:'order_num',index:'order_num', width:80, editable : false, align:'center', excel:'전송타입'},
					{name:'gubun',index:'gubun', width:80, align:'center', editable : false, align:'left', excel:'전송라인 데이타'},
					{name:'interface_transaction_id',index:'interface_transaction_id', width:80, align:'left', editable : false, align:'left', excel:'오류메시지'},
					{name:'group_id',index:'group_id', width:80, editable : false, align:'center', excel:'성공여부'},
					{name:'last_update_date',index:'last_update_date', width:80, sortable:false, align:'left', excel:'전송파일'},
					{name:'last_updated_by',index:'last_updated_by', width:80, sortable:false, align:'left', excel:'백업전송파일명', cellattr: function (){return 'style="cursor:pointer"';}},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: true,
	    cellEdit : true,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: false,
	    multiselect: false,
	    rownumbers: true,
	    //pager: $('#btnjqGridList1'),
	    rowList:[100,500,1000],
	    recordtext: '내용 {0} - {1}, 전체 {2}',
	    emptyrecords:'조회 내역 없음',
	    rowNum : -1, 
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
			
		}
	}); //end of jqGrid
	
	jqGridObj2.jqGrid({ 
		caption: "RCV_HEADERS_INTERFACE 이력",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'lec.ipgoMgr.ipgoMgrList2.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ORDER_NUM', 'GUBUN', 'HEADER_INTERFACE_ID', 'GROUP_ID', 'EDI_CONTROL_NUM', 'OPER'],
	    colModel : [
					{name:'order_num',index:'order_num', width:80, editable : false, align:'center', excel:'전송타입'},
					{name:'gubun',index:'gubun', width:80, align:'center', editable : false, align:'left', excel:'전송라인 데이타'},
					{name:'header_interface_id',index:'header_interface_id', width:80, align:'left', editable : false, align:'left', excel:'오류메시지'},
					{name:'group_id',index:'group_id', width:80, editable : false, align:'center', excel:'성공여부'},
					{name:'edi_control_num',index:'edi_control_num', width:80, sortable:false, align:'left', excel:'전송파일'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: true,
	    cellEdit : true,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: false,
	    multiselect: false,
	    rownumbers: true,
	    //pager: $('#btnjqGridList2'),
	    rowList:[100,500,1000],
	    recordtext: '내용 {0} - {1}, 전체 {2}',
	    emptyrecords:'조회 내역 없음',
	    rowNum : -1, 
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
			
		}
	}); //end of jqGrid
	
	jqGridObj3.jqGrid({ 
		caption: "RCV_TRANSACTIONS_INTERFACE 이력",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'lec.ipgoMgr.ipgoMgrList3.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ORDER_NUM', 'GUBUN', 'INTERFACE_TRANSACTION_ID', 'GROUP_ID', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY', 'OPER'],
	    colModel : [
					{name:'order_num',index:'order_num', width:80, editable : false, align:'center', excel:'전송타입'},
					{name:'gubun',index:'gubun', width:80, align:'center', editable : false, align:'left', excel:'전송라인 데이타'},
					{name:'interface_transaction_id',index:'interface_transaction_id', width:80, align:'left', editable : false, align:'left', excel:'오류메시지'},
					{name:'group_id',index:'group_id', width:80, editable : false, align:'center', excel:'성공여부'},
					{name:'last_update_date',index:'last_update_date', width:80, sortable:false, align:'left', excel:'전송파일'},
					{name:'last_updated_by',index:'last_updated_by', width:80, sortable:false, align:'left', excel:'백업전송파일명', cellattr: function (){return 'style="cursor:pointer"';}},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: true,
	    cellEdit : true,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: false,
	    multiselect: false,
	    rownumbers: true,
	    //pager: $('#btnjqGridList3'),
	    rowList:[100,500,1000],
	    recordtext: '내용 {0} - {1}, 전체 {2}',
	    emptyrecords:'조회 내역 없음',
	    rowNum : -1, 
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
			
		}
	}); //end of jqGrid
	
	fn_insideGridresizeWipChk( $(window), $( "#divList" ), $( "#jqGridList" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList1" ), $( "#jqGridList1" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList2" ), $( "#jqGridList2" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList3" ), $( "#jqGridList3" ), 0, 0.4);

	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
});

//검색
function fn_search() {
	
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 

	var sUrl = "";
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
