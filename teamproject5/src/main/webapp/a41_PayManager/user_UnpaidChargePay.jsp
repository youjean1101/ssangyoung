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
<title>추과과금결제</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#addPayexp{
		font-size:8pt;
		color:grey;
		margin-left:12%;
		margin-top:2%;
	}
	#addPayexp span{ 
		color:red;
	}
	#payMethodSelTab{
		border:1px solid black;
		margin-left:15%;
		margin-top:2%;
		width:70%;
		text-align:center;
		font-size:9pt;
	}
	#payMethodSelTab th{
		border:1px solid black;
		width:30%;
		height:50px;
		font-weight:bold;
		background:rgb(219, 217, 217);
	}
	#payMethodSelTab td{
		border:1px solid black;
		width:70%;
		height:50px;
	}
	#payMethodSelTab td .inputBox{
		width:100px;
		height:30px;
	}
	#payMoneyTab{
		width:35%;
		margin-left:32%;
		margin-top:2%;
		text-align:center;
	}
	#payMoneyTab th{
		height:70px;
		background:rgb(219, 217, 217);
		font-size:16pt;
	}
	#payMoneyTab #heightCont{
		height:50px;
		background:navy;
	}
	#payMoneyTab th input[type="button"]{
		width:100%;
		height:100%;;
		background:navy;
		color:white;
		border:none;
	}
	#payMoneyTab td{
		height:30px;
		font-size:8pt;
	}
	#addPayHistoryDataFra{
		width:70%;
		margin-left:15%;
		margin-top:2%;
		border:none;
	}
	#payMethodSelTab input[type='radio']{
		width:20px;
		height:20px;
	}
	#payMethodSelTab select{
		border:none;
		height:35px;
		font-size:11pt;
	}
	#sendbutton{
		background:rgb(67, 84, 100);
		color:white;
		border:none;
		width:150px;
		height:25px;
		font-size:8pt;
		outline:none;
	}
	#Timer{
		color:red;
		border:none;
		text-align:center;
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
	$("#addPay").css({"background":"navy","color":"white"})
	// 결제방법에 따른 테이블 출력
	$("input[name=payMethod]").change(function(){
		if($(this).val()=="phone"){
			$(".cardSel").css("display","none")
			$(".phoneSel").css("display","")
		}else{
			$(".phoneSel").css("display","none")
			$(".cardSel").css("display","")
		} // 등록된 수단시, 조건 추가
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
	<div id="addPayexp">
		<span>이용 가능시간</span>은 첫 회 대여시점을 기준으로 계산합니다.<br>
		서울자전거 모든 대여소에서 <span>사용이 가능</span>합니다.<br>
		서울자전거 <span>환불</span>규정에 따릅니다.  <a href="https://www.bikeseoul.com/info/infoCoupon.do?part=refund">환불 규정 보기></a><br>
		이용권을 다른 사람에게 <span>양도</span>할 수 없으며,양도로 인해 발생하는 불이익은 구매자가 책임지셔야 합니다.<br>
	</div>
	<table id="payMethodSelTab">
		<tr><th>결제수단</th>
			<td><input type="radio" name="payMethod" value="card" checked/> 신용/체크카드 &nbsp &nbsp &nbsp      
				<input type="radio" name="payMethod" value="phone"/> 휴대폰결제 &nbsp &nbsp &nbsp   
				<input type="radio" name="payMethod" value="getCard"/> 등록된수단</td></tr>
		<tr class="cardSel">
			<th>카드번호</th>
			<td><input type="text" class="inputBox" name="cardNumber1" size="3"> -
				<input type="text" class="inputBox" name="cardNumber2" size="3"> -
				<input type="text" class="inputBox" name="cardNumber3" size="3"> -
				<input type="text" class="inputBox" name="cardNumber4" size="3">
			</td>
		</tr>
		<tr class="cardSel">
			<th>유효기간</th>
			<td><input type="text" class="inputBox" name="validityMonth" size="2" placeholder="년"> / 
				<input type="text" class="inputBox" name="validityYear" size="2" placeholder="월"></td>
		</tr>
		<tr class="cardSel">
			<th>카드종류</th>
			<td><select name="cardKind">
					<option selected>카드를 선택해주세요.</option>
					<option>쌍용카드</option>
					<option>신한카드</option>
					<option>하나카드</option>
					<option>국민카드</option>
					<option>삼성카드</option>
					<option>비씨카드</option>
				</select></td>
		</tr>
		<tr class="cardSel">
			<th>이메일주소</th>
			<td><input type="text" name="email1" style="height:30px;"/> @ <input type="text" style="height:30px;" name="email2"/>
				<select class="inputBox" id="selectEmail">
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
			</td>
		</tr>
		<tr class="inputBox phoneSel" style="display:none;"><th>휴대전화번호</th>
			<td><select class="inputBox phoneSel" style="display:none">
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
				</select>
			<input type="text" class="inputBox"> - <input type="text" class="inputBox"> - <input type="text" class="inputBox"></td></tr>
		<tr class="phoneSel" style="display:none";>
			<th>인증번호발송</th>
			<td><input type='text' id='certnum' style="height:30px;"/>
			<input id='Timer' size="2" type='text' value='' readonly/>
			<input type='button' id='sendbutton' value='인증번호 발송' onclick='TIMER()'/>
			</td>
		</tr>
		<tr class="phoneSel" style="display:none">
			<th>주민번호 앞7자리</th>
			<td><input style="height:30px;" type="text" name="rrn1"/> - <input type="text" name="rrn2" size="1"/>●●●●●●</td>
		</tr>
		<tr><th>미납금액</th><td>원</td></tr>
		<tr><th>미납내역</th><td>초과이용  0 건</td></tr>
	</table>
	<table id="payMoneyTab">
		<tr><th>결제금액 &nbsp &nbsp &nbsp 원</th></tr>
		<tr><td><input type="checkbox"/> <a href="https://www.bikeseoul.com/info/infoCoupon.do?part=add">추가요금</a>자동결제, 
										<a href="https://www.bikeseoul.com/info/infoCoupon.do?part=refund">환불규정</a>, 
										<a href="https://www.bikeseoul.com/app/use/moveUseMenuClauseInfo.do">이용약관</a>에 동의하며 결제를 진행합니다.</td></tr>
		<tr><th id="heightCont"><input type="button" value="결제"></th></tr>
	</table>
	<iframe id="addPayHistoryDataFra" src="${path}/a41_PayManager/user_UpaidChageData.jsp"></iframe>
</body>
<script>
//-------------------------------타이머 기능-------------------------------
const Timer=document.getElementById('Timer'); //스코어 기록창-분
let time= 300000;
let min=5;
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
},300000);//3분이 되면 타이머를 삭제한다.
</script>
</html>