<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ITMS</title>
<!-- Bootstrap core CSS-->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/css/font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="/css/sb-admin.css" rel="stylesheet">
<style type="text/css">
.letter{
  display: inline-block;
  font-weight: 900;
  font-size: 1em;
  margin: 0.2em;
  position: relative;
  color: #00B4F1;
  transform-style: preserve-3d;
  perspective: 600;
  z-index: 1;
}
</style>
</head>

<body class="fixed-nav bg-light" id="page-top">
<form id="application_form" name="application_form" method="post">
	
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav">
		<a class="navbar-brand" href="javascript:addTab('mainFrame','main.mainScreen.layoutMainContents.do?up_link=${up_link}','menu');"><span class="letter" data-letter="T">ITMS</span></a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" style="overflow:auto;" id="menuAccordion">
			
				<c:forEach var="item" items="${treeMenuList}" varStatus="status">
					<c:choose>
						<c:when test="${item.lev == 0}">
							<li class="nav-item" data-toggle="tooltip" data-placement="right" title="${item.menu_name}">
							
								<c:choose>
									<c:when test="${item.leaf == 0 }">
										<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapse${item.menu_id}" data-parent="#menuAccordion"> 
											<i class="fa fa-fw fa-bars"></i> <span class="nav-link-text">${item.menu_name}</span>
										</a>
										
										<ul class="sidenav-second-level collapse" id="collapse${item.menu_id}">
										<c:forEach var="item1" items="${treeMenuList}" varStatus="status">
											<c:if test="${item1.lev == 1 and item1.parent_menu_id == item.menu_id}">
												<li>
													
													<c:choose>
														<c:when test="${item1.leaf == 0 }">
															<a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapse${item1.menu_id}"><i class="fa fa-fw fa-dot-circle-o"></i> ${item1.menu_name}</a>
															<ul class="sidenav-third-level collapse" id="collapse${item1.menu_id}">
															<c:forEach var="item2" items="${treeMenuList}" varStatus="status">
																<c:if test="${item2.lev == 2 and item2.parent_menu_id == item1.menu_id}">
																	<li><a href="javascript:addTab('${item2.menu_name}','${item2.menu_url}?up_link=${item2.up_link}','${item1.menu_name}');">${item2.menu_name}</a></li>
																</c:if>
															</c:forEach>
															</ul>
														</c:when>
														<c:otherwise>
															<a href="javascript:addTab('${item1.menu_name}','${item1.menu_url}?up_link=${item1.up_link}','${item.menu_name}');"><i class="fa fa-fw fa-dot-circle-o"></i> ${item1.menu_name}</a>
														</c:otherwise>
													</c:choose>
													
												</li>
											</c:if>
										</c:forEach>
										</ul>
									
									</c:when>
									<c:otherwise>
										<a href="javascript:addTab('${item.menu_name}','${item.menu_url}?up_link=${item.up_link}','대메뉴');"> 
											<i class="fa fa-fw fa-bars"></i> <span class="nav-link-text">${item.menu_name}</span>
										</a>
									</c:otherwise>
								</c:choose>	
								
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
				
			</ul>
			
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="javascript:updateUserInfo();">
						<i class="fa fa-fw fa-user-o"></i> ${loginUser.name}(${loginUser.auth_code_name})님 환영합니다.
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="modal" data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>로그아웃</a>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="content-wrapper">
		<%-- <iframe src="layoutMainContents.do?up_link=${up_link}" id="main" name="main" scrolling="no"></iframe> --%>
		<iframe id="iframeid" src="main.mainScreen.layoutMainContents.do?up_link=${up_link}" width="100%" height="100%" frameborder="0"></iframe>
	</div>
	
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5> -->
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">현재 세션을 종료할 준비가 되었으면 <br/>아래의 "로그아웃"을 선택하십시오.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="javascript:logout();">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- Bootstrap core JavaScript-->
<script src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/commonGridUtil.js" charset='utf-8'></script>
<script src="/js/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/js/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->

<!-- Page level plugin JavaScript-->
<script src="/js/datatables/jquery.dataTables.js"></script>
<script src="/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/js/sb-admin-datatables.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	var formData = fn_getFormData('#application_form');
	
	var left = 10;
	var top = (screen.height/2)-(700/2);
	
	<c:forEach var="item" items="${popupList}" varStatus="status" >

		if("${status.index}" != 0) {
				left += 300;
		}
		if ( notice_getCookie( "Notice_${item.seq}" ) != "done" ) { 
		       window.open('eventPopup.do?seq=${item.seq}','Notice_${item.seq}','toolbar=no, location=no,directories=no, status=no, menubar=no, scrollbars=no, resizable=no,copyhistory=no,'
		    		    + 'width=600, height=430, top='+top+', left='+left);
		}
	</c:forEach>
	
});

//팝업 
function notice_getCookie( name ) { 
   var nameOfCookie = name + "="; 
   var x = 0; 
   while ( x <= document.cookie.length ) { 
              var y = (x+nameOfCookie.length); 
              if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
                         if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                                 endOfCookie = document.cookie.length; 
                         return unescape( document.cookie.substring( y, endOfCookie ) ); 
              } 
              x = document.cookie.indexOf( " ", x ) + 1; 
              if ( x == 0 ) 
                      break; 
   } 
   return ""; 
}

var dim = windowDimensions();
myIframe = $('#iframeid'); // changed the code to use jQuery
myIframe.height((dim[1]-80) + "px");

function windowDimensions() { // prototype/jQuery compatible
    var myWidth = 0, myHeight = 0;
    if( typeof( window.innerWidth ) == 'number' ) {
        //Non-IE or IE 9+ non-quirks
        myWidth = window.innerWidth;
        myHeight = window.innerHeight;
    } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
        //IE 6+ in 'standards compliant mode'
        myWidth = document.documentElement.clientWidth;
        myHeight = document.documentElement.clientHeight;
    } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
        //IE 5- (lol) compatible
        myWidth = document.body.clientWidth;
        myHeight = document.body.clientHeight;
    }
    if (myWidth < 1) myWidth = screen.width; // emergency fallback to prevent division by zero
    if (myHeight < 1) myHeight = screen.height; 
    return [myWidth,myHeight];
}

function addTab(title, url, upTitle) {
	document.getElementById("iframeid").src = url;
}

function updateUserInfo() {
	document.getElementById("iframeid").src = "userInfo.do";
}

function logout() {
	location.href = "logout.do";
}
</script>

</body>
</html>
