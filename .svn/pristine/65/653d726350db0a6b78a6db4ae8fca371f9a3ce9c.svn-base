<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Report Design</title>
</head>
<body onload="javascript:rd_onload();">
<script type="text/javaScript" language="javascript" defer="defer">
function rd_onload() {
	
	Rdviewer.AutoAdjust = 2;
	Rdviewer.ZoomRatio = 100; 
	//Rdviewer.FileOpen("http://localhost:8080/reportTemplate/test1.mrd", "/rf [http://localhost:8080/reportTemplate/test1.xml] /rpost [] /rv");
	
	Rdviewer.FileOpen(location.origin + "/reportTemplate/test1.mrd", "/rf [" + location.origin + "/reportDegisnTest.do]");
}
</script>
<script src='/reportDesign/rdviewer.js'></script>
</body>
</html>
