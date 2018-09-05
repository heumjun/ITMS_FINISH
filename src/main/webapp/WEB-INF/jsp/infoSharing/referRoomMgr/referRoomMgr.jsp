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
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">자료실</a></li>
	</ol>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<col width="80">
		<col width="500">
		<col width="*"/>
		<tbody>
			<tr>
				<th style="font-size: 13px; font-weight: 100;">제목</th>
				<td><input type="text" class="common" id="p_title" name="p_title" alt="제목"  style="width:480px;" value="" /></td>
				
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
<script src="/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
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

$(document).ready(function(){
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'infoSharing.referRoomMgr.referRoomList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', '제목', '등록자', 'created_by', '등록일', '첨부파일', 'OPER'],
	    colModel : [
					{name:'seq_id', index:'seq_id', width:50, align:'center', sortable:false, title:false, hidden:true},
					{name:'title', index:'title', width:300, align:'left', sortable:false, title:false, formatter:titleFormatter},
					{name:'user_name', index:'user_name', width : 80, align:'center'},
					{name:'created_by', index:'created_by', width : 80, align:'center', hidden: true},
					{name:'create_date', index:'create_date', width : 80, align:'center'},
					{name:'file_img', index:'file_img', width : 50, align:'center', formatter: fileFormatter},
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
                
                var sUrl = "infoSharing.referRoomMgr.popUpReferRoomUpdate.do?p_seq_id=" + item.seq_id + "&p_disabled=" + disabled;
        		
                var screenW = screen.availWidth;  // 스크린 가로사이즈
        		var screenH = screen.availHeight; // 스크린 세로사이즈
        		var popW = 700; // 띄울창의 가로사이즈
        		var popH = 680; // 띄울창의 세로사이즈
        		var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
        		var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
        		
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
	
	//그리드 버튼 숨김
	$("#jqGridList").jqGrid('navGrid', "#btnjqGridList", {
			refresh : false,
			search : false,
			edit : false,
			add : false,
			del : false,								
		}
	);
	
	//Del 버튼
	$("#jqGridList").navButtonAdd('#btnjqGridList', {
		caption : "",
		buttonicon : "ui-icon-minus",
		onClickButton : deleteRow,
		position : "first",
		title : "Del",
		cursor : "pointer"
	});
	
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
	// 등록버튼
	$("#btnRegiste").click(function() {
		var sUrl = "infoSharing.referRoomMgr.popUpReferRoomRegiste.do";
		//window.showModalDialog( sUrl, window, "dialogWidth:1000px; dialogHeight:800px; center:on; scroll:off; status:off");
		
		var screenW = screen.availWidth;  // 스크린 가로사이즈
		var screenH = screen.availHeight; // 스크린 세로사이즈
		var popW = 700; // 띄울창의 가로사이즈
		var popH = 450; // 띄울창의 세로사이즈
		var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
		var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
		
		popupWin = window.open(sUrl, window, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no,'
    		    + 'width='+popW+', height='+popH+', top='+posT+', left='+posL);
		//popupWin.blur();
		
		setTimeout(function(){
			popupWin.focus();
		 }, 200);
	});
	
});

//검색
function fn_search() {
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var sUrl = "infoSharing.referRoomMgr.referRoomList.do";
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

//첨부파일 컬럼 포멧
function fileFormatter(cellvalue, options, rowObject ) {
	
	if(cellvalue == '0') {
		return '';		
	} else {
		//return "<img src=\"/images/icon_file.gif\" border=\"0\" style=\"cursor:pointer;vertical-align:middle;\" onclick=\"fileView('"+rowObject.seq_id+"');\">";
		return "<img src=\"/images/icon_file.gif\" border=\"0\" >";
	}
}

//첨부파일 다운로드
function fileView( seq_id ) {
	
	var sUrl = "infoSharing.referRoomMgr.popUpReferRoomRegiste.do?p_seq_id=" + seq_id;
	
	var screenW = screen.availWidth;  // 스크린 가로사이즈
	var screenH = screen.availHeight; // 스크린 세로사이즈
	var popW = 700; // 띄울창의 가로사이즈
	var popH = 500; // 띄울창의 세로사이즈
	var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
	var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
	
	popupWin = window.open(sUrl, window, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no,'
		    + 'width='+popW+', height='+popH+', top='+posT+', left='+posL);
	
	setTimeout(function(){
		popupWin.focus();
	 }, 200);
}

//Del 버튼
function deleteRow() {
	
	$('#jqGridList').saveCell(kRow, kCol);
	
	var selrow = $('#jqGridList').jqGrid('getGridParam', 'selrow');
	var item = $('#jqGridList').jqGrid('getRowData', selrow);
	
	if(item.created_by != $("#loginId").val()) {
		alert("해당글에 대한 삭제 권한이 없습니다.");
		return false;
	}
	
	item.oper = 'D';

	$('#jqGridList').jqGrid("setRowData", selrow, item);
	var colModel = $( '#jqGridList' ).jqGrid( 'getGridParam', 'colModel' );
	for( var i in colModel ) {
		$( '#jqGridList' ).jqGrid( 'setCell', selrow, colModel[i].name,'', {background : '#FF7E9D' } );
	}
	
	var formData = fn_getFormData('#application_form');
	var url = 'infoSharing.referRoomMgr.referRoomDelete.do?seq_id=' + item.seq_id;
	
	if ( confirm( '삭제 하시겠습니까?' ) != 0 ) {
		
		$.post(url, formData, function( data ) {
			
			if ( data.result == 'success' ) {
				alert("처리가 완료되었습니다.");
				fn_search();
			}
			
		}, "json" ).error( function () {
			alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
		} );
	}

}

</script>
