//gps 
var container = document.getElementById('map');// 지도를 표시할 div 
var options = {
   center: new kakao.maps.LatLng(33.450701, 126.570667),// 지도의 중심좌표
   level: 3 // 지도의 확대 레벨
};

//지도를 생성합니다    
var map = new kakao.maps.Map(container, options);
var infoDiv2 = document.getElementById('centerAddr2'); 
var infoDiv3 = document.getElementById('centerAddr3'); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
    infowindow = new kakao.maps.InfoWindow({zindex:1}); 

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});
function searchAddrFromCoords(coords, callback) {// 좌표로 주소 정보를 요청합니다
   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {// 좌표로 상세 주소 정보를 요청합니다
   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   
}


//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
   if (status === kakao.maps.services.Status.OK) {
     var infoDiv = document.getElementById('centerAddr');

       for(var i = 0; i < result.length; i++) {
           // 행정동의 region_type 값은 'H' 이므로
           if (result[i].region_type === 'H') {
               infoDiv.innerHTML = result[i].address_name;
               break;
           }
       }
   }    
} 

/* function serar */
//동에 대한 default  
   
    function mafun(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

       // 인포윈도우로 장소에 대한 설명을 표시합니다
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">여기</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map.setCenter(coords);
        } 
        
         for(var i = 0; i < result.length; i++) {
             // 행정동의 region_type 값은 'H' 이므로
             if (result[i].region_type === 'H') {         
                 infoDiv.innerHTML = result[i].address_name;       
                 break;
             }
         }
         
         //
         kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
             searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                 if (status === kakao.maps.services.Status.OK) {
                     var detailAddr2 = !!result[0].road_address ? result[0].road_address.address_name : '';
                     detailAddr3 = result[0].address.address_name;
                          
                           
                        /* console.log("도로명주소:"+result[0].road_address.address_name)
                        console.log("지번주소:"+result[0].address.address_name) */
                     
                     var content = '<div class="bAddr">' +
                                     '<span class="title">주소정보</span>' + 
                                     detailAddr2 + 
                                 '</div>';

                     // 마커를 클릭한 위치에 표시합니다 
                     marker.setPosition(mouseEvent.latLng);
                     marker.setMap(map);

                     // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                     infowindow.setContent(content);
                     infowindow.open(map, marker);
                     infoDiv=detailAddr2;
                     infoDiv2.innerHTML=detailAddr2;
                     infoDiv3.innerHTML=detailAddr3;
                     
                     // 지도 선택한 부분 input 들어감 
                     var aform = document.querySelector("#aform")
                     aform.address.value = document.getElementById("centerAddr3").innerText;
             
                     
                 }   
             });
         });
                
     }  

//유효성체크

     
  
	//필수항목 조건식 
	 function checkForm1(){	
	if(!document.aform.email.value){
		    var loginState="로그인을 하셔야합니다."
		    alert(loginState)
		    if(loginState+"\n 로그인 화면으로 이동하시겠습니까?"){
				location.href="SignIn.do"
			}        
	        return false;
	 }
	 	 
	if(!document.aform.title.value){
	        alert("글제목을 입력하세요");
	        return false;
	 }
	 // 플리마켓 유효성체크
	  var startDate = $('#openDate').val();
      var endDate = $('#closeDate').val();
      //-을 구분자로 연,월,일로 잘라내어 배열로 반환
      var startArray = startDate.split('-');
      var endArray = endDate.split('-');   
      //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
      var start_date = new Date(startArray[0], startArray[1], startArray[2]);
      var end_date = new Date(endArray[0], endArray[1], endArray[2]);	 
	 if(start_date.getTime() > end_date.getTime()) {

         alert(" 플리마켓 종료날짜보다 시작날짜가 작아야합니다.");
         return false;
     }
		 
	 if(!document.aform.openDate.value){
	     alert("플리마켓 시작일을 입력하세요");
	     return false;
	 }
	 
	 if(!document.aform.closeDate.value){
	     alert("플리마켓 종료일을 입력하세요");
	     return false;
	 }
	 
	 if(!document.aform.approvalMaxCnt.value){
	     alert("모집인원을 입력해주세요");
	     return false;
	 }
      //모집일 유효성 체크 
	  var startDate1 = $('#recruitmentStartDate').val();
      var endDate1 = $('#recruitmentEndDate').val();
      //-을 구분자로 연,월,일로 잘라내어 배열로 반환
      var startArray1 = startDate1.split('-');
      var endArray1 = endDate1.split('-');   
      //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
      var start_date1 = new Date(startArray1[0], startArray1[1], startArray1[2]);
      var end_date1 = new Date(endArray1[0], endArray1[1], endArray1[2]);	 
	 if(start_date1.getTime() > end_date1.getTime()) {

         alert("모집종료 날짜보다 시작날이 작아야합니다.");
         return false;
     }
	 
	 if(!document.aform.recruitmentStartDate.value){
	     alert("모집시작일을 입력해주세요");
	     return false;
	 }
	 if(!document.aform.recruitmentEndDate.value){
	     alert("모집종료일을 입력해주세요");
	     return false;
	 }
	 
	 //모집마지막일이 
	 if(end_date1.getTime() > start_date.getTime()) {

         alert("모집일을 다시 설정해 주세요");
         return false;
     }
     var checkval = $("#checkform option:selected").val();
	 	 if(checkval==''){
        alert("첨부파일 유무 체크바랍니다")
        return false;
      }
	 if(document.aform.checkForm.value==""){
	     alert("첨부파일 유무를 선택해주세요");
	     return false;
	 }
	 

	 if(!document.aform.address.value){
	     alert("장소를 선택해주세요");
	     return false;
	 }
/*	 if(!document.aform.address.value){
	     alert("장소를 선택해주세요");
	     return false;
	 }*/
	 if(!document.aform.content.value){
	     alert("내용 적어주세요");
	     return false;
	 }
	  if(!document.aform.pro.value){
	     alert("첨부파일은 필수");
	     return false;
	 }
	 //첨부파일 확인을 위한 유효성 체크 
	 var fileForm0 = /(.*?)\.(docx|hwp)$/;
	 
	 var fileArr = Array.from(document.getElementById('isFile').files);// 이벤트로 넘어온 파일들을 배열형식으로 담음(FileList -> Array)
     //파일이 배열로 잘 바뀌엇는지 확인ㅋ
     console.log(fileArr);
     var filecheck = false;
     for(var i=fileArr.length-1; i>=0; i--){
		 var fileName = fileArr[i].name
		//파일이름의 확장자
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		//검사할 확장자의 배열
	
    	var extension = ['doc','docx','ppt','pptx','xls','pdf','hwp','txt'];
    	
    	extension.forEach(function(element) {
	        if(ext == element){
	            filecheck = true;
	        }
    	})
	 }
	
	if(document.aform.checkForm.value=="P"&&filecheck==false){
		alert("개인양식일때는 첨부파일 필수 입니다.")
		return false;
		}
		 
	  return true;
	}
	         
	          