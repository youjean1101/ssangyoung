

function goPage(cnt){
	$("[name=curPage]").val(cnt);
	$("#AdminSearchForm").submit()
}

//----------검색파트-----------검색파트-----------검색파트----------------




//클릭시 검색창과 버튼 값 서브밋 ㅋㅋ!!
$('.authorityradio').click(function(){
	$('#AdminSearchForm').submit();
})


//검색창의 검색 버튼눌렀을 때/엔터쳣을때, checked를 전체로 바꿔주기
function ResetAuthRadioSubmit(){
	
	$(":radio[name='search'][value='전체']").click();

}
//검색되고나서 해당 값에 checked해주기 ㅋㅋ!!
$(":radio[name='search']").each(function() {
	//SchAuthorityRadioVal 이 친구는 해당 jsp파일에서 ${sch.authority}로 선언해놨음
	// 이 파일에서는 ${}못 쓴다!!
	if( $(this).val() == SchAuthorityRadioVal)
	$(this).attr('checked', true);
});






//---------회원 탈퇴/체크박스---------회원 탈퇴/체크박스---------회원 탈퇴/체크박스--------------------------------



//전체 체크 처리
$("#cbx_chkAll").click(function() {
			//전체 체크박스가 클릭이면 전체다 클릭해라
				if($("#DeleteMembersForm #cbx_chkAll").is(":checked")){
				 $("#DeleteMembersForm input[name=email]").prop("checked", true);
				 }
			// 전체 쳌박이 헤제면 전체다 해제
				else{
					 $("#DeleteMembersForm input[name=email]").prop("checked", false);
				}
			});
			
			//개별 쳌박 클릭시
			$("#DeleteMembersForm input[name=email]").click(function() {
				var total = $("#DeleteMembersForm input[name=email]").length;
				var checked = $("#DeleteMembersForm input[name=email]:checked").length;
				
				console.log(total+":"+checked)
				
			// 전체 쳌박 갯수랑 일치하면 전체 쳌박도 체크
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
			// 아니면 끄셈
				else $("#cbx_chkAll").prop("checked", true); 
			});


//==========================================================================================
function DeleteMembersFormfun(){
	if($('#DeleteCheckOk').is(":checked")){
		$('#DeleteMembersForm').submit()
	}else{
		alert("탈퇴처리 동의체크를 해주세요.")
	}
}
