<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="z02_teamproject4.*"
    import="java.util.*"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 차단하기 조회하기</title>
<script type="text/javascript">
</script>
<style>
/* 페이징 처리 4X2 */
*{
   margin:0px;
   padding:0px;
   color: #444444;
   box-sizing:border-box;
}
a{
   text-decoration: none;
}
li{
    list-style:none;
 }
.flex-container{
    width: 1200px;
    height: 680px;
    border: 4px solid lightgray;
    border-radius: 12px 12px;
    margin: 0 auto;
    margin-top: 30px;
  }
.flex-item{
    /* border: 1px solid lightgray; */
    /*display: inline-grid; */
	width: 100%;
    height: 40px;
    float: left;
    margin: 20px 10px 0px 30px;
}
.pagination_wrap{
  	display: flex;
    justify-content: center;
    align-items: center;
    height: 50px;
}
.pagination{
	/* border:1px solid black; */
    background: #fff;
    padding-top: 20px;
    text-align: center;
    display: flex;
    justify-content: center;
    height: 37px;
    width: 100%;
}
#numbers{ 
   padding:0;
   margin: 0 2rem;
   list-style-type:none;
   display:flex; 
}
#numbers li a{
   color:#333;
   padding: .5rem 1rem;
   text-decoration:none;
   opacity:0.7;
}
#numbers li a:hover{
   opacity:1;
}
#numbers li a.active{
   opacity:1;
   background:#333;
   color:#fff;
}

.pagination i{
   color:#333;
   font-size:1.2em;
}
/* 내가쓴 css*/
 .flex-container h2{
	margin: 20px 50px 0px 20px;
	font-size:25pt;
}
.flex-container hr{
	width:97%;
	margin: 20px 0px 20px 20px;
	border:0;
    height:2px;
    background:lightgrey;
    
}
.flex-container #cutoutTab{
	width:95%;
	/* border:1px solid black; */
	margin: 0 auto;
	margin-top: 0px;
}
#cutoutTab th{
	height:50px;
	background:rgb(243, 156, 18);
	color:white;
	font-size:20pt;
	border:none;
	/* width:25%; */
}
.flex-item hr{
	border:0;
    height:0.5px;
    background:orange;
    margin-top: 15px;
    width:92%;
}
#checkbox{
	margin-left: 72px;
    margin-top: -2px;
}

input[type="checkbox"]{
	width:20px;
	height:20px;
}
#no{
	margin-left: 248px;
    margin-top: -33px;
    font-size: 18pt;
}
#cutoutid{
	margin-left: 400px;
    margin-top: -35px;
    font-size: 18pt;
}
	
#address{
	margin-left: 720px;
    margin-top: -29px;
    font-size: 18pt;
}
input[name="cutoutCancel"]{
	background:rgb(142, 68, 173);
	color:white;
	border:1px solid rgb(142, 68, 173);
	border-radius:5px;
	font-size:16pt;
	font-weight:bold;
	width:140px;
	height:50px;
	position:fixed;
	left:21%;
	bottom:21.5%;
}
#nothing{
	color:grey;
	position: absolute;
	top: 38%;
    left: 38%;
}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<div class="flex-container">
		<%	
			Olddealuser Login = (Olddealuser)session.getAttribute("Login");
			// User registerUser = (User)session.getAttribute("userCutCollect"); 차단해지시 삭제 해야하므로 쓸수동..
			socialdao socialDao = new socialdao();
			//List<User> cutUserList= socialDao.cutoutView(new Social(Login.getsId(),"차단"));
			int i = 1;
			boolean hasSess = Login!=null; 
			boolean loginalert=false;
			if(hasSess){
		%>
		<h2><%=Login.getUsername() %>님이 차단한 사용자 정보</h2>
		<hr>
		<form id="cutoutRemoveform" action="cutoutRemove.jsp"><!--  -->
			<%if(socialDao.isCutCollectExist(Login.getId(),"차단")) {%>
			<table id="cutoutTab">
				<tr><th width="15%">전체선택 <input type="checkbox" name="ckAll" onclick="ckAllFn(this)"/></th>
					<th width="15%">No.</th><th width="20%">ID</th><th width="50%">지역</th></tr>
			</table>
				<%for(Olddealuser cutoutuserinfo:socialDao.cutoutView(new Social(Login.getId(),"차단"))){ %>
					<div class="flex-item">
						<div id="checkbox"><Input type="checkbox" name="removeUserSel" value='<%=cutoutuserinfo.getId() %>'/></div>
						<div id="no"><%=i++ %></div>
						<div id="cutoutid"><%=cutoutuserinfo.getId() %></div>
						<div id="address"><%=cutoutuserinfo.getAddress() %></div>
						<hr>
					</div>
				<%} %>
		</form>
		<%} else{ %>
			<h2 id="nothing">차단한 회원이 없습니다.</h2>
		<%} %>
		<input type="button" name="cutoutCancel" value="차단해제" onclick="cutoutremove()"/>
	</div>
		<div class="pagination">
	           <i class="fa-solid fa-arrow-left"></i>
	            <ol id="numbers">
	            <!-- 페이지네이션 번호들이 오는곳 -->
	            </ol>
	           <i class="fa-solid fa-arrow-right"></i> 
         </div>  
		<%}else{
			loginalert=true;
		}
		%>

</body>
<script type="text/javascript">
//------------------------------미체크 시, 유효성체크 기능메서드-------------------------------------------- 
var cutoutRemoveUserSelArr = document.querySelectorAll("[name=removeUserSel]")
function cutoutremove(){
	var is_checked = false;
	cutoutRemoveUserSelArr.forEach(function(userck){
		if(userck.checked==true){
			is_checked=true
		}
	})
	if(!is_checked){
		alert("[안내메시지]차단해제할 회원을 선택해주세요.")
	}else{
		if(confirm("선택하신 회원을 차단목록에서 삭제하시겠습니까?")){
			document.querySelector("#cutoutRemoveform").submit();
		}
	}
} 
//--------------------------전체 체크 기능메서드---------------------------------------------
function ckAllFn(obj){
		for(var idx=0;idx<8;idx++){
			cutoutRemoveUserSelArr[idx].checked = obj.checked	
	}
}
//--------------------------미로그인으로 회원수정화면접속 시, 기능메서드-------------------------------------
var alertis = <%=loginalert%>
if(alertis){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp";
}
//------------------------페이지 기능-------------------------------------------------------
callPageSelector()
function callPageSelector(){
      const rowsPerPage =8; // 10개 씩 끊겟다.
      const rows = document.querySelectorAll('.flex-item');// 게시글 row를 전체 선택
      //console.log(rows);
      const rowsCount = rows.length //게시글 전체의 갯수 
      console.log("gd"+rowsCount);
      const PageCount = Math.ceil(rowsCount/rowsPerPage); // 전체글개수/한페이지에 보여질 갯수를 올림처리 = 페이지 갯수
      //console.log(PageCount)
      const numbers = document.querySelector('#numbers'); //클릭할 페이지 버튼번호가 생성될 ol
      //변수 추가 이전다음버튼
      const prevPageBtn= document.querySelector(".pagination .fa-arrow-left");
      const nextPageBtn= document.querySelector(".pagination .fa-arrow-right");
      let pageActiveIdx = 0;//현재 보고있는 페이지그룹 번호
      let currentPageNum = 0; //현재 보고있는 페이지네이션 번호
      let maxPageNum=5;//페이지그룹 최대 갯수
      
      //페이지네이션 생성
      for(let i=1; i<=PageCount;i++){
         numbers.innerHTML +='<li><a href="">'+i+'</a></li>' //생성될 페이지 갯수만큼 버튼li 생성
      }
      const numberBtn = numbers.querySelectorAll('a'); //페이지버튼 a를 모두 선택
      //console.log(numberBtn);
      
      
      //페이지네이션 감추기
      for(nb of numberBtn){
         nb.style.display='none';
      }
      
      /* numberBtn.forEach(function(item,idx){}) */
      numberBtn.forEach((item,idx)=>{ //item(numbersBtn의 각각), idx(인덱스번호)
         item.addEventListener('click',(e)=>{ //해당 번호버튼을 클릭하면
            e.preventDefault();
            // 테이블 출력함수
            //console.log(idx)
            displayRow(idx);
         });
      });
      
      
      function displayRow(idx){
         let start= idx*rowsPerPage; // 공식으로 페이지를 클릭했을떄 해당 시작번째 게시글 index번호
         let end= start+rowsPerPage;//  공식으로 페이지를 클릭했을 떄 해당 마지막번째 게시글 index번호
         let rowsArray =Array.from(rows) //게시글(모든 tr row)을 전부 배열로 바꾼다.
         //let rowsArray =[...rows]
         //console.log(rowsArray)
         
          for(ra of rowsArray){
            ra.style.display='none'; // 전체 게시글을 일단 안보이게처리
         } 
           let newRows = rowsArray.slice(start,end);
         for(nr of newRows){
            nr.style.display='';
         }   
         for(let nb of numberBtn){
            nb.classList.remove('active'); //지정해놓은 active시 효과를 제거
         }
         numberBtn[idx].classList.add('active'); //지정해놓은 active를 해당 target만 활성화
          
      } //displayRow 
      
      displayRow(0); // 시작하자마자 해당 갯수만큼ㅁ만 페이지보이도록 실행함
      
      //페이지네이션 버튼 그룹표시
      function displayPage(num){
         //페이지네이션 감추기
         for(nb of numberBtn){
            nb.style.display='none'; // 일단 전체 버튼클릭을 보이지않도록 함
         }
         let totalPageCount = Math.ceil(PageCount/maxPageNum);
         let pageArray =[...numberBtn]; // 페이지버튼들을 유사배열에서 일반배열로 바꿔줌
         let start = num*maxPageNum; //0*5이므로 0 , 1*5=5
         let end = start+maxPageNum; // 0+5이므로 5+5,=10 
         let pageListArr = pageArray.slice(start,end); //0,5가 들어오면 0~4까지 출력 , 5,10이면 5~9까지출력
         
         for(let item of pageListArr){
            item.style.display=''; //배열.slice를 통해 나온 페이지번호들만 display=none를 취소하여 보이도록함
         }
         if(pageActiveIdx==0){
            prevPageBtn.style.display='none'; //가장 앞자리의 번호면 이전버튼이 안보이도록 설정
         }else{
            prevPageBtn.style.display='';
         }
         if(pageActiveIdx==totalPageCount-1){
            nextPageBtn.style.display='none'; //가장 앞자리의 번호면 이전버튼이 안보이도록 설정
         }else{
            nextPageBtn.style.display='';
         }
      }
      displayPage(0); //시작하자마자 보여줘야하니까 실행되도록 함
      
      // -> 버튼 
      nextPageBtn.addEventListener('click',()=>{
         let nextPageNum = pageActiveIdx*maxPageNum+maxPageNum;
         displayRow(nextPageNum)
         ++pageActiveIdx
         displayPage(pageActiveIdx);
         
      });
      // <-버튼
      prevPageBtn.addEventListener('click',()=>{
         let nextPageNum = pageActiveIdx*maxPageNum-maxPageNum;
         displayRow(nextPageNum)
         --pageActiveIdx
         displayPage(pageActiveIdx);
         
      });
   }
</script>
</html>