<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.a13_database.*"    
    import="jspexp.a13_database.vo.*"     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script>
/*
 
 */
</script>
</head>
<body>

<%--
# 쿠키 수정하기
1. 기존에 쿠키의 키를 다른 값으로 할당하고, 다시 response객체로 전달한다. 
 --%>
   <h2>현재 쿠키 리스트</h2>
   <form method="post" action="a11_proc.jsp">
   <table id="tb">
      <tr><th>선택</th><th>쿠키의 키</th><th>쿠키의 값</th></tr>
      <%
      Cookie cks[] = request.getCookies();
      log("## 쿠키 갯수 ##"+cks.length);
      for(int idx=0;idx<cks.length;idx++){
         Cookie c = cks[idx];
      %> 
      <tr><td><input type="checkbox" name="cidx" 
               value="<%=idx%>"/></td>
         <td><input type="text" name="ckey" 
               value="<%=c.getName().equals("JSESSIONID")?"":c.getName()%>"/></td>
         <td><input type="text" name="cval" 
               value="<%=c.getName().equals("JSESSIONID")?"":c.getValue()%>"/></td></tr>
      <%
      }
      %>
   </table>
   <input type="hidden" name="proc"/>
   </form>
   <input type="button" value="쿠키추가/변경" onclick="go('add')"/>
   <%-- 쿠키값의 key 같으면 변경이 되고, 다르면 추가 --%>
   <input type="button" value="쿠키삭제" onclick="go('del')"/> 
</body>
<%-- 16:00 --%>
<script>
function go(proc){   
   // check를 하여야 다음 페이지에 전송되게 처리
   var ckDoms = document.querySelectorAll("[name=cidx]");
   var isCheck = false;
   for(var idx=0;idx<ckDoms.length;idx++){
      if(ckDoms[idx].checked){
         isCheck = true;
      }
   }
   if(!isCheck){
      alert("선택된 쿠키값이 없습니다\n 선택하여야 처리가 가능합니다.")
      return;
   }
   document.querySelector("[name=proc]").value=proc;
   // DOM객체의 아래와 같이 요소객체로 배열로 설정하는 경우도 있다.
   document.forms[0].submit();
   //document.querySelector("form").submit(); 과 동일
}
/*
# 요청값을 통한 쿠키의 생성/수정/삭제 처리
1. 파일 정보
   1) a05_CookieList.jsp : 쿠키값 전체 리스트
   2) a09_proc.jsp : 생성/수정/삭제 따라서 변경 처리..
2. 개발 순서
   1) 쿠키값 전체 리스트 화면
      - 기능 버튼 처리
         등록/수정/삭제
      - form action="a09_proc.jsp"
      - 기능요청값 처리 : <input type="hidden" name="proc"/>
      - 버튼을 눌렀을 때, script 처리
         function go(proc){
            document.querySelector("[name=proc]").value=proc;
          }
   2) 요청값에 따른 쿠키데이터 처리(a09_proc.jsp)
      - cidx : index로 체크된 값만 전달 
        ckey : 쿠키의 요청 키를 전달 
        cval : 쿠키의 요청 값을 전달.
      - proc : 쿠키의 등록/수정/삭제 처리..(add,upt,del)
      if(proc!=null){
         for(String cidxS:cidx){
            // check box로 선택되어지 key/value
            int idx = Integer.parseInt(cidxS);
            String key = ckey[idx];
            String val = ckey[cval];
            if(proc.equals("add")||proc.equals("upt")){
               Cookie c = new Cookie(key,val);
               response.addCookie(c);
            }
            if(proc.equals("del")){
               for(Cookie c: request.getCookie()){
                  if(c.getName().equals(key)){
                     c.setMaxAge(0);
                     response.addCookie(c);
                  }
               }               
            }
         }
      }
      response.sendRedirect("a05_CookieList.jsp");
   








 */
</script>
</html>