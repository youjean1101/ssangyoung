<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer메뉴</title>
<style>
	#footer1{
		position:fixed;
		bottom: 3%;
	    left: 5%;
	    width: 600px;
	    height: 150px;
	}
	#footer2{
		position:fixed;
		bottom: 3%;
	    right: 5%;
	    width: 500px;
	    height: 150px;
	}
	#footer1 #footerleft{
		width: 100%;
	    height: 100%;
	    text-align:center;
	    color:grey;
	}
	#footer2 #footerright{
		width: 100%;
	    height: 100%;
	    text-align:center;
	    color:black
	}
	#footerright #appsto{
		width: 100%;
	    height: 80%;
	    font-size:18pt;
	    border:none;
	}
	#footerright #googlesto{
		width: 100%;
	    height: 80%;
	    font-size:18pt;
	    border:none;
	}
	#footerright td{
		font-weight: bold;
		font-size:18pt;
	}
	/* td{
	border:1px solid black;
	} */
	
</style>

</head>
<body>
	<box id="footer1">
		<table id="footerleft">
			<tr><td>중고거래</td><td>중고월드 비즈니스</td><td>자주 묻는 질문</td></tr>
			<tr><td>동네가게</td><td>채팅하기</td><td>회사 소개</td></tr>
			<tr><td>중고월드 알바</td><td></td><td>인재 채용</td></tr>
		</table>
	</box>
	<box id="footer2">
		<table id="footerright">
			<tr><td colspan="2">중고월드 앱 다운로드</td></tr>
			<tr><td><a href="https://apps.apple.com/kr/app/%EB%8B%B9%EA%B7%BC%EB%A7%88%EC%BC%93/id1018769995"><input id="appsto" type="image" src=".\img\appstore.png" alt=""></a></td>
			<td><a href="https://play.google.com/store/apps/details?id=com.towneers.www"><input id="googlesto" type="image" src="/z03_teamproject04/img/googleplay.png" alt=""></a></td></tr>
		</table>
	</box>
	

</body>
<script type="text/javascript">
	var tds = document.querySelectorAll("#footerleft td")
	tds.forEach(function(td){
		td.onmouseover=function(){
			this.style.color="blue"
		}
		td.onmouseout=function(){
			this.style.color="grey"
		}
	})
</script>
</html>