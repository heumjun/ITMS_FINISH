<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/ui.jqgrid.css" type="text/css" />
<link rel="stylesheet" href="/css/ui.jqgrid.custom.css" type="text/css" />
<link rel="stylesheet" href="/css/mdb.min.css" type="text/css" />

<div class="container-fluid">
    <%-- <div class="card mb-3">
        <div class="card-header">
            <i class="fa fa-area-chart"></i> Area Chart Example
        </div>
        <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
    </div> --%>
    <div class="row">
    
        <div class="col-lg-8" style="padding-left : 30px;">
        
        	<!-- <div class="card mb-3">
            	<div class="card-header">
                	<i class="fa fa-newspaper-o"></i> 그림이나 감상합시다.
                </div>
            </div>
        
        	<div id="video-carousel-example" class="carousel slide carousel-fade" data-ride="carousel" style="width: 100%;">
			    Indicators
			    <ol class="carousel-indicators">
			        <li data-target="#video-carousel-example" data-slide-to="0" class="active"></li>
			        <li data-target="#video-carousel-example" data-slide-to="1"></li>
			        <li data-target="#video-carousel-example" data-slide-to="2"></li>
			    </ol>
			    /.Indicators 
			    Slides
			    <div class="carousel-inner" role="listbox">
			        <div class="carousel-item active">
			            <video class="video-fluid" autoplay loop>
			                <source src="https://mdbootstrap.com/img/video/Tropical.mp4" type="video/mp4" />
			            </video>
			        </div>
			        <div class="carousel-item">
			            <video class="video-fluid" autoplay loop>
			                <source src="https://mdbootstrap.com/img/video/forest.mp4" type="video/mp4" />
			            </video>
			        </div>
			        <div class="carousel-item">
			            <video class="video-fluid" autoplay loop>
			                <source src="https://mdbootstrap.com/img/video/Agua-natural.mp4" type="video/mp4" />
			                <source src="C:\\test.mp4" type="video/mp4" />
			            </video>
			        </div>
			    </div>
			    /.Slides
			    Controls
			    <a class="carousel-control-prev" href="#video-carousel-example" role="button" data-slide="prev">
			        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			    </a>
			    <a class="carousel-control-next" href="#video-carousel-example" role="button" data-slide="next">
			        <span class="carousel-control-next-icon" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			    </a>
			    /.Controls
			</div>
			Carousel Wrapper -->
        
            <div class="card mb-3">
            	<div class="card-header">
                	<i class="fa fa-newspaper-o"></i> 사용자별 휴가사용 백분율
                </div>
            </div>
            <div class="card-columns">
                <canvas id="barChart"></canvas>
            </div>
            <!-- /Card Columns-->
        </div>
        
        <div class="col-lg-4">
            
            <!-- Example Notifications Card-->
            <c:if test="${fn:length(noticeList) > 0}">
	            <div class="card mb-3">
	                <div class="card-header">
	                    <i class="fa fa-bell-o"></i> 공지사항
	                </div>
	                <div class="list-group list-group-flush small">
	                	<c:forEach var="item" items="${noticeList}" varStatus="status">
	                		<a class="list-group-item list-group-item-action" href="javascript:noticeClick('${item.seq_id}');">
		                        <div class="media">
		                            <!-- <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/45x45" alt=""> -->
		                            <div class="media-body">
		                            	<!-- new 이미지 -->
		                            	<c:if test ="${item.new_img eq 'Y'}"><img src="/images/icon_new.gif"> </c:if>  
		                                <!-- new 이미지 -->
		                                ${item.title }
		                                <div class="text-muted smaller">${item.last_update_date }</div>
		                            </div>
		                        </div>
		                    </a>
	                	</c:forEach>
	                    <a class="list-group-item list-group-item-action" href="javascript:parent.addTab('','infoSharing.noticeMgr.noticeMgr.do?up_link=infoSharing/noticeMgr','');">공지사항 더보기...</a>
	                </div>
	            </div> <!-- //공지사항 -->
	        </c:if>   
	        
	        <c:if test="${fn:length(boardList) > 0}">
	            <div class="card mb-3">
	                <div class="card-header">
	                    <i class="fa fa-bell-o"></i> 게시판
	                </div>
	                <div class="list-group list-group-flush small">
	                	<c:forEach var="item" items="${boardList}" varStatus="status">
	                		<a class="list-group-item list-group-item-action" href="javascript:boardClick('${item.seq_id}');">
		                        <div class="media">
		                            <!-- <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/45x45" alt=""> -->
		                            <div class="media-body">
		                            	<!-- new 이미지 -->
		                            	<c:if test ="${item.new_img eq 'Y'}"><img src="/images/icon_new.gif"> </c:if>  
		                                <!-- new 이미지 -->
		                                ${item.title }
		                                <div class="text-muted smaller">${item.last_update_date }</div>
		                            </div>
		                        </div>
		                    </a>
	                	</c:forEach>
	                    <a class="list-group-item list-group-item-action" href="javascript:parent.addTab('','infoSharing.boardMgr.boardMgr.do?up_link=infoSharing/boardMgr','');">게시판 더보기...</a>
	                </div>
	            </div> <!-- //게시판 -->
	        </c:if> 
            
            <c:if test="${fn:length(refRoomList) > 0}">
	            <div class="card mb-3">
	                <div class="card-header">
	                    <i class="fa fa-file-o"></i> 자료실
	                </div>
	                <div class="list-group list-group-flush small">
	                	<c:forEach var="item" items="${refRoomList}" varStatus="status">
	                		<a class="list-group-item list-group-item-action" href="javascript:refRoomClick('${item.seq_id}');">
		                        <div class="media">
		                            <!-- <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/45x45" alt=""> -->
		                            <div class="media-body">
		                            	<!-- new 이미지 -->
										<c:if test ="${item.new_img eq 'Y'}"><img src="/images/icon_new.gif"> </c:if>  
										<!-- new 이미지 -->
		                                ${item.title }
		                                <div class="text-muted smaller">${item.last_update_date }</div>
		                            </div>
		                        </div>
		                    </a>
	                	</c:forEach>
	                    <a class="list-group-item list-group-item-action" href="javascript:parent.addTab('','infoSharing.referRoomMgr.referRoomMgr.do?up_link=infoSharing/referRoomMgr','');">자료실 더보기...</a>
	                </div>
	            </div> <!-- //자료실 -->
            </c:if>
            
            <!-- Example Pie Chart Card-->
            <%-- <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-pie-chart"></i> 도오넛
                </div>
                <div class="list-group list-group-flush small">
                    <canvas id="doughnutChart" width="100%"></canvas>
                </div>
            </div> --%>
            
        </div>
    </div>
</div>
<!-- /.container-fluid-->
<!-- Bootstrap core JavaScript-->
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/js/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/js/sb-admin.min.js"></script>
<script src="/js/mdb.min.js"></script>
<!-- Custom scripts for this page-->
<script type="text/javascript" src="/js/commonDateUtil.js" charset='utf-8'></script>

<!-- <script src="/js/chart/Chart.min.js"></script>
<script src="/js/chart/sb-admin-charts.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function(){
	
	//doughnut
	/* var ctxD = document.getElementById("doughnutChart").getContext('2d');
	var myLineChart = new Chart(ctxD, {
	    type: 'doughnut',
	    data: {
	        labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
	        datasets: [
	            {
	                data: [300, 50, 100, 40, 120],
	                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
	                hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
	            }
	        ]
	    },
	    options: {
	        responsive: true
	    }
	}); */
	
	//bar
	var ctxB = document.getElementById("barChart").getContext('2d');
	var myBarChart = new Chart(ctxB, {
	    type: 'bar',
	    data: {
	        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월"],
	        datasets: [{
	            label: '사용자별 휴가사용 백분율',
	            data: [12, 19, 3, 5, 2, 3, 5, 42, 7, 5],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)'
	                /* 'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)' */
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)'
	                /* 'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)' */
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	$.ajax({
		url:"temp.tempSecondMgr.getChartData.do",
		cache:false,
		//data: fn_getFormData( "#application_form" ),
		dataType:"json",
		type:'POST',
		success:function(jsonObj){
			
			// https://www.chartjs.org/docs/latest/ << 참조하세요.
			$.each(jsonObj, function(i, data) {
				myBarChart.data.labels[i] = this.user_name;
				myBarChart.data.datasets[0].data[i] = this.percent;
			});
		    myBarChart.update();
		    
		},
		error:function(jxhr,textStatus)
		{ //에러인경우 Json Text 를  Json Object 변경해 보낸다.
			alert(jxhr.responseText);
		}  
	});
});

function noticeClick(seq_id) {
	var sUrl = "infoSharing.noticeMgr.popUpNoticeRegiste.do?p_seq_id=" + seq_id;
	window.showModalDialog( sUrl, window, "dialogWidth:1000px; dialogHeight:800px; center:on; scroll:off; status:off");
}

function boardClick(seq_id) {
	parent.addTab('','infoSharing.boardMgr.boardMgrView.do?up_link=infoSharing/boardMgr&p_seq_id=' + seq_id ,'');
}

function refRoomClick(seq_id) {
	
	var sUrl = "infoSharing.referRoomMgr.popUpReferRoomUpdate.do?p_seq_id=" + seq_id + "&p_disabled=Y";
	
    var screenW = screen.availWidth;  // 스크린 가로사이즈
	var screenH = screen.availHeight; // 스크린 세로사이즈
	var popW = 700; // 띄울창의 가로사이즈
	var popH = 700; // 띄울창의 세로사이즈
	var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
	var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
	
	popupWin = window.open(sUrl, window, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no,'
		    + 'width='+popW+', height='+popH+', top='+posT+', left='+posL);
	
	setTimeout(function(){
		popupWin.focus();
	 }, 200);
}

</script>

