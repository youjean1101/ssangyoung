<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>서울자전거 따릉이 - 무인대여시스템</title>
<link href="/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.12.4.js"></script> 
<script src="/js/jquery-ui.js"></script>
<script src="/js/easing/jquery.easing.1.3.js"></script>
<script src="/js/gibberish-aes.js"></script>
<script src="/js/jquery.simpler-sidebar.min.js"></script>
<script src="/js/jquery-confirm.js"></script>
<script src="/js/comm.js"></script>
<script src="/js/common_spb.js"></script>

<link rel="stylesheet" href="/css/style_kr_v2.css?ver=0412" type="text/css">
<link rel="stylesheet" href="/css/common.css" type="text/css">
<link rel="stylesheet" href="/css/jquery-confirm.css">
<!--[if lt IE 9]>
<link href="/css/pw.css" title="ie8chn" rel="stylesheet" type="text/css" />
<script src="/js/html5.js"></script>
<script src="/js/respond.min.js"></script>
<![endif]-->
<style>
	.layer-wrap { display: none; position: fixed; left: 0; right: 0; top: 0; bottom: 0; text-align: center; background-color: rgba(0, 0, 0, 0.5); z-index: 9999;  } 
	.pop-layer { display: inline-block; vertical-align: middle; width: 330px; height: auto; background-color: #fff; border: 5px solid #3571B5; z-index: 9999; font-family:Tahoma; }
	.pop-layer .pop-container { padding: 5px 5px; } .pop-layer .btn-r { width: 100%; margin: 10px 0 10px; padding-top: 10px; border-top: 1px solid #DDD; text-align: center; } 
	a.btn-layerClose { display: inline-block; height: 25px; padding: 0 14px 0; border: 1px solid #304a8a; background-color: #3f5a9d; font-size: 13px; color: #fff; line-height: 25px; }
	.pop-layer button{ border-radius: 12px;  background-color: white; /* Green */  border: 2px solid #4CAF50;  color: black;  padding: 5px 10px;  text-align: center;  text-decoration: none;  display: inline-block;  font-size: 12px;  margin: 4px 2px;  -webkit-transition-duration: 0.4s; /* Safari */  transition-duration: 0.4s;  cursor: pointer;}
	.pop-layer button:hover{   background-color: #4CAF50;   color: white; }	
</style> 
</head>
<body class="mainWrap">
	<input type="hidden" id="tabId">

	<div id="layer" class="layer-wrap" style="display: none;visibility: hidden;"> 
		<div class="pop-layer"> 
			<div class="pop-container"> 
				<h1 style="color:blue; font-size:1.3em; margin:10px 0px">[따릉이-프레딧 연계이벤트]</h1>
				<span id="hyPopup">
					<img src="images/popup/hyPopUp.jpg" alt="hyPopupImg">
				</span>
				
				<p style="text-align:left; padding-top:10px;padding-left:20px;text-decoration: underline"><a href="/loginHy.do">따릉이 개인정보 제3자 제공 동의 이동 ☞</a></p>
					<p style="text-align:left; padding-top:10px;padding-left:20px;text-decoration: underline"><a href="https://m.fredit.co.kr/exhibition/fredit/eventFreditMainDetail.do?BBM_ID=1000008242" target="_blank">프레딧 페이지 이동 ☞</a></p>
				<p style="text-align:left; padding-top:10px;padding-left:20px;"><a href="tel:1577-3651" target="_blank">프레딧 고객센터( ☏ 1577-3651 ) </a></p>
				<p style="text-align:left; padding-top:10px;padding-left:20px;">1. 따릉이→프레딧 개인정보 제공동의(따릉이앱)</p>
				<p style="text-align:left; padding-top:10px;padding-left:20px;">2. 프레딧 정보등록(프레딧앱)</p>
				<p style="text-align:left; padding-top:10px;padding-left:20px;">3. 프레딧 내에서 적립내역 확인(익일)</p>
				
				
				<div class="btn-r"> 
					<button onclick="l_out_20220718()" >오늘 하루 열지 않음</button>
					<button onclick="l_fadeOut()">닫기</button>
				</div> <!--// content--> 
			</div> 
		</div>
	</div>
   
	<div class="wrap">
		<!--header-->
		<!--웹 : 헤더추가-->
    <div class="header_wrap">
        <div class="header">
        	<div class="top">
				<div class="m_sub_header_wrap">
					<div class="m_sub_header">
						<button class="back"></button>
						<button class="close"></button>
						<span id="title"></span>
					</div>
					<!-- //.m_sub_header -->
				</div>
				<!-- //.m_sub_header_wrap -->
			
        		<div class="m_menu">메뉴열기</div>
				<div class="m_global">언어선택</div>
				<div class="info"><a href="/info/infoReg.do">이용안내</a></div>
				<div class="alim"><a href="/app/mybike/getPushHistory.do">알림</a></div>
				<a class="join" href="/memberRegSelect.do?appOsType=">회원가입</a>
						<a class="login" href="/login.do">
							로그인</a>
					<div class="global">
					<ul>
						<li class="en"><a href="https://www.bikeseoul.com:457/main.do?lang=en">ENGLISH</a></li>
						<li class="ch"><a href="https://www.bikeseoul.com:457/main.do?lang=zh">中國語</a></li>
						<li class="ja"><a href="https://www.bikeseoul.com:457/main.do?lang=ja">日本語</a></li>
						<li class="ko"><a href="https://www.bikeseoul.com:457/main.do?lang=ko">한국어</a></li>
					</ul>
				</div>
				
				
			</div>
			<!-- 모바일 화면 -->
			<div class="logo"><a href="/main.do"><img src="/images/logo.png" alt="서울자전거 따릉이"></a></div>
            
            <!--메뉴(웹)-->
            <div class="menu_web">
                <ul>
                    <li><a href="/main.do#bike_info">사업소개</a></li>
                    <li><a href="/app/station/moveStationRealtimeStatus.do">대여소 조회</a></li>
                    <li><a href="/app/ticket/member/buyTicketList.do">이용권 구매</a></li>
                    <li><a href="/customer/opinionBoard/opinionBoardList.do">문의/FAQ</a></li>
                    <li><a href="/customer/notice/noticeList.do">공지사항</a></li>
                    <li><a href="/customer/faq/faqList.do">안전수칙</a></li>
                </ul>
            </div>
            <!--메뉴(웹)--> 
        </div>
        <!-- <div class="bike_tap">
		  	<ul>
				<li class="first"><span id="all">전체</span></li>
				<li class="second"><span id="lcd">LCD형</span></li>
				<li class="third"><span id="qr">QR형</span></li>
				<li class="forth"><span id="yg">새싹</span></li>
			</ul>
		</div>
		 <div class="remarks">
			<ul>
				<li class="title">&nbsp;</li>
				<li class="place01">LCD형,&nbsp;QR형&nbsp;반납가능</li>
				<li class="place02">QR형&nbsp;반납가능<span class="lcd">(LCD형&nbsp;반납불가)</span></li>
			</ul>
		</div>  -->
		<!-- //remarks -->
    </div>
    <!--웹 : 헤더추가--><script>
	
		function moveSnsViewPage(flag){
			
			var tUrl = "";
			if(flag === 'snsFacebook') {
				tUrl = "https://www.facebook.com/seoulbike";
		    } else {
		    	tUrl = "https://twitter.com/seoulbike";
		    }
			switch(window.osType){
			    case "web" :
			    	window.open(tUrl,"_blank");
			        break;
			    case "android" :
			        var pData = {targetUrl  :tUrl, returnFnc : "", title : "서울자전거sns" };
			        window.android.openWebviewPopup(JSON.stringify(pData));
			        break;
			    case "ios" : 
			        var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "서울자전거sns", "returnFnc" : "", "call":"openWebviewPopup"}';
			        window.location = iosUrl;
			        break;
		    }
		}
	</script>
<div class="mask">
			<div class="maskwrap">
				<div class="mask_close">닫기</div>
				<div class="change_lang" id="changeLang">
					<ul>
						<li class="en"><a href="https://www.bikeseoul.com:457/main.do?lang=en">ENGLISH</a></li>
						<li class="ch"><a href="https://www.bikeseoul.com:457/main.do?lang=zh">中國語</a></li>
						<li class="ja"><a href="https://www.bikeseoul.com:457/main.do?lang=ja">日本語</a></li>
						<li class="ko"><a href="https://www.bikeseoul.com">한국어</a></li>
				
					</ul>
				</div>
	  			<!-- //.change_lang -->
				<div class="search_content">
					<form id="frm"></form>
				 
					<form  class="search" id="search" role="search">
						<fieldset class="fld_sch">
							<legend class="screen_out">검색어 입력폼</legend>
							<div class="box_search">                    
								<input type="text" id="searchValue" value="" name="searchValue" title="검색어 입력" placeholder="원하시는 지역이 어디신가요?">
								<div id="search_data"></div>
							</div>
						</fieldset>
						<input type="hidden" name="searchType" id="searchType">
					</form>
					<!-- <script>$("select").styledSelect();</script> --> 
				</div>
				<!-- //.search_content -->
			</div>
			<!-- //.maskwrap -->
		</div> 
		<!-- //mask -->
	
		<!-- 정류장 정보 start -->
		<div class="location_info" style="display: none">
			<div class="location_info_wrap">
				<!-- 창닫기  -->
				<div class="mask_close location_close">
					창닫기                    
				</div>
				<!-- //.close -->

				<p class="location_name">
					<span id="location_id"></span>
					<span class="favorite_icon" id="favoriteBtn" style="display: none"><img src="img/favorite.png" alt="">즐겨찾기 등록취소</span>
					<span class="favorite_icon" id="favoriteBtn_off"><img src="img/favorite_off.png" alt="">즐겨찾기 등록</span>
					<span class="favorite_icon" id="reLoadBike" style="display: none">자전거 추가배치 요청</span>
				</p>

				<div class="location_box" id="location_02"> 
					<div class="name">일반 따릉이</div>
					<div class="num" id="parkingQRBikeCnt"></div>
				</div>
				
				<div class="location_box" id="location_03"> 
					<div class="name">새싹 따릉이</div>
					<div class="num" id="parkingELECBikeCnt"></div>
				</div>
			</div>
			<!-- //.location_info_wrap  -->
		</div>
		<!-- //location_info --> 
	 
		<!-- partyVoucherSeq 추가 20190829 -->
		<!-- 웹 메인 -->
		<div class="container" id="main">
			<div class="map" id="mapDiv">
				<div class="side_area">
					<a class="search_bike search_open">검색하기</a>
					<a class="refresh">새로고침</a>
					<a class="side_favorite">즐겨찾기</a>
					<a class="question">이용안내</a>
				</div>
				<!-- //side_area -->
				<div id='progress' style="display: none">
					<img src ='/img/loding.gif' class="lazyload" alt="이미지  대기용">
				</div>
			</div>
			<div class="main_image">
				<div class="content">
					<div class="login_box">
								<form name='loginForm' action="/j_spring_security_check" method="POST">
									<fieldset>
										<legend>로그인</legend>
										<a href="" class="close"></a>
										<p>로그인 후 자전거 대여하실 수 있습니다.</p>
										<div>
											<input class="inputlogin" onKeyPress="" name="j_username"  id="j_username" value="" size="18" maxlength="20" placeholder="아이디">
										</div>
										<div>
											<input class="inputlogin" onKeyPress="" name="j_password" value="" type="password" id="mempw" size="18" maxlength="20" placeholder="비밀번호">
										</div>
										<div class="autologin">
											<input type="checkbox" name="loginchk" id="logchk" title="자동로그인" value="true">
											<label for="logchk"><span></span>자동로그인</label>
										</div> 
										<a href="/memberIdFind.do" class="idpw_srch">아이디</a>/<a href="memberPwFind.do" class="idpw_srch">비밀번호찾기</a>
										<div class="btn">
											<input class="btn_login" type="button" title="로그인" value="로그인" id="loginBtn" onclick="loginFnc()">
										</div>
										<a href="https://www.bikeseoul.com:457/main.do?lang=ko" class="nonmember">비회원<img src="/images/arrow_login.jpg" alt=""></a>
										<a href="https://www.bikeseoul.com:457/main.do?lang=en" class="foreigner">foreigner<img src="/images/arrow_login.jpg" alt=""></a>
										
										<input type="hidden" id="ostype" name="appOsType"  value="web"> 
										<input type="hidden" id="usrDeviceId" name="usrDeviceId"> 
									</fieldset> 
								</form>
							</div>
						</div>    
			</div>
       
			<div class="main_tab">
				<ul>
					<li class="mt_1"><a href="/app/use/moveUseMenuRentCpn.do">대여방법</a></li>
					<li class="mt_2"><a href="/info/infoDuty.do">반납방법</a></li>
					<li class="mt_3"><a href="/app/station/moveStationRealtimeStatus.do">대여소현황</a></li>
					<li class="mt_4"><a href="/info/infoCoupon.do">이용요금안내</a></li>
					<!--li class="mt_4"><a href="/app/mybike/favoriteStation.do">대여하기</a></li-->
				</ul>
			</div>

			<div class="main" id="bike_info">
				<h1><img src="/images/ko/bikeseoul_web.png" alt="자전거와 함께하는 건강한 도시, 세계적인 자전거 도시 서울" class="lazyload"></h1>
				
				<div class="bikeseoul_bn">
				</div>
				
				<div class="rental_guide">
					<h2>대여소 안내</h2>
					<ul>
						<li class="guide_1">
							<div class="img"></div>
							<div class="info">
								<dl>
									<dt>대여소란?</dt>
									<dd>서울자전거를 대여하고 반납할수 있는<br>무인 정류장 형태의 자전거 거치 시설입니다.</dd>
								</dl>
							</div>
						</li>
						<li class="guide_2">
							<div class="img"></div>
							<div class="info">
								<dl>
									<dt>대여소의 위치</dt>
									<dd>
										대여소는 지하철 출입구, 버스정류장, 주택단지,<br>
										관공서, 학교, 은행 등 접근이 편리한 주변 생활시설<br>
										및 통행장소를 중심으로 운영하고 있습니다.
									</dd>
								</dl>
							</div>
						</li>
						<li class="guide_4">
							<div class="img"></div>
							<div class="info">
								<dl>
									<dt>이용방법</dt>
									<dd>
										대여소가 설치된 곳이면 어디에서나<br>
										'따릉이 앱'을 통해 서울 자전거를 대여하고<br>
										반납할 수 있습니다.
									</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
				
				<div class="rental_info">
					<h2>대여소 구성요소</h2>
					<ul>
						<li class="guide_1">
							<div class="img"></div>
							<div class="info">
								<dl>
									<dt>자전거</dt>
									<dd>누구나 이용할 수 있는 자전거로, 내구성이 강한 소재와 고급기어를 사용하여<br>주행 안정성과 편의성을 최우선으로 제작하였습니다.</dd>
								</dl>
							</div>
						</li>
						<li class="guide_2">
							<div class="img"></div>
							<div class="info">
								<dl>
									<dt>거치대</dt>
									<dd>
										거치대는 자전거를 안전하게 세워 보관하는 시설이며, 따릉이 고유 색상과 형태를 지녀<br>
										복잡한 서울 시내에서 쉽게 눈에 띄도록 제작되었습니다.
									</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
				
				<div class="main_app_info">	<!-- 480 #50a169 -->
					<div class="textArea">
						<h1>새롭게 단장하고 찾아온 따릉이 앱</h1>
						<p>
							간편해진 UI와 시스템으로, 사용자들이 더욱 편리하게 이용 할 수 있게 변신했습니다.<br>
							지금 바로 이용해 보세요.
						</p>
						
						<a href="https://apps.apple.com/kr/app/%EC%84%9C%EC%9A%B8%EC%9E%90%EC%A0%84%EA%B1%B0-%EB%94%B0%EB%A6%89%EC%9D%B4/id1037272004">
							<img src="/img/app_ios.png" alt="" class="">
						</a>
						<a href="https://play.google.com/store/apps/details?id=com.dki.spb_android&hl=ko&gl=US">
							<img src="/img/app_and.png" alt="" class="">
						</a>
					</div>
				</div>
				
			</div>
	</div>
</div>	
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=icuxwf317o&submodules=geocoder"></script> 
<script src="/js/newStation.js?ver=0412"></script>
<script src="/js/common_spb.js"></script>
<script src="/js/select/jquery.styled-select-box_main.js"></script>
<script src="/js/lazysizes.min.js" async></script>

<script>
	function l_fadeOut() {
		$('.layer-wrap').fadeOut();
	}
	
	function l_out_20220718(){
		$('.layer-wrap').fadeOut();
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + 1 );
		SetCookie("popUp", 1, todayDate);
	}
	
	function getCookie(cookie_name) {
	    var x, y;
	    var val = document.cookie.split(';');
	    for (var i = 0; i < val.length; i++) {
	        x = val[i].substr(0, val[i].indexOf('='));
	        y = val[i].substr(val[i].indexOf('=') + 1);
	        x = x.replace(/^\s+|\s+$/g, '');
	        // 앞과 뒤의 공백 제거하기
	        if (x == cookie_name) {
	            return unescape(y);
	            // unescape로 디코딩 후 값 리턴
	        }
	    }
	}
	
	$(function(){
		/*
		if( getCookie("popUp") == "1" ) {
			$('.layer-wrap').fadeOut();
		} else{
			$('.layer-wrap').show();
			$('.layer-wrap').css("visibility", "visible");
			$('.layer-wrap').css("display", "block");
		};
		
		
		var mbRegYn = '';
		if(mbRegYn == 'N'){
			alert('개인정보 변경이 필요합니다.');
			location.href = "/app/mybike/memberInfo/memberInfoEdit.do";
			return;
		}
		*/
		
		// $('.layer-wrap').hide();
	})
</script>

<script>

	var langClsCd = 'LAG_001';
	var appOsType = '';
	var positionBtnHtml = "<div class='position_re'><a href='#'>&nbsp;&nbsp;</a></div>";	// TODO 미사용 함수 
	// 2019.02.20 <div style='padding:10px'> 변경
	var locationBtnHtml = "<div style='padding:10px'><img src='/images/location_re.png'></div>";	// GPS 위치 아이콘
	var loginYn				= 'N';
	var rentClsCd			= '';
	var isChkRent			= 'false';												// Timer관련 
	var moveCount			= 0;
	var urlParam			= getUrlParams();												// TODO 자동로그인 관련 Trigger체크
	var doubleSubmitFlag	= false;														// TODO 대여 중복 체크용
	var favorite_flag 		= false;
	var fix_flag 			= false;
	var question_flag		= false;
	
	// 2019.02.20 조회 결과값 가져오는 변수 설정
	var autocompleteStationName = new Array();
	
	if(appOsType == "" || appOsType == "undefined"){
		if(getCookie("osType") != "" ||  getCookie("osType") != "undefined"){
			appOsType = getCookie("osType");
			window.osType = getCookie("osType");
		}else{
			if(urlParam["appOsType"] != ""){
				setCookie("osType", urlParam["appOsType"]);
				appOsType = urlParam["appOsType"];
				window.osType = urlParam["appOsType"];
			}
		}
	}
	
	var locLat = getCookie("locLat");
	var locLog = getCookie("locLog");
	
	if(locLat != ""){
		nMap.defaultLatitude = locLat;
	}
	if(locLog != ""){
		nMap.defaultLongitude = locLog;
	}
	 
	$(function(){
		
		var appOsType = '';
		resizeTab();
		
		$(".first > span").addClass("on");
		
		$(".m_global").click(function(){
			event.preventDefault();
			$(".location_info").css('display','none'); 
			$(".mask").css('display','block'); 
			$(".change_lang").css('display','block');
			
			$(".mask_close").click(function(){
				$(".mask").css('display','none'); 
				$(".change_lang").css('display','none'); 
			}); 

		});
 	 
		$(".search_open").click(function(){
			event.preventDefault();
			$("#searchValue").val("");
			$(".location_info").css('display','none'); 
			$(".mask").css('display','block'); 
			$(".search_content").css('display','block'); 
			
			$(".mask_close").click(function(){
				$(".mask").css('display','none'); 
				$(".search_content").css('display','none'); 
			});        
		});    
		
		$(".location_close").click(function(){
			$(".location_info").css('display','none'); 
		}); 

		var hw = $(window).height(); 
			hwtop = hw-90; 
		
		$(".map").css('height',hwtop);  
		
    	$("#loginBtn").on("click", this.loginFnc);
    	if (loginYn === 'N') {
    		if( idCheck() && loginYn !== "Y" ) return;
    	}

    	if('false' == 'true' && 'false' == 'false'){
			$.ajax({
				type		: 'post',
				url			: '/checkReconsentAjax.do',
				dataType	: 'json',
				data		: {},
				async		: false,
				success		: function(data){
		 			if(data.resultMessage == 'Success'){
						location.href = "/memberReconsent.do";
					}
				},
				error : function(jqXHR, textStatus,errorThrown){
					if(jqXHR.status === 500){
						alert(textStatus);
					} else {
						return false;
					}
					
				}
			});
		}
    	
    	if('' == 'Y'){
    		location.href = "/main.do";
    	}
    	
    	// TODO m_index 미존재
		history.pushState(null, null, location.href);
		window.onpopstate = function(event) {history.go(1)};
        
		// 20190829, && partyVoucherSeq == 0
		var partyVoucherSeq = '0';
		// 사용중 타이머 앱에서만 표출할지 고민 필요
		if (loginYn === 'Y'&& isChkRent == 'true' && rentClsCd !== '' && partyVoucherSeq == 0) {
			var returnTime = mysqlTimeStampToDate('');
			var now = new Date();
			var countTime = Math.floor((returnTime - now) / 60  / 1000);
			if(countTime < 0){
				$("#timename").text('초과시간');
				$("#countdown").text(Math.abs(countTime));
				var sum = Math.floor(Math.abs(countTime)/5) * 200;
				$("#exceedSum").text('예상초과금액 : '+comma(sum)+'원');
				countdown('countdown', parseInt(countTime));
			}else{
				$("#timename").text('남은시간');
				$("#countdown").text(parseInt(countTime));
				countdown('countdown', parseInt(countTime));
			}
		} else {
			resizeMap();
			window.osType = '';
			nMap.setMap(); 
			//locationBtnHtml
			//$(".location").html()
				var locationCustomControl = new naver.maps.CustomControl(locationBtnHtml, {
				position: naver.maps.Position.RIGHT_CENTER
			});
			
				//locationCustomControl.setMap(nMap.map);	// 지도에 내위치 찾기 아이콘 표시
			findLocation();

			var domEventListener = naver.maps.Event.addDOMListener(locationCustomControl.getElement(), 'click', function() {
				// 2019.02.20 parameter추가
				findLocation();
			});
			
			// 2019.02.20j
			$("#searchValue").on("click" , searhText); 
			// 2019.02.20
			naver.maps.Event.addListener(nMap.map, 'dragend', function() {
				nMap.updateMarkers();
			});

			naver.maps.Event.addListener(nMap.map, 'zoom_changed', function() {
				nMap.changeMarker();
			});
		}
		
		
		// 현재위치 아이콘 클릭 이벤트
		$(".location").on("click",function(){
			findLocation();
		})
		
		// 타임 이미지 클릭 이벤트
		$("#timerImg").on("click", function(){
			location.href="/main.do";
		});
		
		$(".new_float_icon").click(function(){
			$(".new_float_icon_mask").css('display','block');
			$(".new_float_info_wrap").css('display','block');  
			
			$(".new_float_close").click(function(){
				$(".new_float_icon_mask").css('display','none'); 
			});
		});
		
	});

	/**
	 * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
	 * @param str       : 체크할 문자열
	 */
	function isEmpty(str){
         
		if(typeof str == "undefined" || str == null || str == "")
			return true;
		else
			return false ;
	}; 

    
	loginFnc = function() {
    	
		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var usrId = $("[name='j_username']").val();
		var usrType = "01";
		var urlParam = getUrlParams();
		
		if( isEmpty ( $("[name='j_username']").val()) ){
			alert('로그인 아이디를 입력해주세요.');
			$("[name='j_username']").focus();
			return false;
		
		} else if(isEmpty ( $("[name='j_password']").val() )){	
			alert('로그인 비밀번호를 입력해주세요.');
			$("[name='j_password']").focus();
			
			return false;
		} else if($("[name='j_password']").val() == ""){
			alert('로그인 비밀번호를 입력해주세요.');
			$("[name='j_password']").focus();
			
			return false;
		
		} else {
			 
			//로그인 유지 체크
			var usrId = $("[name='j_username']").val();
			var usrPassword = $("[name='j_password']").val();
			var encodePassword = AES_Encode(usrPassword);
			var reEncodePassword = encodePassword.replace(/[\r|\n]/g, "");
			var jsonData = null;
			var loginInfo = null;
			var expdate = new Date();
			expDate = new Date(parseInt(expdate.getTime()));
			
			if($("#logchk").is(":checked") ){
				jsonData = {"id" : usrId, "pw" : reEncodePassword, "auto" : "Y", "snsType" : "", "call" : "setLogin"};
				loginInfo = JSON.stringify(jsonData);
				expDate.setFullYear(expDate.getFullYear() + 3);
				SetCookie("SPBcookieSaveid", usrId, expDate);
				SetCookie("SPBcookieSavepw", AES_Encode(usrPassword), expDate);
				loginSubmit();
			} else {
				jsonData = {"id" : "", "pw" : "", "auto" : "N", "snsType" : "", "call" : "setLogin"};
		  		loginInfo = JSON.stringify(jsonData);
				expDate.setDate(expDate.getDate() -1);//cookie delete
				SetCookie("SPBcookieSaveid", "", expDate);
				SetCookie("SPBcookieSavepw", "", expDate);
				loginSubmit();
			}
		}
	};
		 
	function loginSetSuccess(json){
		var deJson = decodeURIComponent(json);
		var saveLoginInfo = $.parseJSON(deJson.toString());
		loginSubmit();
	};

	function loginSubmit(){
		//1.자동로그인 체크		
		 if ($("[name='loginchk']").prop("checked") || $('#logchk').is(':checked') )
		{
			/* var pwde = AES_Encode($("#mempw").val());
			$("#mempw").val(pwde); */
		}else{			
			//transkey
			//mtk.fillEncData();
		} 	
		
		$("[name='loginForm']").attr("action", "/j_spring_security_check");
		$("[name='loginForm']").submit();
		
	};
	
	function setcookie() {
		
		//로그인 유지 체크
		var usrId = $("[name='j_username']").val();
		var usrPassword = $("[name='j_password']").val();
		var encodePassword = AES_Encode(usrPassword);
		var reEncodePassword = encodePassword.replace(/[\r|\n]/g, "");
		var jsonData = null;
		var loginInfo = null;
		var expdate = new Date();
		expDate = new Date(parseInt(expdate.getTime()));
		
		if($('#logchk').is(':checked')){
			jsonData = {"id" : usrId, "pw" : reEncodePassword, "auto" : "Y", "call" : "setLogin"};
			loginInfo = JSON.stringify(jsonData);
			
			expDate.setFullYear(expDate.getFullYear() + 3);
			SetCookie("SPBcookieSaveid", usrId, expDate);
			SetCookie("SPBcookieSavepw", usrPassword, expDate);  //  이미 암호화되어 있음.
		} else {
			jsonData = {"id" : "", "pw" : "", "auto" : "N", "call" : "setLogin"};
    		loginInfo = JSON.stringify(jsonData);
			
   			expDate.setDate(expDate.getDate() -1);//cookie delete
			SetCookie("SPBcookieSaveid", usrId, expDate);
			SetCookie("SPBcookieSavepw", usrPassword, expDate);
		}
	}; 
	
	function idCheck(){
		
		var loginid = cookieVal("SPBcookieSaveid");
		var loginpw = cookieVal("SPBcookieSavepw");
		if(loginid != "" && loginid != null){
			$("#loginCheck").addClass("on");
			$("#logchk").attr('checked', true);
			$("[name='j_username']").val(loginid);
			$("[name='j_password']").val(AES_Decode(loginpw));
			$("[name='j_username']").focus();
			$("[name='j_password']").focus();
			
			//자동로그인
			var urlParam = getUrlParams();
			
			if( urlParam["logout"] != "true"){
				$("#loginBtn").trigger("click");
				return true;
			}
		}
		
		return false;
	};
    
    // Timer 표출용
	function mysqlTimeStampToDate(timestamp) {
		var regex=/^([0-9]{2,4})-([0-1][0-9])-([0-3][0-9]) (?:([0-2][0-9]):([0-5][0-9]):([0-5][0-9]))?$/;
		var parts=timestamp.replace(regex,"$1 $2 $3 $4 $5 $6").split(' ');
		return new Date(parts[0],parts[1]-1,parts[2],parts[3],parts[4],parts[5]);
	};
 
	function getUsrGpsInfo() {
		if (navigator.geolocation) {
			var options = {
				enableHighAccuracy : true,
				timeout : 10000,
				maximumAge : 6000
			};
			
			//navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation, options);
			if ( realStationList == null || realStationList.length == 0 ) {
				navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation, options);
			} else {
				navigator.geolocation.getCurrentPosition(onSuccessGeolocation1, onErrorGeolocation1, options);
			}
			
		} else {
			alert("이 브라우저는 Geolocation를 지원하지 않습니다.");
			location.replace(returnSta.replaceUrl);
		}
	};
    
	 function findLocation( param ) {
	       try {
	             getUsrGpsInfo();
	         } catch( e ) {
	         onErrorGeolocation();
	      }
	       
	   };
    
	function doubleSubmitCheck(){
		if(doubleSubmitFlag){
			return doubleSubmitFlag;
		}else {
			doubleSubmitFlag = true;
			return false;
		}
	} 
    
	function goFavoriteStation(infoData) {
		
		if (loginYn == 'Y') {
			var usrSeq = '';
		       
			var inputAr = [$('<input>', {type : 'hidden', name : "stationId"}).val(infoData.stationId)
						,  $('<input>', {type : 'hidden', name : "usrSeq"}).val(usrSeq)];

			commonAjax.postAjax("/app/station/addFavoriteStationProc.do", "json", {usrSeq:usrSeq, stationId:infoData.stationId}	,function(data){
				if(data.checkResult > 0) {
					alert(data.resultMessage);
					location.reload();
					return false;
				} else {
					alert(data.resultMessage);
					return false;
				}
			}); 
		} else {
			alert( ( langClsCd == 'en' ? 'Available After Login' : '로그인 후 즐겨찾기가 가능합니다.' ));
			return false;
		}
	}
	
	function searhText(e){
		e.preventDefault();
		e.stopPropagation();
		
		if (e.type == "click") {
			//$("#guide_box").css('display', "none");
		}
	  	
		// 2019.02.20 추가 
		if ( autocompleteStationName.length > realStationList.length ) {
			autocompleteStationName = new Array();
			for( var i in realStationList ) {
				autocompleteStationName.push({
					label : realStationList[i].stationName,
					stationLatitude : realStationList[i].stationLatitude,
					stationLongitude : realStationList[i].stationLongitude
				});
			}
		}	
		
		$("#searchValue").autocomplete({
			source : autocompleteStationName 
			,matchContains: true
			,selectFirst: false
			,minLength: 2
			,autoFocus:true
			, select : function(e, ui, data ){
				if(nMap.map.zoom == 9){
					nMap.map.setZoom(12);
				}
				nMap.map.setCenter(  new naver.maps.LatLng(ui.item.stationLatitude, ui.item.stationLongitude ) )
				nMap.updateMarkers();

				$("#searchValue").val("");
				$("#search_data > ul > li").remove();
				$(".mask > ul").hide();
				$(".mask").hide();
			}
		});
		$("#searchValue").autocomplete("option", "appendTo", "#search_data");
				
	}
    
	function onSuccessGeolocation(position) {
		nMap.setGPSLoc( position.coords.latitude, position.coords.longitude );
	}
    
	function onErrorGeolocation() {
		nMap.searchCoordinateToAddress(new naver.maps.LatLng(nMap.defaultLatitude , nMap.defaultLongitude));
	}

	// 기존 위치 정보 찾은 경우는 조회 안함
	function onSuccessGeolocation1(position) {
		nMap.map.setCenter(  new naver.maps.LatLng( position.coords.latitude, position.coords.longitude )  );
		nMap.updateMarkers();
	}
    
	// 기존 위치 정보 찾은 경우는 조회 안함
	function onErrorGeolocation1() {
		this.alert("위치정보 실패하였습니다.");
	}
    
	function countdown(elementId, min) {
		var element, endTime, hours, mins, msLeft, time,timer;
		var timeTerm = 4;
		var timerID = "";
		if(rentClsCd =='RCC_005' || rentClsCd =='RCC_006'){
			timeTerm = 2;
		}
		var timeTermImg='nomal';
		var timeTermImgTmp= 0;
        
		function updateTimer(){
			msLeft = endTime - (+new Date);
			checkRentStatus();
			var ceil = Math.ceil(msLeft / 60) ;
			if ( Math.ceil(ceil / 1000) <= 0 ) {
				$("#timerImg").css({"background": "url('/img/timeline_late.png')", "background-position-x":"center", "background-repeat":"no-repeat", "position":"relative", "background-size":"100%"});
				alert('기본 대여시간이 초과 되었습니다.');//기본 대여 시간이 초과되었습니다. 다시 시도해주세요.
				clearTimeout(timerID);
				doubleSubmitFlag = false;
				chkTimeout = false;
			} else {
 
				time = new Date( msLeft );
				hours = time.getUTCHours();
				mins = time.getUTCMinutes();
				
				element.innerHTML = Math.floor(ceil / 1000);
				timerID = setTimeout( updateTimer, 60 * 1000);//특정시간 이후 함수 실행
				timerImg = Math.floor(25 - (Math.floor(ceil / 1000) * timeTerm / 10)) ;
				
				if (timerImg < 10) {
					timerImg = "0" + timerImg;
				}
				$("#timerImg").css({"background": "url('/img/timeline_"+timerImg+".png')", "background-position-x":"center", "background-repeat":"no-repeat", "position":"relative", "background-size":"100%"});
 			}
		}
		
		function checkRentStatus() {
		    	
			var usrSeq = '';
			var rentType = '';
		        
			commonAjax.postAjax("/app/rent/isChkRentStatus.do", "json", {usrSeq:usrSeq, rentType:rentType} ,function(data){
				if(data.isRent) {
					//alert('대여중');
				} else {
					//alert('반납');
					location.href="/main.do";
					return false;
				}
			}); 
		}
		  
		element = document.getElementById( elementId );
		endTime = (+new Date) + 1000 * min * 60;
		updateTimer();
	}
    
	function checkRent() {
	    	
		var rentType = 'RCC_001';
		var usrSeq = '';
        
		commonAjax.postAjax("/app/rent/isChkRentStatus.do", "json", {usrSeq:usrSeq, rentType:rentType} ,function(data){
			if(data.isRent) {
				//alert('대여 완료');
				location.href="/main.do";
				return;
			} else {
				return;
			}
        }); 
	}
 
	
</script>

<!-- <script src="/js/classie.js"></script> -->
<script>

	var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
	menuRight = document.getElementById( 'cbp-spmenu-s2' ),
	body = document.body;
		
	function disableOther( button ) {
		if( button !== 'showLeft' ) {
			classie.toggle( showLeft, 'disabled' );
		}
		if( button !== 'showRight' ) {
			classie.toggle( showRight, 'disabled' );
		}
	}
	
	function closeMenu() {
		$("#cbp-spmenu-s1").css('visibility', "hidden");
		$("#cbp-spmenu-s2").css('visibility', "hidden");
	}
	
	$(window).resize(function(){ //브라우저 창 사이즈가 변경될때마다 
	     resizeMap();
	     resizeTab();
	}); 

	function resizeMap() {
		var h = $(window).height(); //브라우저 창의 높이값을 가져와 
	    $('#mapDiv').css("height",h) //div#map 에게 높이값을 부여함 
	}
	
	// 현재위치 아이콘 클릭 이벤트
	$(".refresh").on("click",function(){
		findLocation();
		nMap.reloadData(new naver.maps.LatLng(), $("#tabId").val());
	});
	
	$(".m_menu").on("click", function(){
		location.href="/myLeftPage.do";
	});
	
	// 즐겨찾기 아이콘 클릭 이벤트
	$(".side_favorite").on("click", function(){
		if('N' == 'Y'){
			if(!favorite_flag){
				favorite_flag = true;
				location.href="/app/mybike/favoriteStation.do";	
				return;
			}
		}else{
			// 2019.02.20 영어 추가
			if(confirm( langClsCd == 'en' ? 'Available After Login' : '로그인 후 즐겨찾기가 가능합니다.')){
				doubleSubmitFlag = false;		// 2019.02.20 대여실패 시 추가
				location.href="/login.do";
				return false;
			}
		}
	});
	
	// 고장신고 아이콘 클릭 이벤트
	$(".fix").on("click", function(){
		if('N' == 'Y'){
			if(!fix_flag){
				fix_flag = true;
				location.href="/app/err/moveErrReportPage.do";	
				return;
			}
		}else{
			// 2019.02.20 영어 추가
			if(confirm( langClsCd == 'en' ? 'Available After Login' : '로그인 후 고장신고가 가능합니다.')){
				doubleSubmitFlag = false;		// 2019.02.20 대여실패 시 추가
				location.href="/login.do";
				return false;
			}
		}
	});
	
	// 이용안내 버튼 클릭
	$(".question").on("click", function(){
		if(!question_flag){
			question_flag = true;
			location.href="/info/infoReg.do";	
			return;
		}
	});
	
	function resizeTab(){
		if($(".renting").length != 0){
			if($(".tab1").hasClass("on")){
				$(".remarks").hide();
			}else{
				$(".remarks").show();
			}
			var w = $(window).width();
			if(w < 1024){
				$("#main").hide();
			}else{
				$("#main").show();
			}
		}
		
	}
	
	function popTutorial() {
		app.deviceType = window.osType;
		app.popTutorial();
	}
</script>  <!--footer-->

    <div class="footer_wrap">
        <div class="footer">
        	<div class="left">
            <ul>
                <!--<li><a href="">개인정보처리방침</a></li>
                <li class="line"><a href="">이메일주소무단수집거부</a></li>-->
                <li><a href="/app/use/moveUseMenuClauseInfo.do">이용약관</a></li>
                <li class="line"><a href="/app/use/moveUseMenuClauseInfo.do?tabInfo=2">개인정보처리방침</a></li>
                <li class="line"><a href="/app/use/moveUseMenuInsurance.do">보험안내</a></li>
                <li class="line"><a href="/customer/donor/donorList.do">도움주신 분</a></li>
            </ul>
            <p>서울특별시 중구 세종대로 110 서울특별시 대표자 오세훈, Tel : 1599-0120 (사업자등록번호 : 104-83-00469) 우편번호 04524</p>
            <p>COPYRIGHT ⓒ 2018 bikeseoul All RIGHTS RESERVED.</p>
            </div>
            <ul> 
               	<li style="background:url(/images/inc/instaLink.png) no-repeat; width:33px; height:33px; display:inline-block; cursor:pointer" class="instaLink" 		onclick="javascript:moveSnsViewPage('snsInsta')" 		title="인스타 링크" ></li>
               	<li style="background:url(/images/inc/facebookLink.png) no-repeat ; height:33px; display:inline-block; cursor:pointer" class="faceLink" 		onclick="javascript:moveSnsViewPage('snsFacebook')" 	title="페이스북 링크" ></li>
               	<li style="background:url(/images/inc/naverblogLink.png) no-repeat; width:33px; height:33px; display:inline-block; cursor:pointer" class="naverBlogLink" 	onclick="javascript:moveSnsViewPage('snsNaverBlog')" 	title="네이버블로그 링크" ></li>
            </ul>
        </div>
    </div>
    
    <div id="frogue-container" class="position-right-bottom"
              data-chatbot="be43e811-a4e0-4e6e-a400-27b72c0f31b9"
              data-user="사용자ID" data-init-key="value"></div>
    <!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
    <script>
    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'frogue-embed'));
    </script>
    
    
<!--footer-->

<script>

$(function() {
    $(".back").on("click", goBack);
});

$(function() {
    $(".back.left").on("click", goBackLeft);
});

$(function() {
    $(".back.right").on("click", goBackRight);
});

$(function() {
    $(".pwback").on("click", goBack);
});
$(function() {
    $(".close").on("click", goHome);
});
$(function() {
    $(".logo").on("click", goHome);
});
$(function() {
    $(".alim").on("click", goAlim);
});
$(function() {
    //$("#changeLang").on("click", changeLang);
});
function osInfo(pOSobj){
    var obj = JSON.parse(pOSobj);
    window.osType = obj.osInfo;
    
    //대여소 찿기 PDF 버튼 숨기기.
    if($("#pdfDiv") !== 'undefined') {
	    $("#pdfDiv").css("display","none");
    }
};

function goBack(e) {
	//e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    window.osType = '';
    //alert(window.osType);
    switch(window.osType){
    case "web" :
    	window.history.go(-1);      
        break;
    case "android" :
        window.android.goBack();
        break;
    case "ios" : 
        window.location = 'toApp://?{"call":"goBack"}';
        break;
    default :
    	window.history.go(-1);      
        break;
    }
}

function goBackLeft(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
   /*  switch(window.osType){
    case "web" :
        window.location.href='/main.do';     
        break;
    case "android" :
    	window.location.href='/main.do';
        break;
    case "ios" : 
    	window.location.href='/main.do';
        break;
    case "" :
    	window.location.href='/main.do';      
        break;    
    } */
}

function goBackRight(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    /* switch(window.osType){
    case "web" :
        window.location.href='/main.do';     
        break;
    case "android" :
    	window.location.href='/main.do';
        break;
    case "ios" : 
    	window.location.href='/main.do';
        break;
    case "" :
    	window.location.href='/main.do';      
        break;    
    } */
	/* switch(window.osType){
    case "web" :
    	window.history.go(-1);      
        break;
    case "android" :
        window.android.goBack();
        break;
    case "ios" : 
        window.location = 'toApp://?{"call":"goBack"}';
        break;
    case "" :
    	window.history.go(-1);      
        break;
    } */
}

function goHome(e) {
	setCookie("step", 0);
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    switch(window.osType){
    case "web" :
        window.location.href='/main.do';     
        break;
    case "android" :
    	window.location.href='/main.do';
        break;
    case "ios" : 
    	window.location.href='/main.do';
        break;
    default :
    	window.location.href='/main.do';      
        break;    
    }
}

function goAlim(e) {
    //e.preventDefault();
    //alert("2->"+e.type +":"+ window.osType);
    switch(window.osType){
    case "web" :
        window.location.href='/app/mybike/getPushHistory.do';     
        break;
    case "android" :
    	window.location.href='/app/mybike/getPushHistory.do';
        break;
    case "ios" : 
    	window.location.href='/app/mybike/getPushHistory.do';
        break;
    default :
        window.location.href='/app/mybike/getPushHistory.do';     
        break;    
    }
}

function changeLang(e) {
	var lang = 'en'

	switch(window.osType){
    case "web" :
        window.location.href='/main.do?lang='+lang;     
        break;
    case "android" :
    	window.location.href='/main.do?lang='+lang;
        break;
    case "ios" : 
    	window.location.href='/main.do?lang='+lang;
        break;
    default :
        window.location.href='/main.do';     
        break;    
    }
}

function moveSnsViewPage(flag){

    var tUrl = "";
    
    switch( flag ) {
        case 'snsFacebook' : 
        tUrl = "https://www.facebook.com/seoulbike";
        break;
        case "snsInsta" :
        tUrl = "https://www.instagram.com/seoulbike_/"
        break;
        case "snsNaverBlog" :
        tUrl = "https://m.blog.naver.com/PostList.nhn?blogId=2seoulbike"
        break;
    }
/*    
    if(flag === 'snsFacebook') {
        tUrl = "https://www.facebook.com/seoulbike";
    } else {
        tUrl = "https://twitter.com/seoulbike";
    }
 */   
    switch(window.osType){
        case "web" :
            window.open(tUrl,"_blank");
            break;
        case "android" :
            var pData = {targetUrl  :tUrl, returnFnc : "", title : "서울자전거sns" };
            window.android.openWebviewPopup(JSON.stringify(pData));
            break;
        case "ios" : 
            var iosUrl = 'toApp://?{"targetUrl" : "'+tUrl+'","title" : "서울자전거sns", "returnFnc" : "", "call":"openWebviewPopup"}';
            window.location = iosUrl;
            break;
        // 20200914 추가
        default :
            window.open(tUrl,"_blank");
            break;            
    }
}

		
</script>
</body>
</html>
