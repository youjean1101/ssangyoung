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
		[1단계:개념] 1. db가 연결된 스프링 MVC패턴의 개발 순서를 기술하세요.
	[1단계:확인] 2. 회원관리 화면을 처리하세요(member테이블 활용하여 리스트)
	[1단계:확인] 3. 회원관리 화면을 처리하세요(member테이블 활용하여 단일 데이터 조회)
	[1단계:확인] *4. 회원관리 화면을 처리하세요(member테이블 활용하여 수정)
	[1단계:확인] *5. 회원관리 화면을 처리하세요(member테이블 활용하여 삭제)
	[1단계:개념] 6. 모델어트리뷰트로 콤보박스를 사용하는 경우 처리하는 순서를 기술하세요.
	[1단계:확인] *7. 회원테이블(member)에 권한을 콤보박스를 사용하여 검색조건으로 추가하여 처리하세요.
	sql
		SELECT DISTINCT auth
		FROM member200
		
		select * from member200
		where id like '%'||#{id}||'%'
		and name like '%'||#{name}||'%';
		<if test="auth!=''">
		and auth = #{auth}
		</if>
		select * from member200
		where id = #{id}
		
		update member200
			set name=#{name},
				pass=#{pass},
				point=#{point},
				auth=#{auth}
			where id = #{id}
			
		delete member200
		where id = #{id}
	vo Member
	공통mybatis member, MemberMapper.xml
	dao 
	MemberDao
	public List<String> getAuthCom();
	public List<Member> getMemberList(Member sch);
	public Member getMember(String id);
	public void uptMember(Member upt);
	public void delMember(String id);
	mapper 
	<select id="getAuthCom" resultType="string">
		SELECT DISTINCT auth
		FROM member200
	<select id="getMemberList" parameterType="member" resultType="member">
		select * from member200
		where id like '%'||#{id}||'%'
		and name like '%'||#{name}||'%';
		<if test="auth!=''">
		and auth = #{auth}
		</if>
	<select id="getMember" parameterType="string" resultType="member">
		select * from member200
		where id = #{id}
	<update id="uptMember" parameterType="member" >
		update member200
			set name=#{name},
				pass=#{pass},
				point=#{point},
				auth=#{auth}
			where id = #{id}
	<delete id="delMember" parameterType="string" >
		delete member200
		where id = #{id}
	# 화면처리(리스트화면)
	1. 초기화면 호출
		controller(공통콤보,초기리스트), model, view
		A03_MemberController.java
			@ModelAttribute("authCom")
			public Member getAuthCom(){
				return service.getAuthCom()
			}
			/memberListMy.do
			d.addAttribute("mlist",service.getMemberList(sch));
		A03_MemberService.java
			..dao.단	처리 메서드 호출
	2. 화면 - 데이터
		1) form형식 처리
		2) model데이터 출력 jstl처리
	# 화면 처리(수정 삭제를 위한 단일 화면)
	1. 위리스트 화면에서 클릭 시, id값을 통해 요청 화면 로딩
		controller, model(proc(schOne)), view
	2. 화면 - 데이터 
		1) 단일 데이터 로딩키, 요청 id값을 기준으로 모달창 로딩 후,
		2) model데이터 출력 jstl 처리
	# 수정 버튼 클릭 시
	1. 수정 처리 controller 호출
		controller, model(수정 처리 로딩 표시 proce-upt), view
	2. 화면 - 데이터
		1) 수정 처리 후임을 표시
	# 삭제 버튼 클릭 시
	1. 수정 처리 controller 호출
		controller, model(수정 처리 로딩 표시 proce-del), view
	2. 화면 - 
		삭제 alert띄우고, 다시 location.href
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