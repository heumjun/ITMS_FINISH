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

.table thead th {
	vertical-align : top;
}

input[type=checkbox], button 
{
    vertical-align: middle;
}




</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 팝업</title>
<script>
   function notice_setCookie( name, value, expiredays ) { 
            var todayDate = new Date(); 
             todayDate.setDate( todayDate.getDate() + expiredays ); 
             document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
    } 
    function notice_closeWin() 
    {  
             if ( document.forms[0].Notice.checked )  
                     notice_setCookie( "Notice_${notice.seq}", "done" , 1); // 1일=하루동안 이 창을 열지 않음 
             self.close();  
    } 
    function na_call(str){  eval(str);} 
    
    function fileView(seq ) {
		var attURL = "noticeFileView.do?";
	    attURL += "p_seq="+seq;
	
	    var sProperties = 'dialogHeight:340px;dialogWidth:680px;scroll=no;center:yes;resizable=no;status=no;';
	
	    //window.showModalDialog(attURL,"",sProperties);
	    window.open(attURL,"",sProperties);
	    //window.open(attURL,"","width=400, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no");
	}
</script>
</head>
<body>
<form name="form1">
<div class="container-fluid">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">${notice.title}</a></li>
	</ol>
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<col width="85px">
			<col width="240px">
			<col width="85px">
			<col width="240px">
			<thead>
				<%-- <tr>
					<th><strong>제목</strong></th>
					<td class="end" style="text-align: left;" colspan="3">${notice.title}</td>
				</tr> --%>
				<tr>
					<th align="right" valign="top"><strong>내용</strong></th>
					<td class="end" style="text-align: left;" colspan="3"><textarea cols="1" rows="20"
							readonly="readonly" style="border: 0px;">${notice.contents}</textarea></td>
				</tr>
				
				<tr>
					<th><strong>등록자</strong></th>
					<td>${notice.user_name}</td>
					<th><strong>등록일자</strong></th>
					<td class="end" >${notice.create_date}</td>
				</tr>
			</thead>
		</table>
		<div style="float: right; font-size: 11px;">
			<input name="Notice" onclick="notice_closeWin()" type="checkbox">  하루동안 이 창을 열지 않음 <input type="button" value="닫기" onclick="window.close()">
		</div>
	</div>
</div>
</form>
</body>
</html>
