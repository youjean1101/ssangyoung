<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h2{text-align:center;}
	
	h3{
		font-size:20pt; 
		font-weight:800px;
		text-align:center;
	}
	
	div.reservationBox{
		width:800px;
		height:300px;
		border:6px solid red;
		position:absolute;
		left:25%;
	}
	h4{
		text-align:center;
		font-size:16pt; 
		position:relative;
		top:60px;
	}
	
	span{
		color:red;
		font-size:18pt; 
	}
</style>
<body>
	<h2><img src=".\img\CGV_mark.png" width="200px" height="90px" name="cgvmark"></h2>
	<h3>회원님 좌석 예매 내역</h3>
	<div class="reservationBox">
		<h4 id="movieInfo">영화 정보:${param.moviename}<span>${param.subtitle}</span>(${param.bim},${param.ageLimit})</h4>
		<h4 id="reservationInfo">예매정보: ${param.age} <span>${param.peopleCnt}</span>명<br>
			좌석번호: <span>${paramValues.seatno[0]}</span>,<span>${paramValues.seatno[1]}</span>,<span>${paramValues.seatno[2]}</span>,<span>${param.seatno}</span>,<span>${param.seatno}</span>,<span>${param.seatno}</span>,<span>${param.seatno}</span>,<span>${param.seatno}</span></h4>
	</div>
	
</body>
</html>