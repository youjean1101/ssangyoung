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
<title>중고월드 찜 넣기</title>
<script type="text/javascript">
</script>

</head>
<body>
	<%	
		cartlistdao cartlistDao = new cartlistdao();
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		boolean hasSess = Login!=null; 
		boolean isCartSuss = false;
		boolean iscart = false;
		if(hasSess){
			Olderproduct cartproInfo= (Olderproduct)session.getAttribute("cartlist");
			iscart = cartlistDao.isCartlist(new Cartlist(cartproInfo.getProductno(),Login.getId()));
			if(!iscart){
				cartlistDao.cartlistAdd(new Cartlist(cartproInfo.getProductno(),Login.getId()));
				isCartSuss = true;
			}
		}
	%>
	


</body>
<script type="text/javascript">
//-------------------------------------로그인해주세요 알람 기능메서드---------------------------------------
var hasSess =<%=hasSess%>
if(!hasSess){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp"
}

//-----------------------------------찜 중복 확인 기능메서드---------------------------------------
var isCartOb = <%=iscart%>
if(isCartOb){
	alert("[안내메시지]이미 찜 항목에 등록되어있는 상품입니다.")
	location.href="productDetailView.jsp"
}

//---------------------------------------찜등록 완료 후 조회화면 기능 메서드--------------------------------------
var isCartSussOb = <%=isCartSuss%>
if(isCartSussOb){
	var isCollectOb = confirm("[안내메시지]찜등록이 완료되었습니다.\n찜 조회화면으로 이동하시겠습니까?")
	
	if(isCollectOb){
		location.href="cartlistView.jsp"
	}else{
		location.href="productDetailView.jsp"
	}
}

</script>
</html>