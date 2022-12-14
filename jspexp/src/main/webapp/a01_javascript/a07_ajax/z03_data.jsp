<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
${param.num01} + ${param.num02} = ${param.num01+param.num02}
<%--요청값을 받아서 위 형식으로 만들어 다시 client로 전달 
ex) a04_reqSynch.html
	z04_data.jsp
	물건명[	] 가격[	] 갯수[	]
	[구매]
	
	@@@를 @@@(총계)에 구매하셨습니다. 출력
--%>
