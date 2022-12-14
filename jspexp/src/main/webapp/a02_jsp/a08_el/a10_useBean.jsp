<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
# useBean을 활용한 객체 생성
1. jsp에서는 action 태그의 한 형식으로 useBean을 객체를 생성하여 사용하는데 활용한다.
2. 객체 선언과 생성
	<jsp:useBean id="참조명" class="패키지.클래스명" scope="세션범위"/>
3. 호출
	1) <jsp:getProperty name="참조명" property="프로퍼티명" />
		${참조명.property명}
	2) <jsp:setProperty name="참조명" property="프로퍼티명" value="할당할 데이터" />
		${참조명.setXXX('할당데이터')}
public Player(String teamName, String player, double score)
--%>
<jsp:useBean id="pl01" class="jspexp.vo.Player"></jsp:useBean>
<jsp:setProperty property="teamName" name="pl01" value="맨체스터유나이티드"/>
<jsp:setProperty property="player" name="pl01" value="박지성"/>
<jsp:setProperty property="score" name="pl01" value="30.0"/>
<h2>팀명:<jsp:getProperty property="teamName" name="pl01" /></h2>
<h2>이름:<jsp:getProperty property="player" name="pl01" /></h2>
<h2>성적:<jsp:getProperty property="score" name="pl01" />골</h2>
<jsp:useBean id="pl02" class="jspexp.vo.Player" />
${pl02.setTeamName("토트넘")} ${pl02.setPlayer("손흥민")} ${pl02.setScore(23)}
<h2>팀명:${pl02.teamName}</h2>
<h2>이름:${pl02.player}</h2>
<h2>성적:${pl02.score}</h2>
<%--
 ex) Code 클래스를 이용하여 useBean을 이용하여, 두가지 형식으로 저장하고, 출력하세요.
 public Code(String key, String val) 
 --%>
<jsp:useBean id="co01" class="jspexp.vo.Code"></jsp:useBean>
<jsp:setProperty property="key" name="co01" value="나만의 키는 "/>
<jsp:setProperty property="val" name="co01" value="열정"/>
<h2>
	키:<jsp:getProperty property="key" name="co01" />
	값:<jsp:getProperty property="val" name="co01" />
</h2>

<jsp:useBean id="co02" class="jspexp.vo.Code" />
${co02.setKey("또")} ${co02.setVal("성실함?")}
<h2>${co02.key}:${co02.val}</h2>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>