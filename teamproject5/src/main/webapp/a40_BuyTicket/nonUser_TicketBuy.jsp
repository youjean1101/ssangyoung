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
<title>비회원 이용권 구매</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#title{
		color:green;
		font-size:14pt;
		margin-top:3%;
		margin-left:5%;
	}
	#content{
		font-size:9pt;
		font-weight:bold;
		margin-top:1%;
		margin-left:6%;
		line-height:20px;
	}
	#payInputTab{
		border:1px solid black;
		width:60%;
		margin-left:20%;
		margin-top:2%;
		font-size:9pt;
	}
	#payInputTab th{
		border:1px solid black;
		text-align:center;
		font-weight:bold;
		background:rgb(219, 217, 217);
		opacity:0.7;
		width:20%;
		height:50px;
	}
	#payInputTab td{
		border:1px solid black;
		width:80%;
		padding-left:3%;
	}
	#payInputTab td .inputBox{
		width:100px;
		height:25px;
	}
	#payInputTab td #timeSel{
		width:170px;
		height:25px;
	}
	#payInputTab select{
		border:none;
	}
	.payhr{
		margin-top:1%;
		margin-left:10%;
		width:80%;
	}
	#agreeTab{
		margin-left:20%;
		margin-top:1%;
		width:60%;
		font-size:9pt;
	}
	#agreeTab th{
		border-bottom:1px solid grey;
		text-align:center;
		padding-bottom:2%;
		font-size:11pt;
	}
	#agreeTab td{
		padding-top:2%;
	}
	#payButton{
		width:250px;
		height:30px;
		margin-top:1.5%;
		margin-left:40%;
		border:none;
		background:rgb(51, 160, 117);
		color:white;
		outline:none;
	}
	#useNoticeTitle{
		color:red;
		margin-left:20%;
		margin-top:1.5%;
		font-size:14pt;
	}
	#useNoticeTab{
		margin-left:20%;
		width:60%;
		font-size:9pt;
	}
	#useNoticeTab th{
		width:15%;
		height:70px;
		border-bottom:1px solid grey;
		color:green;
	}
	#useNoticeTab td{
		width:70%;
		border-bottom:1px solid grey;
	}
	#noticeHr{
		border:2px solid black;
		margin-left:20%;
		width:60%;
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
		var show="" 
		$("input[name=payMethod]").change(function(){
			if($(this).val()=="phone"){
				$(".cardSel").css("display","none")
				$(".phoneSel").css("display","")
			}else{
				$(".phoneSel").css("display","none")
				$(".cardSel").css("display","")
			}
		})
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
	<hr>
	<h3 id="title">서울자전거 일일 이용권</h3>
	<h4 id="content">자전거 대여 당일만 이용이 가능하며,<br>
					횟수에 상관없이 자전거 대여가 가능합니다.</h4>
	
	<hr class="payhr">
	
	<table id="payInputTab">
	<tbody>
		<tr><th>이용권 구분</th>
			<td><select id="timeSel">
					<option>일일권(1시간)</option>
					<option>프리미엄 일일권(2시간)</option>
				</select></td></tr>
		<tr><th>매수</th><td>1매 (1회 1매씩 구매가 가능합니다.)</td></tr>
		<tr><th>가격</th><td>1,000원 기본대여시간(60분) 초과시 5분마다 추가요금 200원 과금
							<br>(※ 추가요금은 이용권 결제수단으로 자동결제 됩니다.)</td></tr>
		<tr><th>결제수단</th>
			<td><input type="radio" value="card" name="payMethod"  checked>신용/체크카드
				<input type="radio" value="phone" name="payMethod">휴대폰결제<br>
				고객 한명당 하나의 카드로만 가능합니다.(중복결제금지)
				</td></tr>
		<tr><th>생년월일</th>
			<td><select class="inputBox">
					<option>연도</option>
					<c:forEach var="i" begin="1923" end="2011">
						<option>${i} 년</option>
					</c:forEach>
				</select>
				<select class="inputBox">
					<option>월</option>
					<c:forEach var="i" begin="1" end="12">
						<option>${i} 월</option>
					</c:forEach>
				</select>
				<select class="inputBox">
					<option>일</option>
					<c:forEach var="i" begin="1" end="31">
						<option>${i} 일</option>
					</c:forEach>
				</select>
				<br>(만 13세 새싹따릉이 대상자들은 회원 가입 후 이용가능합니다.)
			</td></tr>
		<tr><th>결제금액</th><td>1,000원</td></tr>
		<tr><th>휴대전화번호</th>
			<td><select class="inputBox phoneSel" style="display:none">
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
				</select>
			<input type="text" class="inputBox"> - <input type="text" class="inputBox"> - <input type="text" class="inputBox"></td></tr>
		<tr class="phoneSel" style="display:none";>
			<th>인증번호발송</th>
			<td><input type='text' id='certnum'/>
			<input id='Timer' type='text' value='' readonly/>
			<input type='button' id='sendbutton' value='인증번호 발송' onclick='TIMER()'/>
			</td>
		</tr>
		<tr class="phoneSel" style="display:none">
			<th>주민번호 앞7자리</th>
			<td><input type="text" name="rrn1"/> - <input type="text" name="rrn2" size="1"/>●●●●●●</td>
		</tr>
		<tr class="cardSel">
			<th>카드번호</th>
			<td><input type="text" name="cardNumber1" size="2"> -
				<input type="text" name="cardNumber2" size="2"> -
				<input type="text" name="cardNumber3" size="2"> -
				<input type="text" name="cardNumber4" size="2">
			</td>
		</tr>
		<tr class="cardSel">
			<th>유효기간</th>
			<td><input type="text" name="validityMonth" size="2" placeholder="년"> / 
				<input type="text" name="validityYear" size="2" placeholder="월"></td>
		</tr>
		<tr class="cardSel">
			<th>카드종류</th>
			<td><select>
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
			<td><input type="text" name="email1"/> @ <input type="text" name="email2"/>
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
	</tbody>
	</table>
	
	<hr class="payhr">
	
	<table id="agreeTab">
		<tr><th><input type="checkbox" onclick="ckAllFn(this)">	전체동의</th></tr>
		<tr><td><input type="checkbox" class="agreeSelAll">	추가요금 자동결제 동의</td></tr>
		<tr><td><input type="checkbox" class="agreeSelAll">	서비스 이용약관 동의</td></tr>
		<tr><td><input type="checkbox" class="agreeSelAll">	개인정보 수집·이용 동의</td></tr>
		<tr><td><input type="checkbox" class="agreeSelAll">	수집한 개인정보의 제3자 정보제공 동의</td></tr>
		<tr><td><input type="checkbox" class="agreeSelAll">	위치기반 서비스 이용약관에 동의</td></tr>
		<tr><td><input type="checkbox" class="agreeSelAll">	만 14세이상입니다.</td></tr>
	</table>
	<hr class="payhr">
	
	<button id="payButton" type="button">결제하기</button>
	<h4 id="useNoticeTitle">이용권 사용안내</h4>
	<hr id="noticeHr">
	<table id="useNoticeTab">
		<tr><th><img class="noticeIcon" src="${path}/b01_img/useTime.png"></th><th>이용시간</th><td>이용 가능시간은 첫 회 대여시점을 기준으로 계산합니다.</td></tr>
		<tr><th><img class="noticeIcon" src="${path}/b01_img/rentalOffice.png"></th><th>사용 가능 대여소</th><td>서울자전거 모든 대여소에서사용이 가능합니다.</td></tr>
		<tr><th><img class="noticeIcon" src="${path}/b01_img/cancelORreturn.png"></th><th>취소, 환불</th><td>서울자전거 환불규정에 따릅니다<환불 규정 바로가기></td></tr>
		<tr><th><img class="noticeIcon" src="${path}/b01_img/transmission.png"></th><th>양도</th><td>이용권을 다른 사람에게 양도할 수 없으며,양도로 인해 발생하는 불이익은 구매자가 책임지셔야 합니다.</td></tr>
	</table>
	<br><br>
</body>
<script>
//-----------------------------전체체크 기능--------------------------------
var agreeSelAll=document.querySelectorAll(".agreeSelAll")
function ckAllFn(obj){
		//해당 내용이 checked가 true이면 전체 checked
		// false이면 전체 unchecked
	for(var idx=0;idx<agreeSelAll.length;idx++){
		agreeSelAll[idx].checked = obj.checked	
		// 각요소객체를 이벤트로 할당.
	}
}
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