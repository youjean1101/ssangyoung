<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>        
<%@page import = "java.util.Enumeration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<jsp:useBean id="PDao" class="webproject.Prod"/>
<jsp:useBean id="pd" class="webproject.ProdVO"/>
<jsp:setProperty name="pd" property="*"/>


<c:if test="${param.prodval=='ins'}">
	<%
		String loc="C:/Users/aoddl/git/JoongGo/JoongGo/src/main/webapp/2WebProject/img/saleProd";
		int maxSize=1024*1024*5; // 키로바이트*메가바이트*기가바이트
		MultipartRequest multi = new MultipartRequest(
		         request,
		         loc,
		         maxSize, 
		         "utf-8",
		         new DefaultFileRenamePolicy()
		);
	%>
	<c:set var="prodsuccess" scope="page" value="${PDao.insertProd(pd)}"/> 
	<c:if test="${prodsuccess!=0}">
			<c:set var="imgsuccess" scope="page" value="${PDao.insertimage(pd,prodsuccess)==1}"/>
			<script type="text/javascript">
				var imgsuccess = ${imgsuccess}; //처리된 리턴값 true/false
				if(imgsuccess){
					alert("판매등록 완료되었습니다.감사합니다.")
					location.href="ProdSearch.jsp"
				}
				else if(imgsuccess==false){
					alert("판매등록 실패되었습니다. 다시 시도부탁드립니다.")
					location.href="ProdSearch.jsp"
				}
			</script>
	</c:if>
</c:if>

<c:if test="${param.prodval=='uptStatus'}">
	${PDao.updatedealStatus(pd)} 
</c:if>
<c:if test="${param.prodval=='likeinsert'}">
	${PDao.likeinsert(pd)} 
</c:if>
<c:if test="${param.prodval=='likedelete'}">
	${PDao.likedelete(pd)} 
</c:if>
<c:if test="${param.prodval=='proddelete'}">
	${PDao.DeleteProd(pd)} 
</c:if>








