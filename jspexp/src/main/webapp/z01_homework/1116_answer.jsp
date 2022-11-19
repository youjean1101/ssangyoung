<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
      
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
*/
</script>

</head>
<form>
				<table>
					<col width="10%">
					<tr><th>no</th><th>물건명</th><th>가격</th></tr>
					<%for(int cnt=1;cnt<=3;cnt++) {%>
					<tr><td><%=cnt %></td>
					<td><input type="text" name="pname" /></td>
					<td><input type="text" name="price" /></td>
					</tr>
					<%} %>
					<tr><td colspan="3"><input type="submit" value="구매" /></td></tr>
				</table>
			</form>
			
			<%
			int tot=0;
			String buyList="";
			// getParameterValue : 동일한 요청 key로 여러개의 데이터를 처리할 때 사용
			// pname=사과&pname=바나나&pname=오렌지
			String pnames[] = request.getParameterValues("pname");
			String prices[] = request.getParameterValues("price");
			if(pnames!=null && pnames.length>0){
				for(int idx=0; idx<pnames.length; idx++){ 
					if(pnames[idx]!=null) buyList+=pnames[idx]+", ";
					if(prices[idx]!=null) tot+=Integer.parseInt(prices[idx]);
				}
			}
			if(tot!=0){
			%>	
			<h2>구매목록리스트:<%=buyList %></h2>
			<h2>총비용:<%=tot %></h2>
			<%} %>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>