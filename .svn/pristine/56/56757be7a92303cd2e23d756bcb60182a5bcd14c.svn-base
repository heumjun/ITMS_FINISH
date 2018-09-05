<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<style>
.endbox {
	position: relative;
	text-align: right;
	left: -10px;
	height:22px;
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
	border: 1px solid #000;
	font-size: 11px; 
	font-weight: 100;
}

</style>

<form id="application_form" name="application_form" >
<input type="hidden" id="seq_id" name="seq_id" value="${seq_id}" />
<input type="hidden" id="p_user_name" name="p_user_name" value="${user_name}" />
<input type="hidden" id="loginUser" name="loginUser" value="${loginUser.seq_id}" />
<input type="hidden" id="p_icui_seq_id" name="p_icui_seq_id" value="${icui_seq_id}" />
<input type="hidden" id="p_content" name="p_content" value="" />
<div class="container-fluid">
	<div style="float: right; margin: 0px 0px 4px 0">
		<button type="button" id="btnSave" class="btn btn-primary btn-sm" >저장</button>
		<button type="button" id="btnClose" class="btn btn-primary btn-sm" >닫기</button>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="10%"/>
			<col width="*"/>
			<tbody>
				<tr>
					<th style="font-size: 13px; font-weight: 100;">작성자</th>
					<td>${user_name}
					    <input type="hidden" class="common" id="p_login_id" name="p_login_id" value="${user_name}" />
					</td>
				</tr>

				<c:if test="${seq_id eq null}">
					<tr>	
						<th style="font-size: 13px; font-weight: 100;">해당년도</th>
						<td>
							<select id="p_year" name="p_year"  style="width:80px; font-size: 13px; font-weight: 100;">
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${today}" pattern="yyyy" var="start"/>
								<option value="<c:out value="${start - 1}" />"><c:out value="${start - 1}" /></option> 
								<c:forEach begin="0" end="1" var="idx" step="1">
									<option value="<c:out value="${start + idx}"/>" <c:if test="${start + idx eq year}">selected</c:if> ><c:out value="${start + idx}" /></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>	
						<th style="font-size: 13px; font-weight: 100;">월/차수</th>
						<td>
							<select id="p_month" name="p_month" style="width:80px; font-size: 13px; font-weight: 100;">
								<option value="">선택</option>
								<c:forEach begin="1" end="12" var="idx" step="1">
									<option value="<c:out value="${idx}"/>" <c:if test="${idx eq month}">selected</c:if> ><c:out value="${idx}" />월</option>
								</c:forEach>
							</select>
							<select id="p_chasu" name="p_chasu"  style="width:80px; font-size: 13px; font-weight: 100;">
								<option value="">선택</option>
								<c:forEach begin="1" end="5" var="idx" step="1">
									<option value="<c:out value="${idx}"/>" <c:if test="${idx eq chasu}">selected</c:if> ><c:out value="${idx}" />주차</option>
								</c:forEach>
							</select>
						</td>
					</tr>	
				</c:if>
				
				<c:if test="${seq_id ne null}">
					<tr>	
						<th style="font-size: 13px; font-weight: 100;">해당년도</th>
						<td>${year}년도
							<input type="hidden" class="common" id="p_year" name="p_year" value="${year}" />
						</td>						
					</tr>
					<tr>	
						<th style="font-size: 13px; font-weight: 100;">월/차수</th>
						<td>${month}월 / ${chasu}주차
							<input type="hidden" class="common" id="p_month" name="p_month" value="${month}" />
							<input type="hidden" class="common" id="p_chasu" name="p_chasu" value="${chasu}" />
						</td>					
					</tr>	
				</c:if>

				<tr>	
					<th style="font-size: 13px; font-weight: 100;">실적내용</th>
					<td>
						<textarea name="ckeditor" id="ckeditor"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</form>
<!-- /.container-fluid-->
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script type="text/javascript" src="/js/commonDateUtil.js"></script>
<script type="text/javascript" src="/js/jqueryAjax.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

var date = new Date(); 

$(function(){
    
    CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'400px',
        filebrowserImageUploadUrl: '/community/imageUpload.do', //여기 경로로 파일을 전달하여 업로드 시킨다.
    });
     
     
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
      
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    
});

$(document).ready(function(){
	
	// Insert Text into CKEDITOR
	CKEDITOR.instances.ckeditor.setData();  //  에디터에 내용 초기화(비우기)
	setTimeout(function() {
		CKEDITOR.instances.ckeditor.document.getBody().setHtml('${contents}');
		// html 코드를 정상적으로 에디터에 추가하기 위한 방법
	}, 1000);
	
	// 에디터 비활성화
	//CKEDITOR.config.readOnly = true;
	// 에디터 툴바삭제
	//CKEDITOR.config.removePlugins = 'toolbar';
	
	if($("#loginUser").val() != $("#p_icui_seq_id").val()) {
		$('#btnSave').attr('disabled',true);
	}
	
	//저장버튼
	$( "#btnSave" ).click( function() {
		fn_save();
	});
	
	$("#btnClose").click(function() {
		self.close();
	});
	
});

function fn_save() {
	
	var args = window.dialogArguments;
	
	if(CKEDITOR.instances.ckeditor.getData().length < 1){
		alert("내용을 입력해 주세요.");
		return;
	}
	
	var contents = CKEDITOR.instances.ckeditor.getData().replace(/(\r\n|\n|\r)/gm,'');
	
	$("#p_content").val(contents);
	
	var url = "dlm.weekResultMgr.saveWeekManage.do";
	var formData = fn_getFormData('#application_form');

	if ( confirm( '저장 하시겠습니까?' ) != 0 ) {
		$.post( url, formData, function( data ) {
			alert(data.resultMsg);
			if ( data.result == 'success' ) {
				args.fn_search();
				self.close();
			}
		}, "json" ).error( function () {
			alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
		} );
	}
	
}

</script>
