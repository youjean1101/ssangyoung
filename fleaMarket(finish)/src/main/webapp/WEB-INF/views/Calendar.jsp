<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${path}/resource/js/Req3000/index.global.js"></script>
<script src="${path}/resource/js/Req3000/index.global.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
	

<script>
  // 위 js를 사용할 수 있게 같은 폴드에 있는 dist 폴드를
  // 복사해서 webapp/a00_com  폴드하위에 넣어주세요.
  
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	// 오늘 날짜로 초기화면이 로딩되게 처리
	console.log(new Date())
	console.log(new Date().toISOString())
	var toDay = new Date().toISOString().split("T")[0];
	console.log(toDay);
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: toDay,
      //navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
   	  // 상단에 jquery lib 호출	
      events:function(info, successCallback, failureCallback){
			$.ajax({
				type:"post",
				url:"calendarAjax.do",
				dataType:"json",
				success:function(data){
					console.log(data.callist)
					successCallback(data.callist)
				},
				error:function(err){
					console.log(err)
				}
			})
		} 
    });
	
    calendar.render();
        

  });
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body class="mt-5">

    <h1 style="margin-left: 39%;color:#646EFF;">플리마켓 일정표</h1>
  	<div id='calendar'></div>
  
</body>
</html>
