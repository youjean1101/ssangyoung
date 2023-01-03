<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
       import="jspexp.a13_database.*"
   %>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="al" class="webproject.Alert"/>
<jsp:useBean id="alert" class="webproject.AlertVO"/>
<jsp:setProperty property="*" name="alert"/>
<c:set var="success" scope="page" value="${al.DeleteAlert(alert)==1}"/>

<script>
	var success=${success}
	if(success){
		 var OriginalPage=document.referrer
		location.href=OriginalPage
	}
</script>