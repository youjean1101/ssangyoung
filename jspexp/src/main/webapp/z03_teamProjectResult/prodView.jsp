<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
	import="vo.*" 
    import="dao.*" 
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 상세보기 - 중고월드</title>
<link href="./img/usedworld_icon.ico" rel="shortcut icon" type="image/x-icon">
<link href="css/reset.css" rel="stylesheet">
<link href="css/slidebox.css" rel="stylesheet">
<link href="css/seller_profile.css?after" rel="stylesheet">
<link href="css/prod_info.css" rel="stylesheet">
<style type="text/css">			

</style>
</head>
<body>
	<jsp:useBean id="dao" class="webproject.Prod"/>
	<jsp:useBean id="sch" class="webproject.ProdVO"/>
	<jsp:setProperty property="*" name="sch"/>
	<jsp:setProperty property="id" name="sch" value="${Login.id }"/>
	${dao.UpViewcount(sch)}
	

	
	<!-- header -->
	<%@ include file="Top.jsp" %> 
	<!-- header -->
	
	<div class="slidebox">
	
	<!-- 이미지 슬라이드 -->
	
		<c:forTokens var="img" varStatus="status" items="${dao.getProdImgList(sch)}" delims=",">
			<c:choose>
				<c:when test="${status.first == true}">
					<input type="radio" name="slide" id="slide${status.count}" checked>
				</c:when>
				<c:otherwise>
					<input type="radio" name="slide" id="slide${status.count}">
				</c:otherwise>
			</c:choose>
		</c:forTokens>	
	
	<!-- 이미지 파일 -->
	<ul class="slidelist">
			<c:forTokens var="img" varStatus="status" items="${dao.getProdImgList(sch)}" delims=",">
				<li class="slideitem">
					<a><img src="img/saleProd/${img}"></a>
				</li>
			</c:forTokens>
					
	</ul>	

		<div class="slide-control">
			<div class="control1">
				<label for="slide3" class="prev"></label>
				<label for="slide2" class="next"></label>
			</div>
			<div class="control2">
				<label for="slide1" class="prev"></label>
				<label for="slide3" class="next"></label>
			</div>
			<div class="control3">
				<label for="slide2" class="prev"></label>
				<label for="slide1" class="next"></label>
			</div>
		</div>
		<ul class="slide-pagelist">
			<li><label for="slide1"></label></li>
			<li><label for="slide2"></label></li>
			<li><label for="slide3"></label></li>
		</ul>
	</div> <!-- slidebox -->

		
	<c:forEach var="prod" items="${dao.getProdList(sch)}">	
		<section id="profile">		
			<div id="space">
				<a id="profile_link" href="#">
					<div id="seller">
						<div id="profile_img">
							<img alt="" src="img/main/UnknownUser2.png">
						</div>
						<div id="seller_info">
							<input type="hidden" name="writer" value="${prod.writerid}">
							<input type="hidden" name="dealstat" value="${prod.dealstat}">
							<div id="writer">${prod.writerid}</div>
							<div id="loc">${prod.faddressval} ${prod.saddressval} ${prod.caddressval}</div>
						</div>
					</div> <!-- seller -->
				</a>
				<!-- 수정,삭제 버튼 -->
				<div id="menu">
					<img alt="" src="img/main/ProdViewMenu.png">
					<ul id="sellerMenu">
						<li><a href="#">수정</a></li>
						<li><a href="#" onclick="selState('proddelete','')">삭제</a></li>
					</ul>
				</div>
			</div> <!-- space -->		
		</section> <!-- profile -->
		<section id="prod_info">
			<input type="hidden" name="productno" value="${prod.productno}"> <!-- 삭제 처리 위한 productno -->
			<input type="hidden" name="checklike" value="${dao.checklike(sch)}">
			<p id=prod_category>${prod.kind}</p>
			<h1 id="prod_title" style="margin:0px;">${prod.productname}</h1>	
			<p id="prod_price""><fmt:formatNumber pattern="###,###,###,###" value="${prod.price }"/>원</p>
			<div id="prod_detail">
				<p>
					${prod.information}
				</p>
			</div>
		<p id="like_counts">관심 ${prod.likecount} / 조회수 ${prod.viewcount}</p>			
		</section> <!-- prod_info -->
		<section id="prod_bottom">
			<div id="space">
				<input type="checkbox" id="likebtn">
				<label id="likelabel" for="likebtn" onclick="like()">
				    <img id="unlikeimg"  src="img/main/like.png">
					<img id="likeimg" src="img/main/like2.png">
				</label>
				<!-- 거래 상태 버튼 -->
				<select name="state" id="stateselect" onchange="selState('uptStatus',this.value)">
					<option class="stateoption" value="판매중">판매중</option>
					<option class="stateoption" value="예약중">예약중</option>
					<option class="stateoption" value="거래완료">거래완료</option>
				</select>
				
				<!-- 약속잡기 버튼 -->
				<div id="reservation">
					<input id="reserv_button" type="button" value="약속잡기"> 
					<ul id="datetime">
						<li><input type="date" style="border:none"></li>
						<li><input type="time" style="border:none"></li>
						<li><input id="done" type="submit" value="완료"></li>
					</ul>
				</div> <!-- reservation -->
			</div> <!-- space -->
		</section> <!-- prod_bottom -->
	</c:forEach>

	<!-- footer -->
	<%@include file="Footer.jsp" %>	
	<!-- footer -->
</body>
<script type="text/javascript">

$(document).ready(function(){ // 거래완료 글이면, 관리자 or 작성자아니면 접근불가
    var userid = '${Login.id}'
 	var writerid = document.querySelector('input[name=writer]').value
	var divd = '${Login.userdiv}'
	var state = document.querySelector('input[name=dealstat]').value
var OriginalPage=document.referrer
if(state=='거래완료'){
 if(userid==writerid || divd=="관리자"){	
}else{
	alert("판매완료 글은 작성자만 접근가능합니다. 이전페이지로 이동합니다.")
      location.href=OriginalPage
}
}
   //
	const stateselect = document.getElementById('stateselect');  //select box
	const statelen = stateselect.options.length; //select box의 option 갯수
	const dealstat = '${param.dealstat}'
	  for (let i=0; i<statelen; i++){  
	  	//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
	    if(stateselect.options[i].value == dealstat){
	    	stateselect.options[i].selected = true;
	    }
	  }  
	

})


// 판매자 id와 로그인 id 비교하여 버튼 출력
checkId()
function checkId(){
	var sessId = "${Login.id}"
	var writer = document.querySelector("[name=writer]").value
	var checklike = document.querySelector("input[name=checklike]").value
	if(sessId!=writer){ // 판매자 id != 로그인 id
		document.getElementById("menu").style.display = "none"; // 수정,삭제 버튼 X
		document.querySelector("[name=state]").style.display = "none"; // 거래 상태 버튼 X
		console.log(checklike)
		if(checklike==1){
			document.getElementById("likeimg").style.display = "block"; // 찜 버튼 O
			$("#likebtn").prop("checked", true); 
		}else{
			document.getElementById("likeimg").style.display = "none"; // 찜 버튼 O
		}
		document.getElementById("unlikeimg").style.display = "block"; // 찜 버튼 O
		//
		document.getElementById("reservation").style.display = "block"; // 약속잡기 버튼 O
	}else{ // 판매자 id == 로그인 id
		document.getElementById("menu").style.display = "block";
		document.querySelector("[name=state]").style.display = "block";
		document.getElementById("likeimg").style.display = "none";
		document.getElementById("unlikeimg").style.display = "none";
		document.getElementById("reservation").style.display = "none";
	}
}

function selState(prodval,val){
	var productno = document.querySelector('input[name=productno]')
	if(prodval=='uptStatus'){
	var str = "?prodval="+prodval+"&dealstat="+val+"&productno="+productno.value
	}else if(prodval=='likeinsert' || prodval=='likedelete'){
	var str = "?prodval="+prodval+"&id="+val+"&productno="+productno.value
	}else if(prodval=='proddelete'){
		if(confirm("정말 해당 게시물을 삭제하시겠습니까?")){
	var str = "?prodval="+prodval+"&productno="+productno.value
		}else{return false;}
	}
	 var xhr= new XMLHttpRequest()
	
	 xhr.open("get","CheckProd.jsp"+str,true)
      xhr.send()
	      xhr.onreadystatechange=function(){
	         if(xhr.readyState==4&&xhr.status==200){
	            var SuccessuptState = xhr.responseText // JSON객체로 변환
	            console.log(SuccessuptState)
	            if(SuccessuptState==1 && prodval=='uptStatus'){
	               alert(val+"(으)로 상태가 변경되었습니다.")
	            }else if(SuccessuptState==1 && prodval=='likeinsert'){
	               alert("찜목록에 추가되었습니다.")
	            }else if(SuccessuptState==1 && prodval=='likedelete'){
	            	alert("찜목록에서 삭제되었습니다.")
	            }else if(SuccessuptState==0){
	            	alert("실패하였습니다.")
	            }else if(SuccessuptState==1 && prodval=='proddelete'){
	            	alert("판매글이 정상적으로 삭제되었습니다.\n 조회페이지로 이동합니다.")
	            	location.href="ProdSearch.jsp"
	            }
	         }
	   }  
  
}

/* $("#likebtn").on('change', function() { */
	 
	
function like(){
  if('${Login.id}'!=null){
	var likecheckval =  $("#likebtn").is(":checked"); 
	console.log(likecheckval)
	
     if (!likecheckval) {
    	$('#likeimg').css('display', 'block');
    	selState('likeinsert','${Login.id}')
    }  else {
    	$('#likeimg').css('display', 'none');
    	selState('likedelete','${Login.id}')
    }
  }else{
	  alert("로그인 이후 이용가능합니다.")
  }
 };
	

</script>
</html>