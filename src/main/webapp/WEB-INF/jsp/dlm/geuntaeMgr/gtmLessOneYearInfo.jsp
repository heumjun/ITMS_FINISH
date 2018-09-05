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

.MyCell{
	font-size: 12px !important;
	font-weight : bold !important;
}

</style>

<form id="application_form" name="application_form" >
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">1년미만자기준정보</a></li>
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
				<th style="font-size: 13px; font-weight: 100; width:10%;">사용자명</th>
				<td style="width:70%;"><input type="text" class="common" id="p_name" name="p_name" alt="이름"  style="width:30%;" value="" /></td>
				<td style="width:20%;">
					<div class="button endbox">
						<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
						<button type="button" id="btnSave" class="btn btn-primary btn-sm" >저장</button>
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
<!-- Core plugin JavaScript-->
<!-- Custom scripts for all pages-->
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
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

$(document).ready(function(){
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'dlm.geuntaeMgr.gtmLessOneYearInfoList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', '아이디', '이름', '적용년월일', '적용여부','OPER'],
	    colModel : [
					{name:'seq_id',index:'seq_id', width:60, hidden : true},
					{name:'icui_seq_id',index:'icui_seq_id', width:55, excel:'아이디', editable : false, hidden: true},
					{name:'name',index:'name', width:55, align:'center', editable : true,  align:'center', excel:'이름',
						 edittype : "select",
				  		 editrules : { required : false },
				  		 cellattr: function (){return '';},
				  		 editoptions: {
						 	dataUrl: function(){
				            	var item = jqGridObj.jqGrid( 'getRowData', idRow );
				            	var url = "dlm.geuntaeMgr.gtmLessOneYearUserList.do?p_icui_seq_id=" + item.icui_seq_id;
								return url;
						 	},
				  		 	buildSelect: function(data){
				     		 	if(typeof(data)=='string'){
				     		 		data = $.parseJSON(data);
				     		 	}
				      		 	var rtSlt = '<select id="selectUser" name="selectUser" >';
				      		 	for ( var idx = 0 ; idx < data.length ; idx ++) {
				      		 		rtSlt +='<option value="'+data[idx].sb_value+'" name="'+data[idx].sb_value+'" ' + data[idx].selected + '>'+data[idx].sb_name+'</option>';	
				      		 	}
					       		rtSlt +='</select>';
					       		
					       		return rtSlt;
				  		 	},
				  		 	dataEvents: [{
				            	type: 'change'
				            	, fn: function(e, data) {
				            		var row = $(e.target).closest('tr.jqgrow');
				                    var rowId = row.attr('id');
				                    jqGridObj.jqGrid('setCell', rowId, 'icui_seq_id', e.target.value);
				                }
				            },{ type : 'keydown'
				            	, fn : function( e) { 
				            		var row = $(e.target).closest('tr.jqgrow');
				                    var rowId = row.attr('id');
				                    
				                    var key = e.charCode || e.keyCode; 
				            		if( key == 13 || key == 9) {
				            			jqGridObj.jqGrid('setCell', rowId, 'icui_seq_id', e.target.value);
				            		}
				                    
				            	}
				            },{ type : 'blur'
				            	, fn : function( e) { 
				            		var row = $(e.target).closest('tr.jqgrow');
				                    var rowId = row.attr('id');
				                    jqGridObj.jqGrid('setCell', rowId, 'icui_seq_id', e.target.value);
				            	}
				            }]
				  		 }
					},
					{name:'apply_ymd',index:'apply_ymd', width:60, align:'center', editable : true,
						editoptions: { 
							dataInit: function(el) { 
								$(el).datepicker({
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
								    /* onSelect: function (selectedDate,i) {
				                        $("#jqGridList").jqGrid("saveCell", idRow, idCol);
				                    } */
					  			}); 
							} 
						}
					},
					{name:'apply_flag',index:'apply_flag', width:60, excel:'적용여부', align:'center', width:55, editable : false},
					{name:'oper', width:50, align:'center', sortable:true, title:false, hidden: true}
				],
	    gridview: true,
	    toolbar: [false, "bottom"],
	    viewrecords: true,
	    autowidth: true,
	    cellEdit : true,
        cellsubmit : 'clientArray', // grid edit mode 2
	    scrollOffset : 17,
	    shrinkToFit:true,
	    multiselect: true,
	    //rownumbers: true,
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
			
			// JqGrid Cell CSS 변경
			var rows = jqGridObj.getDataIDs();
			for( var i = 0; i < rows.length; i++ ) {
				
				var status = jqGridObj.getCell( rows[i], "apply_flag" );
				
				if(status == 'N') {
					jqGridObj.setRowData(rows[i], false, {background : "#dfdfdf"});
				} 
				
			}
			
		},

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

	//Add 버튼
	$("#jqGridList").navButtonAdd('#btnjqGridList', {
		caption : "",
		buttonicon : "ui-icon-plus",
		onClickButton : addChmResultRow,
		position : "first",
		title : "Add",
		cursor : "pointer"
	});

	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save();
	} );
	
});

//검색
function fn_search() {
	//검색 시 스크롤 깨짐현상 해결
	jqGridObj.closest(".ui-jqgrid-bdiv").scrollLeft(0); 
	
	var sUrl = "dlm.geuntaeMgr.gtmLessOneYearInfoList.do";
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



//Del 버튼
function deleteRow() {
	$('#jqGridList').saveCell(kRow, kCol);
	
	//체크한 것만 배열에 담음 
	var recs = $("#jqGridList").jqGrid('getGridParam', 'selarrrow');
	var rows = recs.length;
	
	/* 각 ROW 별로 상태에 따라 작업 */
	for (var i = rows - 1; i >= 0; i--) {
		
		var item  = $('#jqGridList').jqGrid('getRowData', recs[i]);
		
		if (item.oper == 'I') {
			$('#jqGridList').jqGrid('delRowData', recs[i]);
		} else {
			item.oper = 'D';
			$('#jqGridList').jqGrid("setRowData", recs[i], item);
			var colModel = $( '#jqGridList' ).jqGrid( 'getGridParam', 'colModel' );
			for( var j in colModel ) {
				$( '#jqGridList' ).jqGrid( 'setCell', recs[i], colModel[j].name,'', {background : '#FF7E9D' } );
			}
		}
	}

	$('#jqGridList').resetSelection();
}

//Add 버튼 
function addChmResultRow() {
	$('#jqGridList').saveCell(kRow, idCol);

	var item = {};
	var colModel = $('#jqGridList').jqGrid('getGridParam', 'colModel');

	for ( var i in colModel)
		item[colModel[i].name] = '';

	item.oper = 'I';
	item.apply_flag = 'N';

	$('#jqGridList').resetSelection();
	$('#jqGridList').jqGrid('addRowData', $.jgrid.randId(), item, 'first');
	
}



//저장
function fn_save() {
	$( '#jqGridList' ).saveCell( kRow, idCol );
	
	var changedData = $( "#jqGridList" ).jqGrid( 'getRowData' );
	
	// 변경된 체크 박스가 있는지 체크한다.
	
	for( var i = 1; i < changedData.length + 1; i++ ) {
		var item = $( '#jqGridList' ).jqGrid( 'getRowData', i );
		
		//alert(item.oper);
		
		if ( item.oper != 'I' && item.oper != 'U' ) {

			if (item.oper == 'U') {
				// apply the data which was entered.
				$('#jqGridList').jqGrid("setRowData", i, item);
			}
		}
	}
	
	if (!fn_checkValidate()) {
		return;
	}
	
	if ( confirm( '변경된 데이터를 저장하시겠습니까?' ) != 0 ) {
		var chmResultRows = [];

		//변경된 row만 가져 오기 위한 함수
		getChangedChmResultData( function( data ) {
			
			chmResultRows = data;
			var dataList = { chmResultList : JSON.stringify( chmResultRows ) };

			var url = 'dlm.geuntaeMgr.saveLessOneYearInfo.do';
			var formData = fn_getFormData('#application_form');
			//객체를 합치기. dataList를 기준으로 formData를 합친다.
			var parameters = $.extend( {}, dataList, formData);
			
			$.post( url, parameters, function( data ) {
				alert(data.resultMsg);
				if ( data.result == 'success' ) {
					fn_search();
				}
			}, "json" ).error( function () {
				alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
			} );
		} );
	}
}




//그리드 필수입력 체크
function fn_checkValidate() {
	var result = true;
	var message = "";
	var nChangedCnt = 0;
	var ids = $("#jqGridList").jqGrid('getDataIDs');

	for (var i = 0; i < ids.length; i++) {
		var oper = $("#jqGridList").jqGrid('getCell', ids[i], 'oper');
		var new_icui_seq_id = $("#jqGridList").jqGrid('getCell', ids[i], 'icui_seq_id');
		var new_apply_ymd = $("#jqGridList").jqGrid('getCell', ids[i], 'apply_ymd');

		if (oper == 'I' || oper == 'U' || oper == 'D') {
			nChangedCnt++;
		}
		
		//데이터 중복 검사
		if (oper == 'I' || oper == 'U') {
			for (var i = 0; i < ids.length; i++) {
				var old_oper = $("#jqGridList").jqGrid('getCell', ids[i], 'oper');
				var old_icui_seq_id = $("#jqGridList").jqGrid('getCell', ids[i], 'icui_seq_id');
				var old_apply_ymd = $("#jqGridList").jqGrid('getCell', ids[i], 'apply_ymd');
				if (old_oper == '' || oper == null) {
					
					if(new_icui_seq_id == old_icui_seq_id & new_apply_ymd == old_apply_ymd){
						result = false;
						message = "데이터가 중복으로 작성되었습니다. 확인 바랍니다.";
					}
				}
			}
		}
	}

	if (nChangedCnt == 0) {
		result = false;
		message = "변경된 내용이 없습니다.";
	}

	if (!result) {
		alert(message);
	}

	return result;
}

//가져온 배열중에서 필요한 배열만 골라내기 
function getChangedChmResultData( callback ) {
	var changedData = $.grep( $( "#jqGridList" ).jqGrid( 'getRowData' ), function( obj ) {
		return obj.oper == 'I' || obj.oper == 'U' || obj.oper == 'D';
	} );
	
	callback.apply( this, [ changedData.concat(resultData) ] );
}

</script>
