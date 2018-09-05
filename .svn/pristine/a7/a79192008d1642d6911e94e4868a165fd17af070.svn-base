<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<input type="hidden" id="login_id" name="login_id"/>
<input type="hidden" id="login_pw" name="login_pw"/>

<div class="content-wrapper">
	<div class="container-fluid">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">사용자관리</a></li>
			<!-- <li class="breadcrumb-item active">목록</li> -->
		</ol>
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="120">
			<col width="150">
			<col width="120">
			<col width="150">
			<col width="120">
			<col width="150">
			<col width="*"/>
			<tbody>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">아이디</th>
					<td><input type="text" class="common" id="p_login_id" name="p_login_id" alt="아이디"  style="width:120px;" value="" /></td>
					
					<th style="font-size: 13px; font-weight: 100;">이름</th>
					<td><input type="text" class="common" id="p_name" name="p_name" alt="이름"  style="width:120px;" value="" /></td>
					
					<th style="font-size: 13px; font-weight: 100;">사용여부</th>
					<td>
						<select id="p_sel_status" name="p_sel_status" style="width:120px; font-size: 13px; font-weight: 100;">
							<option value="">선택</option>
							<option value="Y">사용</option>
							<option value="N">비사용</option>
						</select>
					</td>
					
					<td>
						<div class="button endbox">
							<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
							<button type="button" id="btnLogin" class="btn btn-success btn-sm" >로그인</button>
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
	    url: 'main.logIn.AutoLoginUserList.do',
	    //url: 'admin.userMgr.ManageUserList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', '아이디', 'XX', '이름', '이메일', '직급코드', '직급', '담당업무', 
	                '주소', '주', '보조', '회사', '시스템', 'sm_man_flag_changed', 'status_changed', 'OPER'],
	    colModel : [
					{name:'seq_id',index:'seq_id', width:55, hidden : true},
					{name:'login_id',index:'login_id', width:80, excel:'아이디', editable : false},
					{name:'password',index:'password', width:80, editable : false, hidden: true},
					{name:'name',index:'name', width:70, align:'center', editable : false, excel:'이름'},
					{name:'e_mail',index:'e_mail', width:175, align:'left', editable : false, excel:'이메일'},
					{name:'rank_code',index:'rank_code', width:120, sortable:false, editable : false, align:'center', hidden: true},
					{name:'rank',index:'rank', width:40, sortable:false, editable : false, align:'center'},
					{name:'business_role',index:'business_role', width:230, sortable:false, editable : false, excel:'전화번호'},
					{name:'home_address',index:'home_address', width:210, sortable:false, editable : false, excel:'전화번호'},
					{name:'phone1',index:'phone1', width:80, sortable:false, editable : false, align:'center', excel:'전화번호'},
					{name:'phone2',index:'phone2', width:80, sortable:false, editable : false, align:'center', excel:'전화번호'},
					{name:'tel',index:'tel', width:80, sortable:false, editable : false, align:'center', excel:'전화번호'},
					{name:'erp_legacy_gubun',index:'erp_legacy_gubun', width:50, sortable:false, editable : false, align:'center', excel:'전화번호'},
					{name:'sm_man_flag_changed',index:'sm_man_flag_changed', width: 25, hidden:true},
					{name:'status_changed',index:'status_changed', width: 25, hidden:true},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    autowidth: true,
	    cellEdit : true,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit: true,
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
		//beforeSaveCell : chmResultEditEnd,
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
		ondblClickRow : function( rowid, iCol, cellcontent, e ) {
			
			jqGridObj.saveCell(kRow, idCol );
			
			var rowData = jqGridObj.getRowData(rowid);
			var login_id = rowData['login_id'];
			var password = rowData['password'];
			
			$("#login_id").val(login_id);
			$("#login_pw").val(password);
			
			var form    = document.application_form;
			form.action = "loginCheck.do";
			form.method = "post";
			form.submit();
			
		},
		//에디트가 종료되면, 셀의 에디트 가능 여부를 false 로 돌린다.
		afterEditCell: function (rowid, cellname, value, iRow, iCol) {
		    $(this).setColProp("login_id", { editable: false });
		}
	}); //end of jqGrid

	// jqGrid 크기 동적화
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	
	$( "#jqGridList" ).jqGrid( 'setGroupHeaders', {
		useColSpanStyle : true, 
		groupHeaders : [ { startColumnName : 'phone1', numberOfColumns : 3, titleText : '연락처'}
					   ]
	} );
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
	// 로그인 버튼 클릭
	$("#btnLogin").click(function(){
		fn_login();
	});
	
});

function fn_login() {
	var selrow = $('#jqGridList').jqGrid('getGridParam', 'selrow');
	var item = $('#jqGridList').jqGrid('getRowData', selrow);
	
	if(selrow == null) {
		alert("사용자를 선택해주세요.");
		return false;
	}
	
	$("#login_id").val(item.login_id);
	$("#login_pw").val(item.password);
	
	var form    = document.application_form;
	form.action = "loginCheck.do";
	form.method = "post";
	form.submit();
}



//검색
function fn_search() {
	
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var sUrl = "main.logIn.AutoLoginUserList.do";
	jqGridObj.jqGrid( "clearGridData" );
	jqGridObj.jqGrid( 'setGridParam', {
		url : sUrl,
		mtype : 'POST',
		datatype : 'json',
		page : 1,
		postData : fn_getFormData( "#application_form" )
	} ).trigger( "reloadGrid" );
}

</script>
