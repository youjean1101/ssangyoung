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
<title>중고월드 찜 목록조회</title>
<style>
	#cartBox{
		border:4px solid lightgrey;
		border-radius:10px;
		width:1200px;
		height:600px;
		position:fixed;
		left:15%;
		top:12%;
	}
	#cartBox #name{
		font-size:28pt;
		margin:15px 15px;
	}
	#cartBox #cartlistTab{
		/* border:1px solid lightgrey; */
		width:100%;
		height:90%;
		position:absolute;
		top:10%;
	}
	#cartBox #cartlistTab td{
		/* border:1px solid lightgrey; */
		width:25%;
		height:42.5%;
	}
	#cartBox #cartlistTab>#cartproTab{
		/* border:1px solid lightgrey; */
		position:absolute;
		top:0%;
		
	}
	#cartBox #cartlistTab #cartproTab th{
		width:10%;
	}
	#cartBox #cartlistTab #cartproTab td{
		width:90%;
		height:20px;
	}
	#cartproTab td #like{
		position:flex;
		right:0%;
		color:black;
	} 
	#cartproTab td img{
		width:100%;
		height:160px;
	}
	#cartproTab input[name="cartremoveSel"]{
		width:20px;
		height:20px;
	}
	input[name="cartCancel"]{
	background:rgb(142, 68, 173);
	color:white;
	border:1px solid rgb(142, 68, 173);
	border-radius:5px;
	position:absolute;
	right:0%;
	bottom:-10%;
	font-size:14pt;
	font-weight:bold;
	width:140px;
	height:50px;
	}
	.nextorprev{
		background:white;
		color:grey;
		height:60px;
		width:60px;
		border:5px solid grey;
		border-radius:60px;
		font-size:30pt;
		line-height:0px;
		font-size:30pt;
		box-shadow:3px 3px 3px grey;
	}
	input[name="previous"]{
		position:absolute;
		left:45%;
		bottom:-12%;
	}
	input[name="next"]{
		position:absolute;
		left:52%;
		bottom:-12%;
	}
	input[name="previous"]:hover{
		background:white;
		color:black;
		border:5px solid black;
	}
	input[name="next"]:hover{
		background:white;
		color:black;
		border:5px solid black;
	}
	input[name="previous"]:active{
		background:white;
		color:black;
		border:5px solid black;
		box-shadow : none;
	}
	input[name="next"]:active{
		background:white;
		color:black;
		border:5px solid black;
		box-shadow : none;
	}
	.title{
		font-size:13pt;
		font-weight:bold;
	}
	.local{
		font-size:10pt;
		color:grey;
	}
	.cost{
		font-size:10pt;
		color:orange;
	}
	#nothing{
		color:grey;
		position: absolute;
		top:40%;
		left:38%;
		font-size:25pt;
	}
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<%
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		cartlistdao cartlistDao = new cartlistdao();
		boolean hasSess = Login!=null; 
		boolean loginalert=false;
		int cartCnt=0;
		/* int productno[] = null;
		String productname[] = null;
		String faddressval[] = null;
		String saddressval[] = null;
		String caddressval[]= null;
		int price[] = null; */
		if(hasSess){
	%>
	<form id="cartremoveform" action="cartRemove.jsp">
		<box id="cartBox">
			<h2 id="name"><%=Login.getUsername() %>님의 찜목록♥</h2>
			<%if(cartlistDao.isCartProd(Login.getId())){ %>
			<table id="cartlistTab">
				<tr>
					<%for(Olderproduct productInfo:cartlistDao.cartProductInfo(Login.getId())){ 
						cartCnt = cartlistDao.cartProductCnt(productInfo.getProductno());
						/* for(int i=0;i<productInfo.length;i++){
							productno[i] = productInfo.getProductno();
							productname[i] = productInfo.getProductname();
							faddressval[i] = productInfo.getFaddressval();
							saddressval[i] = productInfo.getSaddressval();
							caddressval[i]= productInfo.getCaddressval();
							price[i] = productInfo.getPrice();
						}
							System.out.println(productno);
							System.out.println(productname);
							System.out.println(faddressval);
							System.out.println(saddressval);
							System.out.println(caddressval);
							System.out.println(price);
						} */
						
					%>
					<!-- <tbody></tbody> -->
						<td>
							<table id="cartproTab">
								<tr>
								<th><input type="checkbox" name="cartremoveSel" value="<%=productInfo.getProductno()%>"/></th>
									<td><img src=".\img\productPhoto\<%=productInfo.getProductname()%>.png"/></td>
								</tr><!-- 이미지테이블 생성 시 기능구현-->
								<tr>
								<th></th><td class="title"><%=productInfo.getProductname() %></td>
								</tr>
								<tr>
								<th></th>
								<td class="local">
								<%=productInfo.getFaddressval()%> <%=productInfo.getSaddressval()%> <%=productInfo.getCaddressval()%>
								</td>
								</tr>
								<tr>
								<th></th>
								<td class="cost"><%=productInfo.getPrice()%>원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<span id="like">♡ <%=cartCnt %></span></td></tr>
							</table>
						</td> <!-- 반복문으로 나타내야함 4X2테이블로 -->
				<%} %>
				</tr>
				<tr><td></td><td></td><td></td><td></td></tr>
			</table>
			<%}else{ %>
				<h2 id="nothing">찜 상품이 없습니다.</h2>
			<%} %>
			<input type="button" name="cartCancel" value="찜 삭제하기" onclick="cartRemove()"/>
			<input type="button" class="nextorprev" name="previous" value="◀"/>
			<input type="button" class="nextorprev" name="next" value="▶"/>
		</box>
	</form>
	<%	}else{ 
		loginalert=true;
	} %>
</body>
<script type="text/javascript">

//--------------------------미로그인으로 접속 시, 기능메서드-------------------------------------
	var alertis = <%=loginalert%>
	if(alertis){
		alert("[안내메시지]로그인을 해주세요.")
		location.href="login.jsp";
	}
//------------------------조회화면 4행2열 만들기 기능메서드---------------------------------------

<%-- 	var cartlistTabOb = document.querySelector("#cartlistTab tbody");
	var show = "";
	var i =1;
	for(var rowIdx=0;rowIdx<2;rowIdx++){
		show += "<tr>"
		for(var colIdx=0;colIdx<4;colIdx++){
			show+="<td><table id='cartproTab'>"
			show+="<tr><th><input type='checkbox' name='cartremove' value='<%=productno[i]%>'/></th>"
			show+="<td><img src='.\img\productPhoto\애플마우스.png'/></td></tr>"
			//show+= productnameOb
			//show+=".png'/></td></tr>"
			show+="<tr><th></th><td class='title'><%=productname[0]%></td></tr>"
				show+="<tr><th></th><td class='local'><%=faddressval[0] %> <%=saddressval[0]%> <%=caddressval[0]%></td></tr>"
					show+="<tr><th></th><td class='cost'><%=price[0]%>원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"
					show+="<span id='like'>♡ <%=cartCnt[0]%></span></td></tr>"
			show+="</table></td>"
		}
		show += "</tr>"
	}
	/* for(var rowIdx=0;rowIdx<=2;rowIdx++){
		show+="<tr>"
		for(var colIdx=0;colIdx<=4;colIdx++){
			show += "<td><table><tr><th>테이블안에테이블<th></tr></table><td>"
		}
		show+="</tr>"
	} */
	cartlistTabOb.innerHTML = show;
 --%>
//-------------------------------------찜삭제 미체크시, 유효성체크 기능-----------------------------------
function cartRemove(){
	var cartRemoveSelArr = document.querySelectorAll("[name=cartremoveSel]")
	var is_checked = false;
	cartRemoveSelArr.forEach(function(prock){
		if(prock.checked==true){
			is_checked=true
		}
	})
	if(!is_checked){
		alert("[안내메시지]찜 삭제할 상품을 선택해주세요.")
	}else{
		if(confirm("선택하신 품목을 찜목록에서 삭제하시겠습니까?")){
			document.querySelector("#cartremoveform").submit();
		}
	}
} 

</script>
</html>