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
	height: 50px;
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

textarea
{
  border:1px solid #999999;
  width:100%;
  margin:5px 0;
  padding:3px;
}

</style>
<form id="application_form" name="application_form" >
<input type="hidden" id="seq_id" name="seq_id" value="${loginUser.seq_id}" />
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">회원정보</a></li>
	</ol>
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    	<col width="80">
		<col width="200">
		<col width="80">
		<col width="200">
		<col width="*"/>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">아이디</th>
			<td colspan="3">
		       ${loginUser.login_id }
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">이름</th>
			<td>
		       <input type="text" id="p_name" name="p_name" class="form-control" value="${loginUser.name}" />
		    </td>
		    <th style="font-size: 13px; font-weight: 100;">이메일</th>
			<td>
		       <input type="text" id="p_e_mail" name="p_e_mail" class="form-control" value="${loginUser.e_mail}" />
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">회사</th>
			<td>
		       <input type="text" id="p_company_name" name="p_company_name" class="form-control" value="${loginUser.company_name}" />
		    </td>
		    <th style="font-size: 13px; font-weight: 100;">부서</th>
			<td>
		       <input type="text" id="p_department" name="p_department" class="form-control" value="${loginUser.department}" />
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">직급</th>
			<td>
		       <input type="hidden" id="p_rank_code" name="p_rank_code" class="form-control" value="${loginUser.rank_code}" />
		       <select class="form-control" id="p_sel_rank" name="p_sel_rank"></select>
		    </td>
		    <th style="font-size: 13px; font-weight: 100;">담당업무</th>
			<td>
		       <input type="text" id="p_business_role" name="p_business_role" class="form-control" value="${loginUser.business_role}" />
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">연락처</th>
			<td>
		       <input type="text" id="p_phone1" name="p_phone1" class="form-control" value="${loginUser.phone1}" />
		    </td>
		    <th style="font-size: 13px; font-weight: 100;">회사연락처</th>
			<td>
		       <input type="text" id="p_tel" name="p_tel" class="form-control" value="${loginUser.tel}" />
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">주소</th>
			<td colspan="3">
		       <input type="text" id="p_home_address" name="p_home_address" class="form-control" value="${loginUser.home_address}" />
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">계정보호 질문</th>
			<td>
				<input type="hidden" id="p_question_code" name="p_question_code" class="form-control" value="${loginUser.question_code}" />
				<select class="form-control" id="p_sel_question" name="p_sel_question">
				</select>
		    </td>
			<th style="font-size: 13px; font-weight: 100;">계정보호 답변</th>
			<td>
		       <input type="text" id="p_answer" name="p_answer" class="form-control" value="${loginUser.answer}" />
		    </td>
		</tr>
		<tr>
			<th style="font-size: 13px; font-weight: 100;">기존 비밀번호</th>
			<td>
		       <input type="password" id="p_password" name="p_password" class="form-control" value="" />
		    </td>
		    <th style="font-size: 13px; font-weight: 100;">신규 비밀번호</th>
			<td>
		       <input type="password" id="p_new_password" name="p_new_password" class="form-control" value="" />
		    </td>
		</tr>
    </table>
    <div class="button endbox">
		<button type="button" id="btnModify" class="btn btn-primary btn-sm" >수정</button>
		<button type="button" id="btnCancel" class="btn btn-primary btn-sm" >취소</button>
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
<script type="text/javascript" src="/js/jqgrid/i18n/grid.locale-en.js" charset='utf-8'></script>
<script src="/js/jqueryAjax.js"></script>
<script src="/js/jquery.mask.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#p_phone1").mask("999-9999-9999");
	$("#p_tel").mask("999-9999-9999");
	
	// 계정보호 질문 리스트
	getAjaxHtml($("#p_sel_question"), "main.memberJoin.memberQuestionSelectBoxDataList.do?sb_type=not&p_query=getMemberQuestionList", null, null);
	
	// 직급 리스트
	getAjaxHtml($("#p_sel_rank"), "main.memberJoin.memberPositionSelectBoxDataList.do?sb_type=not&p_query=getMemberPositionList", null, null);
	
});

$(document).ready(function(){
	
	setTimeout(function(){
		$("#p_sel_question").val("${loginUser.question_code}").prop("selected", true);
	}, 500);
	
	setTimeout(function(){
		$("#p_sel_rank").val("${loginUser.rank_code}").prop("selected", true);
	}, 500);
	
	$("#btnCancel").click(function(){
		history.go(-1);
	});
	
	$("#btnModify").click(function(){
		
		var formData = fn_getFormData('#application_form');
        
      	//ajax 호출
        if ( confirm( '저장 하시겠습니까?' ) != 0 ) {
	        $.ajax({
	            url         :   "userInfoSave.do",
	            dataType    :   "json",
	            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	            type        :   "post",
	            data        :   formData,
	            success     :   function(data){
	            	alert(data.resultMsg);
	    			if ( data.result == 'success' ) {
	    				history.go(-1);
	    			} else {
	    				$("#p_password").focus();
	    			}
	            },
	            error       :   function(request, status, error){
	            	alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
	            }
	        });
        }
        
	});
});
</script>
