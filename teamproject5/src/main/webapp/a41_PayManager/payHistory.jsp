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
<title>결제내역</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#payDateindexTab{
		width:70%;
		margin-left:15%;
		margin-top:3%;
		height:120px;
		background:lightgrey;
		text-align:center;
	}
	#payDateindexTab th{
		width:60%;
	}
	#payDateindexTab td{
		width:10%;
		padding-right:5px;
	}
	#payDateindexTab input[type="button"]{
		width:100px;
		height:35px;
		border:1px solid navy;
		background:white;
		color:navy;
	}
	#payDateindexTab input[type="button"]:hover{
		background:navy;
		color:white;
	}
	#payDateindexTab input[value="검색"]{
		width:200px;
		height:40px;
		border:none;
		background:green;
		color:white;
	}
	#usePayDateDetailTab{
		border:1px solid black;
		width:70%;
		margin-left:15%;
		margin-top:2%;
		text-align:center;
	}
	#usePayDateDetailTab th{
		border:1px solid black;
		background:rgb(219, 217, 217);
		width:10%;
		height:35px;
	}
	#usePayDateDetailTab td{
		border:1px solid black;
		height:50px;
	}
	#payDateindexTab input[type='radio']{
		width:20px;
		height:20px;
	}
	#payDateindexTab input[type='date']{
		width:230px;
		height:40px;
		text-align:center;
	}
	#payHistoryDataTab{
		/* border:1px solid black; */
		text-align:center;
		width:70%;
		margin-left:15%;
		margin-top:2%;
		font-size:9pt;
	}
	#payHistoryDataTab th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:40px;
		background:rgb(219, 217, 217);
	}
	#payHistoryDataTab td{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:35px;
	}
	#payHistoryCnt{
		font-size:8pt;
		color:darkgrey;
		margin-top:3%;
		margin-left:80%;
	}
	#payHistoryCnt span{
		color:red;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 마이페이지 결제관리 공통 클릭상태 유지
	$("#payhistory").css({"background":"navy","color":"white"})
	
	// 기간 지정 dafault값
	$("input[value='1주일']").css({"background":"navy","color":"white"})
	var defaultday = new Date();
	var dayOfMonth = defaultday.getDate(); //일전
	var monthOfYear = defaultday.getMonth(); //개월전
	defaultday.setDate(dayOfMonth - 7);
	$("#startDate").val(defaultday.toISOString().substring(0, 10))
	$("#endDate").val(new Date().toISOString().substring(0, 10))
	
    dateclick() // 변경안하고 클릭시,
	$("#endDate").change(function(){
		dateclick()//날짜 변경 후 클릭 시,
	})
	
	// 개월수 클릭에 따른 배경/기간변경
	function dateclick(){
		$(".payHistoryMonthSel").click(function(){
			$(".payHistoryMonthSel").css({"background":"","color":""})
			$(this).css({"background":"navy","color":"white"})
			var endDate = $('#endDate').val();
			var endArray = endDate.split('-')
			var enddatePre = new Date(endArray[0], endArray[1]-1, endArray[2]); // new Date 월은 0부터 시작(0~11)
			var endDate_dayOfMonth = enddatePre.getDate();
			var endDate_monthOfYear = enddatePre.getMonth();
			
			if($(this).val()==="1주일"){
				enddatePre.setDate(endDate_dayOfMonth-6);
				$("#startDate").val(enddatePre.toISOString().substring(0, 10))
			}else if($(this).val()==="1개월"){
				enddatePre.setDate(endDate_dayOfMonth+1);
				enddatePre.setMonth(endDate_monthOfYear-1);
				$("#startDate").val(enddatePre.toISOString().substring(0, 10))
			}else if($(this).val()==="3개월"){
				enddatePre.setDate(endDate_dayOfMonth+1);
				enddatePre.setMonth(endDate_monthOfYear-3);
				$("#startDate").val(enddatePre.toISOString().substring(0, 10))
			}else{
				enddatePre.setDate(endDate_dayOfMonth+1);
				enddatePre.setMonth(endDate_monthOfYear-6);
				$("#startDate").val(enddatePre.toISOString().substring(0, 10))
			}
		})
	}
 	// 기간 유효성 체크 (시작날짜와 끝나는날짜)
	$("#index").click(function(){
		//기간 유효성체크
		var startDateOb = $('#startDate').val();
		var endDateOb = $('#endDate').val();
		 //-을 구분자로 연,월,일로 잘라내어 배열로 반환
		var startObArray = startDateOb.split('-');
		var endObArray  = endDateOb.split('-')
	    //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
	   	var start_date = new Date(startObArray[0], startObArray[1], startObArray[2]);
	    var end_date = new Date(endObArray[0], endObArray[1], endObArray[2]);
        //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
        if(start_date.getTime() > end_date.getTime()) {
            alert("[안내메시지] 종료날짜보다 시작날짜가 작아야합니다.");
            return false;
        }else{
        	$("#seachForm").submit();
        }
	})
});
	
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a07_mypagecommon.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a09_myPagePayManager.jsp"></jsp:include>
	<form id="seachForm" action="${path}/payHistorySeach.do" method="get">
		<input name="id" value="himan" hidden="true">
		<table id="payDateindexTab">
			<tr><th>
				<input type="radio" value="" name="payMethod" checked/> 전체 &nbsp
				<input type="radio" value="card" name="payMethod"/> 신용/체크카드 &nbsp
				<input type="radio" value="phone" name="payMethod"/> 휴대폰 결제 &nbsp
				</th>
				<td><input value="1주일" type="button" class="payHistoryMonthSel"/></td>
				<td><input value="1개월" type="button" class="payHistoryMonthSel"/></td>
				<td><input value="3개월" type="button" class="payHistoryMonthSel"/></td>
				<td><input value="6개월" type="button" class="payHistoryMonthSel"/></td>
			</tr>
			<tr><th>
				<input type="date" id="startDate" name="startdate"> ~ <input type="date" id="endDate" name="enddate">
				</th>
				<td></td>
				<td></td>
				<td colspan="2"><input value="검색" type="button" id="index"/></td>
			</tr>
		</table>
		</form>
	<!-- <div id="payHistoryCnt">Total : <span>0</span> 건 /<span> 0</span> 원</div> -->
	<table id="payHistoryDataTab">
		<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="30%">
	   	<col width="20%">
	   	<col width="20%">
		<thead>
			<tr><th>결제상품</th><th>금액</th><th>결제방법</th>
				<th>대여시간</th><th>환불예정액</th><th>환불/취소</th></tr>
		</thead>
		<tbody>
			<c:forEach var="plist" items="${paylist}">
			<tr><td>${plist.ticketKind}</td><td>${plist.payMoney}</td><td>${plist.payMethod}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${plist.rentalTime}"/></td>
				<td>${plist.payMoney}</td><td>X</td></tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table id="usePayDateDetailTab">
		<col width="10%">
	   	<col width="10%">
	   	<col width="30%">
	   	<col width="30%">
	   	<col width="20%">
		<tr><th rowspan="2" colspan="2">구분</th><th colspan="2">사용시</th><th rowspan="2">미사용시</th></tr>
		<tr><th>이용개시일로부터 7일이내</th><th>이용개시일로부터 7일초과</th></tr>
		<tr><td rowspan="4">정기권</td><td>365일권</td><td rowspan="3">7일권 이용요금 공제</td><td rowspan="2">환불 요청일까지의 월별 이용요금 공제(사용월수 x 30일권 이용요금)</td><td rowspan="5">전액환불</td></tr>
		<tr><td>180일권</td></tr>
		<tr><td>30일권</td><td rowspan="2">환불 불가</td></tr>
		<tr><td>7일권</td><td>이용개시일로부터 <br>2일이내 일일권 이용요금 공제</td></tr>
		<tr><td colspan="2">일일권</td><td colspan="2">환불 불가</td></tr>
		<tr><td colspan="5" style="color:red;">※ 이용권 사용한 경우(이용권 개시일 기준)<br>
			1일권 : 환불불가 , 7일권 : 2일이내, 30일권 : 7일이내, 180일권 : 60일이내, 365일권은 150일이내 신청해야만 환불이 가능합니다.</td></tr>
	</table>
</body>
</html>