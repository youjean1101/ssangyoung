console.log(SessAddress.split('&')[0])
console.log(SessAddress.split('&')[1])
console.log(SessAddress.split('&')[2])
console.log(SessAddress.split('&')[3])

$('#MemberInfoForm #sample6_postcode').val(SessAddress.split('&')[0])
$('#MemberInfoForm #sample6_address').val(SessAddress.split('&')[1])
$('#MemberInfoForm #sample6_extraAddress').val(SessAddress.split('&')[2])
$('#MemberInfoForm #sample6_detailAddress').val(SessAddress.split('&')[3])
$('#MemberInfoForm select[name=category]').val(SessCategory).prop('selected',true)


//이미지 미리보기
function RenderImg(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
		console.log(e.target.result[0])
      $('#MemberInfoForm #MemberInfo_Profileimg').attr('src',e.target.result) ;
      $('#MemberInfoForm input[name=profileimgname]').val(input.files[0].name);
       
    };
    reader.readAsDataURL(input.files[0]);
    
  } else {
    document.getElementById('preview').src = "";
  }
}


function AddressApi() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").readOnly = false; 
            document.getElementById("sample6_detailAddress").focus();
            
        }
    }).open();
}


// 회원정보 수정
$("#UptInfoBtn").click(function(){
	var addresscheck = $('#MemberInfoForm input[name=address]').val()
	
	var MemberInfoAddress = $('#MemberInfoForm input[name=address]').val(
		$('#MemberInfoForm #sample6_postcode').val()
		+"&"+$('#MemberInfoForm #sample6_address').val()
		+"&"+$('#MemberInfoForm #sample6_extraAddress').val()
		+"&"+$('#MemberInfoForm #sample6_detailAddress').val())
	//닉네임
	if($('#MemberInfoForm input[name=nickname]').val().length<2 ||$('#MemberInfoForm input[name=nickname]').val().length>21){
		$('#MemberInfoForm input[name=nickname]').addClass('is-invalid')
		$('#MemberInfoForm input[name=nickname]').focus()
		return false;
	} 
	//폰번
	if($('#MemberInfoForm input[name=phonenumber]').val().length!=13){
		$('#MemberInfoForm input[name=nickname]').addClass('is-invalid')
		$('#MemberInfoForm input[name=nickname]').focus()
		return false;
	}
	
	if($("#MemberInfo_category").val()=='카테고리 선택'){
		$("#MemberInfo_category").addClass('is-invalid')
		$("#MemberInfo_category").focus()
		return false;//ㅋㅋㅋ
	}
	
	var addresscheck = $('#MemberInfoForm input[name=address]').val()== SessAddress?false:true;
	var categorycheck = $('#MemberInfoForm select[name=category]').val() == SessCategory?false:true;
	//console.log($('#MemberInfoForm select[name=category]').val(),SessCategory)
	var nicknamecheck = $('#MemberInfoForm input[name=nickname]').val() == SessNickname?false:true;
	var phonenumbercheck = $('#MemberInfoForm input[name=phonenumber]').val() == SessPhonenumber?false:true;
	var profileimgcheck = $('#MemberInfoForm input[name=profileimgname]').val() == SessProfileimg?false:true;
	var authcheck = $('#MemberInfoForm input[name=authority]').val() ==SessAuth?false:true;
	//console.log(addresscheck,categorycheck,nicknamecheck,phonenumbercheck,profileimgcheck,authcheck)
	if(!addresscheck&&!categorycheck&&!nicknamecheck&&!phonenumbercheck&&!profileimgcheck&&!authcheck){
		Swal.fire({
		  icon: 'info',
		  title: '변경사항이 없습니다.',
		  showConfirmButton: false,
		  timer: 1500
		})
		return false;
	}
	
  $("#MemberInfoForm").submit();
});
	
//키
	$('#UpdatePasswordForm input').keyup(function(){
		$(this).removeClass('is-invalid')
	})
//비밀번호 수정 
$("#uptPassBtn").click(function(){
    var CurrentPassword = $('#UpdatePasswordForm #CurrentPassword')
    var uptPassword = $('#UpdatePasswordForm input[name=password]')
    var uptPassword2 = $('#UpdatePasswordForm #password2')

    if (SessPassword=='1111' && SessPassword!=CurrentPassword.val()) {
        console.log('여긴가?'+SessPassword+":"+CurrentPassword)
        CurrentPassword.addClass('is-invalid')
        Swal.fire({
            icon: 'error',
            text: '비밀번호가 일치하지않습니다.'
        })
        return false;
    }

    if (SessPassword!='1111' && MatchPassword(CurrentPassword.val())=='false') {
        console.log('아니면 여긴가?'+SessPassword+":"+CurrentPassword)
        CurrentPassword.addClass('is-invalid')
        Swal.fire({
            icon: 'error',
            text: '비밀번호가 일치하지않습니다.'
        })
        return false;
    }

    if (!chkPW(uptPassword.val())) {
        uptPassword.addClass('is-invalid')
        Swal.fire({
            icon: 'error',
            text: '비밀번호 형식이 올바르지 않습니다.'
        })
        return false;
    }

    if (!chkPW2(uptPassword.val(),uptPassword2.val())) {
        uptPassword2.addClass('is-invalid')
        Swal.fire({
            icon: 'error',
            text: '1차 비밀번호와 일치하지 않습니다.'
        })
        return false;
    }

    if (MatchPassword(uptPassword.val())=='true') {
        Swal.fire({
            icon: 'error',
            text: '기존 비밀번호와 다른 비밀번호를 설정해주세요.'
        })
         return false;
    }  
    $("#UpdatePasswordForm").submit();
});
//비밀번호1 유효성 ----------------------------------------------------------------------
function chkPW(pass){
	 var pw = pass;
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);
		 if(pw.length < 8 || pw.length > 16){	 
			return false;		 
		 }else if(pw.search(/\s/) != -1){	
			 	return false;
		 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			 	return false;
		 }else {
			 	return true;
		 }
}


//비번확인	----------------------------------------------------------------------
function chkPW2(pass1val,pass2val){
		if(pass1val!=pass2val){		
			return false;
		}else{	
			return true;
		}
	
}

//회원탈퇴
function LeaveMember(){
	let deletecheck = MatchPassword($('#LeaveMemberForm input[name=password]').val())
	
	if(deletecheck=='false'){
		alert("비밀번호가 일치하지 않습니다.")
		$('#LeaveMemberForm input[name=password]').addClass('is-invalid')
		return false;
	}
	if(deletecheck=='true'){
		if(!comfirm("정말 탈퇴하시겠습니까?")){
			return false;
		}else{
			return true;
		}
	}
 return false;
}

//회원탈퇴, 비번변경시 기존 비번 일치하는지 확인
function MatchPassword(pass){
	var MatchResult="";
	var qstr ="password="+pass+"&sespassword="+SessPassword
		$.ajax({
			url:"MatchPassword.do",
			type:"post",
			data:qstr,
			async: false,
			dataType:"json",
			success:function(data){
				console.log(data.MatchPassword)
				MatchResult =data.MatchPassword;
				
				
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
	return MatchResult;
}
	


//사업자 확인 api ----------------------------------------------------------------------
var buisnum = $('#BusinessUpdateModal input[name=businessnumber]')
function exp0101(){
buisnum.removeClass('is-invalid');
if(buisnum.val().length<10){
	$("#buisnessnumberfeedback").text('사업자 번호를 10자리입니다.')
	buisnum.addClass('is-invalid');
	return false;
}
if(buisnum.val().length>10){
	$("#buisnessnumberfeedback").text('숫자만으로 10자리를 입력해야합니다.')
	buisnum.addClass('is-invalid');
	return false;
}
var data = {"b_no":[buisnum.val()]};   
	$.ajax({
	  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=qaJs1GHTyoLGcztYwOmuuQrV8qrgsos8R3r%2FpIQdyqX2HWAX%2Fy8tlU33sKXL0L0XkV%2FBAGqk8BT8KMVPoZn25g%3D%3D",  // serviceKey 값을 xxxxxx에 입력
	  type: "POST",
	  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
	  dataType: "JSON",
	  contentType: "application/json",
	  accept: "application/json",
	  success: function(result) {
	      console.log(result);
	      var buisstatus=result.data[0].b_stt; //폐업자 / ''
	      if(buisstatus=='폐업자' || buisstatus==''){
			  buisnum.addClass('is-invalid');
		  }else{
			  checkBusiness(buisnum.val())
			 
		  	}
	  },
	  error: function(result) {
	      console.log(result.responseText); //responseText의 에러메세지 확인
	  }
	});
} 

function checkBusiness(businum){
	$.ajax({
			url:"checkBusiness.do",
			type:"post",
			data:"businessnumber="+businum,
			dataType:"json",
			success:function(data){
				if(data.checkBusiness==0){
					  $('#MemberInfoForm input[name=authority]').val('사업자')
					  $('#MemberInfoForm input[name=businessnumber]').val(buisnum.val())
					   buisnum.addClass('is-valid');
					   buisnum.attr('readonly',true);
					   console.log(buisnum.val())
					   if(confirm('사업자 확인되었습니다. 사업자로 전환하시겠습니까?')){
						   $('#MemberInfoForm').submit()
						}else{
							location.reload()
						}
				}else{
					 buisnum.addClass('is-invalid');
					 alert('이미 가입되어있는 사업자 번호입니다. 다시 입력 바랍니다.')
					 buisnum.val('')
					 buisnum.focus()
				}
				
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
}

//기본이미지로 변경하기----------------------------------------------------------------------
function ChangeDefualtProfile(){
	$('#MemberInfoForm input[name=profileimgname]').val('defaultprofile.png')
	$('#MemberInfo_Profileimg').attr('src','/fleaMarket/resource/img/Member/profileimg/defaultprofile.png')
}

//네이버연동-------------------------------------------------------------

 //네이버 로그인 로고
  	var naver_id_login = new naver_id_login("WQO4B5GCMQKA06XHFOuA", "http://223.26.182.204:7080/fleaMarket/MemberInfo.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 3,40);
  	naver_id_login.setDomain("http://223.26.182.204:7080/fleaMarket/MemberInfo.do");
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
   window.opener.naverSnsplus(naver_id_login.getProfileData('email'))
   window.close();
  }
  
  function naverSnsplus(naveremail){
	  location.href="SnsEmailPlus.do?email="+SessEmail+"&naveremail="+naveremail
  }
  
  
  