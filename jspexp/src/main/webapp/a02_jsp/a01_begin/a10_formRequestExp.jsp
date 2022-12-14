<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
      
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
	//	a10_formRequestExp.jsp
	// 1. 초기로딩된 페이지와
	// 2. 요청값을 전달 후 만들어진 페이지는 다른 모양으로 나온느 
	// 		초기화면과 요청값을 받은 후 나오는 2개의 논리적 페이지를 포함하고 있다.
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
<%--
# 숫자형 데이터 요청값 처리
1. default 변수 선언.
	int num01=0;
2. 요청값 설정
	String num01S = request.getParameter("num01);
3. 해당 요청데이터가 있을 때, 형변환 처리.
	if(num01S!=null) num01 = Integer.parseInt(num01S);
# 함수형 처리(기능메서드 선언 처리)
int chInt(String req){
	int num =0;
	if(req!=null || !req.equals("")) num = Integer.parseInt(req);
	return num;
}

int num01 = chInt(request.getParameter("num01");
int num02 = chInt(request.getParameter("num02");
	
 --%>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>