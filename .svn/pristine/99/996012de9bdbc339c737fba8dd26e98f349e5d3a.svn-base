<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/ui.jqgrid.css" type="text/css" />
<link rel="stylesheet" href="/css/redmond/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="stylesheet" href="/css/uploadify.css" />
<style>
.endbox {
	position: relative;
	text-align: right;
	left: -10px;
}

table th {
	text-align: left;
}

.required {
	background-color: #FFFFA2;
	text-transform: uppercase;
	border: 1px solid #000;
}

.common {
	font-family: '굴림';
	border:1px solid #999999;
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

textarea
{
  border:1px solid #999999;
  width:100%;
  margin:5px 0;
  padding:3px;
}

</style>

<form id="application_form" name="application_form" enctype="multipart/form-data" method="post">
<input type="hidden" id="p_disabled" name="p_disabled" value="${p_disabled }" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${loginUser.seq_id }" />
<input type="hidden" id="p_seq_id" name="p_seq_id" value="${p_seq_id}" />
<input type="hidden" id="p_attach_seq_id" name="p_attach_seq_id" value="" />
<input type="hidden" id="ref_table_seq_id" name="ref_table_seq_id" value="" />
<div class="container-fluid">
	<div style="float: right; margin: 10px 0px 10px 0">
		<button type="button" id="btnSave" class="btn btn-primary btn-sm" >수정</button>
		<button type="button" id="btnClose" class="btn btn-primary btn-sm" >닫기</button>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="10%"/>
			<col width="*"/>
			<tbody>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">제목</th>
					<td><input type="text" class="common" id="p_title" name="p_title" alt="제목" style="width:100%;" value="${referRoom.title}" /></td>
				</tr>
				
				<tr>	
					<th align="right" valign="top">내용</th>
					<td>
						<textarea class="common" id="p_contents" name="p_contents" cols="1" rows="7" alt="내용">${referRoom.contents}</textarea>
					</td>
				</tr>
				
				<tr>
					<th align="right" valign="top">첨부파일 목록</th>
					<td>
						<div align="right" style="margin-bottom:5px;">
							<button type="button" id="btnDown" class="btn btn-success btn-sm" >다운로드</button>
							<button type="button" id="btnDel" class="btn btn-danger btn-sm" >첨부삭제</button>
						</div>
						<div class="table-responsive">
							<table id = "jqGridList"></table>
							<div   id = "btnjqGridList"></div>
						</div>	
					</td>
				<tr>	
				
				<tr>	
					<th align="right" valign="top"><input type="file" name="fileName" id="fileName" size="51"  multiple="true" /></th>
					<td>
						<div id="some_file_queue" style="height:200px; overflow: auto;"></div>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>
</form>
<!-- /.container-fluid-->
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/commonDateUtil.js"></script>
<script type="text/javascript" src="/js/jquery.jqGrid.min.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/jqueryAjax.js"></script>
<script type="text/javascript" src="/js/jquery.uploadify.min.js"></script>
<script type="text/javascript">
var idRow;
var idCol;
var kRow;
var kCol;
var resultData = [];
var jqGridObj = $('#jqGridList');

//File Implode Submit Form 셋팅.
$(function() {
	
	$("#fileName").uploadify({
		buttonText  : '추가파일',
		//buttonClass : 'some-class',
		auto 		: false,
		method   	: 'post',              //파라미터 전송 방식
		swf     	: '/css/uploadify.swf',
		uploader 	: 'infoSharing.referRoomMgr.saveReferRoomAttachFile.do',
		height  	: 30,
		width    	: 120,
		queueID  	: 'some_file_queue', 
		fileDataName: 'fileName',
		onSelect 	: function(file) {

		},
        onUploadStart : function(file) {
            $('#fileName').uploadify('settings','formData',{
                'ref_table_seq_id': $('#ref_table_seq_id').val()
            });
        },
        onUploadSuccess : function(file, data, response) {
        	
        },
        onQueueComplete : function(file) {
        	alert("처리가 완료되었습니다.");
        	
        	jqGridObj.jqGrid( 'setGridParam', {
				url : 'infoSharing.referRoomMgr.popUpReferRoomAttachList.do',
				mtype : 'POST',
				datatype : 'json',
				page : 1,
				postData : fn_getFormData( "#application_form" )
			} ).trigger( "reloadGrid" );
    		opener.fn_search();
        	//window.close();
        }
	});
}); //function end

$(document).ready(function() {
	
	// 해당 자료글과 로그인사용자가 다른 경우 수정버튼, 첨부삭제 비활성화
	if($("#p_disabled").val() == 'Y') {
		$("#btnSave").attr("disabled", true);
		$("#btnDel").attr("disabled", true);
	}
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'infoSharing.referRoomMgr.popUpReferRoomAttachList.do',
	    postData : fn_getFormData('#application_form'),
	    colNames : ['SEQ', '파일명', '용량(KB)', 'OPER'],
	    colModel : [
					{name:'seq_id', index:'seq_id', width:50, align:'center', sortable:false, title:false, hidden:true},
					{name:'org_file_name', index:'org_file_name', sortable:false, width : 170, align:'left'},
					{name:'file_size', index:'file_size', sortable:false, width : 50, align:'right'},
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
	    //pager: $('#btnjqGridList'),
	    rowList:[100,500,1000],
	    recordtext: '내용 {0} - {1}, 전체 {2}',
	    emptyrecords:'조회 내역 없음',
	    rowNum : 9999, 
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
		ondblClickRow : function( rowid, iCol, cellcontent, e ) {
			
			jqGridObj.saveCell(kRow, idCol );
			
			var rowData = jqGridObj.getRowData(rowid);
			var seq_id = rowData['seq_id'];

			$("#p_attach_seq_id").val(seq_id);
			
			form = $('#application_form');
			form.attr("action", "infoSharing.referRoomMgr.refAttachFileDownload.do");
			form.attr("target", "_self");
			form.attr("method", "post");
			form.submit();
		}
	}); //end of jqGrid
	
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save();
	});
	
	$("#btnClose").click(function() {
		window.close();
	});
	
	$("#btnDown").click(function() {
		
		var selarrrow = jqGridObj.jqGrid('getGridParam', 'selarrrow');
		var p_attach_seq_id = new Array();
		
		if(selarrrow.length > 0) {
			
			for (var i = 0; i < selarrrow.length; i++) 
			{
				var item  = jqGridObj.jqGrid('getRowData', selarrrow[i]);
				p_attach_seq_id.push(item.seq_id);
			}
			
			$("#p_attach_seq_id").val(p_attach_seq_id);
			
			form = $('#application_form');

			form.attr("action", "infoSharing.referRoomMgr.refAttachFileDownload.do");
			form.attr("target", "_self");
			form.attr("method", "post");
			form.submit();
			
			
		} else {
			alert("첨부파일을 선택해주세요.");
	    	return false;
		}
		
	});
		
	$("#btnDel").click(function() {
		
		var selarrrow = jqGridObj.jqGrid('getGridParam', 'selarrrow');
		var p_attach_seq_id = new Array();
		
		if(selarrrow.length > 0) {
			
			for (var i = 0; i < selarrrow.length; i++) 
			{
				var item  = jqGridObj.jqGrid('getRowData', selarrrow[i]);
				p_attach_seq_id.push(item.seq_id);
			}
			
			$("#p_attach_seq_id").val(p_attach_seq_id);
			
			var formData = fn_getFormData('#application_form');
			
			if ( confirm( '선택한 파일을 삭제 하시겠습니까?' ) != 0 ) {
			
				$.post( 'infoSharing.referRoomMgr.refAttachFileDelete.do', formData, function( data ) {
					
					if ( data.result == 'success' ) {
						alert("처리가 완료되었습니다.");
						jqGridObj.jqGrid( 'setGridParam', {
							url : 'infoSharing.referRoomMgr.popUpReferRoomAttachList.do',
							mtype : 'POST',
							datatype : 'json',
							page : 1,
							postData : fn_getFormData( "#application_form" )
						} ).trigger( "reloadGrid" );
		        		opener.fn_search();
					}
					
				}, "json" ).error( function () {
					alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
				} );
			}
			
		} else {
			alert("첨부파일을 선택해주세요.");
	    	return false;
		}
		
	});
	
});

function fn_save() {
	
	var args = window.dialogArguments;
	var result = true;
	var message = "";
	
	if(uniqeValidation()) {
	
		var url = "infoSharing.referRoomMgr.saveReferRoom.do";
		var formData = fn_getFormData('#application_form');
		
		if ( confirm( '수정 하시겠습니까?' ) != 0 ) {
			
			$.ajax({
				url:url,
				cache:false,
				data:formData,
				dataType:"json",
				type:'POST',
				success:function(data){
					$('#ref_table_seq_id').val($("#p_seq_id").val());
					if ( data.result == 'success' ) {
						
						var queueCount = $("#some_file_queue > div").size();
			            if (queueCount < 1) {
			            	alert("처리가 완료되었습니다.");
			            	opener.fn_search();
			            } else {
			            	$('#fileName').uploadify('upload', '*');
			            }
						
					}
					
				},
				error:function(jxhr,textStatus)
				{
					alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
				}  
			});
			
		}
	}
	
}

//필수 항목 Validation
var uniqeValidation = function(){
	var rnt = true;
	$(".common").each(function(){
		if($(this).val() == ""){
			$(this).focus();
			alert($(this).attr("alt")+ "이 누락되었습니다.");
			rnt = false;
			return false;
		}
	});
	return rnt;
}

//afterSaveCell oper 값 지정
function chmResultEditEnd( irow, cellName, val, iRow, iCol ) {
	
	var item = jqGridObj.jqGrid( 'getRowData', irow );
	
	if (item.oper != 'I')
		item.oper = 'U';

	jqGridObj.jqGrid( "setRowData", irow, item );
	$( "input.editable,select.editable", this ).attr( "editable", "0" );
	
	if(val == null) val = "";
	//입력 후 대문자로 변환
	jqGridObj.setCell(irow, cellName, val.toUpperCase(), '');
}

</script>
