<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br />"); //br 태그
%> 
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
<input type="hidden" id="p_charge" name="p_charge" value="${p_charge }" />
<input type="hidden" id="p_disabled" name="p_disabled" value="${p_disabled }" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${loginUser.seq_id }" />
<input type="hidden" id="loginId" name="loginId" value="${loginUser.login_id }" />
<input type="hidden" id="p_seq_id" name="p_seq_id" value="${p_seq_id}" />
<input type="hidden" id="p_attach_seq_id" name="p_attach_seq_id" value="" />
<input type="hidden" id="ref_table_seq_id" name="ref_table_seq_id" value="" />
<input type="hidden" id="p_status" name="p_status" value="${p_status }" />
<input type="hidden" id="p_term" name="p_term" value="${distb.term }" />

<div class="container-fluid">
	<div style="float: right; margin: 10px 0px 10px 0">
		<button type="button" id="btnSave" class="btn btn-primary btn-sm" >처리완료</button>
		<button type="button" id="btnCancel" class="btn btn-primary btn-sm" >처리불가</button>
		<button type="button" id="btnClose" class="btn btn-primary btn-sm" >닫기</button>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="10%"/>
			<col width="*"/>
			<tbody>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">구분</th>
					<td>
						<div class="form-check form-check-inline">
						  <input type="radio" class="form-check-input" id="p_term_chk1" name="p_term_chk" value="N" disabled="disabled">일반
						</div>
						
						<!-- Material inline 2 -->
						<div class="form-check form-check-inline">
						  <input type="radio" class="form-check-input" id="p_term_chk2" name="p_term_chk" value="Y" disabled="disabled">긴급
						</div>
					</td>
				</tr>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">제목</th>
					<td><input type="text" class="common" id="p_title" name="p_title" alt="제목" style="width:100%;" value="${distb.title}" readonly="readonly" /></td>
				</tr>
				
				<tr>	
					<th align="right" valign="top">내용</th>
					<td>
						<textarea class="common" id="p_contents" name="p_contents" cols="1" rows="17" alt="내용" readonly="readonly">${fn:replace(distb.contents, br, crcn)}</textarea>
					</td>
				</tr>
				
				<tr>
					<th align="right" valign="top">첨부파일 목록</th>
					<td>
						<div align="right" style="margin-bottom:5px;">
							<button type="button" id="btnDown" class="btn btn-success btn-sm" >다운로드</button>
						</div>
						<div class="table-responsive">
							<table id = "jqGridList"></table>
							<div   id = "btnjqGridList"></div>
						</div>	
					</td>
				<tr>	
				
				<tr>	
					<th style="font-size: 13px; font-weight: 100;">담당자</th>
					<td>
						<select class="common" id="p_sel_charge" name="p_sel_charge" disabled="disabled">
						</select>
					</td>
				</tr>
				
				<tr>	
					<th align="right" valign="top">코멘트</th>
					<td>
						<textarea id="p_comments" name="p_comments" cols="1" rows="3" alt="코멘트">${distb.comments}</textarea>
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

$(document).ready(function() {
	
	if($("#p_term").val() == 'Y' ) {
		$('input:radio[name=p_term_chk]:input[value=Y]').attr("checked", true);
	} else {
		$('input:radio[name=p_term_chk]:input[value=N]').attr("checked", true);
	}
	
	getAjaxHtml($("#p_sel_charge"), "distb.distbMgr.distbChargeSelectBoxDataList.do?sb_type=not&p_query=getDistbChargeList", null, null);
	setTimeout(function(){
		$("#p_sel_charge").val($("#p_charge").val()).prop("selected", true);
	 },400);
	
	if($("#p_charge").val() != $("#loginId").val()) {
		$("#btnSave").attr("disabled", true);
		$("#btnCancel").attr("disabled", true);
	}
	
	if($("#p_status").val() == 'S' || $("#p_status").val() == 'X') {
		$("#btnSave").hide();
		$("#btnCancel").hide();
	}
	
	jqGridObj.jqGrid({ 
	    datatype: 'json', 
	    mtype: 'POST',
	    url: 'distb.distbMgr.popUpDistbAttachList.do',
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
			form.attr("action", "distb.distbMgr.distbAttachFileDownload.do");
			form.attr("target", "_self");
			form.attr("method", "post");
			form.submit();
		}
	}); //end of jqGrid
	
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save('S');
	});
	
	//저장버튼
	$( "#btnCancel" ).click( function() {
		fn_save('X');
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

			form.attr("action", "distb.distbMgr.distbAttachFileDownload.do");
			form.attr("target", "_self");
			form.attr("method", "post");
			form.submit();
			
			
		} else {
			alert("첨부파일을 선택해주세요.");
	    	return false;
		}
		
	});
		
});

function fn_save(status) {
	
	var conMsg = '';
	
	$("#p_status").val(status);
	
	if(status == 'S') {
		conMsg = '처리완료';
	} else {
		conMsg = '처리불가';
	}
	
	if($("#p_comments").val() == ""){
		$(this).focus();
		alert("코멘트가 누락되었습니다.");
		return false;
	}
	
	var url = "distb.distbMgr.updateDistbProcess.do";
	var formData = fn_getFormData('#application_form');
	
	if ( confirm( conMsg + ' 하시겠습니까?' ) != 0 ) {
		$.post( url, formData, function( data ) {
			alert(data.resultMsg);
			if ( data.result == 'success' ) {
				opener.fn_search();
				window.close();
			}
		}, "json" ).error( function () {
			alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
		} );
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
