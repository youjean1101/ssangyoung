<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "java.util.*"
    import="jspexp.vo.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="\a00_com\a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
 */
</script>
</head>
<body>
<%-- 팀명 선수명 성적을 Player라는 vo 클래스를 만들고 출력처리 해보세요. --%>
<%
	List<Player> plist = new ArrayList<Player>();
	plist.add(new Player("SSG", "김광현", 0.378));
	plist.add(new Player("한화", "모루겟", 0.400));
	plist.add(new Player("SSG", "김광현", 0.240));
	for(Player p:plist){
		log(p.getTeamName()+":"+p.getPlayer()+":"+p.getScore());
	}
%>
	<table border>
	<tr><th>팀명</th><th>선수명</th><th>성적</th></tr>
	<% for(Player p:plist){%>
	<tr><td><%=p.getTeamName() %></td><td><%=p.getPlayer() %></td><td><%=p.getScore() %></td></tr>
	<%} %>
	</table>
</body>
</html>