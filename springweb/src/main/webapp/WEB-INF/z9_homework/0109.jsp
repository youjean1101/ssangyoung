<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</script>
</head>

<body>
<%--2023-01-09
[1단계:개념] 1. MVC패턴으로 ajax를 구현할려고 한다. 주요 자바프로그램과 프로세스를 설명하세요
            controller, service, view
[1단계:개념] 2. Gson lib는 어떤 역할을 하는지 예제를 통해서 설명하세요
[1단계:개념] 3. controller의 PrintWriter out =response.getWriter();는 어떤 역할을 하는가?
[1단계:확인]*4. 회원등록form을 로딩하고, id중복여부를 확인하는 기능을 처리하는 MVC ajax를 구현하세요.
           기존 dao에서 검색메서드 활용
controller
	A13_MemberController.java(/member.do)
		String id = request.getParameter("id");
		
		if(id==null){
			request.getRequestDispatcher("WEB-INF\a01_mvc\a12_memberReg.html").forward(request,response);
		}else{
			PrintWriter out = request.getPrintWriter()
			out.print(service.checkIdJson(id))
		}
	
service
	A14_MemberService.java, A06_PreparedDao.java(checkId(String id))
		public String checkIdJson(String id){
			return dao.checkId(id);
		}
view
	WEB-INF\a01_mvc\a12_memberReg.html
	<h2>회원등록</h2>
		아이디 : <input type="text" name="id" />
			<input type="button" value="등록여부확인" id="chIdBtn" />
			<input type="hidden" id="passIdck" value="false" />
	<script>
		var idObj = document.querySelector("[name=id]");
		var chIdBtn = document.querySelector("#chIdBtn");
		var passIdckObj = document.querySelector("#passIdck");
		idObj.onkeyup=function(){
			// 글자 유효성 check(8~18)
			if(event.keyCode==13){
				validChk();
			}
		}
		chIdBtn.onclick=validChk;
		function validChk(){
			var idVal = idObj.value;
			if(idVal>=8 && idVal<=18){
				idCkAjax()
			}else{
				alert("등록할 아이디는 8~18 가능합니다.")
			}
		}
		function idCkAjax(){
			var xhr = new XMLHttpRequest();
			xhr.open("get", "/member.do", true);
			xhr.send()
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					console.log(xhr.responseText)
					var hasId = JSON.parse(xhr.responseText)
					if( hasId ){
						alert("등록된 아이디 입니다.");
						passIdckObj.value="true" // 최종적으로 회원 등록시, 
						idObj.readOnly="readOnly" // 일단 인증이 되었을 때는 변경 못하게 
					}else{
						alert("등록 가능한 아이디입니다.);
					}
				}
			}
		}
			
[1단계:개념] 5. 스프링 환경 설정을 위한 순서를 기술하세요
[1단계:개념] 6. dispather.xml와 web.xml의 역할을 기술하세요.
[1단계:확인]*7. 다이나믹 웹프로젝트로 springweb2로 만들고, 스프링의 front단과 컨트롤러를 등록하고 backend를 호출하세요.
            ppt자료 작성 및 제출
            
[1단계:개념]*8. 오늘 한 예제 밑에 바로 및에 기능 메서드 추가하여 start2.do로 a02_start.jsp가 호출되는 예제를 작성하세요.
 --%>
</body>
</html>