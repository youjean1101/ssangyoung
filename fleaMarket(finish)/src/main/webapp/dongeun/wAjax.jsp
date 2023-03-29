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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<!--  -->
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>
<div class="container">
	<h1>기상청 날씨 api</h1>
	<h2>종로 날씨</h2>
	<form action="">
	  <label for="datepick">날짜 선택</label>
	  <input type="text" id="datepick"/>
	  <button>조회</button>
	</form>
	<table class="table table-hover">
	   <thead>
	      <tr>
	          <th>날짜</th>
	          <th>시간</th>
	          <th>온도</th>
	      </tr>
	   </thead>
	   <tbody>
	   <tr>
	      <td colspan="3">조회 내용이 없습니다.</td>
	   </tr>
	 <!--      <tr>
	         <td>20230311</td>
	         <td>0600</td>
	         <td>-4.0</td>
	      </tr> -->
	
	   </tbody>
	</table>
</div>

<p class="result">
<!--    20230310, 0600, -7입니다. -->

<script type="text/javascript">
$( "#datepick" ).datepicker({
	 dateFormat: "yymmdd",
	 //하루전만 선택 가능
	 minDate:"-5d",
	 //오늘까지만 선택 가능 
	 maxDate:"d",
});
//jquery ui api 
$( "#datepick" ).datepicker( "setDate", new Date() );


        let initDate=$("#datepick").val();
        
      //form태그에 submit 이벤트가 일어날때 
        $('form').submit(function(){
        	 let tDate=$("#datepick").val();
        	//날씨 정보를 클릭시 해당 function 실행 
     	    weather(tDate);
        	//form기능 작동 불가하게
        	return false;
        });
        
		
		
		function weather(initDate){
			console.log(initDate);
			$.ajax({
				url: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=Y8NXiinHE%2BuTCEAgEYIO5cOB5tV%2BgfXgmeijWT2V4iC2M7e4IRfoArVxggmRtXYO9BFdxMNzqVey6gGXR79keA%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="+initDate+"&base_time=0500&nx=55&ny=127"
						,
				success:function(result){
					console.log(result);
					let items =result.response.body.items.item;
					/*
					let filteredItems=[];
					for(let i=0;i<items.length;i++){
						if(items[i].category=='TMP'){
							filteredItems.push(item[i]);
						}
					}
					*/
					let filteredItems = items.filter(function(item){
					   return item.category=="TMP";
					});
					makeTable(filteredItems);
					
				},
			});		
		}//날씨조회 테이블 생성 함수
			
	    weather(initDate);
		
		function makeTable(src){
			var tableHTML ="";
			src.forEach(function(item){
				    tableHTML +="<tr>"
					tableHTML +="<td>"+item.fcstDate+"</td>"
					tableHTML +="<td>"+item.fcstTime+"</td>"
					tableHTML +="<td>"+item.fcstValue+"</td>"
					tableHTML +="</tr>"
			  	 			  
			});
		$("table tbody").html(tableHTML);	
		}

</script>
</p>
</body>
</html>