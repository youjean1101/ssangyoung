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
2023-01-17
[1단계:개념] 1. 출력을 처리하는 기능메서드를 기술하고, 이 기능메서드에 callback함수가 처리될 때 어떤 효과가 나는지 기술하세요
[1단계:확인] 2. callback함수를 이용하여 5*5 테이블에 1~25번호를 붙이고, 짝/홀별로 배경색상을 다르게 처리하세요
[1단계:개념] 3. 부모/조상객체를 선택하는 기능메서드를 기술하세요
[1단계:확인] 4. <p><h2>,<p><h2>,<p><h2> 구조로 된 상황에서 h2를 클릭시, 상위 p태그이 border의 테두리가 파랑색으로 처리되게 하세요  
[1단계:개념] 5. 자식/후손 객체를 선택하는 기능메서드를 기술하세요
[1단계:개념] 6. 형제 객체를 선택하는 기능메서드를 기술하세요
[1단계:활용] 7. 입력시, next()를 활용해서 유효성(글자수 8~16)에 대한 내용을 표시하게 하세요.
[1단계:활용] 8. eq()를 활용하여 화살표로 커서를 움직일 때 마다, 3X3테이블의 특정한 td의 배경색상이 위치가 이동이 되게 하세요
[1단계:개념] 9. 의존성 자동 주입이란 무엇이고 이것과 관련한 옵션은 어떤 것들이 있는가?
[1단계:확인] 10. Pencil과 Eraser를 1:1관계로 설정하고 의존성 자동 주입으로 처리해보세요.(byType)
[1단계:확인] 11. BusDriver와 Bus를 선언하고 버스기사가 여러 대의 버스가운데 선택된 의존성 자동 주입을 처리해보세요(byName)
[1단계:개념] 12. 특정 패키지 자동 클래스 선언 형식을 기술하세요
[1단계:확인] 13. z06_vo 패키지에 Person, Product, Music 클래스를 복사하고  컨테이너에서 해당 객체들을 호출하게 처리하세요
 

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>