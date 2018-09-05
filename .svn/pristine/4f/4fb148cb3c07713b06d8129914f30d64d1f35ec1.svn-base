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
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">로그 확인</a></li>
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
    <div class="row mh-100">
        <div class="col-12 mh-100">
            <!-- tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="nav-item"><a href="#loginLog" aria-controls="loginLog" role="tab" data-toggle="tab" class="nav-link active">로그인 로그</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#errorLog" aria-controls="errorLog" role="tab" data-toggle="tab" class="nav-link">에러 로그</a>
                </li>
            </ul>
            <div class="tab-content mh-100">
                <div role="tabpanel" class="tab-pane active py-3" id="loginLog">
                	<div class="table-responsive">
						<table id="jqGridList"></table>
						<div id="btnjqGridList"></div>
					</div>
                </div>
                <div role="tabpanel" class="tab-pane py-3" id="errorLog">
					<div class="table-responsive">
						<table id="jqGridList1"></table>
						<div id="btnjqGridList1"></div>
					</div>
                </div>

            </div>
        </div>
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
<!-- Custom scripts for this page-->
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
var main_target = 'concM';

var jqGridObj = $('#jqGridList');
var jqGridObj1 = $('#jqGridList1');

$(document).ready(function(){
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'admin.logMgr.loginLogList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['LOGIN_LOG_ID', 'LOGIN_SEQ_ID', 'LOGIN_ID', 'LOGIN_IP', 'LOGIN_DATE', 'OPER'],
	    colModel : [
					{name:'login_log_id',index:'login_log_id', width:80, sortable:false, editable:false, align:'center', hidden: true},
					{name:'login_seq_id',index:'login_seq_id', width:100, sortable:false, editable:false, align:'center'},
					{name:'login_id',index:'login_id', width:80, sortable:false, editable:false, align:'center'},
					{name:'login_ip',index:'login_ip', width:100, sortable:false, editable:false, align:'center'},
					{name:'login_date',index:'login_date', width:150, sortable:false, editable:false, align:'center'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    //autowidth: true,
	    cellEdit : false,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: true,
	    multiselect: false,
	    rownumbers: true,
	    //pager: $('#btnjqGridList'),
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
	}); //end of jqGrid
	
	jqGridObj1.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ERROR_LOG_ID', 'EXECUTE_URL', 'LOGIN_ID', 'ERROR_MSG', 'ERROR_DATE', 'OPER'],
	    colModel : [
					{name:'error_log_id',index:'error_log_id', width:20, sortable:false, editable:false, align:'center', hidden: true},
					{name:'execute_url',index:'execute_url', width:80, sortable:false, editable:false, align:'left'},
					{name:'login_id',index:'login_id', width:80, sortable:false, editable:false, align:'center'},
					{name:'error_msg',index:'error_msg', width:300, sortable:false, editable:false, align:'left'},
					{name:'error_date',index:'error_date', width:80, sortable:false, editable:false, align:'center'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
		gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    //autowidth: false,
	    cellEdit : false,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: true,
	    multiselect: false,
	    rownumbers: true,
	    //pager: $('#btnjqGridList'),
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
		//beforeSaveCell : chmResultEditEnd,
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
	
	// jqGrid 크기 동적화
	// Tab1
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	// Tab2
	fn_gridresize( $(window), $( "#jqGridList1" ), 70 );
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search(main_target);
	});
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = $(e.target).attr("href") // activated tab
		var sUrl = "";
		
		target = target.replace("#", "");
		fn_search(target);
		
	});
	
});

//검색
function fn_search(target) {
	
	main_target = target;
	
	if(target == 'loginLog') 
	{
		fn_gridresize( $(window), $( "#jqGridList" ), 70 );
		jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "admin.logMgr.loginLogList.do";
		jqGridObj.jqGrid( "clearGridData" );
		jqGridObj.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
	}
	else 
	{
		fn_gridresize( $(window), $( "#jqGridList1" ), 70 );
		jqGridObj1.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "admin.logMgr.errorLogList.do";
		jqGridObj1.jqGrid( "clearGridData" );
		jqGridObj1.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
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
