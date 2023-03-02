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
function UpdateInfo(){
	var MemberInfoAddress = $('#MemberInfoForm input[name=address]').val(
		$('#MemberInfoForm #sample6_postcode').val()
		+"&"+$('#MemberInfoForm #sample6_address').val()
		+"&"+$('#MemberInfoForm #sample6_extraAddress').val()
		+"&"+$('#MemberInfoForm #sample6_detailAddress').val())
	//닉네임
	if($('#MemberInfoForm input[name=nickname]').val().length<2){
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
	return true;
	}

