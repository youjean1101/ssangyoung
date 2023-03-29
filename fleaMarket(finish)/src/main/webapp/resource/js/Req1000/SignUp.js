
	var OkEamil = false;
	var OkPass1 = false;
	var OkPass2 = false;
	var OkName = false;
	var OkRrn = false;
	var OkCheckName = false;
	var OkPhonenum = false;
	var OkAddress =false;
	var OkAuth=false;
	var OkBusiness =false;	
	var OkCategory=false;
	$('.SignUp_ProfileWrap').slideUp('slow') //사업자등록증 input

	
   
	 
	 
	//이메일 양식확인
$('#CheckEmailBtn').click(function(){
	var RegEmail = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[.0-9a-zA-Z])*.[a-zA-Z]$/i;
	var EmailVal = $('[name=email]').val()
	var Emaildoc = $('[name=email]')
	if(!RegEmail.test(EmailVal) || EmailVal==''){
		//$('pass1feedback').text('이메일 형식이 맞지않습니다.')
		Emaildoc.addClass('is-invalid')
		return false;
	}else{
		var qstr ="email="+EmailVal
		$.ajax({
			url:"DuplicateEmail.do",
			type:"post",
			data:qstr,
			dataType:"json",
			success:function(data){
				console.log(data)
				if(data.DuplicateEmail==null){
					Emaildoc.removeClass('is-invalid')
					Emaildoc.addClass('is-valid')
					sendEmail()
				}else{
					alert("중복된 이메일이 있습니다. 다시입력바랍니다.")
					$('#emailfeedback').text('중복된 이메일입니다.')
					Emaildoc.val('')
					Emaildoc.focus()
					Emaildoc.addClass('is-invalid')
				}
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
		
		
	}
})


//이메일 보내기
emailjs.init("mzN3R1G0GZQBRs8hh");
var SixRanNum = ""; 
        function sendEmail(){
        	SixRanNum=""
        	//6자 난수생성
        	for(let i = 0; i < 6; i++) {
        		SixRanNum += Math.floor(Math.random() * 10)
        	  }           	
        	console.log(SixRanNum)
          var templateParams = {
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                to_name: $('[name=email]').val(),
                to_email : $('[name=email]').val(),
                message : SixRanNum
                
          }
         emailjs.send('service_ee7pra4','template_azph6ba', templateParams)
         //emailjs.send('service ID', 'template ID > emailjs 페이지에서 만든 템플릿에서 확인이 가능하다', 보낼 내용이 담긴 객체)
         	    .then(function(response) {
         	       alert('입력하신 메일을 확인하시고, 인증번호를 입력부탁드립니다.')
         	       
         	    }, function(error) {
         	       alert('정상적인 제출이 이루어지지 않았습니다. 다시 시도해주세요!')
         	    });
       } 
        
 $('#checkEmailCode').keyup(function(){
	 console.log($(this).val())
	 console.log(SixRanNum)
    	 if($(this).val()==SixRanNum && $(this).val()!=''){
			 $('[name=email]').attr('readonly',true)
    		 $(this).attr('readonly',true)
    		 $(this).addClass("is-valid")
    		 OkEamil = true;
    	 }
      });
	 
	 
//비밀번호1 유효성
$('[name=password]').keyup(function chkPW(){
	 var pw = $(this).val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);
		 if(pw.length < 8 || pw.length > 16){
			 console.log(pw);
			 $('#pass1feedback').text("8자리 ~ 16자리 이내로 입력해주세요.")
			 $(this).addClass('is-invalid')
			 OkPass1 = false;		 
		 }else if(pw.search(/\s/) != -1){
			 $(this).removeClass('is-invalid')
			 $('#pass1feedback').text("비밀번호는 공백 없이 입력해주세요.")
			 $(this).addClass('is-invalid')
			 OkPass1 = false;
		 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			 $(this).removeClass('is-invalid')
			 $('#pass1feedback').text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.")
			 $(this).addClass('is-invalid')
			 OkPass1 = false;
		 }else {
			 $(this).removeClass('is-invalid')
			 $(this).addClass('is-valid')
			 OkPass1 = true;
		 }
})
//비번확인	
$('[name=password2]').keyup(function(){
	var pass1val = $('[name=password]').val()
	var pass2val = $(this).val()
	if(!OkPass1){
		alert("위 칸의 비밀번호부터 입력부탁드립니다.")
		$(this).val('')
		$('#password1').focus()
	}else{
		if(pass1val!=pass2val){
			$(this).removeClass('is-valid')
			$(this).addClass('is-invalid')
			OkPass2=false;
		}else{
			$(this).removeClass('is-invalid')
			$(this).addClass('is-valid')
			OkPass2=true;
		}
	}
})
$('[name=personalnumber]').keyup(function(){
	var RrnLength = $(this).val().length
	if(RrnLength!=14){
		$(this).addClass('is-invalid')
		$(this).removeClass('is-valid')
		OkRrn=false;
	}else{
		// 주민번호 정규식
		var RegRrn=/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
		if(!RegRrn.test($(this).val())){
			$(this).addClass('is-invalid')
			$(this).removeClass('is-valid')
		}else{
			$(this).addClass('is-valid')
			$(this).removeClass('is-invalid')
			console.log($('#SignUp_FullRrn').val())
			OkRrn=true;
		}
	}
})
 // 이름/주민번호 기존 여부확인
function CheckUser(){ 
	var NameValCheck = $('[name=name]').val().length>1
	var NameVal = $('[name=name]').val() //이름 value
	var RrnVal = $('[name=personalnumber]').val() //주민value
	if(!NameValCheck || !OkRrn){
		alert("이름/주민번호란을 맞게 채워주세요")
	}else{
		var qstr = "name="+NameVal+"&personalnumber="+RrnVal
		console.log(qstr)
		$.ajax({
			url:"DuplicateMem.do",
			type:"post",
			data:qstr,
			dataType:"json",
			success:function(data){
				console.log(data.DuplicateMem)
				if(data.DuplicateMem==null){
					alert("중복확인되었습니다. 감사합니다.")
					$('[name=name],[name=personalnumber]').attr('readonly',true)
					OkCheckName=true;
				}else{
					alert("일치하는 회원이 있습니다. 다시입력바랍니다.")
					$('[name=name],[name=personalnumber]').val('')
					$('[name=name]').focus()
				}
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
	}	
}
	
//프사 이미지 미리보기
function RenderImg(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
		console.log(e.target.result[0])
      $('#SignUpForm #SignUp_Profileimg').attr('src',e.target.result) ;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "https://cdn-icons-png.flaticon.com/512/8053/8053055.png";
  }
}


//폰번호 확인
	$('[name=phonenumber]').keyup(function(){
	var regPhone=/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if($(this).val().length==13){
			if(regPhone.test($(this).val())){
				
				$(this).removeClass('is-invalid')
				$(this).addClass('is-valid')
				OkPhonenum = true;
			}else{
				$(this).next().text('형식이 올바르지않습니다.')
				$(this).removeClass('is-valid')
				$(this).addClass('is-invalid')
				OkPhonenum = false;
			}
		}else{
			$(this).next().text('13자리가 아닙니다.')
			$(this).removeClass('is-valid')
			$(this).addClass('is-invalid')
			OkPhonenum = false;
		}
	})
		
//우편번호
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
            document.getElementById("sample6_detailAddress").focus();
            OkAddress=true;
        }
    }).open();
}
	//마지막스탭 이쁘게 하는고
   	$('.SignUp_cardgroup .card').click(function(){
		   //이뿌게하기
		   if($(this).attr('id')=="SignUp_SellerCard"){ //셀러를 고를경우  
		   	$(this).children('#AuthImg').attr('src','https://cdn-icons-png.flaticon.com/512/3981/3981099.png').css("transform","scale(1.4)")		
			$('#SignUp_buisnessmanCard #AuthImg').attr('src','https://cdn-icons-png.flaticon.com/512/1378/1378542.png')
						.css("transform","scale(1.0)")
			$('#SignUp_buisnessmanCard').css('background-color','white');
			$(this).children('#AuthCheckImg').css('display','block')
			$('#SignUp_buisnessmanCard').children('#AuthCheckImg').css('display','none')
			$('.SignUp_ProfileWrap').slideUp('slow')
			$('[name=authority]').val('일반셀러')
			OkAuth=true;
			OkBusiness=true;
		   }else{ //사업자를 고를경우
			//이뿌게하기
		   	$(this).children('#AuthImg').attr('src','https://cdn-icons-png.flaticon.com/512/1378/1378644.png').css('transform','scale(1.4)')
			$('#SignUp_SellerCard #AuthImg').attr('src','https://cdn-icons-png.flaticon.com/512/3981/3981072.png')
						.css("transform","scale(1.0)")
			$('#SignUp_SellerCard').css('background-color','white');
			$(this).children('#AuthCheckImg').css('display','block')
			$('#SignUp_SellerCard').children('#AuthCheckImg').css('display','none')
			alert("사업자 가입은 사업자 번호 인증을 완료해야합니다.")
			$('.SignUp_ProfileWrap').slideDown('slow')
			$('[name=buisnesscheck]').val('true');
			OkAuth=true;// 사업자등록등 넣게 유효성 검사
			OkBusiness=false;			
		   }
		   $(this).css('background-color','#f5f2f6')//선택한 카드 배경색처리
		   
	   })
	  
	 $('[name=buisnessfile]').change(function(){
		 if($(this).val()==''){
			 $(this).removeClass('is-valid')
			 $(this).addClass('is-invalid')			 
		 }else{
			 $(this).removeClass('is-invalid')
			 $(this).addClass('is-valid')	
		 }
	 })
	  
	  
// 사업자번호 확인 api
var buisnum = $('[name=businessnumber]')
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
			  $("#buisnessnumberfeedback").text('폐업자 혹은 존재하지않는 사업자번호입니다.')
			  buisnum.addClass('is-invalid');
		  }else{
			  //있으면 중복검샄ㅋ!
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
					 buisnum.removeClass('is-invalid');
					 buisnum.addClass('is-valid');
					 buisnum.attr('readonly',true);
					 $('[name=authority]').val('사업자')
					 OkbOkBusiness=true;
					 alert('사업자 확인되었습니다. 감사합니다.')
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

// 동의약관 전체 체크 처리
$("#cbx_chkAll").click(function() {
			//전체 체크박스가 클릭이면 전체다 클릭해라
				if($("#cbx_chkAll").is(":checked")){
				 $("input[name=Sucb]").prop("checked", true);
				 }
			// 전체 쳌박이 헤제면 전체다 해제
				else{
					 $("input[name=Sucb]").prop("checked", false);
				}
			});
			
			//개별 쳌박 클릭시
			$("input[name=Sucb]").click(function() {
				var total = $("input[name=Sucb]").length;
				var checked = $("input[name=Sucb]:checked").length;
				
				console.log(total+":"+checked)
				
			// 전체 쳌박 갯수랑 일치하면 전체 쳌박도 체크
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
			// 아니면 끄셈
				else $("#cbx_chkAll").prop("checked", true); 
			});

//위 동의약관 필수항목 두개 체크 시, 바깥 이용약관 동의
$('#Trem_2,#Trem_1,#cbx_chkAll').change(function(){
	if($('#Trem_2').is(':checked') && $('#Trem_1').is(':checked')){
		$('#TotTermCheck').prop("checked",true)
	}else{
		$('#TotTermCheck').prop("checked",false)
	}
})
	

	   //dd
	   
	//스탭넘기기전 유효성검사
	function CheckStepHandler(number){
		if(number==1){
		if(!OkEamil){alert("이메일 인증을 완료해주세요."); return false;}
		if(!OkPass2){alert("비밀번호를 알맞게 입력해주세요."); return false;}
		if(!OkCheckName){alert("기존 회원 여부 체크를 진행해주세요"); return false;}
		}else if(number==2){
		if(!OkPhonenum){alert("핸드폰번호를 정확하게 입력부탁드립니다."); return false;}
		if(!OkAddress){alert("우편번호 찾기를 통해서 주소기재 부탁드립니다."); return false;}
			console.log($('[name=profileimg]').val())
			if($('[name=nickname').val().length<2){
				$('[name=nickname]').val($('[name=email]').val().split('@')[0])
			}
			$('[name=address]').val($('#sample6_postcode').val()+"&"+$('#sample6_address').val()+"&"+$('#sample6_extraAddress').val()+"&"+$('#sample6_detailAddress').val())
			console.log($('[name=address]').val())
		}		
		return SignUpHandler(number);
	}
	
	
	
	//회원가입 다음스탭 이전스탭 넘기는 핸들러
	function SignUpHandler(number){
		var absnumber = Math.abs(number) //섹션 지정용 절대값
		var documentVal1 = '#SignUp_'+absnumber+'Section'; //기준섹션
		var documentVal2 = '#SignUp_'+(absnumber+1)+'Section'; //옮겨질 섹션
		var infomationText;//step에 출력될 문구 선언
		var Method; // 다음/이전 지정
		
		if(number==1){ //섹션에 표현될 문구 지정
			infomationText = '<span class="font-weight-bolder">step 2/3&nbsp;&nbsp;&nbsp;추가 정보를 기입해주세요</p>'			
		}else if(number==2){			
			infomationText = '<span class="font-weight-bolder">step 3/3&nbsp;&nbsp;&nbsp;마지막 정보를 선택해주세요</p>'		
		}else if(number==-2){
			infomationText = '<span class="font-weight-bolder">step 2/3&nbsp;&nbsp;&nbsp;추가 정보를 기입해주세요</p>'		
		}else if(number==-1){
			infomationText = '<span class="font-weight-bolder">step 1/3&nbsp;&nbsp;&nbsp;다음 정보를 입력해주세요.</p>'
		}	
		var Method = number>0?'next':'prev'; // 다음,이전 선택

		return SignUpSectionMove(documentVal1,documentVal2,infomationText,Method);
	}
	
	//핸들러에서 온 정보를가지고 이전/타음스탭 행동
	function SignUpSectionMove(documentVal1,documentVal2,infomationText,method){
		Section = document.querySelector(documentVal1); //두번째 섹션
		Section2 = document.querySelector(documentVal2); //두번째 섹션
		 document.querySelector('.Signup_infomation').innerHTML = infomationText;//step문구
		Section.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
		Section2.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
		if(method=='next'){
			Section2.style.display='block';
			Section.classList.add('animate__fadeOutLeft');
			Section2.classList.add('animate__fadeInRight');
		}else{
			Section.style.display='block';
			Section2.classList.add('animate__fadeOutRight');
			Section.classList.add('animate__fadeInLeft');
		}
	}
    
    

	//회원가입 완료 버튼
    function SignUp_Ok(){	
    	if(!OkAuth){alert("가입 유형을 선택해주세요."); return false;}
    	if($('[name=category]').val()=='카테고리 선택'){alert('카테고리를 선택해주세요.'); return false;}
    	if($('#TotTermCheck').is(':checked')==false){alert('이용약관 동의 이후 가입 완료 부탁드립니다.'); return false;}
    	$('#SignUpForm').submit()
    }