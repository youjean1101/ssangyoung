	// 페이징
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("#frmSch").submit()
	}
	
	// 내 신청 상세 조회 모달창
    function getFiles(index,appno){
		$.ajax({
			url:"appFileView.do",
			type:"post",
			data:"applicationNo="+appno,
			dataType:"json",
			success:function(data){
				
				var files = data.appFile;
				var str = "<input type=\"hidden\" name=\"applicationNo\" value=\""+appno+"\"/>";
				
				if(files == null){ // 첨부 파일 없을 때
					str += "<div class='form-group text-center'>삭제하시겠습니까?</div>"
					$(".modal-body > label").hide()
					$(".ApprovalBtnWrap button:nth-child(1)").hide()
				}else{ // 첨부 파일 있을 때
					var filelist = files.split(',');
					filelist.forEach(function(f){
						str+="<input class='form-control w-50 mb-2' onclick=\"javascript:location.href='downloadAppFile.do?filename="+f+"'\" name='filename' type='text' value='"+f+"' readonly/>"
					})
					str += "<input type='file' name='addFile' class='form-control w-50 mb-2' id='addFile' multiple>"
					str += "<button class='m-1 btn btn-primary' type='button' onclick=\"alldown('downloadAppFileForm')\">전체 다운로드</button>";
					$(".modal-body > label").show()
					$(".ApprovalBtnWrap button:nth-child(1)").show()
				}
				$('#downloadAppFileForm').html(str)
				$(".ApprovalBtnWrap button:nth-child(1)").attr("onclick","goApp("+index+",'uptApp')") // 수정 버튼
				$(".ApprovalBtnWrap button:nth-child(2)").attr("onclick","goApp("+index+",'delApp')") // 삭제 버튼
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
	
	// 내 신청 수정/삭제 유효성 검사
  	function goApp(index,methods){
		var statusText = $('#datatable-search tbody tr:nth-child('+index+') td:nth-child(4) span').text()
		if(statusText != '대기'){
			cantUptAlert();
			return false;
		}
		if(methods=='uptApp' && $('#addFile').val()==''){
			insFileAlert();
			return false;
		}
		$('#downloadAppFileForm').attr({action:methods+".do", method:"post"})
		$('#downloadAppFileForm').submit()
  	}
  
 	// 내 신청 삭제
	function delApp(applicationNo){
		$.ajax({
			url:"delApp.do",
			type:"post",
			data:"applicationNo="+applicationNo,
			dataType:"json",
			success:function(data){
				delAlert();
				location.reload(); 
			},
			error:function(xhr,status,err){
	              console.log(xhr)
	              console.log(status)
	              console.log(err)
	        }
		})
	}
 	
 	// alert
 	var alert = function(alertIcon, msg) {
		Swal.fire({
		    icon:alertIcon,
	        text:msg,
	        confirmButtonText:'확인'
		 })
	}
 	function cantUptAlert(){
 		alert('error','승인/거부된 신청은 편집할 수 없습니다');
 	}
 	function insFileAlert(){
 		alert('warning','파일을 첨부해 주세요');
 	}
 	function delAlert(){
 		alert('warning','삭제되었습니다');
 	}