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
<title>중고월드 구매완료 판매내역</title>
<script type="text/javascript">

</script>
<style>
	#dealSuccSalesListTab #dealSuccSalesproTab{
		/* border:1px solid lightgrey; */
		margin:2px 17px;
	}
	#dealSuccSalesListTab #dealSuccSalesproTab td{
		width:100%;
		height:15px;
		/* border:2px solid black; */
	}
	#dealSuccSalesproTab td #like{
		position:flex;
		right:0%;
		color:black;
	} 
	#dealSuccSalesproTab td img{
		width:250px;
		height:140px;
		border-radius:5px;
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

</style>
</head>
<body>
	<table id="dealSuccSalesListTab">
			<tr>
				<%
				reservedao reserveDao = new reservedao();
				cartlistdao cartlistDao = new cartlistdao();
				int cartCnt=0;
				Olddealuser Login = (Olddealuser)session.getAttribute("Login");
				boolean hasSess = Login!=null; 
				boolean loginalert=false;
				if(hasSess){
					for(Olderproduct productInfo:reserveDao.salesViewPro(Login.getId(),"거래완료")){ 
					cartCnt = cartlistDao.cartProductCnt(productInfo.getProductno());
				%>
					<td>
						<table id="dealSuccSalesproTab">
							<tr><td><img src=".\img\productPhoto\<%=productInfo.getProductname()%>.png"/></td></tr>
							<tr><td class="title"><%=productInfo.getProductname() %></td></tr>
							<tr><td class="local">
							<%=productInfo.getFaddressval()%> <%=productInfo.getSaddressval()%> <%=productInfo.getCaddressval()%>
							</td></tr>
							<tr>
							<td class="cost"><%=productInfo.getPrice()%>원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							<span id="like">♡ <%=cartCnt %></span></td></tr>
						</table>
					</td> <!-- 반복문으로 나타내야함 4X2테이블로 -->
			<%} 
			}%>
			</tr>
			<tr><td></td><td></td><td></td><td></td></tr>
	</table>
</body>
<script type="text/javascript">


</script>
</html>