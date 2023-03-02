var connected_at="";
var kakaoemail="";
//카카오로그인
Kakao.init('8a93693b514b55e6af5ef4f64d5ce6be'); //발급받은 키 중 javascript키를 사용해준다.
function kakaoLogin(){
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
    Kakao.Auth.login({
      scope:'profile_nickname,profile_image,account_email',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  connected_at = response.connected_at
        	  kakao_account = response.kakao_account
        	  if(typeof kakao_account != 'undefined'){
            	  kakaoemail = kakao_account.email;         	
              }
              if(Loginemail==''){SNSResult('kakao',kakaoemail)} //로그인 전이면
              //else{LinkSns('kakao',kakaoemail)} //로그인상태에서  	  	 
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
  
  //sns로그인 시도 존재유무 확인
function SNSResult(platforms,snsemail,name){
	var qstr = platforms=='kakao'?"snsemail="+snsemail:"name="+name
				$.ajax({
					url:"CheckPeristalsisSNS.do",
					type:"post",
					data:qstr,
					dataType:"json",
					success:function(data){
						console.log(data)
						if(data.CheckPeristalsisSNS==null){
							ResultModal('no',snsemail)
						}else{
							if(platforms=='kakao'){
								if(data.CheckPeristalsisSNS.kakaoemail==null){
									$('#SNSLoginbnt').text('카카오연동 및 바로 로그인')
									.css({"color":"black","background-color":"yellow"})
									$('#snsemail').val(snsemail)
									ResultModal('ok',snsemail)	 
								}else{
									location.href="Login.do?kakaoemail="+data.CheckPeristalsisSNS.kakaoemail
								}
							}else{
								if(data.CheckPeristalsisSNS.naveremail==null){
									$('#SNSLoginbnt').text('네이버연동 및 바로 로그인')
									.css({"color":"black","background":"green","border":"1px solid black"})
									$('#snsemail').val(snsemail)
									$('#snsname').val(name)
									ResultModal('ok',data.CheckPeristalsisSNS.email,name)
								}else{
									location.href="Login.do?naveremail="+data.CheckPeristalsisSNS.naveremail								}
							}
						}
					},
					error:function(xhr,status,error){
		                  console.log(xhr)
		                  console.log(status)
		                  console.log(error)
		            }
				})
}

// sns로그인 시도 후 처리결과
function ResultModal(sign,snsemail){
	if(sign=='ok'){
		$('#SNSLoginTextArea').val("<"+snsemail+">"+'로 가입된 기존 아이디가 있습니다.\r\n해당 SNS계정을 연동하시겠습니까?')
		$('#SNSLoginTextAreaAfter').text('')
		$('#SNSLoginbnt').removeAttr('data-bs-dismiss',"modal")
		$('#SnsresultModalbtn').click()
	}else{
		$('#SNSLoginTextArea').attr('rows','5')
		$('#SNSLoginTextArea').val(snsemail+'로 가입된 아이디가 없습니다.\r\n회원가입 후, 연동 부탁드립니다.\r\n\r\n로그인->(상단 오른쪽 회원메뉴)회원정보-> sns연동하기')
		$('#SNSLoginTextAreaAfter').text('만일 기존 이메일과 해당 SNS계정이 틀릴 경우 확인이 안되오니, 로그인 후 연동 부탁드립니다.')
		$('#SNSLoginbnt').attr('data-bs-dismiss',"modal")
		$('#SNSLoginbnt').text('확인')
		$('#SnsresultModalbtn').click()
	}
}	

//연동확인 후, 연동안되있을 때 연동하도록하기
$('#SNSLoginbnt').click(function(){
	  var snsemail = $('#snsemail').val()
	  var snsname = $('#snsname').val()
	  if($(this).text()=='카카오연동 및 바로 로그인'){
		  location.href='SnsEmailPlus.do?kakaoemail='+snsemail
	  }else if($(this).text()=='확인'){
		  
	  }else{
		 location.href='SnsEmailPlus.do?naveremail='+snsemail+"&name="+snsname 
	  }
  })
  
  
  //네이버 로그인 로고
  	var naver_id_login = new naver_id_login("WQO4B5GCMQKA06XHFOuA", "http://localhost:8090/fleaMarket/SignIn.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 3,40);
  	naver_id_login.setDomain("http://localhost:8090/fleaMarket/SignIn.do");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
// 네이버 로그인 기능
// var naver_id_login = new naver_id_login("WQO4B5GCMQKA06XHFOuA", "http://localhost:8090/fleaMarket/SignIn.do");
  // 접근 토큰 값 출력
 // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   console.log(naver_id_login.getProfileData('phonenumber'))
   console.log(naver_id_login.getProfileData('email'));
   window.opener.SNSResult('naver',naver_id_login.getProfileData('email'),naver_id_login.getProfileData('name'))
   window.close();
  }
  
 
 function MemberFindModal(method){
	 if(method=='id'){
		 $('#MemberFindTitle').text('아이디 찾기');
		 $('.MemberFindEmail_Wrap').slideUp();
	 }else if('pass'){
		 $('#MemberFindTitle').text('비밀번호 찾기');
		 $('.MemberFindEmail_Wrap').slideDown(); 
	 }
	 $('#MemberFindModalbtn').click()
 }
 
 function MemberFindHandler(){
	 var FindName = $('#MemberFindModal [name=name]');
	 var FindRrn = $('#MemberFindModal [name=personalnumber]');
	 var FindEmail = $('#MemberFindModal [name=email]');
	 var qstr;
	 var url;
	 
	 if(FindName.val().length<2){alert("이름은 2글자 이상입니다."); return false;}
	 if(FindRrn.val().length!=14){alert("주민번호는 -포함 14자리입니다."); return false;}
	 
	 
	 if( $('#MemberFindTitle').text()=='아이디 찾기'){
		 qstr = "name="+FindName.val()+"&personalnumber="+FindRrn.val()
		 url = "DuplicateMem.do" //회원가입시 중복검사 코드랑 동일해서 똑같이 사용함
		// MemberFindEmail(url,qstr)
	 }else{
		 if(FindEmail.val().length==0){alert("이메일을 기입해주세요");return false;}
		 qstr = "name="+FindName.val()+"&personalnumber="+FindRrn.val()+"&email="+FindEmail.val()
		 console.log(qstr)
		 url = "MemberFindPassword.do" 
		// MemberFindPass(url,qstr)
	 }
	 
	  $.ajax({
		url:url,
		type:"post",
		data:qstr,
		dataType:"json",
		success:function(data){
		 if( $('#MemberFindTitle').text()=='아이디 찾기'){
			console.log(data.DuplicateMem.email)
			$('#MemberFindResult').html("<span style='font-weight:bold;'>"+FindName.val()+"</span>님의 계정은<span style='font-weight:bold;'>"+data.DuplicateMem.email+"</span>입니다.")
			
		}else{
			console.log(data.MemberFindPassword)
			$('#MemberFindResult').html(data.MemberFindPassword)
		}
		},
		error:function(xhr,status,error){
		    console.log(xhr)
		    console.log(status)
		    console.log(error)
		}
	 })
	 
 }
 
 function MemberFindEmail(url,qstr){
	
 }
 

 