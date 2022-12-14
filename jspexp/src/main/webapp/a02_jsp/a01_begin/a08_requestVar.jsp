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
# 요청값을 변수할당.
1. 요청값
 ?name=사과&price=3000&cnt=2
2. 변수를 지정해서 할당하면 기본 문자열로 할당이 된다.
# 요청값이 없을 때, default 데이터를 위한 처리
1. if조건을 통해서 null인 경우 
	1) 문자열 ==> ""
	2) 숫자 ==> 0
	초기화면에서 form 요소객체에 의해서 요청값을 전송하지 않기 때문에
	null 데이터인 경우로 처리된다.
	==> 한페이지에서 form 입력화면과 요청값을 전달할 결과 데이터 출력화면이
	같이 처리될 때, 주로 if(요청==null)를 check하여 처리한다.
	
 --%>
 <%
 String name = request.getParameter("name");
 if(name==null) name="";
 String price = request.getParameter("price");
 if(price==null) price="0";
 String cnt = request.getParameter("cnt");
 if(cnt==null) cnt="0";
 %>
 	<h2>이름:<%=name %></h2>
 	<h2>가격:<%=price %></h2>
 	<h2>갯수:<%=cnt %></h2>
 <%--
 ex) 학생명, 국어, 영어, 수학 점수를 요청값을 처리하고, 학생명 ==> "없음", 숫자는 0
 	으로 표현해서, 테이블형태로 데이터를 출력하세요. 
 	학생명 @@
 	국어 @@
 	영어 @@
 	수학 @@
? 	: 초기화면 - request.getParameter("sname") == null
 	?stuName=&kor=&eng=&math=
 	 : 입력하지 않고 submit 했을 때
 	 - request.getParameter("sname").equals("")
 	ps) 서버에 전송되기 전에 js단에서 form 요소가 입력되게 처리한다.
 	?stuName=홍길동&kor=70&eng=80&math=90
 	 : 입력하고 submit 했을 때..
 	 - request.getParameter("sname").equals("홍길동")
  --%>
  <%
  String stuName =request.getParameter("stuName");
  if(stuName==null) stuName="없음";
  String kor =request.getParameter("kor");
  if(kor==null || kor.equals("")) kor="0";
  String eng =request.getParameter("eng");
  if(eng==null || eng.equals("")) eng="0";
  String math =request.getParameter("math");
  if(math==null || math.equals("")) math="0";
// 문자열 형식으로 된 숫자형 문자열을 숫자로 변환.. : Interger.parseInt("25")==>25
// 실수 Double.parseDouble("25.7")
// 입력없이 submit을 누르면 넘어갈 때.
// null이 아니고 ""으로 처리되기에 Integer.parseInt("")에러가 발생한다.
// 자바는 NumberFormatException 발생해서 수행중단, js parseInt("") ==> NaN
// ?math=&kor=
	int korInt = Integer.parseInt(kor);
	int engInt = Integer.parseInt(eng);
	int mathInt = Integer.parseInt(math);
	int tot = korInt + engInt + mathInt;
  
  %>
  	<table>
  	<tr><th>학생명</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th></tr>
  	<tr><td><%=stuName %></td><td><%=kor %></td><td><%=eng %></td><td><%=math %></td><td><%=tot %></td></tr>
  	</table>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>