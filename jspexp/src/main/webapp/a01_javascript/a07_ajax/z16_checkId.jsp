<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    %>
<%-- 주석은 꼭 이걸로 해야함
jspexp.a13_database.A06_PareparedDao checkId
데이터가 있으면 true, 없으면 false
{"hasMember":true}
{"hasMember":false}
 --%>
<jsp:useBean id="dao" class="jspexp.a13_database.A06_PareparedDao"></jsp:useBean>
{"hasMember":${dao.checkId(param.id)}}