var id="";
var connected_at="";
var email="";
var gender="";
//카카오로그인
Kakao.init('3f3833946c18cf3c7278e2509e86c4ae'); //발급받은 키 중 javascript키를 사용해준다.
function kakaoLogin(){
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
    Kakao.Auth.login({
      scope:'profile_nickname,profile_image,account_email,gender,birthday',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  id = response.id
        	  connected_at = response.connected_at
        	  kakao_account = response.kakao_account
        	  if(typeof kakao_account != 'undefined'){
            	  email = kakao_account.email;
            	  gender = kakao_account.gender; 
            	  profile_image = kakao_account.profile.profile_image_url;
              }
        	  console.log(id+":"+connected_at+":"+email+":"+gender+":"+profile_image)
        	  location.href="./Login/LoginAccess.jsp?Login_email="+email+"&profile_image="+profile_image; 
        	  
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