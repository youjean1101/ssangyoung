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
<body>
<%-- 
# ex) 영화명, 가격, 관람인원을 입력받아서 영화명과 총관람비용을 하단 테이블에 출력하게 하세요.
--%>	
	<form>
		영화명: <input type ="text" name="movieName"/>
		가격 : <select name="movieprice"/>
				<option value="10000">일반(10000원)</option>
				<option value="13000">3D(13000원)</option>
				<option value="17000">4D(17000원)</option>
			  </select>
		관람인원: 
			<select name="moviePersonCnt">
				<%for(int cnt=1; cnt<=10; cnt++){ %>
				<option><%=cnt %></option>
				<%} %>
			</select>
		<input type="submit" value="영화예매">
	</form>
	<%
	// ?mname=영화명&price=10000&cnt=5
	String movieName = request.getParameter("movieName");
	// 요청값이 없는 초기화면에는 출력내용이 보이지 않게 처리..
	// null이 아닐때만 보이게 처리..
	if(movieName!=null){
		// 물건가격 ==> 
		String movieprice = request.getParameter("movieprice");
		if(movieprice==null) movieprice="0";
		String moviePersonCnt = request.getParameter("moviePersonCnt");
		if(moviePersonCnt==null) moviePersonCnt="0";
		// 가져온 price, cnt를 숫자로 형변환 후, 연산 처리(*) tot할당.	
		int tot = Integer.parseInt(movieprice)*Integer.parseInt(moviePersonCnt);
	%>
	<table>
		<col width="40%">
		<tr><th>영화명</th><td><%=movieName %></td></tr>
		<tr><th>총관람비용</th><td><%=tot %></td></tr>
	</table>
	<%} %>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>