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
<title>환불내역</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#returnIndexTab{
		width:80%;
		height:80px;
		margin-top:2%;
		margin-left:10%;
		background:lightgrey;
		text-align:center;
	}
	
	#returnIndexTab th{
		width:10%;
	}
	
	#returnIndexTab td{
		width:20%;
	}
	
	#returnIndexTab td input[value="검색"]{
		border:none;
		width:80%;
		height:50px;
		color:white;
		background:navy;
	}
	
	#returnIndexTab td input[type='date']{
		width:80%;
		height:40px;
		text-align:center;
	}
	
	.returnHistoryMonthSel{
		background:white;
		border:2px solid navy;
		width:90%;
		height:40px;
		color:navy;
	}
	
	.returnHistoryMonthSel:hover{
		background:navy;
		color:white;
	}
	
	/* #returnHistoryDataFra{
		margin-top:2%;
		margin-left:10%;
		width:80%;
		border:none;
	} */
	#returnHistoryDataTab{
		text-align:center;
		width:80%;
		margin-top:2%;
		margin-left:10%;
		font-size:9pt;
	}
	#returnHistoryDataTab th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:40px;
		background:rgb(219, 217, 217);
	}
	#returnHistoryDataTab td{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:35px;
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
	$("#returnhistory").css({"background":"navy","color":"white"})

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
	// 마지막날짜 기준에 따른 1주일,1개월,3개월,6개월적용 기능
	function dateclick(){
		$(".returnHistoryMonthSel").click(function(){
			// 개월수 클릭에 따른 배경/기간변경
			$(".returnHistoryMonthSel").css({"background":"","color":""})
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
		 var endDateOb =endDate = $('#endDate').val();
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
	<form id="seachForm" action="${path}/returnHistorySeach.do" method="get">
		<input name="id" value="himan" hidden="true">
		<table id="returnIndexTab">
			<tr>
				<th><input value="1주일" type="button" class="returnHistoryMonthSel"/></th>
				<th><input value="1개월" type="button" class="returnHistoryMonthSel"/></th>
				<th><input value="3개월" type="button" class="returnHistoryMonthSel"/></th>
				<th><input value="6개월" type="button" class="returnHistoryMonthSel"/></th>
				<td><input type="date" id="startDate" value="" name="startdate">&nbsp &nbsp ~</td><td><input type="date" value="" id="endDate" name="enddate"></td>
				<td><input type="button" value="검색" id="index"/></td>
			</tr>
		</table>
	</form>
	<table id="returnHistoryDataTab">
		<col width="33%">
	   	<col width="33%">
	   	<col width="33%">
		<thead>
			<tr><th>환불상품</th><th>금액</th><th>환불일</th></tr>
		</thead>
		<tbody>
			<c:forEach var="rlist" items="${returnlist}">
				<tr><td>${rlist.ticketKind}</td><td>${rlist.payMoney}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${rlist.returnTime}"/></td></tr>
			</c:forEach>
			<!-- <tr><td colspan="3" style="color:red;">내역없음</td></tr> -->
		</tbody>
	</table>
</body>
</html>