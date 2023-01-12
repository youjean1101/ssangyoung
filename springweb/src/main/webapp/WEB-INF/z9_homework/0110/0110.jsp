<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%--
			[1단계:확인] 3. 스프링 요청값, 모델, 뷰 연습(RequestParam으로 요청처리)  
               1) 점수를 입력하고 점수에 따른 등급분류(A~F)를 모델로 처리하고  화면에 출력하세요.(get/post 구분)

               2) 아이디와 패스워드를 입력하여 인증 여부 모델로 설정하고 화면에 출력하세요(get/post 구분)

               3) 초기화면에 임의의 구구단이 나오게 하고 정답을 입력하면 그 결과에 따라 정답/오답 출력되게 처리하세요(get/post 통합)
				
               4) 컴퓨터와 하는 가위바위보라는 타이틀로 해당 내용을 선택했을 때, 컴퓨터와 나의 결과에 따라 승/무/패가 처리되게 하세요.(get/post 통합)

			[1단계:확인] 4. 스프링 요청값, 모델, 뷰 연습(VO객체로 요청처리)                 
               1) 프리미어리그 팀의 정보(팀명, 승,무,패,골득실)를 VO객체를 만들고, form으로 등록 처리했을 때, 입력된 정보를 vo를 통해서 하단에 출력되게 하세요.

               2) 회원정보(회원아이디, 이름, 패스워드, 권한, 포인트 )를 vo객체 만들고, 등록시 등록되게 하세요.

               3) 김밥의 갯수나 가격   가격[0] 갯수 @ 총계 @@@  [다음 1개 확인] 초기화면이고 클릭시 마다 입력된 가격에서 한개씩 갯수가 올라가
                  계산되게 하세요..
                  [3000] 갯수 1  총계 3000  [다음 2개 확인-버튼] 
                  [3000] 갯수 2  총계 6000  [다음 3개 확인-버튼] 
	 --%>
</body>
</html>