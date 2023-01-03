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
<title>중고월드 판매 예약 내역</title>
<script type="text/javascript">
</script>
<style>
	#reservelistTab #reserveproTab{
		/* border:1px solid lightgrey; */
		margin:2px 17px;
	}
	#reserveBox #reservelistTab #reserveproTab td{
		width:100%;
		height:15px;
		/* border:2px solid black; */
	}
	#reserveproTab td #like{
		position:flex;
		right:0%;
		color:black;
	} 
	#reserveproTab td img{
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
	#nothing{
		color:grey;
		position: absolute;
		top:40%;
		left:35%;
	}
</style>
</head>
<body>
	<table id="reservelistTab">
			<tr>
				<%
				reservedao reserveDao = new reservedao();
				cartlistdao cartlistDao = new cartlistdao();
				int cartCnt=0;
				Olddealuser Login = (Olddealuser)session.getAttribute("Login");
				boolean hasSess = Login!=null; 
				boolean loginalert=false;
				if(hasSess){
					if(reserveDao.isReserveViewPro("판매예약",Login.getId())){
						for(Olderproduct productInfo:reserveDao.buysalesReservePro("판매예약",Login.getId())){ 
						cartCnt = cartlistDao.cartProductCnt(productInfo.getProductno());
				%>
					<td>
						<table id="reserveproTab">
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
				<%} %>
			</tr>
			<tr><td></td><td></td><td></td><td></td></tr>
	</table>
			
			<%		}else{%>
						<h2 id="nothing">판매상품 중 예약된 물품이 없습니다.</h2>
			<% 		}
			}%>
			


</body>
<script type="text/javascript">


</script>
</html>