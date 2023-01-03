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
<title>중고월드 찜 삭제</title>
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
	<%	
		boolean isRemoveCart = false;
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		cartlistdao cartlistDao = new cartlistdao();
		String []cartRomoveProSels= request.getParameterValues("cartremoveSel");
		if(cartRomoveProSels!=null){
			for(int idx=0;idx<cartRomoveProSels.length;idx++){
				cartlistDao.cartlistRemove(new Cartlist(Integer.parseInt(cartRomoveProSels[idx]),Login.getId()));
			}
			isRemoveCart = true;
		}
	%>


</body>
<script type="text/javascript">
var isSuccess=<%=isRemoveCart%>
if(isSuccess){
	alert("[안내메시지]선택하신 상품을 찜목록에서 삭제 완료하였습니다.")
	location.href="cartlistView.jsp"
}
</script>
</html>