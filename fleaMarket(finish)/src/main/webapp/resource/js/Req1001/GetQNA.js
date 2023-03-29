$(document).ready(function(){
		//내용 입력시 input에 할당
		$('#editor .ql-editor').keyup(function(){
		 	var expeditor=$(this).html() 
			$('input[name=content]').val(expeditor);
		})
			
		
});

//뒤로가기
$("#goQnaList").click(function(){
location.href="QNAList.do"	
})
	
	
//수정 
$("#uptBtn").click(function(){
	Swal.fire({
	   icon: 'succcess',
       text: '수정이 완료되었습니다. 감사합니다.',
       confirmButtonText: '확인'
    }).then((result) => {
       if (result.value) {
         $("#uptForm").submit();
       }
    })   
})
//삭제 
$('#delBtn').on('click', function() {
    Swal.fire({
       title: '삭제하시겠습니까?',
       icon: 'warning',
       showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
       confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
       cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
       confirmButtonText: '확인', // confirm 버튼 텍스트 지정
       cancelButtonText: '취소' // cancel 버튼 텍스트 지정
    }).then((result) => {
       if (result.value) {
    	   var qnano = $('#delBtn').data('qnano');
    	   $('#deleteForm [name=qnano]').val(qnano);

         $("#deleteForm").submit();
       }
    })   
 })


$('#QNAAnswerBtn').click(function(){

var anstitle = $('input[name=title]').val()
var ansqnano = $('input[name=qnano]').val()
var anssecretwhether = $('input[name=secretwhether]').val()


location.href="MemberQnAreg.do?method=a&title="+anstitle+"&refno="+ansqnano+"&secretwhether="+anssecretwhether
})

