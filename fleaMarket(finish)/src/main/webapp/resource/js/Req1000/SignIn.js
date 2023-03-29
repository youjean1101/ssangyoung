 
  //네이버 로그인 로고
  	var naver_id_login = new naver_id_login("WQO4B5GCMQKA06XHFOuA", "http://223.26.182.204:7080/fleaMarket/SignIn.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 3,40);
  	naver_id_login.setDomain("http://223.26.182.204:7080/fleaMarket/SignIn.do");
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
   window.opener.SNSResult('naver',naver_id_login.getProfileData('email'),
   								naver_id_login.getProfileData('name'))
   window.close();
  }
 function MemberFindModal(method){
	 $('#MemberFindModal input[name=name]').val('')
	 $('#MemberFindModal input[name=personalnumber]').val('')
	 $('#MemberFindModal input[name=email]').val('')
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
 

 