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
		<li class="breadcrumb-item"><a href="#">WIP 결산 모니터링</a></li>
	</ol>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<%-- <col width="80">
		<col width="120"> --%>
		<col width="*"/>
		<tbody>
			<tr>
				<%-- <th style="font-size: 13px; font-weight: 100;">기간</th>
				<td>
					<select id="p_sel_date" name="p_sel_date" style="width: 100px;">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${today}" pattern="YYYY-MM" var="today"/>
						<c:forEach items="${dateList}" var="list">
						<option value="${list}" <c:if test="${today eq list}">selected</c:if> >${list}</option>
						</c:forEach>
					</select>
				</td> --%>
				
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
                <li role="presentation" class="nav-item"><a href="#concM" aria-controls="concM" role="tab" data-toggle="tab" class="nav-link active">Conc Monitoring</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#etcM" aria-controls="etcM" role="tab" data-toggle="tab" class="nav-link">ETC Monitoring</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#Interface1" aria-controls="Interface1" role="tab" data-toggle="tab" class="nav-link">Interface1</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#Interface2" aria-controls="Interface2" role="tab" data-toggle="tab" class="nav-link">Interface2</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#actual" aria-controls="actual" role="tab" data-toggle="tab" class="nav-link">제작 Actual</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#fixedPrice" aria-controls="fixedPrice" role="tab" data-toggle="tab" class="nav-link">제작 Fixed Price</a>
                </li>
                <li role="presentation" class="nav-item"><a href="#etc" aria-controls="etc" role="tab" data-toggle="tab" class="nav-link">ETC</a>
                </li>
            </ul>
            <div class="tab-content mh-100">
                <div role="tabpanel" class="tab-pane active py-3" id="concM">
                	<div class="table-responsive">
						<table id="jqGridList"></table>
						<div id="btnjqGridList"></div>
					</div>
                </div>
                <div role="tabpanel" class="tab-pane py-3" id="etcM">
					<div id="divList1" style="position:relative; float: left; width: 100%;">
						<table id="jqGridList1"></table>
						<div id="btnjqGridList1"></div>
					</div>	
					<div id="divList2" style="position:relative; float: left; width: 100%; margin-top: 5px;">
						<table id="jqGridList2"></table>
						<div id="btnjqGridList2"></div>
					</div>	
                </div>
                <div role="tabpanel" class="tab-pane py-3 mh-100" id="Interface1">
                    <div class="table-responsive">
						<div id="divList3" style="position:relative; float: left; width: 100%;">
							<table id="jqGridList3"></table>
							<div id="btnjqGridList3"></div>
						</div>	
						<div id="divList4" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList4"></table>
							<div id="btnjqGridList4"></div>
						</div>
						<div id="divList5" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList5"></table>
							<div id="btnjqGridList5"></div>
						</div>	
						<div id="divList6" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList6"></table>
							<div id="btnjqGridList6"></div>
						</div>
						<div id="divList7" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList7"></table>
							<div id="btnjqGridList7"></div>
						</div>
					</div>
                </div>
                <div role="tabpanel" class="tab-pane py-3 mh-100" id="Interface2">
                    <div class="table-responsive">
						<div id="divList8" style="position:relative; float: left; width: 100%;">
							<table id="jqGridList8"></table>
							<div id="btnjqGridList8"></div>
						</div>	
						<div id="divList9" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList9"></table>
							<div id="btnjqGridList9"></div>
						</div>
						<div id="divList10" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList10"></table>
							<div id="btnjqGridList10"></div>
						</div>	
						<div id="divList11" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList11"></table>
							<div id="btnjqGridList11"></div>
						</div>
					</div>
                </div>
                <div role="tabpanel" class="tab-pane py-3 mh-100" id="actual">
                    <div class="table-responsive">
						<div id="divList12" style="position:relative; float: left; width: 100%;">
							<table id="jqGridList12"></table>
							<div id="btnjqGridList12"></div>
						</div>	
						<div id="divList13" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList13"></table>
							<div id="btnjqGridList13"></div>
						</div>
						<div id="divList14" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList14"></table>
							<div id="btnjqGridList14"></div>
						</div>	
						<div id="divList15" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList15"></table>
							<div id="btnjqGridList15"></div>
						</div>
						<div id="divList16" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList16"></table>
							<div id="btnjqGridList16"></div>
						</div>
						<div id="divList17" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList17"></table>
							<div id="btnjqGridList17"></div>
						</div>
						<div id="divList18" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList18"></table>
							<div id="btnjqGridList18"></div>
						</div>
					</div>
                </div>
                <div role="tabpanel" class="tab-pane py-3 mh-100" id="fixedPrice">
                    <div class="table-responsive">
						<div id="divList19" style="position:relative; float: left; width: 100%;">
							<table id="jqGridList19"></table>
							<div id="btnjqGridList19"></div>
						</div>	
						<div id="divList20" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList20"></table>
							<div id="btnjqGridList20"></div>
						</div>
						<div id="divList21" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList21"></table>
							<div id="btnjqGridList21"></div>
						</div>	
					</div>
                </div>
                <div role="tabpanel" class="tab-pane py-3 mh-100" id="etc">
                    <div class="table-responsive">
						<div id="divList22" style="position:relative; float: left; width: 100%;">
							<table id="jqGridList22"></table>
							<div id="btnjqGridList22"></div>
						</div>
						<div id="divList23" style="position:relative; float: left; width: 100%; margin-top: 5px;">
							<table id="jqGridList23"></table>
							<div id="btnjqGridList23"></div>
						</div>	
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
var jqGridObj2 = $('#jqGridList2');

var jqGridObj3 = $('#jqGridList3');
var jqGridObj4 = $('#jqGridList4');
var jqGridObj5 = $('#jqGridList5');
var jqGridObj6 = $('#jqGridList6');
var jqGridObj7 = $('#jqGridList7');

var jqGridObj8 = $('#jqGridList8');
var jqGridObj9 = $('#jqGridList9');
var jqGridObj10 = $('#jqGridList10');
var jqGridObj11 = $('#jqGridList11');

var jqGridObj12 = $('#jqGridList12');
var jqGridObj13 = $('#jqGridList13');
var jqGridObj14 = $('#jqGridList14');
var jqGridObj15 = $('#jqGridList15');
var jqGridObj16 = $('#jqGridList16');
var jqGridObj17 = $('#jqGridList17');
var jqGridObj18 = $('#jqGridList18');

var jqGridObj19 = $('#jqGridList19');
var jqGridObj20 = $('#jqGridList20');
var jqGridObj21 = $('#jqGridList21');

var jqGridObj22 = $('#jqGridList22');
var jqGridObj23 = $('#jqGridList23');

$(document).ready(function(){
	
	setInterval(fn_search, 600000);
	
	jqGridObj.jqGrid({ 
		caption: "Concurrent Schedule",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'lec.wipChkMgr.wipChkMgrList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['STATUS', 'STATUS_NAME', 'PHASE', 'PHASE_NAME', 'REQUESTOR', 'EXECUTABLE_NAME', 'PROGRAM_SHORT_NAME', 'PROGRAM'
	                , 'START_DATE', 'COMPLETION_DATE', 'SECOND', 'MINUTE', 'COMPLETION_TEXT', 'ARGUMENT_TEXT'
	                , 'FILE_NAME', 'REQUEST_ID', 'INTERVAL_UNIT', 'INTERVAL_TYPE', 'OPER'],
	    colModel : [
					{name:'status',index:'status', width:80, sortable:false, editable:false, align:'center'},
					{name:'status_name',index:'status_name', width:100, sortable:false, editable:false, align:'center'},
					{name:'phase',index:'phase', width:80, sortable:false, editable:false, align:'center'},
					{name:'phase_name',index:'phase_name', width:100, sortable:false, editable:false, align:'center'},
					{name:'requestor',index:'requestor', width:150, sortable:false, editable:false, align:'left'},
					{name:'executable_name',index:'executable_name', width:150, sortable:false, editable:false, align:'left'},
					{name:'program_short_name',index:'program_short_name', width:180, sortable:false, editable:false, align:'left'},
					{name:'program',index:'program', width:300, sortable:false, editable:false, align:'left'},
					{name:'start_date',index:'start_date', width:120, sortable:false, editable:false, align:'center'},
					{name:'completion_date',index:'completion_date', width:120, sortable:false, editable:false, align:'center'},
					{name:'second',index:'second', width:100, sortable:false, editable:false, align:'right'},
					{name:'minute',index:'minute', width:100, sortable:false, editable:false, align:'right'},
					{name:'completion_text',index:'completion_text', width:150, sortable:false, editable:false, align:'left'},
					{name:'argument_text',index:'argument_text', width:300, sortable:false, editable:false, align:'left'},
					{name:'file_name',index:'file_name', width:300, sortable:false, editable:false, align:'left'},
					{name:'request_id',index:'request_id', width:120, sortable:false, editable:false, align:'center'},
					{name:'interval_unit',index:'interval_unit', width:120, sortable:false, editable:false, align:'right'},
					{name:'interval_type',index:'interval_type', width:120, sortable:false, editable:false, align:'left'},
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
			
		},
	}); //end of jqGrid
	
	jqGridObj1.jqGrid({ 
		caption: "Concurrent Error",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['STATUS', 'STATUS_NAME', 'PHASE', 'PHASE_NAME', 'REQUESTOR', 'PROGRAM_SHORT_NAME', 'PROGRAM', 'START_DATE'
	                , 'COMPLETION_DATE', 'COMPLETION_TEXT', 'ARGUMENT_TEXT', 'FILE_NAME', 'REQUEST_ID', 'INTERVAL_UNIT', 'INTERVAL_TYPE'
	                , 'OPER'],
	    colModel : [
					{name:'status',index:'status', width:80, sortable:false, editable:false, align:'center'},
					{name:'status_name',index:'status_name', width:100, sortable:false, editable:false, align:'center'},
					{name:'phase',index:'phase', width:80, sortable:false, editable:false, align:'center'},
					{name:'phase_name',index:'phase_name', width:100, sortable:false, editable:false, align:'center'},
					{name:'requestor',index:'requestor', width:150, sortable:false, editable:false, align:'left'},
					{name:'program_short_name',index:'program_short_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'program',index:'program', width:400, sortable:false, editable:false, align:'left'},
					{name:'start_date',index:'start_date', width:120, sortable:false, editable:false, align:'center'},
					{name:'completion_date',index:'completion_date', width:120, sortable:false, editable:false, align:'center'},
					{name:'completion_text',index:'completion_text', width:300, sortable:false, editable:false, align:'left'},
					{name:'argument_text',index:'argument_text', width:150, sortable:false, editable:false, align:'left'},
					{name:'file_name',index:'file_name', width:300, sortable:false, editable:false, align:'left'},
					{name:'request_id',index:'request_id', width:100, sortable:false, editable:false, align:'center'},
					{name:'interval_unit',index:'interval_unit', width:120, sortable:false, editable:false, align:'right'},
					{name:'interval_type',index:'interval_type', width:200, sortable:false, editable:false, align:'left'},
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
	
	jqGridObj2.jqGrid({ 
		caption: "Lock Session",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['OBJECT_NAME', 'TERMINAL', 'LOCKER', 'PROGRAM', 'LOCKWAIT', 'LOCKMODE', 'OBJECT_TYPE', 'SESSION_ID', 'SERIAL', 'SID', 'OPER'],
	    colModel : [
					{name:'object_name',index:'object_name', width:300, sortable:false, editable:false, align:'left'},
					{name:'terminal',index:'terminal', width:200, sortable:false, editable:false, align:'left'},
					{name:'locker',index:'locker', width:200, sortable:false, editable:false, align:'left'},
					{name:'program',index:'program', width:400, sortable:false, editable:false, align:'left'},
					{name:'lockwait',index:'lockwait', width:150, sortable:false, editable:false, align:'left'},
					{name:'lockmode',index:'lockmode', width:200, sortable:false, editable:false, align:'left'},
					{name:'object_type',index:'object_type', width:150, sortable:false, editable:false, align:'left'},
					{name:'session_id',index:'session_id', width:100, sortable:false, editable:false, align:'left'},
					{name:'serial',index:'serial', width:100, sortable:false, editable:false, align:'left'},
					{name:'sid',index:'sid', width:100, sortable:false, editable:false, align:'left'},
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
	    forceFit:true,
	    shrinkToFit:false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj3.jqGrid({ 
		caption: "BOM",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ORGANIZATION_ID', 'ASSEMBLY_TYPE', 'ITEM_NUMBER', 'ALTERNATE_BOM_DESIGNATOR', 'TRANSACTION_TYPE'
	                , 'PROCESS_FLAG', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY', 'CREATION_DATE', 'CREATED_BY', 'LAST_UPDATE_LOGIN'
	                , 'BATCH_ID', 'COMPONENT_QUANTITY', 'COMPONENT_ITEM_NUMBER', 'ASSEMBLY_ITEM_NUMBER', 'PROCESS_FLAG', 'TRANSACTION_TYPE', 'OPER'],
	    colModel : [
					{name:'organization_id',index:'organization_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'assembly_type',index:'assembly_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'item_number',index:'item_number', width:150, sortable:false, editable:false, align:'left'},
					{name:'alternate_bom_designator',index:'alternate_bom_designator', width:300, sortable:false, editable:false, align:'left'},
					{name:'transaction_type',index:'transaction_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_flag',index:'process_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:150, sortable:false, editable:false, align:'left'},
					{name:'last_updated_by',index:'last_updated_by', width:150, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:150, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:150, sortable:false, editable:false, align:'left'},
					{name:'last_update_login',index:'last_update_login', width:150, sortable:false, editable:false, align:'left'},
					{name:'batch_id',index:'batch_id', width:150, sortable:false, editable:false, align:'left'},
					{name:'component_quantity',index:'component_quantity', width:300, sortable:false, editable:false, align:'left'},
					{name:'component_item_number',index:'component_item_number', width:300, sortable:false, editable:false, align:'left'},
					{name:'assembly_item_number',index:'assembly_item_number', width:300, sortable:false, editable:false, align:'left'},
					{name:'process_flag',index:'process_flag', width:150, sortable:false, editable:false, align:'left'},
					{name:'transaction_type',index:'transaction_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit:true,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj4.jqGrid({ 
		caption: "ROUTING",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ORGANIZATION_ID', 'CFM_ROUTING_FLAG', 'ASSEMBLY_ITEM_NUMBER', 'ALTERNATE_ROUTING_DESIGNATOR', 'ROUTING_TYPE'
	                , 'TRANSACTION_TYPE', 'PROCESS_FLAG', 'COMPLETION_SUBINVENTORY', 'CREATION_DATE', 'CREATED_BY', 'CREATED_NAME'
	                , 'BATCH_ID', 'STANDARD_OPERATION_ID', 'OPERATION_SEQ_NUM', 'OPERATION_DESCRIPTION', 'MINIMUM_TRANSFER_QUANTITY'
	                , 'DEPARTMENT_CODE', 'REFERENCE_FLAG', 'EFFECTIVITY_DATE', 'RESOURCE_CODE', 'USAGE_RATE_OR_AMOUNT'
	                , 'SCHEDULE_FLAG', 'BASIS_TYPE', 'AUTOCHARGE_TYPE', 'STANDARD_RATE_FLAG', 'OPER'],
	    colModel : [
					{name:'organization_id',index:'organization_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'cfm_routing_flag',index:'cfm_routing_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'assembly_item_number',index:'assembly_item_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'alternate_routing_designator',index:'alternate_routing_designator', width:200, sortable:false, editable:false, align:'left'},
					{name:'routing_type',index:'routing_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_type',index:'transaction_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_flag',index:'process_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'completion_subinventory',index:'completion_subinventory', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_name',index:'created_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'batch_id',index:'batch_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'standard_operation_id',index:'standard_operation_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'operation_seq_num',index:'operation_seq_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'operation_description',index:'operation_description', width:200, sortable:false, editable:false, align:'left'},
					{name:'minimum_transfer_quantity',index:'minimum_transfer_quantity', width:200, sortable:false, editable:false, align:'left'},
					{name:'department_code',index:'department_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'reference_flag',index:'reference_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'effectivity_date',index:'effectivity_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'resource_code',index:'resource_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'usage_rate_or_amount',index:'usage_rate_or_amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'schedule_flag',index:'schedule_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'basis_type',index:'basis_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'autocharge_type',index:'autocharge_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'standard_rate_flag',index:'standard_rate_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj5.jqGrid({ 
		caption: "JOB",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['INTERFACE_ID', 'GROUP_ID', 'WIP_ENTITY_ID', 'JOB_NAME', 'DESCRIPTION'
	                , 'CREATION_DATE', 'CREATED_BY', 'CREATED_NAME', 'LOAD_TYPE', 'STATUS_TYPE', 'START_QUANTITY'
	                , 'ALLOW_EXPLOSION', 'FIRST_UNIT_START_DATE', 'HEADER_ID', 'PROCESS_PHASE', 'PROCESS_STATUS'
	                , 'SOURCE_CODE', 'PRIMARY_ITEM_ID', 'ITEM_CODE', 'PROJECT_ID', 'PROJECT_NUM'
	                , 'TASK_ID', 'TASK_NUM', 'OPER'],
	    colModel : [
					{name:'interface_id',index:'interface_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'group_id',index:'group_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'wip_entity_id',index:'wip_entity_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'job_name',index:'job_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'description',index:'description', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:150, sortable:false, editable:false, align:'left'},
					{name:'created_name',index:'created_name', width:150, sortable:false, editable:false, align:'left'},
					{name:'load_type',index:'load_type', width:150, sortable:false, editable:false, align:'left'},
					{name:'status_type',index:'status_type', width:150, sortable:false, editable:false, align:'left'},
					{name:'start_quantity',index:'start_quantity', width:200, sortable:false, editable:false, align:'left'},
					{name:'allow_explosion',index:'allow_explosion', width:200, sortable:false, editable:false, align:'left'},
					{name:'first_unit_start_date',index:'first_unit_start_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'header_id',index:'header_id', width:150, sortable:false, editable:false, align:'left'},
					{name:'process_phase',index:'process_phase', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_status',index:'process_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'source_code',index:'source_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'primary_item_id',index:'primary_item_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'item_code',index:'item_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_id',index:'project_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_num',index:'project_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'task_id',index:'task_id', width:150, sortable:false, editable:false, align:'left'},
					{name:'task_num',index:'task_num', width:150, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj6.jqGrid({ 
		caption: "MDS Schedule",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SCHEDULE_DESIGNATOR', 'ERROR_MESSAGE', 'PROCESS_STATUS', 'PROJECT_ID', 'TASK_ID'
	                , 'INVENTORY_ITEM_ID', 'SCHEDULE_QUANTITY', 'CREATED_BY', 'CREATED_NAME', 'LAST_UPDATED_BY', 'LAST_UPDATED_NAME'
	                , 'SCHEDULE_DATE', 'NEW_SCHEDULE_DATE', 'SCHEDULE_COMMENTS', 'OPER'],
	    colModel : [
					{name:'schedule_designator',index:'schedule_designator', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_message',index:'error_message', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_status',index:'process_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_id',index:'project_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'task_id',index:'task_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'inventory_item_id',index:'inventory_item_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'schedule_quantity',index:'schedule_quantity', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:150, sortable:false, editable:false, align:'left'},
					{name:'created_name',index:'created_name', width:150, sortable:false, editable:false, align:'left'},
					{name:'last_updated_by',index:'last_updated_by', width:150, sortable:false, editable:false, align:'left'},
					{name:'last_updated_name',index:'last_updated_name', width:150, sortable:false, editable:false, align:'left'},
					{name:'schedule_date',index:'schedule_date', width:150, sortable:false, editable:false, align:'left'},
					{name:'new_schedule_date',index:'new_schedule_date', width:150, sortable:false, editable:false, align:'left'},
					{name:'schedule_comments',index:'schedule_comments', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj7.jqGrid({ 
		caption: "WIP Resource Transaction",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SOURCE_CODE', 'SOURCE_LINE_ID', 'TRANSACTION_ID', 'ORGANIZATION_CODE', 'WIP_ENTITY_NAME'
	                , 'OPERATION_SEQ_NUM', 'RESOURCE_SEQ_NUM', 'TRANSACTION_QUANTITY', 'TRANSACTION_UOM', 'TRANSACTION_DATE'
	                , 'CREATION_DATE', 'LAST_UPDATE_DATE', 'PROCESS_STATUS', 'PROCESS_STATUS_MEAN'
	                , 'ERROR_MESSAGE', 'DESCRIPTION', 'OPER'],
	    colModel : [
					{name:'source_code',index:'source_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'source_line_id',index:'source_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_id',index:'transaction_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'organization_code',index:'organization_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'wip_entity_name',index:'wip_entity_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'operation_seq_num',index:'operation_seq_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'resource_seq_num',index:'resource_seq_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_quantity',index:'transaction_quantity', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_uom',index:'transaction_uom', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_date',index:'transaction_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_status',index:'process_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_status_mean',index:'process_status_mean', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_message',index:'error_message', width:200, sortable:false, editable:false, align:'left'},
					{name:'description',index:'description', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj8.jqGrid({ 
		caption: "RCV Transaction",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['INTERFACE_TYPE', 'INTERFACE_TRANSACTION_ID', 'INTERFACE_HEADER_ID', 'INTERFACE_LINE_ID', 'COLUMN_NAME', 'TABLE_NAME'
	                , 'ERROR_MESSAGE', 'ERROR_MESSAGE_NAME', 'PROCESSING_DATE', 'REQUEST_ID', 'BATCH_ID'
	                , 'RH', 'HEADER_INTERFACE_ID', 'GROUP_ID', 'PROCESSING_STATUS_CODE', 'RECEIPT_HEADER_ID', 'VENDOR_ID', 'VENDOR_SITE_ID'
	                , 'RT', 'RT_INTERFACE_TRANSACTION_ID', 'RT_GROUP_ID', 'RT_REQUEST_ID', 'RT_TRANSACTION_TYPE', 'RT_TRANSACTION_DATE'
	                , 'RT_ATTRIBUTE12', 'RT_ATTRIBUTE13', 'RT_ATTRIBUTE14', 'RT_ATTRIBUTE15', 'RT_HEADER_INTERFACE_ID', 'RT_DOCUMENT_NUM'
	                , 'RT_DOCUMENT_LINE_NUM', 'OPER'],
	    colModel : [
					{name:'interface_type',index:'interface_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_transaction_id',index:'interface_transaction_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_header_id',index:'interface_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_line_id',index:'interface_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'column_name',index:'column_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'table_name',index:'table_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_message',index:'error_message', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_message_name',index:'error_message_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'processing_date',index:'processing_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_id',index:'request_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'batch_id',index:'batch_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'rh',index:'rh', width:200, sortable:false, editable:false, align:'left'},
					{name:'header_interface_id',index:'header_interface_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'group_id',index:'group_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'processing_status_code',index:'processing_status_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'receipt_header_id',index:'receipt_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'vendor_id',index:'vendor_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'vendor_site_id',index:'vendor_site_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt',index:'rt', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_interface_transaction_id',index:'rt_interface_transaction_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_group_id',index:'rt_group_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_request_id',index:'rt_request_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_transaction_type',index:'rt_transaction_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_transaction_date',index:'rt_transaction_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_attribute12',index:'rt_attribute12', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_attribute13',index:'rt_attribute13', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_attribute14',index:'rt_attribute14', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_attribute15',index:'rt_attribute15', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_header_interface_id',index:'rt_header_interface_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_document_num',index:'rt_document_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'rt_document_line_num',index:'rt_document_line_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj9.jqGrid({ 
		caption: "Requisition",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['CREATION_DATE', 'TRANSACTION_ID', 'PROCESS_FLAG', 'REQUEST_ID', 'BATCH_ID', 'COLUMN_NAME', 'ERROR_MESSAGE'
	                , 'INTERFACE_SOURCE_CODE', 'REQ_NUMBER_SEGMENT1', 'HEADER_ATTRIBUTE1', 'DESTINATION_ORGANIZATION_ID', 'PREPARER_ID'
	                , 'MANAGER_NAME', 'CREATED_BY', 'CREATED_NAME', 'SUGGESTED_BUYER_ID', 'BUYER_NAME', 'PROJECT_ID', 'PROJECT_NUM'
	                , 'PROJECT_STATUS_NAME', 'START_DATE', 'COMPLETION_DATE', 'TASK_ID', 'TASK_NUM', 'START_DATE', 'COMPLETION_DATE'
	                , 'EXPENDITURE_TYPE', 'EXPENDITURE_ORG_ID', 'EXPENDITURE_ITEM_DATE', 'QUANTITY', 'HEADER_DESCRIPTION', 'OPER'],
	    colModel : [
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_id',index:'transaction_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_flag',index:'process_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_id',index:'request_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'batch_id',index:'batch_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'column_name',index:'column_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_message',index:'error_message', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_source_code',index:'interface_source_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'req_number_segment1',index:'req_number_segment1', width:200, sortable:false, editable:false, align:'left'},
					{name:'header_attribute1',index:'header_attribute1', width:200, sortable:false, editable:false, align:'left'},
					{name:'destination_organization_id',index:'destination_organization_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'preparer_id',index:'preparer_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'manager_name',index:'manager_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_name',index:'created_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'suggested_buyer_id',index:'suggested_buyer_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'buyer_name',index:'buyer_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_id',index:'project_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_num',index:'project_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_status_name',index:'project_status_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'start_date',index:'start_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'completion_date',index:'completion_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'task_id',index:'task_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'task_num',index:'task_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'start_date',index:'start_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'completion_date',index:'completion_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'expenditure_type',index:'expenditure_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'expenditure_org_id',index:'expenditure_org_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'expenditure_item_date',index:'expenditure_item_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'quantity',index:'quantity', width:200, sortable:false, editable:false, align:'left'},
					{name:'header_description',index:'header_description', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj10.jqGrid({ 
		caption: "MSI Transaction",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SET_PROCESS_ID', 'TRANSACTION_ID', 'PROCESS_FLAG', 'ORGANIZATION_ID', 'CREATION_DATE', 'CREATED_BY', 'CREATED_NAME'
	                , 'SEGMENT1', 'DESCRIPTION', 'PRIMARY_UOM_CODE', 'ATTRIBUTE1', 'ATTRIBUTE7', 'ATTRIBUTE14', 'INVENTORY_ITEM_STATUS_CODE'
	                , 'ITEM_TYPE', 'TEMPLATE_NAME', 'TRANSACTION_TYPE'
	                , 'MIE', 'TABLE_NAME', 'MESSAGE_NAME', 'COLUMN_NAME', 'ERROR_MESSAGE', 'MESSAGE_TYPE', 'OPER'],
	    colModel : [
					{name:'set_process_id',index:'set_process_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_id',index:'transaction_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_flag',index:'process_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'organization_id',index:'organization_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_name',index:'created_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'segment1',index:'segment1', width:200, sortable:false, editable:false, align:'left'},
					{name:'description',index:'description', width:200, sortable:false, editable:false, align:'left'},
					{name:'primary_uom_code',index:'primary_uom_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute1',index:'attribute1', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute7',index:'attribute7', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute14',index:'attribute14', width:200, sortable:false, editable:false, align:'left'},
					{name:'inventory_item_status_code',index:'inventory_item_status_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'item_type',index:'item_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'template_name',index:'template_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_type',index:'transaction_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'mie',index:'mie', width:200, sortable:false, editable:false, align:'left'},
					{name:'table_name',index:'table_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'message_name',index:'message_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'column_name',index:'column_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_message',index:'error_message', width:200, sortable:false, editable:false, align:'left'},
					{name:'message_type',index:'message_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj11.jqGrid({ 
		caption: "MTI Transaction",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['TRANSACTION_INTERFACE_ID', 'TRANSACTION_HEADER_ID', 'INVENTORY_ITEM_ID', 'ITEM_SEGMENT1', 'TRANSACTION_QUANTITY'
	                , 'TRANSACTION_DATE', 'SUBINVENTORY_CODE', 'TRANSACTION_SOURCE_ID', 'TRANSACTION_SOURCE_NAME', 'TRANSACTION_TYPE_ID'
	                , 'SOURCE_CODE', 'SOURCE_LINE_ID', 'SOURCE_HEADER_ID', 'PROCESS_FLAG', 'TRANSACTION_MODE', 'CREATION_DATE'
	                , 'CREATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATED_BY', 'OPER'],
	    colModel : [
					{name:'transaction_interface_id',index:'transaction_interface_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_header_id',index:'transaction_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'inventory_item_id',index:'inventory_item_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'item_segment1',index:'item_segment1', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_quantity',index:'transaction_quantity', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_date',index:'transaction_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'subinventory_code',index:'subinventory_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_source_id',index:'transaction_source_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_source_name',index:'transaction_source_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_type_id',index:'transaction_type_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'source_code',index:'source_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'source_line_id',index:'source_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'source_header_id',index:'source_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'process_flag',index:'process_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'transaction_mode',index:'transaction_mode', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_updated_by',index:'last_updated_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj12.jqGrid({ 
		caption: "Interface Table",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ERROR_MSG', 'INTERFACE_ID', 'ENTRY_HEADER_ID', 'ENTRY_LINE_ID', 'PUR_LINE_IF_ID', 'POH_ID', 'POL_ID'
	                , 'REQUEST_LINE_ID', 'ENTRY_DATE', 'CURRENT_SUM', 'AMOUNT_SUM', 'PO_VENDOR_ID', 'ACTUAL_CURRENT', 'AMOUNT'
	                , 'START_DATE', 'FINISH_DATE', 'INTERFACE_YN', 'INTERFACE_DATE', 'DELETE_YN', 'SUBMIT_TEAM', 'SUBMIT_EMPLOYEE_ID'
	                , 'ATTRIBUTE1', 'ATTRIBUTE2', 'ATTRIBUTE3', 'ATTRIBUTE4', 'ATTRIBUTE5', 'ATTRIBUTE6', 'ATTRIBUTE7', 'ATTRIBUTE8'
	                , 'ATTRIBUTE9', 'ATTRIBUTE10', 'ORGANIZATION_ID', 'CREATED_BY', 'CREATION_DATE', 'LAST_UPDATED_BY', 'LAST_UPDATE_DATE'
	                , 'LAST_UPDATE_LOGIN', 'OBJECT_VERSION_NUMBER', 'OPER'],
	    colModel : [
					{name:'error_msg',index:'error_msg', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_id',index:'interface_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_header_id',index:'entry_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_line_id',index:'entry_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pur_line_if_id',index:'pur_line_if_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'poh_id',index:'poh_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pol_id',index:'pol_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_line_id',index:'request_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_date',index:'entry_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'current_sum',index:'current_sum', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount_sum',index:'amount_sum', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_vendor_id',index:'po_vendor_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'actual_current',index:'actual_current', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'start_date',index:'start_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'finish_date',index:'finish_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_yn',index:'interface_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_date',index:'interface_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'delete_yn',index:'delete_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_team',index:'submit_team', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_employee_id',index:'submit_employee_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute1',index:'attribute1', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute2',index:'attribute2', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute3',index:'attribute3', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute4',index:'attribute4', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute5',index:'attribute5', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute6',index:'attribute6', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute7',index:'attribute7', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute8',index:'attribute8', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute9',index:'attribute9', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute10',index:'attribute10', width:200, sortable:false, editable:false, align:'left'},
					{name:'organization_id',index:'organization_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_updated_by',index:'last_updated_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_login',index:'last_update_login', width:200, sortable:false, editable:false, align:'left'},
					{name:'object_version_number',index:'object_version_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj13.jqGrid({ 
		caption: "Monthly Conunt",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ENTRY_DATE', 'AMOUNT', 'COUNT', 'OPER'],
	    colModel : [
					{name:'entry_date',index:'entry_date', width:150, sortable:false, editable:false, align:'center'},
					{name:'amount',index:'amount', width:150, sortable:false, editable:false, align:'right'},
					{name:'count',index:'count', width:150, sortable:false, editable:false, align:'right'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj14.jqGrid({ 
		caption: "Header Check",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ENTRY_HEADER_ID', 'ENTRY_LINE_ID', 'PUR_LINE_IF_ID', 'LINE_NO_ORDER', 'REQUEST_LINE_ID', 'POH_ID', 'POL_ID'
	                , 'PROJECT_MFG_ID', 'PROJECT_REAL_CODE', 'INSPECTION_PASSED_FLAG', 'ACTUAL_CURRENT', 'AMOUNT', 'BAK_AMOUNT'
	                , 'START_DATE', 'FINISH_DATE', 'REQUEST_APPR_ID', 'ATTRIBUTE1', 'ATTRIBUTE2', 'ATTRIBUTE3', 'ATTRIBUTE4', 'ATTRIBUTE5'
	                , 'ORG_ID', 'CREATED_BY', 'CREATION_DATE', 'LAST_UPDATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATE_LOGIN', 'LINE_STATUS'
	                , 'APPROVE_REJECT_YN', 'APPROVE_REJECT_USER', 'REJECT_REASON_CODE', 'REJECT_REASON_DESC', 'HEADER_CNT', 'ENTRY_DATE', 'OPER'],
	    colModel : [
					{name:'entry_header_id',index:'entry_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_line_id',index:'entry_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pur_line_if_id',index:'pur_line_if_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_no_order',index:'line_no_order', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_line_id',index:'request_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'poh_id',index:'poh_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pol_id',index:'pol_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_mfg_id',index:'project_mfg_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_real_code',index:'project_real_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'inspection_passed_flag',index:'inspection_passed_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'actual_current',index:'actual_current', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'bak_amount',index:'bak_amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'start_date',index:'start_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'finish_date',index:'finish_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_appr_id',index:'request_appr_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute1',index:'attribute1', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute2',index:'attribute2', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute3',index:'attribute3', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute4',index:'attribute4', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute5',index:'attribute5', width:200, sortable:false, editable:false, align:'left'},
					{name:'org_id',index:'org_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_updated_by',index:'last_updated_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_login',index:'last_update_login', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_status',index:'line_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'approve_reject_yn',index:'approve_reject_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'approve_reject_user',index:'approve_reject_user', width:200, sortable:false, editable:false, align:'left'},
					{name:'reject_reason_code',index:'reject_reason_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'reject_reason_desc',index:'reject_reason_desc', width:200, sortable:false, editable:false, align:'left'},
					{name:'header_cnt',index:'header_cnt', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_date',index:'entry_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj15.jqGrid({ 
		caption: "Line or Amount Check",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['TYPE_NAME', 'ENTRY_HEADER_ID', 'PUR_LINE_IF_ID', 'REQUEST_LINE_ID', 'POH_ID', 'POL_ID', 'SEQ', 'ENTRY_DATE'
	                , 'PRE_SUM', 'CURRENT_SUM', 'RESIDUAL', 'AMOUNT', 'CURRENT_STATUS', 'CLAIM_STATUS', 'PO_VENDOR_ID', 'PO_VENDOR_SITE_ID'
	                , 'REJECT_TYPE', 'REJECT_DESCRIPTION', 'REQUEST_APPR_ID', 'INSPECTION_CHECKED', 'INTERFACED_FLAG', 'ROLLUPED_FLAG'
	                , 'ATTRIBUTE1', 'ATTRIBUTE2', 'ATTRIBUTE3', 'ATTRIBUTE4', 'ATTRIBUTE5', 'ORG_ID', 'CREATED_BY', 'CREATION_DATE'
	                , 'LAST_UPDATED_BY', 'LAST_UPDATE_DATE', 'LAST_UPDATE_LOGIN', 'ENTRY_SYSTEM', 'SUBMIT_TEAM', 'SUBMIT_EMPLOYEE_ID', 'ATTRIBUTE10'
	                , 'LINE_AMT', 'LINE_CNT', 'OPER'],
	    colModel : [
					{name:'type_name',index:'type_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_header_id',index:'entry_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pur_line_if_id',index:'pur_line_if_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_line_id',index:'request_line_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'poh_id',index:'poh_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pol_id',index:'pol_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'seq',index:'seq', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_date',index:'entry_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'pre_sum',index:'pre_sum', width:200, sortable:false, editable:false, align:'left'},
					{name:'current_sum',index:'current_sum', width:200, sortable:false, editable:false, align:'left'},
					{name:'residual',index:'residual', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'current_status',index:'current_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'claim_status',index:'claim_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_vendor_id',index:'po_vendor_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_vendor_site_id',index:'po_vendor_site_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'reject_type',index:'reject_type', width:200, sortable:false, editable:false, align:'left'},
					{name:'reject_description',index:'reject_description', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_appr_id',index:'request_appr_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'inspection_checked',index:'inspection_checked', width:200, sortable:false, editable:false, align:'left'},
					{name:'interfaced_flag',index:'interfaced_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'rolluped_flag',index:'rolluped_flag', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute1',index:'attribute1', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute2',index:'attribute2', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute3',index:'attribute3', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute4',index:'attribute4', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute5',index:'attribute5', width:200, sortable:false, editable:false, align:'left'},
					{name:'org_id',index:'org_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_updated_by',index:'last_updated_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_login',index:'last_update_login', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_system',index:'entry_system', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_team',index:'submit_team', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_employee_id',index:'submit_employee_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute10',index:'attribute10', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_amt',index:'line_amt', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_cnt',index:'line_cnt', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj16.jqGrid({ 
		caption: "QTY Compare",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['PUR_LINE_IF_ID', 'CURRENT_STATUS', 'QTY', 'AMOUNT', 'RCV_QTY', 'RCV_AMT', 'POH_ID', 'POL_ID', 'OPER'],
	    colModel : [
					{name:'pur_line_if_id',index:'pur_line_if_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'current_status',index:'current_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'qty',index:'qty', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'rcv_qty',index:'rcv_qty', width:200, sortable:false, editable:false, align:'left'},
					{name:'rcv_amt',index:'rcv_amt', width:200, sortable:false, editable:false, align:'left'},
					{name:'poh_id',index:'poh_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pol_id',index:'pol_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj17.jqGrid({ 
		caption: "RCV Overlap",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['POH_ID', 'POL_ID', 'PO_NUMBER', 'PO_LINE', 'WIP_QTY', 'WIP_AMT', 'RCV_DATE', 'RCV_QTY', 'OPER'],
	    colModel : [
					{name:'poh_id',index:'poh_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pol_id',index:'pol_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_number',index:'po_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_line',index:'po_line', width:200, sortable:false, editable:false, align:'left'},
					{name:'wip_qty',index:'wip_qty', width:200, sortable:false, editable:false, align:'left'},
					{name:'wip_amt',index:'wip_amt', width:200, sortable:false, editable:false, align:'left'},
					{name:'rcv_date',index:'rcv_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'rcv_qty',index:'rcv_qty', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj18.jqGrid({ 
		caption: "Not Processed",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ENTRY_SYSTEM', 'ENTRY_HEADER_ID', 'PUR_LINE_IF_ID', 'CURRENT_STATUS', 'LINE_STATUS', 'LINE_STATUS_NAME', 'VENDOR_NAME'
	                , 'POH_ID', 'PO_NUMBER', 'POL_ID', 'PO_LINE', 'PROJECT_ID', 'PROJECT_NUMBER', 'PRE_SUM', 'CURRENT_SUM', 'RESIDUAL', 'AMOUNT'
	                , 'REQUEST_APPR_ID', 'APPR_NAME', 'SUBMIT_TEAM', 'TEAM', 'SUBMIT_EMPLOYEE_ID', 'CREATED_BY', 'EMPLOYEE', 'EAS_STATUS'
	                , 'CREATION_DATE', 'LAST_UPDATE_DATE', 'OPER'],
	    colModel : [
					{name:'entry_system',index:'entry_system', width:200, sortable:false, editable:false, align:'left'},
					{name:'entry_header_id',index:'entry_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'pur_line_if_id',index:'pur_line_if_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'current_status',index:'current_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_status',index:'line_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_status_name',index:'line_status_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'vendor_name',index:'vendor_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'poh_id',index:'poh_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_number',index:'po_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'pol_id',index:'pol_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'po_line',index:'po_line', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_id',index:'project_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_number',index:'project_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'pre_sum',index:'pre_sum', width:200, sortable:false, editable:false, align:'left'},
					{name:'current_sum',index:'current_sum', width:200, sortable:false, editable:false, align:'left'},
					{name:'residual',index:'residual', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'request_appr_id',index:'request_appr_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'appr_name',index:'appr_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_team',index:'submit_team', width:200, sortable:false, editable:false, align:'left'},
					{name:'team',index:'team', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_employee_id',index:'submit_employee_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'created_by',index:'created_by', width:200, sortable:false, editable:false, align:'left'},
					{name:'employee',index:'employee', width:200, sortable:false, editable:false, align:'left'},
					{name:'eas_status',index:'eas_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'creation_date',index:'creation_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'last_update_date',index:'last_update_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj19.jqGrid({ 
		caption: "Interface Table",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['TYPE_NAME', 'ERROR_MSG', 'INTERFACE_YN', 'DELETE_YN', 'WEB_MASTER_ID', 'INTERFACE_ID', 'BC_DIVISION_CODE'
	                , 'SUPPLIER_ID', 'PERIOD_YYYYMM', 'PROJECT_ID', 'SUBMIT_TEAM', 'SUBMIT_EMPLOYEE_ID', 'OPER'],
	    colModel : [
					{name:'type_name',index:'type_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'error_msg',index:'error_msg', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_yn',index:'interface_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'delete_yn',index:'delete_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'web_master_id',index:'web_master_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_id',index:'interface_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'bc_division_code',index:'bc_division_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'supplier_id',index:'supplier_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'period_yyyymm',index:'period_yyyymm', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_id',index:'project_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_team',index:'submit_team', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_employee_id',index:'submit_employee_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj20.jqGrid({ 
		caption: "Monthly Conunt",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['ENTRY_DATE', 'AMOUNT', 'COUNT', 'OPER'],
	    colModel : [
					{name:'entry_date',index:'entry_date', width:150, sortable:false, editable:false, align:'center'},
					{name:'amount',index:'amount', width:150, sortable:false, editable:false, align:'right'},
					{name:'count',index:'count', width:150, sortable:false, editable:false, align:'right'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj21.jqGrid({ 
		caption: "Not Processed",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SOURCE', 'WEB_MASTER_ID', 'BC_DIVISION_ID', 'WORKING_CATEGORY', 'WORKING_CATEGORY_NAME', 'SUPPLIER_ID', 'SUPPLIER_NAME'
	                , 'PROJECT_ID', 'PERIOD_YYYYMMDD', 'PR_NUM', 'PR_LINE_NUM', 'AMOUNT', 'USE_AMOUNT', 'APPROVE_REJECT_YN', 'LINE_STATUS'
	                , 'PR_INTERFACE_YN', 'SUBMIT_TEAM', 'TEAM_NAME', 'SUBMIT_EMPLOYEE_ID', 'EMPLOYEE_NAME', 'OPER'],
	    colModel : [
					{name:'source',index:'source', width:200, sortable:false, editable:false, align:'left'},
					{name:'web_master_id',index:'web_master_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'bc_division_id',index:'bc_division_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'working_category',index:'working_category', width:200, sortable:false, editable:false, align:'left'},
					{name:'working_category_name',index:'working_category_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'supplier_id',index:'supplier_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'supplier_name',index:'supplier_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'project_id',index:'project_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'period_yyyymmdd',index:'period_yyyymmdd', width:200, sortable:false, editable:false, align:'left'},
					{name:'pr_num',index:'pr_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'pr_line_num',index:'pr_line_num', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'use_amount',index:'use_amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'approve_reject_yn',index:'approve_reject_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'line_status',index:'line_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'pr_interface_yn',index:'pr_interface_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_team',index:'submit_team', width:200, sortable:false, editable:false, align:'left'},
					{name:'team_name',index:'team_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'submit_employee_id',index:'submit_employee_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'employee_name',index:'employee_name', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj22.jqGrid({ 
		caption: "Attachment",
	    datatype: 'json', 
	    mtype: 'POST',
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['INTERFACE_DATE', 'PERIOD_YYYYMM', 'TYPE', 'COUNT', 'INTERFACE_YN', 'DELETE_YN', 'ATTRIBUTE1', 'ATTRIBUTE2', 'OPER'],
	    colModel : [
					{name:'interface_date',index:'interface_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'period_yyyymm',index:'period_yyyymm', width:200, sortable:false, editable:false, align:'left'},
					{name:'type',index:'type', width:200, sortable:false, editable:false, align:'left'},
					{name:'count',index:'count', width:200, sortable:false, editable:false, align:'left'},
					{name:'interface_yn',index:'interface_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'delete_yn',index:'delete_yn', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute1',index:'attribute1', width:200, sortable:false, editable:false, align:'left'},
					{name:'attribute2',index:'attribute2', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
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
			
		},
	}); //end of jqGrid
	
	jqGridObj23.jqGrid({ 
		caption: "NDE AP",
	    datatype: 'json', 
	    mtype: 'POST', 
	    url: '',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['JOURNAL_STATUS', 'JOURNAL_NUMBER', 'EAI_STATUS', 'EAI_APLS_DEAL_DTM', 'EAI_ERR_MSG', 'EAI_TS_NO'
	                , 'TRX_HEADER_ID', 'GROUP_NUMBER', 'TRX_NUMBER', 'ACCOUNTING_DATE', 'CURRENCY', 'AMOUNT', 'DESCRIPTION', 'ACCOUNT_CODE', 'OPER'],
	    colModel : [
					{name:'journal_status',index:'journal_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'journal_number',index:'journal_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'eai_status',index:'eai_status', width:200, sortable:false, editable:false, align:'left'},
					{name:'eai_apls_deal_dtm',index:'eai_apls_deal_dtm', width:200, sortable:false, editable:false, align:'left'},
					{name:'eai_err_msg',index:'eai_err_msg', width:200, sortable:false, editable:false, align:'left'},
					{name:'eai_ts_no',index:'eai_ts_no', width:200, sortable:false, editable:false, align:'left'},
					{name:'trx_header_id',index:'trx_header_id', width:200, sortable:false, editable:false, align:'left'},
					{name:'group_number',index:'group_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'trx_number',index:'trx_number', width:200, sortable:false, editable:false, align:'left'},
					{name:'accounting_date',index:'accounting_date', width:200, sortable:false, editable:false, align:'left'},
					{name:'currency',index:'currency', width:200, sortable:false, editable:false, align:'left'},
					{name:'amount',index:'amount', width:200, sortable:false, editable:false, align:'left'},
					{name:'description',index:'description', width:200, sortable:false, editable:false, align:'left'},
					{name:'account_code',index:'account_code', width:200, sortable:false, editable:false, align:'left'},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    //toolbar: [false, "bottom"],
	    viewrecords: true,
	    height : $(window).height()/4,
	    autowidth: false,
	    cellEdit : false,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    forceFit: true,
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
			
		},
	}); //end of jqGrid
	
	// jqGrid 크기 동적화
	// Tab1
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	// Tab2 
	fn_insideGridresizeWipChk( $(window), $( "#divList1" ), $( "#jqGridList1" ), 0, 0.5);
	fn_insideGridresizeWipChk( $(window), $( "#divList2" ), $( "#jqGridList2" ), 0, 0.5);
	// Tab3
	fn_insideGridresizeWipChk( $(window), $( "#divList3" ), $( "#jqGridList3" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList4" ), $( "#jqGridList4" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList5" ), $( "#jqGridList5" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList6" ), $( "#jqGridList6" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList7" ), $( "#jqGridList7" ), 0, 0.4);
	// Tab4
	fn_insideGridresizeWipChk( $(window), $( "#divList8" ), $( "#jqGridList8" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList9" ), $( "#jqGridList9" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList10" ), $( "#jqGridList10" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList11" ), $( "#jqGridList11" ), 0, 0.4);
	// Tab5
	fn_insideGridresizeWipChk( $(window), $( "#divList12" ), $( "#jqGridList12" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList13" ), $( "#jqGridList13" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList14" ), $( "#jqGridList14" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList15" ), $( "#jqGridList15" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList16" ), $( "#jqGridList16" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList17" ), $( "#jqGridList17" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList18" ), $( "#jqGridList18" ), 0, 0.4);
	// Tab6
	fn_insideGridresizeWipChk( $(window), $( "#divList19" ), $( "#jqGridList19" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList20" ), $( "#jqGridList20" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList21" ), $( "#jqGridList21" ), 0, 0.4);
	// Tab7
	fn_insideGridresizeWipChk( $(window), $( "#divList22" ), $( "#jqGridList22" ), 0, 0.4);
	fn_insideGridresizeWipChk( $(window), $( "#divList23" ), $( "#jqGridList23" ), 0, 0.4);
	
	
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
	
	if(target == 'concM') 
	{
		fn_gridresize( $(window), $( "#jqGridList" ), 70 );
		jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList.do";
		jqGridObj.jqGrid( "clearGridData" );
		jqGridObj.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
	}
	else if(target == 'etcM') 
	{
		//fn_gridresize( $(window), $( "#jqGridList1" ), 70 );
		
		fn_insideGridresizeWipChk( $(window), $( "#divList1" ), $( "#jqGridList1" ), 0, 0.5);
		fn_insideGridresizeWipChk( $(window), $( "#divList2" ), $( "#jqGridList2" ), 0, 0.5);
		
		jqGridObj1.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj2.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList1.do";
		jqGridObj1.jqGrid( "clearGridData" );
		jqGridObj1.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			cellEdit : false,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList2.do";
		jqGridObj2.jqGrid( "clearGridData" );
		jqGridObj2.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			cellEdit : false,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
	}
	else if(target == 'Interface1') 
	{
		fn_insideGridresizeWipChk( $(window), $( "#divList3" ), $( "#jqGridList3" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList4" ), $( "#jqGridList4" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList5" ), $( "#jqGridList5" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList6" ), $( "#jqGridList6" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList7" ), $( "#jqGridList7" ), 0, 0.4);
		
		jqGridObj3.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj4.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj5.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj6.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj7.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList3.do";
		jqGridObj3.jqGrid( "clearGridData" );
		jqGridObj3.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList4.do";
		jqGridObj4.jqGrid( "clearGridData" );
		jqGridObj4.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList5.do";
		jqGridObj5.jqGrid( "clearGridData" );
		jqGridObj5.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList6.do";
		jqGridObj6.jqGrid( "clearGridData" );
		jqGridObj6.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList7.do";
		jqGridObj7.jqGrid( "clearGridData" );
		jqGridObj7.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
	}
	else if(target == 'Interface2') 
	{
		fn_insideGridresizeWipChk( $(window), $( "#divList8" ), $( "#jqGridList8" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList9" ), $( "#jqGridList9" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList10" ), $( "#jqGridList10" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList11" ), $( "#jqGridList11" ), 0, 0.4);
		
		jqGridObj8.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj9.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj10.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj11.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList8.do";
		jqGridObj8.jqGrid( "clearGridData" );
		jqGridObj8.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList9.do";
		jqGridObj9.jqGrid( "clearGridData" );
		jqGridObj9.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList10.do";
		jqGridObj10.jqGrid( "clearGridData" );
		jqGridObj10.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList11.do";
		jqGridObj11.jqGrid( "clearGridData" );
		jqGridObj11.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
	}
	else if(target == 'actual') 
	{
		fn_insideGridresizeWipChk( $(window), $( "#divList12" ), $( "#jqGridList12" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList13" ), $( "#jqGridList13" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList14" ), $( "#jqGridList14" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList15" ), $( "#jqGridList15" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList16" ), $( "#jqGridList16" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList17" ), $( "#jqGridList17" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList18" ), $( "#jqGridList18" ), 0, 0.4);
		
		jqGridObj12.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj13.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj14.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj15.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj16.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj17.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj18.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList12.do";
		jqGridObj12.jqGrid( "clearGridData" );
		jqGridObj12.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList13.do";
		jqGridObj13.jqGrid( "clearGridData" );
		jqGridObj13.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList14.do";
		jqGridObj14.jqGrid( "clearGridData" );
		jqGridObj14.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList15.do";
		jqGridObj15.jqGrid( "clearGridData" );
		jqGridObj15.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList16.do";
		jqGridObj16.jqGrid( "clearGridData" );
		jqGridObj16.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList17.do";
		jqGridObj17.jqGrid( "clearGridData" );
		jqGridObj17.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList18.do";
		jqGridObj18.jqGrid( "clearGridData" );
		jqGridObj18.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
	}
	else if(target == 'fixedPrice') 
	{
		fn_insideGridresizeWipChk( $(window), $( "#divList19" ), $( "#jqGridList19" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList20" ), $( "#jqGridList20" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList21" ), $( "#jqGridList21" ), 0, 0.4);
		
		jqGridObj19.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj20.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj21.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList19.do";
		jqGridObj19.jqGrid( "clearGridData" );
		jqGridObj19.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList20.do";
		jqGridObj20.jqGrid( "clearGridData" );
		jqGridObj20.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList21.do";
		jqGridObj21.jqGrid( "clearGridData" );
		jqGridObj21.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
	}
	else 
	{
		fn_insideGridresizeWipChk( $(window), $( "#divList22" ), $( "#jqGridList22" ), 0, 0.4);
		fn_insideGridresizeWipChk( $(window), $( "#divList23" ), $( "#jqGridList23" ), 0, 0.4);
		
		jqGridObj22.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		jqGridObj23.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
		
		sUrl = "lec.wipChkMgr.wipChkMgrList22.do";
		jqGridObj22.jqGrid( "clearGridData" );
		jqGridObj22.jqGrid( 'setGridParam', {
			url : sUrl,
			mtype : 'POST',
			datatype : 'json',
			page : 1,
			postData : fn_getFormData( "#application_form" )
		} ).trigger( "reloadGrid" );
		
		sUrl = "lec.wipChkMgr.wipChkMgrList23.do";
		jqGridObj23.jqGrid( "clearGridData" );
		jqGridObj23.jqGrid( 'setGridParam', {
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
