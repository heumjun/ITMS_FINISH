//일주일 단위로 초기 셋팅
function fn_weekDate( date_start, date_end ) {
	var url = 'selectWeekList.do';

	$.post( url, "", function( data ) {
		$( "#" + date_start ).val( data.created_date_start );
	  	$( "#" + date_end ).val( data.created_date_end );
	}, "json" );
}

function fn_toDate( to_date ) {
	var url = 'selectWeekList.do';

	$.post( url, "", function( data ) {
		$( "#" + to_date ).val( data.created_date_end );
	}, "json" );
}

function fn_addDate( to_date, chk_date, add_day ) {
	var url = 'selectAddDay.do?'+"add_day="+add_day;

	$.post( url, "", function( data ) {
		$( "#" + to_date ).val( data.add_date);
		$( "#" + chk_date ).val( data.add_date_val );
	}, "json" );
}

function fn_monthDate(date_start,date_end){
	var url = 'selectWeekList.do';
	$.post( url, "", function( data ) {
		$( "#" + date_start ).val( data.created_date_end );
		var to_date_ary = data.created_date_end.split("-");
		$( "#" + date_end ).val(to_date_ary[0]+"-"+to_date_ary[1]+"-"+( new Date( to_date_ary[0], to_date_ary[1], 0) ).getDate());
	}, "json" );
}

function fn_twoMonthDate(date_start,date_end){
	var url = 'selectWeekList.do';
	$.post( url, "", function( data ) {
		
		// 두달전 날짜
		var prevDate = new Date(new Date().setMonth(new Date().getMonth()-2)); 
		var prevMon = dateToYYYYMMDD(prevDate);
		$( "#" + date_start ).val( prevMon );
		$( "#" + date_end ).val( data.created_date_end );
	}, "json" );
}

function dateToYYYYMMDD(date) {
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

function pad(num) {
    num = num + '';
    return num.length < 2 ? '0' + num : num;
}

function fn_lastMonthDate(date_start,date_end){
	var to_date_ary = null; 
	if( $( "#" + date_start ).val() == ""){
		var date = new Date();
		var firstDayOfMonth = new Date( date.getFullYear(), date.getMonth() , 1 );
		var lastMonth = new Date ( firstDayOfMonth.setDate( firstDayOfMonth.getDate() -1 ) );
		var chan_val = lastMonth.getFullYear() + "-" + (lastMonth.getMonth()+1)+"-01";
	    to_date_ary = chan_val.split("-");
	}
	else {
		to_date_ary = $( "#" + date_start ).val().split("-");
	}
	$( "#" + date_start ).val( to_date_ary[0]+"-"+to_date_ary[1]+"-"+"01" );
	$( "#" + date_end ).val(to_date_ary[0]+"-"+to_date_ary[1]+"-"+( new Date( to_date_ary[0], to_date_ary[1], 0) ).getDate());
}

// 주말을 제외한 두 날짜의 일 계산
function calcDate(startDate, endDate) {
	
	var arr1 = startDate.split('-');
    var arr2 = endDate.split('-');
    
    var date1 = new Date(arr1[0], arr1[1]-1, arr1[2]);
    var date2 = new Date(arr2[0], arr2[1]-1, arr2[2]);

    var count = 0;

	while(true) {  
	
	    var temp_date = date1;
	    if(temp_date.getTime() > date2.getTime()) {
	        //console.log("count : " + count);
	        break;
	    } else {
	        var tmp = temp_date.getDay();
	        if(tmp == 0 || tmp == 6) {
	            // 주말
	            //console.log("주말");
	        } else {
	            // 평일
	            //console.log("평일");
	            count++;         
	        }
	        temp_date.setDate(date1.getDate() + 1); 
	    }
	}
	
	return count;

}


//2 helper functions - moment.js is 35K minified so overkill in my opinion
function pad(num) { 
	return ("0" + num).slice(-2); 
}

function formatDate(date) { 
	var d = new Date(date), dArr = [d.getFullYear(), pad(d.getMonth() + 1), pad(d.getDate())];
	return dArr.join('-');
}

function calculateDays(startDate,endDate) {
	
	var arr1 = startDate.split('-');
    var arr2 = endDate.split('-');
    
    var first = new Date(arr1[0], arr1[1]-1, arr1[2]);
    var last = new Date(arr2[0], arr2[1]-1, arr2[2]);
	
	var aDay = 24 * 60 * 60 * 1000,
	daysDiff = parseInt((last.getTime()-first.getTime())/aDay,10)+1;
	
	if (daysDiff>0) {  
		for (var i = first.getTime(), lst = last.getTime(); i <= lst; i += aDay) {
			var d = new Date(i);
			if (d.getDay() == 6 || d.getDay() == 0 || gon.holiday.indexOf(formatDate(d)) != -1) {
						daysDiff--;
			}
		}
	}
	return daysDiff;
}

//타이틀 new 이미지 추가 포멧
function titleFormatter(cellvalue, options, rowObject ) {
	var flag = rowObject.new_img;
	var mark = "";
	
	if(flag == 'Y'){
		mark = "<img src=\"/images/icon_new.gif\" border=\"0\" > "+cellvalue;
	}else{
		mark = cellvalue;
	}
	
	return mark;
}
