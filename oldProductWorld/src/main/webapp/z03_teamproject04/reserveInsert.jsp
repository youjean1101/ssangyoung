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
<title>중고월드 예약하기 추가</title>
<script type="text/javascript">
</script>
	<% 
		//session.setAttribute("reserveInfo",reservepro);
		//Reserve reserveInfo = (Reserve)session.getAttribute("reserveproInfo");
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		Olderproduct reserveProInfo= (Olderproduct)session.getAttribute("reserveProInfo");
		boolean hasSess = Login!=null;
		boolean loginalert=false;
		boolean isReservedate = false;
		boolean reserveSucc = false;
		if(hasSess){
			String reservedate = request.getParameter("reservationDate"); if(reservedate==null) reservedate="";
			String reservetime = request.getParameter("reservationTime"); if(reservetime==null) reservetime="";
			if(reservedate!="" && reservetime!=""){
				//Reserve(String date, int sugprice, String reservation, String id, int productno)
				//<h2><% =reservedate+" "+reservetime</h2>
				Reserve ins = new Reserve(reservedate+" "+reservetime ,reserveProInfo.getPrice(),"O",Login.getId(),reserveProInfo.getProductno());
				reservedao reserveDao = new reservedao();
				reserveDao.reserveAdd(ins);
				reserveDao.dealstatUpdate(reserveProInfo.getProductno());
				reserveSucc = true;
			}else if(reservedate=="" || reservetime==""){
				isReservedate = true;
			}
		}else{
			loginalert=true;
		}
	%>
</head>
<body>


</body>
<script type="text/javascript">
//----------------------------로그인후 사용해달라는 기능메서드------------------------------------
var alertis = <%=loginalert%>
if(alertis){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp";
} 
//----------------------------예약시간 미입력시 유효성체크 기능메서드-------------------------------
var isReservedateOb = <%=isReservedate%>
if(isReservedateOb){
	alert("[안내메시지]예약시간을 입력해주세요.")
	location.href = "productDetailView.jsp"
}

//-------------------------------------예약완료시 팝업발생--------------------------------
var reserveSuccOb = <%=reserveSucc%>
if(reserveSuccOb){
	 var reserveAfter = confirm("[안내메시지]예약하기가 완료되었습니다. 예약정보를 조회하러 가시겠습니까?")
	 if(reserveAfter){
		 location.href = "reserveView.jsp"
	 }else{
		 location.href = "productDetailView.jsp"
	 }
}
</script>
</html>