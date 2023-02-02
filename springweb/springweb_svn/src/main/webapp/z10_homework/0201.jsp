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
[1단계:개념] 1. 고정아이피를 통해서 svn/git서버 설정과 클라이언트를 통해 접속하는 설정 과정을 기술하세요.
[1단계:확인] 2. (조별과제) svn/git에 서버에 리파지토리로 prj01 폴드를 만들고, 이 폴드에 다이나믹웹프로젝트 올리고, 
            클라이언트에서 해당 프로젝트를 import처리하세요 
[1단계:개념] 3. 고정아이피를 통해서 DB서버 설정과 원격에서 접속하기위해 설정해야 하는 내용을 기술하세요.
[1단계:확인] 4. (조별과제) 원격에 있는 DB서버에 system/1111 계정으로 접근하여 조원들의 각 계정을 만들어서,
           해당 계정으로 접속하여 member테이블을 만들고 데이터를 넣고, 다른 조원 계정으로 접속해서 데이터를
           확인하세요.
      DB 설치 시, 비밀번호 : @@@@ 관리자 계정 비밀번호
     C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin]scott.sql
     계정은 system //1111계정으로 접근해서 계정을 만들고,
     	계정생성(id,pass),
     	계정에 권한을 부여(접근, 테이블 생성 및 사용하는 권한, 물리적 파일을 접근하여 사용)
     	
     // ex) scott/tiger 비번호는 대소문자 구분
     	GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY tiger;
     	ALTER USER SCOTT DEFAULT TABLESPACE USERS;
		ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
     // ex) himan/7777
     	
     	GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO himan IDENTIFIED BY 7777;
     	ALTER USER himan DEFAULT TABLESPACE USERS;
		ALTER USER himan TEMPORARY TABLESPACE TEMP;
     	
     // tablespace는 물리적 저장위치와 연결되어 있어, 데이터베이스가 만들어지고 실제 물리적 위치의 저장소도 연결하여야 한다.
		ALTER USER 권한을줄아이디 DEFAULT TABLESPACE USERS;
		ALTER USER 권한을줄아이디 TEMPORARY TABLESPACE TEMP;
      
[1단계:확인] 5. (조별과제) 프로젝트 진행할 다이나믹웹프로젝트 만들어, 스프링환경으로 처리하여, controller로
            첫화면이 로딩되게 처리하세요.
[1단계:확인] 6. (조별과제) 프로젝트 진행할 다이나믹웹프로젝트 만들어, 스프링환경으로 처리하여, controller로
            DB처리가 되는 첫화면이 로딩되게 처리하세요.
      컨테이너 부분에 DB연결 정보와 계정/비번으로 스프링 환결설정을 완료한다.
		<property name="url" value="jdbc:oracle:thin:@223.26.137.39:1521:xe"/>	
		<property name="username" value="himan"/>	
		<property name="password" value="7777"/>
      
[1단계:개념] 7. vue의 디렉티브 3가지 형식 {{}}, v-text, v-html의 차이를 기술하세요.

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