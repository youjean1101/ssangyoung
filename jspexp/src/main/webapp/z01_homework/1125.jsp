<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">

</script>

</head>
<body>
	<h2>[2단계:확인] 1. [jsp] 회원등록리스트(회원아이디,회원명,포인트,권한(select-관리자/일반사용자/방문객))로 출력 리스트를 처리하세요.</h2>
	<%
	 	// public Member(String id, String name, String auth, int point) 
	 	List<Member> mlist = new ArrayList<Member>();
		mlist.add(new Member("himan","홍길동","관리자",200));
		mlist.add(new Member("goodman","신길동","일반사용자",300));
		mlist.add(new Member("goodgirl","김길동","방문객",100));
		mlist.add(new Member("higirl","이길동","일반사용자",450));
	 %>
	
	<table>
	<tr><th>선택</th><th>회원아이디</th><th>회원명</th><th>포인트</th><th>권한</th></tr>
	<% for(int idx=0;idx<mlist.size();idx++){ 
	 		Member m = mlist.get(idx);
	 	%>
	<tr><td><input type="checkbox" name="ck" value="<%=idx%>"/></td>
		<td><input type="text" name="id" value="<%=m.getId()%>"/></td>
		<td><input type="text" name="name" value="<%=m.getName()%>"/></td>
		<td><input type="number" name="point" min="10" max="100000" step="10" value="<%=m.getPoint()%>"/></td>
		<td><select>
				<option value="관리자" <%=m.getAuth().equals("관리자")?"selected":""%>>관리자</option>
				<option value="일반사용자" <%=m.getAuth().equals("일반사용자")?"selected":""%>>일반사용자</option>
				<option value="방문객" <%=m.getAuth().equals("방문객")?"selected":""%>>방문객</option>
			</select>
		</td></tr>
	<%} %>
	</table>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>