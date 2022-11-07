<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		 <h3>사원정보</h3><br>
 		 <h4>입사일(년/월/일) :${param.hiredate} </h4>
         <h4>다음프로젝트(년/@주째) : ${param.project}</h4>
         <h4>회원룸 예약 :</h4>
            <h5>- 방번호 : ${param.roomno}</h5> 
            <h5>- 날짜(년/월/일) : ${param.reservationdate}</h5>
            <h5>- 시간(@@:@@) : ${param.reservationtime}</h5>
</body>
</html>