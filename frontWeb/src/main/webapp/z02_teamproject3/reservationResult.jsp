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
		margin :10px -30px;
	}
	h4{
		text-align:center;
		font-size:16pt; 
		position:relative;
		top:60px;
	}
	
	span{
		color:red;
		font-size:20pt; 
		font-weight:50px;
	}
	input[type=button]{
	width:350px; height:60px;
	background-color:white; 
	color:rgb(234,0,0); 
	border:5px solid rgb(234,0,0);
	border-radius:5px;
	font-family:"HY견고딕"; font-size:30px;
	position:absolute;
	bottom:20%;
	left:28%;
	margin :50px 160px;
	}
</style>
<body>
	<h2><img src=".\img\CGV_mark.png" width="200px" height="90px" name="cgvmark"></h2>
	<h3>회원님 좌석 예매 내역</h3>
	<div class="reservationBox">
		<h4 id="movieInfo"> 영화 정보: <span> 블랜 펜서-와칸다 포에버</span>(4D,12세관람가)</h4>
		<h4 id="reservationInfo">예매정보: ${param.age} <span>${param.peopleCnt}</span>명<br>
			좌석번호: <span>${paramValues.seatno[0]}</span>,
			<span>${paramValues.seatno[1]}</span>,
			<span>${paramValues.seatno[2]}</span>,
			<span>${paramValues.seatno[3]}</span>,
			<span>${paramValues.seatno[4]}</span>,
			<span>${paramValues.seatno[5]}</span>,
			<span>${paramValues.seatno[6]}</span>,
			<span>${paramValues.seatno[7]}</span>
		</h4>
	</div>
		<input type="button" value="결제하러가기>" onclick="alert('결제창 넘어가기')">
	
</body>
</html>