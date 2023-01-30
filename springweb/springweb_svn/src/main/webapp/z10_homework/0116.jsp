<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
    import="jspexp.vo.*"  
    import="jspexp.a13_database.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
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
2023-01-16
[1단계:개념] 1. DI로 설정한 Collections 객체들의 기본 컨테이너 선언 방법을 기술하세요.
[1단계:확인] 2. 호주머니 클래스를 선언하고 여기담긴 구슬을 Set로 할당하고, 호출하는 클래스와 di를 설정하고 호출하세요
[1단계:확인]#3. Car클래스에 Tire클래스(제조사,가격)을 List로 추가하여 1:다로 처리되는 di를 선언하고 호출하세요.
	1) Tire클래스 company, price
	2) Car클래스
		String kind;
		List<Tire> tlist;
		public void setTlist(List<Tire> tlist)
		public void showMyTire(){
			System.out.println("차량종류:"+kind);
			if(tlist!=null && tlist.size()>0){
				for(Tire t:tlist){
					System.out.print(t.getCompany+"\t"+t.getPrice());
				}
			}else{
				System.out.println("타이어가 장착되지 않았습니다.");
			}
		}		
	3) DI선언
		<property name="tlist">
			<list>
				<bean ref="tire01">
				<bean ref="tire02">
	


[1단계:확인]#4. Map/Properties의 차이점을 기술하고, BaseTeam클래스에 타석 순서별 선수명를 Map으로, 수비역할별 선수명을 Properties로 DI로 할당하여 출력 처리하세요
Map: generic으로 type지정 <map><entry key="" value="">
Properties : type을 자유롭게 사용 <props><prop key="">값설정</>
class BaseTeam{
	private Map<Integer, String> hitOrders;
	private Properties defends;
}
	<property name="hitOrders">
		<map>
			<entry key="1" value="홍길동"/>
			<entry key="2" value="김길동"/>
			<entry key="3" value="신길동"/>
			..
			<entry key="9" value="마길동"/>
	<property name="defends">
		<props>
			<prop key="투수" value="김길동"/>		
			<prop key="포수" value="신길동"/>		
			<prop key="1루수" value="오길동"/>		
			<prop key="2루수" value="마길동"/>		




[1단계:개념] 5. di에서 namespace처리를 위한 ddl 선언과 선언형식을 기술하세요
[1단계:확인]#6. callback메서드를 이용하여, 등록회원확인하기 누를때, 등록된 회원리스트나오고, alert(조회완료), 다시 등록회원닫기 누를때,
      닫아지면 등록회원확인 완료 alert()이 로딩되게 하세요.
	1) 화면 구현
		<input type="button" id="chBtn" value="등록회원확인"/>
		<div id="showList">
			<h2>등록회원리스트</h2>
		</div>
	2) script
		$("#chBtn").click(function(){
			if($(this).val()=="등록회원확인"){
				$(this).val("등록회원닫기")
				$("#showList").show("slow",function(){
					alert("조회회원 확인")
				});
			}else{
				$(this).val("등록회원확인")
				$("#showList").hide("slow",function(){
					alert("등록회원확인 완료")
				});				
			}
		});	
		
 --%>

</body>
<script src="${path}/a00_com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
		$("#showList").hide();
		$("#chBtn").click(function(){
			if($(this).val()=="등록회원확인"){
				$(this).val("등록회원닫기")
				$("#showList").show("slow",function(){
					alert("조회회원 확인")
				});
			}else{
				$(this).val("등록회원확인")
				$("#showList").hide("slow",function(){
					alert("등록회원확인 완료")
				});				
			}
		});	
});
</script>
</head>

<body>
<div class="jumbotron text-center">
<h2 >callback연습</h2>
<input type="button" id="chBtn" value="등록회원확인"/>
</div>
<div class="container" id="showList">

</html>