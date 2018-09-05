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

</style>
<form id="application_form" name="application_form" >
<div class="container-fluid">
	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">MDBootstrap Chart Test</a></li>
	</ol>
	
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<col width="*"/>
		<tbody>
			<tr>
				<td>
					<div class="button endbox">
						<button type="button" id="btnSearch" class="btn btn-primary btn-sm" >조회</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="row">
        <div class="col-lg-12" style="padding-left : 30px;">
        	<div class="card-columns">
				<canvas id="barChart" height="100%"></canvas>
			</div>
        </div>
	</div>
</div>
</form>
<!-- /.container-fluid-->
<!-- Bootstrap core JavaScript-->
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/sb-admin.min.js"></script>
<script src="/js/mdb.min.js"></script>

<script type="text/javascript">
//bar
var ctxB = document.getElementById("barChart").getContext('2d');
	
var myBarChart = new Chart(ctxB, {
    type: 'bar',
    data: {
        //labels: ${dataLabel},
        labels: ['aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa','aaa'],
        datasets: [{
            label: '사용자별 휴가 사용 백분율',
            //data: ${dataValue},
            data: [20, 20, 20, 20, 20, 20, 20, 20, 20, 20],
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
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
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
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
    
});

$(document).ready(function(){
	// Search 버튼 클릭 시 Ajax로 리스트를 받아 넣는다.
	$("#btnSearch").click(function(){
		fn_search();
	});
	
});

function fn_search() {
	
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
}
</script>
