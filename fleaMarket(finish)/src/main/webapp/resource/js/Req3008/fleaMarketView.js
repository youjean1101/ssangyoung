   $(document).ready(function(){   
	    // 모집 상태
		var $today = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -14); // 현재 날짜 yyyy-MM-dd		
		var $sdate = (new Date($startDate)).toISOString().substring(0,10) // 모집 시작일
		var $edate = (new Date($endDate)).toISOString().substring(0,10) // 모집 마감일
		if($today < $edate || $today == $edate){ // 오늘이 마감일 이전이거나 같으면 
			$('.badge').addClass( 'badge-success' );
			$('.badge').text("모집중");
		}else{
			$('.badge').addClass( 'badge-danger' );
			$('.badge').text("모집마감");
			$("#appBtn").hide(); // 신청하기 버튼 숨기기
		}
		
	   	// 모달창 확인 버튼
		$("[name=regBtn]").click(function(){
			// 파일 첨부 검사
			if($("#appFile").val()==""){
				 insFileAlert();
			     return false;
			 }
			return true;
			$("#frmfile").submit();
		})
	});
	    
	// 신청 버튼 클릭 시 유효성 
	function appCheck(){
		// 로그인 검사
		if($sessEmail==""){
			// 모달창 열리지 않게
			$(this).removeAttr("data-bs-toggle");
			$(this).removeAttr("data-bs-target");
			signInAlert();
		}else{
			// 중복 신청 검사
			var qstr ="postingNumber="+postingNumber+"&email="+$sessEmail
			$.ajax({
				url:"duplicateApp.do",
				type:"post",
				data:qstr,
				dataType:"json",
				success:function(data){
					var cnt=data.duplicateApp;
					
					if(cnt == 0){
						$("#appModal").click();
					}else{
						dupAlert();
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
    
	// alert
	var alert = function(alertIcon, msg) {
		Swal.fire({
		    icon:alertIcon,
	        text:msg,
	        confirmButtonText:'확인'
		 })
	}
	function insFileAlert(){
		alert('warning','파일을 첨부해 주세요');
	}
	function signInAlert(){
		Swal.fire({
		    icon:'warning',
	        text:'로그인 후 이용해주세요',
	        confirmButtonText:'로그인',
	        showCancelButton: true,
	        cancelButtonText:'취소',
		 }).then((result) =>{
			 if(result.isConfirmed){
			 location.href = "${path}/SignIn.do";
			 }
		 })
	}
	function dupAlert(){
		alert('warning','중복 신청하실 수 없습니다');
	}
	function uptBtn(postingNumber){
		Swal.fire({
		    icon:'warning',
	        text:'수정 페이지로 이동하시겠습니까?',
	        confirmButtonText:'이동',
	        showCancelButton: true,
	        cancelButtonText:'취소',
		 }).then((result) =>{
			 if(result.isConfirmed){
			 location.href = "FleaMarketUptPage.do?postingNumber="+postingNumber;
			 }
		 })
	}
	function delBtn(postingNumber){
		Swal.fire({
		    icon:'warning',
	        text:'삭제하시겠습니까?',
	        confirmButtonText:'삭제',
	        showCancelButton:true,
	        cancelButtonText:'취소',
	        cancelButtonColor:'#d33',
		 }).then((result) =>{
			 if(result.isConfirmed){
			 location.href = "FleaMarketDel.do?postingNumber="+postingNumber;
			 }
		 })
	}