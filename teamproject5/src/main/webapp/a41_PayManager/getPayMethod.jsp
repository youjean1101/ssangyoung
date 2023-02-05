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
<title>결제수단등록</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#guide01{
		font-weight:bold;
		font-size:9pt;
		margin-top:3%;
		margin-left:10%;
	}
	#guide02{
		font-size:9pt;
		margin-top:3%;
		margin-left:10%;
	}
	#guide02 span{
		color:red;
	}
	#getPayMethodSelTab{
		width:80%;
		height:100px;
		margin-top:3%;
		margin-left:10%;
	}
	#getPayMethodSelTab td{
		border:5px solid white;
	}
	#getPayMethodSelTab td button{
		background:lightgrey;
		border:none;
		width:100%;
		height:100%;
		font-size:14pt;
		font-weight:bold;
	}
	#getPayMethodSelTab td button span{
		color:grey;
		font-size:9pt;
		font-weight:10px;
	}
	
	.phoneSel{
		 aria-hidden:true;
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
	$(".phoneSel").css("display","none")
	// 마이페이지 결제관리 공통 클릭상태 유지
	$("#getPayMethod").css({"background":"navy","color":"white"})
	// 결제수단에 따른 모달창변경 기능
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
	   });
	});
});
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a07_mypagecommon.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a09_myPagePayManager.jsp"></jsp:include>
	<div id="guide01">추가과금이 발생할 경우 등록한 결제 수단으로 자동 결제됩니다.</div>
	<table id="getPayMethodSelTab">
		<tr><td><button id="modalphone" type="button" data-toggle="modal" data-target="#exampleModalCenter">휴대전화등록<br> <span>휴대전화를 결제수단으로 등록합니다.</span></button></td>
			<td><button id="modalcard" type="button" data-toggle="modal" data-target="#exampleModalCenter">신용카드 등록<br> <span>신용카드를 결제수단으로 등록 합니다.</span></button></td></tr>
	</table>
	<div id="guide02">결제수단 변경시 <span>500원이 결제</span>됩니다. 그리고 해당 결제금액은 일정시간이 지난 후 <span>자동으로 결제취소</span>가 진행됩니다. 
		<span>(최대 5분 정도 소요)</span> 회원님의 양해를 부탁드립니다.</div>
<!-- 모달창1 발생 -->
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
		<form id="frm02" class="form"  method="post">
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
		        <input type="text" class="form-control" name="phonenum01" style="width:90px;">
		    </div>
		    - 
		    <div class="col" style="padding:0px 0px;">
		        <input type="text" class="form-control" name="phonenum02"  style="width:90px;"> 
		    </div>
		    - 
		    <div class="col" style="padding:0px 0px;">
		        <input type="text" class="form-control" name="phonenum03" style="width:90px" >
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
        	<input type="text" class="form-control" name="rrn7front" style="width:150px;">
	        &nbsp - &nbsp 
        	<input type="text" class="form-control" name="rrn7behind" style="width:50px;">
	        ●●●●●●
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;">
	         카드번호 :&nbsp 
        	<input type="text" class="form-control" name="cardno1" style="width:70px;">
	        &nbsp - &nbsp 
        	<input type="text" class="form-control" name="cardno2" style="width:70px;">
	        &nbsp - &nbsp 
        	<input type="text" class="form-control" name="cardno3" style="width:70px;">
	        &nbsp - &nbsp
        	<input type="text" class="form-control" name="cardno4" style="width:70px;">
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;">
	         유효기간 :&nbsp 
        	<input type="text" class="form-control" name="validityMonth" placeholder="월" style="width:60px;">
        	&nbsp / &nbsp 
        	<input type="text" class="form-control" name="validityYear" placeholder="년" style="width:60px;">
	      </div>
	      <div class="row cardSel" style="margin-left:2%; margin-top:3%; display:none;" class="cardSel">
	         카드종류 :&nbsp 
        	<select name="cardKind" class="form-control" style="width:250px;">
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
        	<input type="text" class="form-control" name="email1" style="width:130px;">
        	&nbsp @ &nbsp 
        	<input type="text" class="form-control" name="email2" style="width:130px;">
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
	    </form> 
   	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-success" id="phoneIns">휴대폰등록</button>
        <button type="button" class="btn btn-success" id="cardIns">카드등록</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
//-------------------------------타이머 기능-------------------------------
const Timer=document.getElementById('Timer'); //스코어 기록창-분
let time= 180000;
let min=3;
let sec=60;

Timer.value=min+":"+'00'; 

function TIMER(){
    PlAYTIME=setInterval(function(){
        time=time-1000; //1초씩 줄어듦
        min=time/(60*1000); //초를 분으로 나눠준다.

       if(sec>0){ //sec=60 에서 1씩 빼서 출력해준다.
            sec=sec-1;
            Timer.value=Math.floor(min)+':'+sec; 
            //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.
        }
        if(sec===0){
         	// 0에서 -1을 하면 -59가 출력된다.
            // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
            sec=60;
            Timer.value=Math.floor(min)+':'+'00'
        }     
    },1000); //1초마다 
}
setTimeout(function(){
    clearInterval(PlAYTIME);
},180000);//3분이 되면 타이머를 삭제한다.
</script>
</html>