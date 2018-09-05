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

textarea
{
  border:1px solid #999999;
  width:100%;
  margin:5px 0;
  padding:3px;
}

</style>
<input type="hidden" id="board_id" name="board_id" value="${seq_id}" />
<input type="hidden" id="icui_seq_id" name="icui_seq_id" value="${icui_seq_id}" />
<input type="hidden" id="loginSeq" name="loginSeq" value="${loginUser.seq_id}" />
<div class="container-fluid">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">상세보기</a></li>
	</ol>
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
        	<td width="50%" style="font-weight: 700;">
                ${title}
            </td>
            <td width="15%">
                ${user_name}
            </td>
            <td width="15%">
                ${last_update_date}
            </td>
            <td width="20%" colspan="2" align="right">
                <button id="modify" name="modify" class="btn btn-primary btn-sm">수정</button>
                <button id="delete" name="delete" class="btn btn-danger btn-sm">삭제</button>
            </td>
        </tr>
        <tr height="300px;">
            <td colspan="4" valign="top">
                ${contents}
            </td>
        </tr>
    </table>
    
    <div id="replyDiv">
	    <table class="table table-bordered" id="reply_area" width="100%" cellspacing="0">
	        <!-- <tr reply_type="all">
	            <td colspan="4"></td>
	        </tr> -->
	        <!-- 댓글이 들어갈 공간 -->
	        <c:forEach var="replyList" items="${replyList}" varStatus="status">
	            <tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
	                <td width="870px">
	                    <c:forEach var="i" begin="1" varStatus="status" end="${replyList.depth }">
	                    	&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						<c:if test="${replyList.depth == '0'}"> <i class="fa fa-comment-o"></i> </c:if>
	                    <c:if test="${replyList.depth != '0'}"> <i class="fa fa-arrow-right"></i> </c:if>
	                    ${replyList.reply_content}
	                </td>
	                <td width="100px">
	                    ${replyList.reply_writer}
	                </td>
	                <td width="100px">
	                    <input type="password" id="reply_password_${replyList.seq_id}" class="common" style="width:100px;" maxlength="10" placeholder="패스워드"/>
	                </td>
	                <td>
	                    <button name="reply_del" reply_id="${replyList.seq_id}">삭제</button>
	                    <%-- <c:if test="${replyList.depth != '1'}"> --%>
	                        <button name="reply_reply" reply_id="${replyList.seq_id}" depth="${replyList.depth}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
	                    <%-- </c:if> --%>
	                </td>
	            </tr>
	        </c:forEach>
	    </table>
    </div>
	    
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
            <td width="500px">
                이름: <input type="text" id="reply_writer" name="reply_writer" class="common" style="width:170px;" maxlength="10" placeholder="작성자"/>
            </td>
            <td>
            	패스워드: <input type="password" id="reply_password" name="reply_password" class="common" style="width:170px;" maxlength="10" placeholder="패스워드"/>
            </td>
            <td>
            	<div class="button endbox">
            		<button id="reply_save" name="reply_save" class="btn btn-primary btn-sm">댓글 등록</button>
            	</div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
            </td>
        </tr>
    </table>
    <div class="button endbox">
		<button type="button" id="btnList" class="btn btn-primary btn-sm" >게시판</button>
	</div>
</div>
</form>
<!-- /.container-fluid-->
<!-- Bootstrap core JavaScript-->
<script src="/js/jquery-1.11.0.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	if( $("#loginSeq").val() == $("#icui_seq_id").val() ) {
		$("#modify").show();
		$("#delete").show();
	} else {
		$("#modify").hide();
		$("#delete").hide();
	}
	
	 //글수정
    $("#modify").click(function() {
    	location.href = "infoSharing.boardMgr.boardMgrEdit.do?p_seq_id="+$("#board_id").val();
    });
	 
  	//글 삭제
    $("#delete").click(function(){
         
        //ajax로 패스워드 검수 후 수정 페이지로 포워딩
        //값 셋팅
        var objParams = {
                p_seq_id       : $("#board_id").val()  
        };
                             
        //ajax 호출
        $.ajax({
            url         :   "infoSharing.boardMgr.boardDelete.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post",
            async       :   false, //동기: false, 비동기: ture
            data        :   objParams,
            success     :   function(data){
            	alert(data.resultMsg);
    			if ( data.result == 'success' ) {
    				location.href = "infoSharing.boardMgr.boardMgr.do";
    			}
            },
            error       :   function(request, status, error){
            	alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
            }
        });
         
    });
	
  	// 게시글 목록
	$("#btnList").click(function() {
	    location.href = "infoSharing.boardMgr.boardMgr.do";
	});
	
	//댓글 저장
    $("#reply_save").click(function(){
         
        //널 검사
        if($("#reply_writer").val().trim() == ""){
            alert("이름을 입력하세요.");
            $("#reply_writer").focus();
            return false;
        }
         
        if($("#reply_password").val().trim() == ""){
            alert("패스워드를 입력하세요.");
            $("#reply_password").focus();
            return false;
        }
         
        if($("#reply_content").val().trim() == ""){
            alert("내용을 입력하세요.");
            $("#reply_content").focus();
            return false;
        }
         
        var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
        
      	//값 셋팅
        var objParams = {
                board_id        : $("#board_id").val(),
                parent_id       : "0",  
                depth           : "0",
                reply_writer    : $("#reply_writer").val(),
                reply_password  : $("#reply_password").val(),
                reply_content   : reply_content
        };
        
        var reply_id;
         
        //ajax 호출
        $.ajax({
            url         :   "infoSharing.boardMgr.boardReplySave.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post",
            async       :   false, //동기: false, 비동기: ture
            data        :   objParams,
            success     :   function(data){
            	alert(data.resultMsg);
    			if ( data.result == 'success' ) {
    				reply_id = data.reply_id;
    				depth = data.depth;
    			}
            },
            error       :   function(request, status, error){
            	alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
            }
        });
        
        /* var reply_area = $("#reply_area");
         
        var reply = 
            '<tr reply_type="main">'+
            '   <td width="870px"> <i class="fa fa-comment-o"></i> '+ 
            reply_content+
            '   </td>'+
            '   <td width="100px">'+
            $("#reply_writer").val()+
            '   </td>'+
            '   <td width="100px">'+
            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
            '   </td>'+
            '   <td>'+
            '       <button name="reply_del" reply_id="'+reply_id+'">삭제</button>      '+
            '       <button name="reply_reply" reply_id="'+reply_id+'" depth="'+depth+'">댓글</button>'+
            '   </td>'+
            '</tr>';
             
         if($('#reply_area').contents().size()==0){
             $('#reply_area').append(reply);
         }else{
             $('#reply_area tr:last').after(reply);
         } */

        //댓글 초기화
        $("#reply_writer").val("");
        $("#reply_password").val("");
        $("#reply_content").val("");
        
        location.reload();
         
    });
	
  	//댓글 삭제
    $("button[name='reply_del']").click(function(){
    	
        var check = false;
        var reply_id = $(this).attr("reply_id");
        var reply_password = "reply_password_"+reply_id;
         
        if($("#"+reply_password).val().trim() == ""){
            alert("패스워드을 입력하세요.");
            $("#"+reply_password).focus();
            return false;
        }
         
        //패스워드와 아이디를 넘겨 삭제를 한다.
        //값 셋팅
        var objParams = {
                reply_password  : $("#"+reply_password).val(),
                reply_id        : reply_id
        };
        
        //ajax 호출
        $.ajax({
            url         :   "infoSharing.boardMgr.boardReplyDelete.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post",
            async       :   false, //동기: false, 비동기: ture
            data        :   objParams,
            success     :   function(data){
            	
            	alert(data.resultMsg);
            	if ( data.result == 'success' ) {
            		check = true;
            		var currentLocation = window.location.href;
                    $("#replyDiv").load(currentLocation + " #reply_area");
    			}
            },
            error       :   function(request, status, error){
            	alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
            }
        });
         
        if(check){
            // 삭제하면서 하위 댓글도 삭제
            // 댓글의 다음
            var prevTr = $(this).parent().parent().next(); 
             
          	// 댓글의 다음이 sub면 계속 넘어감
            while(prevTr.attr("reply_type")=="sub"){
                prevTr = prevTr.next();
                prevTr.prev().remove();
            }
             
            // 마지막 리플 처리
            if(prevTr.attr("reply_type") == undefined){
                prevTr = $(this).parent().parent();
                prevTr.remove();
            }
             
            $(this).parent().parent().remove(); 
            
        }
        
        location.reload();
        
    });
	
	
  	//대댓글 입력창
    $(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
		
        $("#reply_add").remove();
         
        var reply_id = $(this).attr("reply_id");
        var depth = ($(this).attr("depth")*1) + 1;
        var last_check = false;//마지막 tr 체크
		
        //입력받는 창 등록
         var replyEditor = 
            '<tr id="reply_add" class="reply_reply">'+
            '   <td width="870px">'+
            '       <textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
            '   </td>'+
            '   <td width="100px">'+
            '       <input type="text" name="reply_reply_writer" style="width:100%;" maxlength="10" placeholder="작성자"/>'+
            '   </td>'+
            '   <td width="100px">'+
            '       <input type="password" name="reply_reply_password" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
            '   </td>'+
            '   <td>'+
            '       <button name="reply_reply_save" reply_id="'+reply_id+'" depth="'+depth+'">등록</button>'+
            '       <button name="reply_reply_cancel">취소</button>'+
            '   </td>'+
            '</tr>';
             
        var prevTr = $(this).parent().parent().next();
         
        //부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
        //마지막 리플 처리
        if(prevTr.attr("reply_type") == 'undefined'){
            prevTr = $(this).parent().parent();
        }else{
            /* while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
            	alert(1);
                prevTr = prevTr.next();
            } */
            if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
                last_check = true;
            }else{
                prevTr = prevTr.prev();
            }
             
        }
         
        if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
            $('#reply_area tr:last').after(replyEditor);    
        }else{
            prevTr.after(replyEditor);
        }
        
    });
  	
  	//대댓글 등록
    $(document).on("click","button[name='reply_reply_save']",function(){
                             
        var reply_reply_writer = $("input[name='reply_reply_writer']");
        var reply_reply_password = $("input[name='reply_reply_password']");
        var reply_reply_content = $("textarea[name='reply_reply_content']");
        var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
         
        //널 검사
        if(reply_reply_writer.val().trim() == ""){
            alert("이름을 입력하세요.");
            reply_reply_writer.focus();
            return false;
        }
         
        if(reply_reply_password.val().trim() == ""){
            alert("패스워드를 입력하세요.");
            reply_reply_password.focus();
            return false;
        }
         
        if(reply_reply_content.val().trim() == ""){
            alert("내용을 입력하세요.");
            reply_reply_content.focus();
            return false;
        }
         
        //값 셋팅
        var objParams = {
                board_id        : $("#board_id").val(),
                parent_id       : $(this).attr("reply_id"), 
                depth           : $(this).attr("depth"),
                reply_writer    : reply_reply_writer.val(),
                reply_password  : reply_reply_password.val(),
                reply_content   : reply_reply_content_val
        };
         
        var reply_id;
         
        //ajax 호출
        $.ajax({
            url         :   "infoSharing.boardMgr.boardReplySave.do",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post",
            async       :   false, //동기: false, 비동기: ture
            data        :   objParams,
            success     :   function(data){
                alert(data.resultMsg);
            	if ( data.result == 'success' ) {
            		reply_id = data.reply_id;
            		depth = data.depth;
    			}
            },
            error       :   function(request, status, error){
            	alert( "시스템 오류입니다.\n전산담당자에게 문의해주세요." );
            }
        });
        
        /* var empty = '';
        for(i=0; i< (depth*1)+1; i++ ) {
        	empty += "&nbsp;&nbsp;&nbsp;&nbsp;"
        }
        empty += ' <i class="fa fa-arrow-right"></i> ';
         
        var reply = 
            '<tr reply_type="sub">'+
            '   <td width="870px">'+
            empty + reply_reply_content_val+
            '   </td>'+
            '   <td width="100px">'+
            reply_reply_writer.val()+
            '   </td>'+
            '   <td width="100px">'+
            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
            '   </td>'+
            '   <td>'+
            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
            '       <button name="reply_reply" reply_id="'+reply_id+'" depth="'+depth+'">댓글</button>'+
            '   </td>'+
            '</tr>';
             
        var prevTr = $(this).parent().parent().prev();
         
        prevTr.after(reply);

        $("#reply_add").remove(); */
        
        location.reload();

    });
  	
  	//대댓글 입력창 취소
    $(document).on("click","button[name='reply_reply_cancel']",function(){
        $("#reply_add").remove();
    });
	
});
</script>
