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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#noneUserUnpaidViewTab{
		/* border:1px solid black; */
		text-align:center;
		width:80%;
		margin-left:10%;
		/* margin-top:15%; */
		font-size:9pt;
	}
	#noneUserUnpaidViewTab th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:40px;
		background:rgb(219, 217, 217);
	}
	#noneUserUnpaidViewTab td{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:35px;
	}
	#nonUserUnpaidPayTab{
		width:35%;
		margin-left:32%;
		margin-top:2%;
		text-align:center;
	}
	#nonUserUnpaidPayTab th{
		height:70px;
		background:rgb(219, 217, 217);
		font-size:14pt;
		border:15px solid white;
	}
	#nonUserUnpaidPayTab #heightCont{
		height:50px;
		background:rgb(51, 160, 117);
	}
	#nonUserUnpaidPayTab th [type=button]{
		width:100%;
		height:100%;
		background:rgb(51, 160, 117);
		color:white;
		border:none;
		outline:none;
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
		$("#modalcard").click(function(){
			$("#phoneIns").hide() // 초기화면에서는 보이지 않게 처리
			$("#cardIns").show()
			$("#exampleModalLongTitle").text("결제수단등록(카드등록)");
			$(".phoneSel").css("display","none");
			$(".cardSel").css("display","");
		})
		$("#modalphone").click(function(){
			$("#exampleModalLongTitle").text("결제수단등록(휴대폰등록)");
			$("#phoneIns").show()
			$("#cardIns").hide()
			$(".phoneSel").css("display","");
			$(".cardSel").css("display","none");
		})
		// 이메일 직접입력/선택값 기능
		$('#selectEmail').change(function(){
			   $("#selectEmail option:selected").each(function () {
					if($(this).val()== '1'){ //직접입력일 경우
						 $("[name=email2]").val('');                        //값 초기화
						 $("[name=email2]").attr("disabled",false); //활성화
					}else{ //직접입력이 아닐경우
						 $("[name=email2]").val($(this).text());      //선택값 입력
						 $("[name=email2]").attr("disabled",true); //비활성화
					}
		   })
		})
		/* $("#cardIns").click(function(){
			location.href="/getpayInsert.do?cardno="+$("#cardno1").val()+"-"+$("#cardno2").val()+"-"+$("#cardno3").val()+"-"+$("#cardno4").val()
													+"&validity="+$("#validityMonth").val()+"/"+$("#validityYear").val()
													+"&cardkind="+$("#cardKind").val()
													+"&email="+$("#email1").val()+"@"+$("#email2").val()
													+"&phoneNumber="
													+"&rrn="
		})
		$("#phoneIns").click(function(){
			location.href="/getpayInsert.do?phoneNumber="+$("#phonenum01").val()+"-"+$("#phonenum02").val()+"-"+$("#phonenum03").val()
														+"&rrn="+$("#rrn7front").val()+"-"+$("#rrn7behind").val()
														+"&cardno="
														+"&validity="
														+"&cardkind="
														+"&email="				
		}) */
	});
</script>
</head>

<body>
	<table id="noneUserUnpaidViewTab">
		<col width="20%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="15%">
	   	<col width="15%">
	   	<col width="10%">
	   	<col width="20%">
		<thead>
			<tr><th>결제상품</th><th>금액</th><th>결제방법</th>
				<th>대여시간</th><th>반납시간</th><th>사용시간</th><th>미납금액</th></tr>
		</thead>
		<tbody>
			<c:forEach var="nUlist" items="${nonUserUnpaidList}">
			<tr><td>${nUlist.ticketKind}</td><td>${nUlist.payMoney}원</td><td>${nUlist.payMethod}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${nUlist.rentalTime}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${nUlist.returnTime}"/></td>
				<td>${nUlist.useTime}</td><td>${nUlist.unpaidCharge}원</td></tr>
			<tr style="display:none"><td colspan="7"><input type="hidden" id="totCharge" value="${nUlist.unpaidCharge}"/></td></tr>
			</c:forEach><!--총금액 출력(value값을 누적기능)  -->
		</tbody>
	</table>
	<table id="nonUserUnpaidPayTab">
		<tr style="display:none"><th colspan="2">결제금액 &nbsp &nbsp &nbsp <span>0</span>원</th></tr>
		<tr><th id="heightCont"><button id="modalphone" type="button" data-toggle="modal" data-target="#exampleModalCenter">휴대폰 결제하기</button></th>
			<th id="heightCont"><button id="modalcard" type="button" data-toggle="modal" data-target="#exampleModalCenter">카드 결제하기</button></th></tr>
	</table> <!-- 모달창으로 결제하기   -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">결제수단등록(휴대전화)</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<!-- <form id="frm02" class="form"  method="post"> -->
		<!--  <input type="hidden" value="himan"/> -->
	     <div class="row phoneSel" style="margin-left:2%;margin-top:3%;">
	        전화번호 : &nbsp 
	         <div class="col" style="padding:0px 0px;">
		        <select class="form-control" style="width:90px" name="telecom">
						<option>SKT</option>
						<option>KT</option>
						<option>LG U+</option>
				</select>
			</div>
			<div class="col" style="padding:2px 0px;"> 
		        <input type="text" class="form-control" name="phonenum01" id="phonenum01" style="width:90px;">
		    </div>
		    - 
		    <div class="col" style="padding:0px 0px;">
		        <input type="text" class="form-control" name="phonenum02" id="phonenum02" style="width:90px;"> 
		    </div>
		    - 
		    <div class="col" style="padding:0px 0px;">
		        <input type="text" class="form-control" name="phonenum03" id="phonenum03" style="width:90px" >
	     	</div>	
	     </div>
	     <div class="row phoneSel" style="margin-left:2%;margin-top:3%;">
	        인증번호 : &nbsp 
	         <input type="text" class="form-control" placeholder="인증번호" name="certNum" style="width:120px;">
	         <input id='Timer' type='text'  class="form-control" value='' readonly style="width:90px; border:none; background:white; color:red;"/>
	         <input type="button" class="btn btn-warning" value="인증번호 전송" name="certNum" onclick='TIMER()' style="width:130px;">
	      </div>
	     <div class="row phoneSel" style="margin-left:2%; margin-top:3%;">
	         주민번호 7앞자리 :&nbsp 
        	<input type="text" class="form-control" name="rrn7front" id="rrn7front" style="width:150px;">
	        &nbsp - &nbsp 
        	<input type="text" class="form-control" name="rrn7behind" id="rrn7behind" style="width:50px;">
	        ●●●●●●
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;">
	         카드번호 :&nbsp 
        	<input type="text" class="form-control" name="cardno1" id="cardno1" style="width:70px;">
	        &nbsp - &nbsp 
        	<input type="text" class="form-control" name="cardno2" id="cardno2" style="width:70px;">
	        &nbsp - &nbsp 
        	<input type="text" class="form-control" name="cardno3" id="cardno3" style="width:70px;">
	        &nbsp - &nbsp
        	<input type="text" class="form-control" name="cardno4" id="cardno4" style="width:70px;">
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;">
	         유효기간 :&nbsp 
        	<input type="text" class="form-control" id="validityMonth" name="validityMonth" placeholder="월" style="width:60px;">
        	&nbsp / &nbsp 
        	<input type="text" class="form-control" id="validityYear" name="validityYear" placeholder="년" style="width:60px;">
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;" class="cardSel">
	         카드종류 :&nbsp 
        	<select name="cardKind" id="cardKind" class="form-control" style="width:250px;">
					<option selected>카드를 선택해주세요.</option>
					<option>쌍용카드</option>
					<option>신한카드</option>
					<option>하나카드</option>
					<option>국민카드</option>
					<option>삼성카드</option>
					<option>비씨카드</option>
				</select>
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;">
	         이메일 :&nbsp 
        	<input type="text" class="form-control" id="email1" name="email1" style="width:130px;">
        	&nbsp @ &nbsp 
        	<input type="text" class="form-control" id="email2" name="email2" style="width:130px;">
	     	 <select class="form-control" style="width:100px; font-size:8pt;" id="selectEmail">
					<option value="1">직접입력</option>
					 <option>naver.com</option>
					 <option>hanmail.net</option>
					 <option>hotmail.com</option>
					 <option>nate.com</option>
					 <option>yahoo.co.kr</option>
					 <option>empas.com</option>
					 <option>dreamwiz.com</option>
					 <option>freechal.com</option>
					 <option>lycos.co.kr</option>
					 <option>korea.com</option>
					 <option>gmail.com</option>
					 <option>hanmir.com</option>
					 <option>paran.com</option>
				</select>
	      </div>
	    <!-- </form>  -->
   	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-success" id="phoneIns">결제하기</button>
        <button type="button" class="btn btn-success" id="cardIns">결제하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>