<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
# jsp에서 조건문과 반복문 처리
1. 반복문 처리
	1) 자바코드는 scriptlet에 넣고, 출력하는 부분은 expression에 넣어 구분하여 처리..
	2) 처리 순서
		- 한단위 기본코드를 만든다.
		- 출력할 부분을 index0으로 처리해 본다.
		- 출력내용을 위아래에 java코드는 <% %>로 감싸준다.
		- 반복문의 기본 형식을 아래 위로 넣는다.
		- index부분을 변수로 처리해준다.
 --%>
 <%
 	String[] arry={"사과","바나나","딸기"};
 %>
 	<%for(String fruit:arry){ %>
 	
 	<h2><%=fruit%></h2>
 	<%}%>
 	<%-- ex) 가격을 배열 만들고, 반복문을 통해서 h3로 출력하세요. --%>
 	<% 
 	int[] prices={3000,5000,9000}; 
 	log("길이"+prices.length);
 	for(int idx=0;idx<prices.length;idx++){
 		log("index:"+idx);
 		System.out.println(arry[idx]+":"+prices[idx]);
 		log("#로그#"+arry[idx]+":"+prices[idx]);
 	}
 	%>
 	
 	<% for(int idx=0;idx<prices.length;idx++){ %>
 	
 	<h3><%=prices[idx] %></h3>
 	<%} %>
 	<h3>물건의 정보</h3>
 	<style>
 		td{text-align:center;}
 	</style>
 	<%-- 중간에 ctrl+s를 누르면서 에러가 나는지 확인 --%>
 	<table width="50%" style="border-collapse:collapse" border>
 		<tr><th>no</th><th>물건명</th><th>가격</th></tr>
 		<% for(int idx=0;idx<prices.length;idx++){%>
 		<tr>
 		<td><%= idx+1%></td>
 		<td><%= arry[idx] %></td>
 		<td><%=prices[idx] %></td>
 		</tr>
 		<%} %>
 	</table>
 	<%--
 	ex) 사원명 사원번호 부서번호를 각각 배열만들고, for문을 통해서 출력 처리하세요.
 	 --%>
 	 <% 
 	 String[] enameArry={"홍길동","김길동","이길동"}; 
 	 int[] enoArry={7000,7001,7002}; 
 	 int[] deptnoArry={10,20,30}; 
 	 
 	 for(int idx=0; idx<enameArry.length;idx++){
 		 System.out.println(enameArry[idx]+","+enoArry[idx]+","+deptnoArry[idx]);
 	 }		 
 	 %>
 	 <br>
 	 <table width="30%" style="border-collapse:collapse" border>
 	 	<tr><th>사원번호</th><th>사원명</th><th>부서번호</th></tr>
 	 	<%  for(int idx=0; idx<enameArry.length;idx++){%>
 	 	<tr>
 	 	<td><%=enoArry[idx] %></td>
 	 	<td><%=enameArry[idx] %></td>
 	 	<td><%=deptnoArry[idx] %></td>
 	 	</tr>
 	 	<%} %>
 	 </table>
 	 
 	
</body>
</html>