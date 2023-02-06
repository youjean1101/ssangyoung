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
<title>회원 이용권구매</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#userTicketSelTitle{
		margin-left:6%;
		margin-top:5%;
		font-weight:bold;
	}
	#TicketKindSelTab{
		width:90%;
		height:100px;
		font-size:12pt;
		margin-left:6%;
	}
	#TicketKindSelTab td{
		width:33%;
		border:20px solid white;
		
	}
	#TicketKindSelTab td button{
		width:100%;
		height:100%;
		border:1px solid grey;
		border-radius:5px;
		background:grey;
		color:white;
		outline:none;
	}
	#TicketguideTitle{
		margin-left:85%;
		font-size:9pt;
		font-weight:bold;
	}
	#guideBox{
		border:1px solid lightgrey;
		width:90%;
		margin-left:6%;
	}
	#guideBox li{
		font-size:10pt;
		line-height:30px;
	}
	#guideBox li span{
		color:red;
		font-weight:bold;
	}
	#ticketPayTab{
		width:80%;
		margin-left:10%;
		margin-top:3%;
		height:600px;
	}
	#ticketPayTab th{
		width:75%;
	}
	#ticketPayTab td{
		border:3px solid navy;
		width:25%;
	}
	#ticketPayTab div{
		border:2px solid black;
		width:95%;
		height:90%;
		font-size:14pt;
		margin-left:3%;
		box-shadow: 10px 10px grey;
		line-height:50px;
	}
	#ticketPayTab div #ticketSel{
		width:250px;
		height:40px;
		font-size:10pt;
	}
	#ticketPayTab div span{
		font-size:12pt;
		font-weight:normal;
	}
	input[name="payMethod"]{
		margin-left:100px;
	}
	#ticketPayTab input[type='radio']{
		width:20px;
		height:20px;
	}
	#payMethodinput{
		width:90%;
		margin-left:5%;
		font-size:11pt;
	}
	#payMethodinput th{
		border:1px solid black;
		text-align:center;
		font-weight:bold;
		background:rgb(219, 217, 217);
		opacity:0.7;
		width:30%;
		height:50px;
	}
	#payMethodinput td{
		border:1px solid black;
		width:70%;
		padding-left:3%;
	}
	#payMethodinput td .inputBox{
		width:100px;
		height:30px;
	}
	#payMethodinput select{
		border:none;
	}
	#sendbutton{
		background:rgb(67, 84, 100);
		color:white;
		border:none;
		width:150px;
		height:30px;
		font-size:10pt;
		outline:none;
	}
	#Timer{
		color:red;
		border:none;
		text-align:center;
	}
	#payMoneyTab{
		height:100%;
		width:90%;
		margin-left:5%;
		fontsize:16px;
		text-align:center;
	}
	#payMoneyTab td{
		border:none;
	}
	#payMoneyTab td button{
		width:100%;
		height:50px;
		background:navy;
		color:white;
		font-size:14pt;
	}
	#payMoneyTab td input[type="checkbox"]{
		width:20px;
		height:20px;
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
		// 티켓 선택에 따른 버튼 클릭
		var Sel = '${param.Sel}'
		if(Sel=="groupSel"){
			groupclick();
		}else if(Sel=="seasonSel"){
			seasonclick();
		}else{
			dayclick();
		}
		// 결제방식에 따른 출력 테이블
		$("input[name=payMethod]").change(function(){
			if($(this).val()=="phone"){
				$(".cardSel").css("display","none")
				$(".phoneSel").css("display","")
			}else{
				$(".phoneSel").css("display","none")
				$(".cardSel").css("display","")
			}
		})
		//이메일 기능메서드
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
		
		// 티켓 종류 버튼 클릭에 따른 종류부분 select,text 변경
		function dayclick(){
			$("#TicketKindSelTab button").css("background","")
			$("#day").css({"background":"rgb(76, 171, 106)"})
			$("#price").text("0 원")
			$("#price2").text("0 원")
			$("#totprice").text("0")
			$("#ticketKindText").text("일일권")
			ticketKindOptionshow+="<option style='display:none;'>선택</option>"
			ticketKindOptionshow+="<option value='1000'>일일회원(1시간권)</option>"
			ticketKindOptionshow+="<option value='2000'>일일회원(2시간권)</option>"
			$("#ticketSel").html(ticketKindOptionshow)
			ticketKindOptionshow=""
		}
		function seasonclick(){
			$("#TicketKindSelTab button").css("background","")
			$("#season").css({"background":"rgb(76, 171, 106)"})
			$("#price").text("0 원")
			$("#price2").text("0 원")
			$("#totprice").text("0")
			$("#ticketKindText").text("정기권")
			ticketKindOptionshow+="<option style='display:none;'>선택</option>"
			ticketKindOptionshow+="<option value='3000'>7일(1시간권)</option>"
			ticketKindOptionshow+="<option value='5000'>30일(1시간권)</option>"
			ticketKindOptionshow+="<option value='15000'>180일(1시간권)</option>"
			ticketKindOptionshow+="<option value='30000'>365일(1시간권)</option>"
			ticketKindOptionshow+="<option value='4000'>7일(2시간권)</option>"
			ticketKindOptionshow+="<option value='7000'>30일(2시간권)</option>"
			ticketKindOptionshow+="<option value='20000'>180일(2시간권)</option>"
			ticketKindOptionshow+="<option value='40000'>365일(2시간권)</option>"
			$("#ticketSel").html(ticketKindOptionshow)
			ticketKindOptionshow=""
		}
		function groupclick(){
			$("#TicketKindSelTab button").css("background","")
			$("#group").css({"background":"rgb(76, 171, 106)"})
			$("#price").text("0 원")
			$("#price2").text("0 원")
			$("#totprice").text("0")
			$("#ticketKindText").text("단체권")
			ticketKindOptionshow+="<option style='display:none;'>선택</option>"
			ticketKindOptionshow+="<option value='1000'>단체(1시간권)</option>"
			$("#ticketSel").html(ticketKindOptionshow)
			ticketKindOptionshow=""
		}
		
		var ticketKindOptionshow=""
		$("#TicketKindSelTab button").click(function(){
			if($(this).val()=="group"){ //일일권 버튼 클릭 시,
				groupclick()
			}else if($(this).val()=="season"){ //정기권 버튼 클릭 시,
				seasonclick()
			}else{
				dayclick()
			}
		})
		
		// 티켓 종류에 따른 가격변경 기능
		$("#ticketSel").change(function(){
			$("#price").text($(this).val()+" 원")
			$("#price2").text($(this).val()+" 원")
			$("#totprice").text($(this).val())
		})
		
	});
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<h3 id="userTicketSelTitle">이용권 구매</h3>
	<table id="TicketKindSelTab">
		<tr>
			<td><button type="button" value="day" id="day">일일권</button></td>
			<td><button type="button" value="season" id="season">정기권</button></td>
			<td><button type="button" value="group" id="group">단체권</button></td>
		</tr>
	</table>
	<h4 id="TicketguideTitle">ⓘ 이용권 사용 안내</h4>
	<div id="guideBox">
		<ul>
			<li>1회 1매씩 구매가 가능합니다.
			<li><span>대여시간은 1시간이며, 정해진 기간동안, 대여 반납이 가능합니다.</span>
			<li>초과시 5분마다 추가요금(200원)과금됩니다.<br>
					<span>예시) 기본 초과 1분 ~ 5분 : 200원, 6분 ~ 10분 : 400원</span>
			<li>추가요금은 이용권 결제수단으로 자동결제됩니다.
		</ul>
	</div>
	<table id="ticketPayTab">
		<tr><th>
			<div id="ticketKind">&nbsp &nbsp<span style="font-size:14pt; font-weight:bold;" id="ticketKindText">일일권</span> 종류 선택<br>
				&nbsp &nbsp &nbsp
				<select id="ticketSel">
					<option>선택</option>
				</select>
				<span id="price" style="margin-left:50%;font-weight:bold;">0 원</span>
			</div>
			</th>
			<td rowspan="3">
				<table id="payMoneyTab">
					<tr><td style="font-weight:bold; font-size:20pt; text-align:left;">결제금액</td><td></td></tr>
					<tr><td colspan="2"><hr style="border:3px solid navy; background:navy;"></td></tr>
					<tr><td>이용권</td><td id="price2">0원</td></tr>
					<tr><td colspan="2"><hr style="border:3px solid navy; background:navy;"></td></tr>
					<tr><td></td><td><span id="totprice" style="font-size:25pt; color:green; font-weight:bold;">0</span>원</td></tr>
					<tr><td colspan="2">
						<input type="checkbox">
						추가요금자동결제,환불규정, 이용약관에 동의하며 결제를 진행합니다.(이용권 사용안내)
						</td>
					</tr>
					<tr><td colspan="2">
						<input type="checkbox">
						만 13세 미만의 미성년자가 서비스를 이용하는 경우, 사고 발생 시 보험 적용을 받을 수 없는 등의 불이익을 받으실 수 있습니다. (만 15세 미만의 경우 상법 제732조에 의거하여 사망 보험 적용 불가)
						</td>
					</tr>
					<tr><td colspan="2">
						<button type="button">결제하기</button>
						</td></tr>
				</table>
			</td></tr>
			
		<tr><th>
			<div id="ticketbuyMethod">&nbsp &nbsp결제<br>
				&nbsp &nbsp &nbsp
				<input type="radio" name="payMethod" value="card"/> <span>신용/체크카드</span>
				<input type="radio" name="payMethod" value="phone"/> <span>휴대폰결제</span>
				<input type="radio" name="payMethod" value="getPayMethod"/> <span>등록수단</span>
			</div>
			</th></tr>
		<tr><th style="height:300px;">
			<table id="payMethodinput">
				<tr class="phoneSel" style="display:none;"><th>휴대전화번호</th>
					<td><select class="inputBox">
							<option>SKT</option>
							<option>KT</option>
							<option>LG U+</option>
						</select>
					<input type="text" class="inputBox"> - <input type="text" class="inputBox"> - <input type="text" class="inputBox"></td></tr>
				<tr class="phoneSel" style="display:none;">
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
				<tr class="cardSel" style="display:none;">
					<th>카드번호</th>
					<td><input type="text" name="cardNumber1" size="2"> -
						<input type="text" name="cardNumber2" size="2"> -
						<input type="text" name="cardNumber3" size="2"> -
						<input type="text" name="cardNumber4" size="2">
					</td>
				</tr>
				<tr class="cardSel" style="display:none;">
					<th>유효기간</th>
					<td><input type="text" name="validityMonth" size="2" placeholder="년"> / 
						<input type="text" name="validityYear" size="2" placeholder="월"></td>
				</tr>
				<tr class="cardSel" style="display:none;">
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
				<tr class="cardSel" style="display:none;">
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
			</table>
			</th></tr>
	</table>
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