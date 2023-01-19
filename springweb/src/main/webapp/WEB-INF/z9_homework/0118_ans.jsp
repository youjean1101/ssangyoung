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
2023-01-18
[1단계:개념] 1. ajax처리를 위하여 백엔드단에서 처리할 부분과, 프런트단 처리할 부분을 구분하여 기술하세요.
[1단계:확인] 2. dao에 회원정보 처리 메서드 확인해서, json데이터를 가져오는 처리를 하세요
[1단계:확인]#3. jquery ajax를 이용해서 물건가격과 갯수를 입력시, 결과로 컨트롤에서 총계를 받아서 alert으로 처리하게 하세요.
   1) 초기화면 호출 Controller 작성
      A02_Controller.java
      @GetMapping("buyProd99.do")
      public String buyProd99(){
         return "z10_homework\0118.jsp";
      } 
   2) RestController에 요청값에 의해 결과 데이터 리턴하는 처리
      // Get방식/Post방식이 따로 선언할 때는 동일한 url 선언 가능
      @PostMapping("buyProd99.do") // produces="text/plain;charset=utf=8"
      public String buyProd99(Product p){
         // 총계값 전달
         return ""+p.getPrice()*p.getCnt();
      }
   3) 화면단 jquery ajax 처리
      <form>
         물건가격:<input class="sch" type="number" name="price" value="0"/> 
         물건갯수:<input class="sch" type="number" name="cnt" value="0" /> 
      이벤트 핸들러 선언
         $(".sch").on("keyup",function(){
            if(event.keyCode==13){
               $.ajax({
                  url:"${path}/buyProd99.do",
                  type:"post",
                  data:$("form").serialize(),
                  success:function(tot){
                     alert("총계:"+tot)
                  }
                  error:function(xhr,status,err){
                     console.log(err)
                  }
               })
            }
         })
      ajax 처리
            
[1단계:확인]#4. 초기화면을 로딩해서 회원명과 권한으로 조회해서 회원 정보를 ajax로 출력하여 처리를 하세요.
   1) 초기화면 호출 및 구현 
      A02_Controller.java
      @GetMapping("/memListAjax.do")
      public String memListAjax(){
         return "z10_homework\\0118.jsp";
      }
      view :z10_homework\0118.jsp
      회원명:<input type="text" class="sch" name="name"
      권한:<input type="text" class="sch"  name="auth"
   2) Rest컨트롤러 선언
      @PostMapping("/memListAjax.do")
      public String  memListAjax(Member sch){
         Gson g = new Gson()
         A06_PreparedDao dao = new A06_PreparedDao();
         return g.toJson(dao.getMemberList(sch));
      }
   3) 화면단 이벤트 핸들러 및 ajax처리
      $(".sch").keyup(function(){
         if(event.keyCode==13){
            $.ajax({
               url:"${path}/memListAjax.do",
               type:"post",
               data:$("#frm02").serialize(),
               dataType:"json",
               success:function(mlist){
                  var addHTML=""
                  $(mlist).each(function(idx,mem){
                     addHTML+="<tr>"
                     addHTML+="<td>"+mem.getId()+"</td">
                     addHTML+="<td>"+mem.getName()+"</td">
                     addHTML+="<td>"+mem.getPoint()+"</td">
                     addHTML+="<td>"+mem.getAuth()+"</td">
                     addHTML+="</tr>"
                  })
               },
               error:function(xhr,status,err){
                  console.log(err)
               }
            })
         }
      })         
      

[1단계:개념] 5. 소스로 코드상 의존성 자동 주입을 할려면 사전에 어떤 처리를 하여야 하고, 실제 처리 예제를 기술하세요
[1단계:확인]#6. Service단에 Dept객체를 리턴하고, 코드상 의존성 자동주입을 해서 화면단에 부서정보를 출력하게 처리하세요

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
      $("#frm01 .sch").on("keyup",function(){
         if(event.keyCode==13){
            $.ajax({
               url:"${path}/buyProd99.do",
               type:"post",
               data:$("#frm01").serialize(),
               dataType:"json",
               success:function(tot){
                  alert("총계:"+tot)
               },
               error:function(xhr,status,err){
                  console.log(err)
               }
            })
         }
      })   
      $("#frm02 .sch").keyup(function(){
         if(event.keyCode==13){
            $.ajax({
               url:"${path}/memListAjax.do",
               type:"post",
               data:$("#frm02").serialize(),
               dataType:"json",
               success:function(mlist){
                  var addHTML=""
                  $(mlist).each(function(idx,mem){
                     addHTML+="<tr>"
                     addHTML+="<td>"+mem.id+"</td>"
                     addHTML+="<td>"+mem.name+"</td>"
                     addHTML+="<td>"+mem.point+"</td>"
                     addHTML+="<td>"+mem.auth+"</td>"
                     addHTML+="</tr>"
                  })
                  $("#memList tbody").html(addHTML)
               },
               error:function(xhr,status,err){
                  console.log(err)
               }
            })
         }
      })         
      
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>과제</h2>
  <%--
  <h2 data-toggle="modal" data-target="#exampleModalCenter">
   --%>
</div>
<div class="container">
   <h2>회원리스트조회(ajax)</h2>
   <form id="frm02" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2 sch" placeholder="회원명" name="name"/>
       <input class="form-control mr-sm-2 sch" placeholder="회원권한" name="auth" />
    </nav>
   </form>
   <table id="memList" class="table table-hover table-striped">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      <col width="25%">
     <thead>
    
      <tr class="table-success text-center">
        <th>아이디</th>
        <th>이름</th>
        <th>포인트</th>
        <th>권한</th>
      </tr>
    </thead>   
    <tbody>
    </tbody>
   </table>   
   
   

   <h2>물건명 처리</h2>
   <form id="frm01" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2 sch" placeholder="가격입력" name="price"/>
       <input class="form-control mr-sm-2 sch" placeholder="갯수입력" name="cnt" />
    </nav>
   </form>
  
</div>
<div class="container">
   <h2>부서정보(autowiring처리)</h2>
   <form id="frm02" class="form-inline"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2 sch" placeholder="회원명" name="name"/>
       <input class="form-control mr-sm-2 sch" placeholder="회원권한" name="auth" />
    </nav>
   </form>
   <table id="deptList" class="table table-hover table-striped">
      <col width="33%">
      <col width="33%">
      <col width="33%">
     <thead>
    
      <tr class="table-success text-center">
        <th>부서번호</th>
        <th>부서명</th>
        <th>부서위치</th>
      </tr>
    </thead>   
    <tbody>
    	<tr>
    		<td>${dept.deptno}</td><td>${dept.dname}</td><td>${dept.loc}</td>
    	</tr>
    </tbody>
   </table>   
</div>

</body>
</html>