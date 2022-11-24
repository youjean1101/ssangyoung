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
	<h2>[1단계:확인] 3. form 하위 요소객체와 request.getParameterNames()를 이용하여 사원명/사원번호/부서이름을 등록리스트하세요</h2>
	<%-- <form>
		사원명: <input type="text" name="사원명" value="홍길동"/>
		사원번호: <input type="text" name="사원번호" value="7000"/>
		부서이름: <input type="text" name="부서이름" value="인사팀"/>
		<input type="submit" value="등록"/>
	</form>
	
	<table>
 	<%
 	// 요청값이 가변적일 때, 처리되는 객체로 요청 키들을 가지고 온다.
 	Enumeration e = request.getParameterNames();
 	while(e.hasMoreElements()){ 
 		String key = (String)e.nextElement();
 	%>
 		<tr><th><%=key %></th><td><%=request.getParameter(key)%></td></tr>
 	<%} %>
	</table> --%>
	
	<h2>[3단계:확인] 4.(선택) form요소객체를 이용하여 학생3명의 이름/국어/영어/수학 입력하고 요청값을 처리하세요.
				각, 학생의 평균 점수와 과목별 평균점수를 출력하세요.</h2>
	
	<% for(int cnt=1; cnt<=3; cnt++){ %>
	<h3><%=cnt %>번 학생점수</h3>
	<form>
		이름:<input type="text" name="이름" value="이름">
		국어:<input type="text" name="국어점수" value="국어점수">
		영어:<input type="text" name="영어점수" value="영어점수">
		수학:<input type="text" name="수학점수" value="수학점수">
		<%} %>
		<input type="submit" value="계산"/>
	</form>
	
	<%! int chInt(String req){
        		int ret = 0;
        		if(req!=null){
        			try{
        			ret = Integer.parseInt(req);
        			}catch(Exception e){
        				log("에러발생:"+e.getMessage());
        			}
        		}
        		return ret;
        	}
	%>
	<%
			int kor = chInt(request.getParameter("국어점수"));
			int eng = chInt(request.getParameter("영어점수"));
			int math = chInt(request.getParameter("수학점수"));
			int avg = (kor+eng+math)/3;
	%>
	
	<%
	String names[] = request.getParameterValues("이름"); 
	String kors[] = request.getParameterValues("국어점수"); 
	String engs[] = request.getParameterValues("영어점수"); 
	String maths[] = request.getParameterValues("수학점수");
	// int avg[] = request.getParameterValues(avg);
	%>
	
	<table>
		<tr><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>평균점수</th></tr>
		<% if(names!=null&&kors!=null&&engs!=null&&maths!=null){
			for(int idx=0;idx<names.length;idx++){ %>
			<tr>
				<td><%=names[idx] %></td>
				<td><%=kors[idx] %></td>
				<td><%=engs[idx] %></td>
				<td><%=maths[idx] %></td>
				<td></td>
			</tr>
			<%} 
			}%>
		<tr><th>과목별평균점수</th><td></td><td></td><td></td></tr>
	</table>
	
	<h1>정답</h1>
	<h2>학생</h2>
	<%
		String []names4 = {"홍길동", "김길동","신길동"};
	%>
	<form>
		<table>
		<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th></tr>
		<%
		for(int cnt=1;cnt<=3;cnt++){
		%>
			<tr>
			<td><input type='text' name='name4' value=""/></td>
			<td><input type='text' name='kor4' value="0"/></td>
			<td><input type='text' name='eng4' value="0"/></td>
			<td><input type='text' name='math4' value="0"/></td>
			</tr>
		<%}%>
		<tr><td colspan="4"><input type="submit"></td></tr>
		</table>
	</form>
	<p align="center">
		<h3>
		<%
		String []names40 = request.getParameterValues("name4");
		String []kors40 = request.getParameterValues("kor4");
		String []engs40 = request.getParameterValues("eng4");
		String []maths40 = request.getParameterValues("math4");
		int totAll = 0;
		if(names!=null){ // 초기 로딩 화면과 구분
			for(int idx=0;idx<names.length;idx++){
				int tot = 	Integer.parseInt(kors40[idx])+
							Integer.parseInt(engs40[idx])+
							Integer.parseInt(maths40[idx]);
				out.print(names[idx]+", 평균:"+(tot/3)+"<br>");
			}
		}
		out.print("<br>국어점수:");
		if(kors40!=null){
			int tot=0;
			for(String kor4:kors40){
				// 공백, null 숫자형에 대한 처리 ==> 0
				int pt=0;
				try{
					pt = Integer.parseInt(kor4);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>국어합산:"+tot+", 국어평균:"+(tot/3));
			totAll+=tot/3;
		}
		out.print("<br>영어점수:");
		if(engs40!=null){
			int tot=0;
			for(String eng4:engs40){
				// 공백, null 숫자형에 대한 처리 ==> 0
				int pt=0;
				try{
					pt = Integer.parseInt(eng4);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>영어합산:"+tot+", 영어평균:"+(tot/3));
			totAll+=tot/3;
		}
		out.print("<br>수학점수:");
		if(maths40!=null){
			int tot=0;
			for(String math4:maths40){
				// 공백, null 숫자형에 대한 처리 ==> 0
				int pt=0;
				try{
					pt = Integer.parseInt(math4);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>수학합산:"+tot+", 수학평균:"+(tot/3));
			totAll+=tot/3;
		}
		out.print("<br>전체과목학생 평균:"+(totAll/3));
		%>
		</h3>
	
	<h2>[3단계:확인] 5. form요소 객체를 활용하여 장바구니 담긴 물건 3개 중, check된 물건명과 가격 구매갯수 총계가 계산 되게 하세요.</h2>
	<h2>장바구니</h2>
	<form>
		<input type="checkbox" name="basket" value="사과">사과
		<input type="checkbox" name="basket" value="바나나">바나나
		<input type="checkbox" name="basket" value="딸기">딸기
		<input type="submit" value="구매하기">
	</form>
	<%
	String basket[] = request.getParameterValues("basket");
	%>
	<h3>물건명:<%=basket %></h3>
	<%-- <h3>구매갯수:<%=basket.length %></h3> --%>
	<h3>가격:</h3>
	<h3>총계:</h3>
	
	<h2>[1단계:확인] 7. post 방식으로 월드컵 A조의 팀명과 점수를 입력하고 현재 대전 결과를 출력하세요.
                     팀1    팀2 
                팀명[   ]  [    ]
                점수[   ]  [    ]
                      [결과] 
                    @@@ vs @@@
                      1 - 2
                      @@@ 승</h2>
	<h1>정답</h1>
	<h2>월드컵 결과</h2>
	<form method="post">
		<table>
			<tr><th></th><th>팀1</th><th>팀2</th></tr>
			<tr><th>팀명</th><td><input type="text" name="tname"/></td>
							<td><input type="text" name="tname"/></td></tr>
			<tr><th>점수</th><td><input type="text" name="point" value="0"/></td>
							<td><input type="text" name="point" value="0"/></td></tr>
			<tr><td colspan="3"><input type="submit" value="결과"/></td></tr>
		</table>
	</form>
<%
	String tnames[] = request.getParameterValues("tname");
	String points[] = request.getParameterValues("point");
	if(tnames!=null){
		out.print(tnames[0]+" vs "+tnames[1]+"<br>");
		out.print(points[0]+" : "+points[1]+"<br>");
		int pt1 = Integer.parseInt(points[0]);
		int pt2 = Integer.parseInt(points[1]);
		String result = "무승부";
		if(pt1>pt2) result = tnames[0]+"승";
		if(pt1<pt2) result = tnames[1]+"승";
		out.print(result);
	}
%>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>