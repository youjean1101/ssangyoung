<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

</head>

<body>
<h1>기상청 날씨 api</h1>
<h2>종로 날씨</h2>
<p class="result">
<!--    20230310, 0600, -7입니다. -->
<script type="text/javascript">

				
		$.ajax({url:"https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=Y8NXiinHE%2BuTCEAgEYIO5cOB5tV%2BgfXgmeijWT2V4iC2M7e4IRfoArVxggmRtXYO9BFdxMNzqVey6gGXR79keA%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20230312&base_time=0500&nx=55&ny=127", 
			success:function(result){
				console.log(result);
				let item=result.response.body.items.item[3];
				let content=
				item.baseData +
				","+
				item.baseTime+
				","+
			    item.obsrValue+
			    "입니다.";
				$('.result').text(content);
		  },
		});
		


</script>


</p>
</body>
</html>