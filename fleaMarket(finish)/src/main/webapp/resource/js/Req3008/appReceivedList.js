	function updateAppRe(applicationNo, approvalwhether){
		// 유효성 검사
		$.ajax({
			url:"updateAppRe.do",
			type:"post",
			data:"applicationNo="+applicationNo+"&approvalWhether="+approvalwhether,
			dataType:"json",
			success:function(data){
				var msg="";
				if(approvalwhether=='a'){
					msg="승인되었습니다"
					alertIcon="success"
				}else{
					msg="거부되었습니다"
					alertIcon="error"
				}
				Swal.fire({
				    icon:alertIcon,
			        text:msg,
			        confirmButtonText:'확인'
				}).then((result) =>{
					 if(result.isConfirmed){
						 location.reload(); 
					 }
				 })
				
			},
			error:function(xhr,status,err){
	              console.log(xhr)
	              console.log(status)
	              console.log(err)
	        }
		})
	}
	
	// 페이징
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("#frmSch").submit()
	}
	
	// 받은 신청 상세 조회 모달창
    function getFiles(appno){
		$.ajax({
			url:"appFileView.do",
			type:"post",
			data:"applicationNo="+appno,
			dataType:"json",
			success:function(data){
				var files = data.appFile;
				var str = "";
				
				if(files == null){ // 첨부 파일 없을 때
					str += "<div class='form-group text-center'>신청을 승인하시겠습니까?</div>"
					$(".modal-body > label").hide()
				}else{ // 첨부 파일 있을 때
					var filelist = files.split(',');
					filelist.forEach(function(f){
						str += "<input class='form-control w-50 mb-2' onclick=\"javascript:location.href='downloadAppFile.do?filename="+f+"'\" name='filename' type='text' value='"+f+"' readonly/>"
					})
					str += "<button class='m-1 btn btn-primary' type='button' onclick=\"alldown('downloadAppFileForm')\">전체 다운로드</button>";
				}
				$('#downloadAppFileForm').html(str)
				$(".ApprovalBtnWrap button:nth-child(1)").attr("onclick","updateAppRe("+appno+",'a')")
				$(".ApprovalBtnWrap button:nth-child(2)").attr("onclick","updateAppRe("+appno+",'r')")
				$('#ApplicaionModalBtn').click() // 모달창
			},
			error:function(xhr,status,err){
	              console.log(xhr)
	              console.log(status)
	              console.log(err)
	        }
		})
	}
	
	// 신청글 파일 전체 다운로드
	function alldown(){
		var len = $('#downloadAppFileForm').children('input[name=filename]').length
		var start=1;
		setInterval(function() {
			$("#downloadAppFileForm input[name=filename]:nth-child("+start+")").click()
			start++
			if(start==len){
				clearInterval()
			}
		},500)
	}