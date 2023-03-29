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
<style>
.flex-container{
            display: flex;
            border: 1px solid lightgray;
            border-radius: 10px;
            margin:5px;
            background-color:white;
}
 .flex-container.center{justify-content: center;}
 /*   #0081cc*/
 tr{
background:#81DAF5;
 color:black;
 width:100px;
 font-size:13px;
 }
 td{
 height:70px;
 color:red;
 }
 table{
 border:1px solid white;
 }
 
 th{
 background:white;
 text-align:center;
 }
 
table{
width:90px;
}
</style>
<body>
<div class="flex-container" style="width: 800px;">
<!-- <div class="flex-container center"> -->

<table>
   <tr><th>정보</th></tr>
   <tr>  
   <th></th>
  </tr>
  <tr>
   <th>현재온도:</th>
  </tr>
  <tr>  
    <th>최저온도:</th>
  </tr>
   
  <tr>  
    <th>최고온도:</th>
  </tr>
      
  <tr>  
    <th>바람:</th>
  </tr>
</table>
<table>
   <tr><th>서울</th></tr>
   <tr>  
   <td class="icon"></td>
  </tr>
  <tr>
   <td class="ctemp"></td>
  </tr>
  <tr>  
    <td class="lowtemp"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp"></td>
  </tr>
      
  <tr>  
    <td class="wind"></td>
  </tr>
</table>

<table>
   <tr><th>부산</th></tr>
   <tr>  
    <td class="icon1"></td>
  </tr>
  <tr>
    <td class="ctemp1"></td>
  </tr>
  <tr>  
    <td class="lowtemp1"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp1"></td>
  </tr>
      
  <tr>  
    <td class="wind1"></td>
  </tr>
</table>

<table>
   <tr><th>대전</th></tr>
   <tr>  
    <td class="icon2"></td>
  </tr>
  <tr>
    <td class="ctemp2"></td>
  </tr>
  <tr>  
    <td class="lowtemp2"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp2"></td>
  </tr>
      
  <tr>  
    <td class="wind2"></td>
  </tr>
</table>

<table>
   <tr><th>제주</th></tr>
   <tr>  
    <td class="icon3"></td>
  </tr>
  <tr>
    <td class="ctemp3"></td>
  </tr>
  <tr>  
    <td class="lowtemp3"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp3"></td>
  </tr>
      
  <tr>  
    <td class="wind3"></td>
  </tr>
</table>

<table>
   <tr><th>대구</th></tr>
   <tr>  
    <td class="icon4"></td>
  </tr>
  <tr>
    <td class="ctemp4"></td>
  </tr>
  <tr>  
    <td class="lowtemp4"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp4"></td>
  </tr>
      
  <tr>  
    <td class="wind4"></td>
  </tr>
</table>

<table>
   <tr><th>인천</th></tr>
   <tr>  
    <td class="icon5"></td>
  </tr>
  <tr>
    <td class="ctemp5"></td>
  </tr>
  <tr>  
    <td class="lowtemp5"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp5"></td>
  </tr>
      
  <tr>  
    <td class="wind5"></td>
  </tr>
</table>

<table>
   <tr><th>천안</th></tr>
   <tr>  
    <td class="icon6"></td>
  </tr>
  <tr>
    <td class="ctemp6"></td>
  </tr>
  <tr>  
    <td class="lowtemp6"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp6"></td>
  </tr>
      
  <tr>  
    <td class="wind6"></td>
  </tr>
</table>

<table>
   <tr><th>광주</th></tr>
   <tr>  
    <td class="icon7"></td>
  </tr>
  <tr>
    <td class="ctemp7"></td>
  </tr>
  <tr>  
    <td class="lowtemp7"></td>
  </tr>
   
  <tr>  
    <td class="heighttemp7"></td>
  </tr>
      
  <tr>  
    <td class="wind7"></td>
  </tr>
</table>


<!-- </div> -->

</div>
<!--    <img alt="" src="https://openweathermap.org/img/wn/10d@2x.png"> -->
<script>
var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp').append(resp.main.temp)
        $('.lowtemp').append(resp.main.temp_min)
        $('.heighttemp').append(resp.main.temp_max)
        $('.wind').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon').html(wiconUrl);
    }
});
var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Busan&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp1').append(resp.main.temp)
        $('.lowtemp1').append(resp.main.temp_min)
        $('.heighttemp1').append(resp.main.temp_max)
        $('.wind1').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon1').html(wiconUrl);
    }
});

var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Daejeon&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp2').append(resp.main.temp)
        $('.lowtemp2').append(resp.main.temp_min)
        $('.heighttemp2').append(resp.main.temp_max)
        $('.wind2').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon2').html(wiconUrl);
    }
});

var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Jeju&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp3').append(resp.main.temp)
        $('.lowtemp3').append(resp.main.temp_min)
        $('.heighttemp3').append(resp.main.temp_max)
        $('.wind3').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon3').html(wiconUrl);
    }
});
var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Daegu&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp4').append(resp.main.temp)
        $('.lowtemp4').append(resp.main.temp_min)
        $('.heighttemp4').append(resp.main.temp_max)
        $('.wind4').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon4').html(wiconUrl);
    }
});
var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Incheon&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp5').append(resp.main.temp)
        $('.lowtemp5').append(resp.main.temp_min)
        $('.heighttemp5').append(resp.main.temp_max)
        $('.wind5').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon5').html(wiconUrl);
    }
});
var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Cheonan&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp6').append(resp.main.temp)
        $('.lowtemp6').append(resp.main.temp_min)
        $('.heighttemp6').append(resp.main.temp_max)
        $('.wind6').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon6').html(wiconUrl);
    }
});
var apiURI = 'https://api.openweathermap.org/data/2.5/weather?q=Gwangju&appid=d12078fe81973d3035e6d7f7915cefce&units=metric';
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        $('.ctemp7').append(resp.main.temp)
        $('.lowtemp7').append(resp.main.temp_min)
        $('.heighttemp7').append(resp.main.temp_max)
        $('.wind7').append(resp.wind.speed);
        
        var wiconUrl='<img alt="'+resp.weather[0].description+'" src="https://openweathermap.org/img/wn/'+resp.weather[0].icon+'.png">'
        $('.icon7').html(wiconUrl);
    }
});


</script>
</body>
</html>