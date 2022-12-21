<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
%>
<jsp:useBean id="dao" class="z02_teamproject4.userdao"></jsp:useBean>
{"hasMember":${dao.userIDConfirm(param.id)}}