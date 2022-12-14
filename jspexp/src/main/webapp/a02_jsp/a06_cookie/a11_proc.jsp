<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.a13_database.*"    
    import="jspexp.a13_database.vo.*" 
    import="java.net.URLEncoder"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script>
/*
 
 */
</script>
</head>
<body>
<%
	// 프로세스 : 등록/수정/삭제
	String proc = request.getParameter("proc");
	// check된 index 번호
	String[] cidx = request.getParameterValues("cidx");
	// 쿠키의 키와 값
	String[] ckey = request.getParameterValues("ckey");
	String[] cval = request.getParameterValues("cval");
	if(proc!=null){ //쿠기값 화면에서 넘어올 떄만 처리
		for(String cidxS:cidx){
			// check box로 선택되어진 key/value
			int idx = Integer.parseInt(cidxS);
			String key = URLEncoder.encode(ckey[idx],"UTF-8");
			String val = URLEncoder.encode(cval[idx],"UTF-8");
			//String key = ckey[idx];
			//String val = cval[idx];
			//입력된 값이 없을 때, check한 것에 대한 에러 방지..
			if(!key.equals("")&&!val.equals("")){
				// 쿠키를 만들어서
				// 수정과 등록은 같은 프로세스로 처리되고
				// 삭제만 setMaxAge를 0으로 추가
				Cookie c = new Cookie(key,val);
				if(proc.equals("del")){
					c.setMaxAge(0);
				}
				response.addCookie(c);
			}
			/* Cookie c = new Cookie(key,val);
			if(proc.equals("del")){
				c.setMaxAge(0);
			}
			response.addCookie(c); 
			if(proc.equals("add")||proc.equals("upt")){
				Cookie c1 = new Cookie(key,val);
				response.addCookie(c1);
			}
			if(proc.equals("del")){
				for(Cookie c1: request.getCookies()){
					if(c.getName().equals(key)){
						c.setMaxAge(0);
						response.addCookie(c1);
					}
				}
			} */
		}
	}
	// 서버단에서 페이지 이동 코드로 서버로 이동 처리..
	response.sendRedirect("a10_CookieList.jsp");

%>
<%--
# 

 --%>


</body>
<script>
/*

 */
</script>
</html>