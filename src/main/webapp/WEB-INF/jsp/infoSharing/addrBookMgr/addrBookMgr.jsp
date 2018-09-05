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
	height:22px;
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
<input type="hidden" id="p_col_name"  name="p_col_name"/>
<input type="hidden" id="p_data_name" name="p_data_name"/>
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">주소록관리(운영팀)</a></li>
	</ol>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
				<td>
					<div class="button endbox">
						<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
						<button type="button" id="btnExport" class="btn btn-success btn-sm" >엑셀</button>						
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
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- <script src="/js/sb-admin.min.js"></script> -->
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
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
    
$(document).ready(function(){
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'infoSharing.addrBookMgr.addrBookMgrList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['이름', '직급', '이메일', '주소', '주', '보조', '회사', '담당업무'],
	    colModel : [
					{name:'name'			,index:'name'			, width:30,  align:'center', excel:'이름',     editable : false},
					{name:'rank_kor_name'	,index:'rank_kor_name'	, width:20,  align:'center', excel:'직급',     editable : false},
					{name:'e_mail'	 		,index:'e_mail'	  		, width:100, align:'left',   excel:'이메일',    editable : false},					
					{name:'home_address'	,index:'home_address'	, width:180, align:'left',   excel:'주소',     editable : false},
					{name:'phone1'	 		,index:'phone1'	  		, width:50,  align:'center',   excel:'주연락처',   editable : false},
					{name:'phone2'	 		,index:'phone2'	  		, width:50,  align:'center',   excel:'보조연락처',  editable : false},
					{name:'tel'	 			,index:'tel'	  		, width:50,  align:'center',   excel:'회사연락처',  editable : false},
					{name:'business_role'   ,index:'business_role'  , width:150, align:'left',   excel:'담당업무',   editable : false}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    autowidth: true,
	    cellEdit : true,
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
   			var pages 		      = 1;
   			var rowNum 			  = 100;	   

   			if (pgButton == "user") 
   			{
   				if (pageIndex > lastPageX) 
   				{
   			    	pages = lastPageX
   			    } 
   				else
   				{ 
   					pages = pageIndex;
   				}
   				
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
   			else if(pgButton == 'next')
   			{
   				pages = currentPageIndex+1;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			} 
   			else if(pgButton == 'last')
   			{
   				pages = lastPageX;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
   			else if(pgButton == 'prev')
   			{
   				pages = currentPageIndex-1;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
   			else if(pgButton == 'first')
   			{
   				pages = 1;
   				rowNum = $('.ui-pg-selbox option:selected').val();
   			}
 	   		else if(pgButton == 'records') 
 	   		{
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
			
		}
	}); //end of jqGrid

	// jqGrid 크기 동적화
	fn_gridresize( $(window), $( "#jqGridList" ), 70 );
	
	//그리드 버튼 숨김
	$("#jqGridList").jqGrid('navGrid', "#btnjqGridList", {
			refresh : false,
			search : false,
			edit : false,
			add : false,
			del : false,								
		}
	);

	//Refresh
	$("#jqGridList").navButtonAdd('#btnjqGridList', {
		caption : "",
		buttonicon : "ui-icon-refresh",
		onClickButton : function() {
			fn_search();
		},
		position : "first",
		title : "Refresh",
		cursor : "pointer"
	});

	$( "#jqGridList" ).jqGrid( 'setGroupHeaders', {
		useColSpanStyle : true, 
		groupHeaders : [ { startColumnName : 'phone1', numberOfColumns : 3, titleText : '연락처'}
					   ]
	} );
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		if(uniqeValidation()){
			fn_search();
		}
	});	
	
	//btnExport 버튼 클릭 시 
	$("#btnExport").click(function(){
		fn_excelDownload();	
	});	
});

//필수 항목 Validation
var uniqeValidation = function(){
	var rnt = true;
	$(".required").each(function(){
		if($(this).val() == ""){
			$(this).focus();
			alert($(this).attr("alt")+ "가 누락되었습니다.");
			rnt = false;
			return false;
		}
	});
	return rnt;
}

//검색
function fn_search() {
	
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var sUrl = "infoSharing.addrBookMgr.addrBookMgrList.do";
	jqGridObj.jqGrid( "clearGridData" );
	jqGridObj.jqGrid( 'setGridParam', {
		url : sUrl,
		mtype : 'POST',
		datatype : 'json',
		page : 1,
		postData : fn_getFormData( "#application_form" )
	} ).trigger( "reloadGrid" );
}

//엑셀 다운로드 화면 호출
function fn_excelDownload() {
	//그리드의 label과 name을 받는다.
	//용도 : 엑셀 출력 시 헤더 및 데이터 맵퍼 자동 설정
	var colName = new Array();
	var dataName = new Array();
	
	var cn = $( "#jqGridList" ).jqGrid( "getGridParam", "colNames" );
	var cm = $( "#jqGridList" ).jqGrid( "getGridParam", "colModel" );
	for(var i=1; i<cm.length; i++ ){
		
		if(cm[i]['hidden'] == false) {
			colName.push(cm[i]['excel']);
			dataName.push(cm[i]['index']);	
		}
	}
	$( '#p_col_name' ).val(colName);
	$( '#p_data_name' ).val(dataName);
	var form    = document.application_form;
	form.action = "infoSharing.addrBookMgr.addrBookMgrListExcelExport.do";
	form.method = "post";
	form.submit();
}
</script>
