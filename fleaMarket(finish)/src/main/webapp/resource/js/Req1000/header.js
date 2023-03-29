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


 


  
  function kakaoLogOut(){
		
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        	
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	    location.href="Logout.do"
	  }  
	  
	  

 