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
<%--
2023-01-09
[1단계:개념] 1. MVC패턴으로 ajax를 구현할려고 한다. 주요 자바프로그램과 프로세스를 설명하세요
    controller, service, view

# 주요 자바 프로그램
controller : 사용자의 요청 페이지, 요청값 등을 전달 받고,
			dao 등을 통해 만들어진 모델데이터를 설정하고,
			이 모델데이터를 view단을 호출함과 동시에 전달하는 역할을 한다.
			즉, 중재자 역할을 주로 한다.
			예) 	서빙받고 전달하는 사람(중재자)	

service : 비지니스 로직(알고리즘)
			모델을 만들기 위한 객체
			controller에서 넘겨온 요청값을 가진 Emp VO객체를
			Dao에 호출하여 list 데이터를 리턴하여 controller단에 넘긴다. 
			예) 주방장

view : 비즈니스 영역에 대한 받은 핵심데이터(모델)을 controller에서 전달 받아,
		사용자가 보게 될 화면을 처리하는 역할을 한다.
		모델데이터 jsp에서 el,jstl로 활용한다.
		예) 카르보나 스파게티를 좋은 모양에 담아서 손님에게 전달

# 프로세스
	1) 초기화면 로딩 : html 
	2) key이벤트에 의해서 ajax호출(요청값 전달)
	3) controller단에서 요청값 전달
	4) 전달할 json 문자열 만들기(List객체 ==> json 문자열)
	5) client단에서 받은 json문자열 객체로 변환 : JSON.parse()
	6) js 반복 처리로 출력 처리

[1단계:개념] 2. Gson lib는 어떤 역할을 하는지 예제를 통해서 설명하세요
GSON이란?
- 자바 객체를 JSON 표현으로 변환하는 데 사용할 수 있는 자바 라이브러리다. 
- JSON 문자열을 동등한 자바 객체로 변환하는 데에도 사용할 수 있다.
- 소스코드가 없는 기존 객체를 포함해 임의의 자바 객체로 작업할 수 있다. 
GSON특징
- 일반적으로 먼저 Gson 인스턴스를 구성한 다음 toJson(Object) 또는 fromJson(String, Class)를 호출해 사용한다
-  Gson 인스턴스는 Thread-safe하므로 여러 쓰레드에서 자유롭게 재사용할 수 있다. 
- 기본 구성이 필요한 모든 경우 new Gson()을 호출해 Gson 인스턴스를 만들 수 있다. 
예시)
// array/object ==> json 문자열
public String empAjax(String ename,String job, String frSalS, String toSalS) {
	sch = getEmp(ename, job, frSalS, toSalS);
	Gson g = new Gson();
	return g.toJson(empList());
}
// 서비스 호출
String json = service.empAjax(ename,job,frSal,toSal);


[1단계:개념] 3. controller의 PrintWriter out =response.getWriter();는 어떤 역할을 하는가?
- Servlet에서 클라이언트의 요청(Request)에 대한 응답(Response) 형태는 문자(character) 또는 바이트(byte)가 될 수 있다.
- 클라이언트의 요청에 문자 형태로 응답하려면 데이터의 흐름(Stream)을 컨트롤 해야 한다. 즉 텍스트(==문자) 형태로 응답을 보내도록 설정해야 한다.
- HttpServletResponse 인터페이스의 상위 인터페이스인 ServletResponse의 getWriter() 메소드를 호출하면 스트림에 텍스트를 기록하는 것이 가능하다.

[1단계:확인]* 4. 회원등록form을 로딩하고, id중복여부를 확인하는 기능을 처리하는 MVC ajax를 구현하세요.
           기존 dao에서 검색메서드 활용
------------------------------------------------------------
[Z01_0109_homework.java] -- 컨트롤러

package jspexp.a01_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Z01_1109_homework
 */
@WebServlet(name = "0109_homework.do", urlPatterns = { "/0109_homework.do" })
public class Z01_0109_homework extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Z01_0109_Service service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Z01_0109_homework() {
        super();
        // TODO Auto-generated constructor stub
        service = new Z01_0109_Service();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		if(id==null) {
			request.getRequestDispatcher("WEB-INF\\a01_mvc\\0109_homework.html").forward(request, response);
		}else {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(service.getcheckID(id));
		}
		
	}

}

-------------------------------------------------------------
[Z01_0109_Service.java] -- 서비스

package jspexp.a01_mvc;

import java.util.List;

import com.google.gson.Gson;
import jspexp.a13_database.A06_PareparedDao;
import jspexp.vo.Member;

public class Z01_0109_Service {
	private A06_PareparedDao dao;
	private Member sch;
	
	public Z01_0109_Service(){
		dao = new A06_PareparedDao(); 
	}
	
	public boolean getcheckID(String id) {
		if(id==null) id="";
		return dao.checkId(id);
	}
	
}

-------------------------------------------------------------
[0109_homework.html]-- 뷰

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<style type="text/css">

</style>
<script>

</script>
</head>
<body>
	<table>
		<tr><th>아이디:</th><td><input type="text" name="id" /></td></tr>
		<tr><td colspan="2"><input type="button" value="중복확인" id="schBtn"></td></tr>
	</table>
</body>
<script type="text/javascript">
var idObj = document.querySelector("[name=id]");
var schBtn = document.querySelector("#schBtn")
idObj.onkeyup=function(){
	if(event.keyCode==13) callAjax();
}
schBtn.onclick=function(){
	callAjax();
}
idObj.focus();
callAjax();

function callAjax(){
	var xhr = new XMLHttpRequest()
	var id = idObj.value
	var qsr = "id="+id
	xhr.open("get","/0109_homework.do?"+qsr,true)
	xhr.send()
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			console.log(xhr.responseText)
			var isCheckID = JSON.parse(xhr.responseText)
			if(isCheckID){
				alert("[안내메시지]중복된 아이디 입니다. 다시 입력해주세요.")
			}else{
				alert("[안내메시지] 사용가능한 아이디입니다.")
			}
		}
	}
}

</script>
</html>

[1단계:개념] 5. 스프링 환경 설정을 위한 순서를 기술하세요
	1) 단계별 스프링 환경
		- 1단계 : dynamic web project기반 스프링 환경 결정
		- 2단계 : sts(spring tool suits) 툴을 이용한 스트링 부트 활용
	2) lib : 필요한 jar 파일 복사
	3) 컨테이너 설정
		스프링 핵심(core) 처리로 xml 파일로 설정한다. 
			(dispatcher-servlet.xml)
		src\main\webapp\WEB-INF 가 default 설정 위치
	4) web.xml 설정
		스프링 프레임 워크 시작 front-controller 설정
			dispatcherservlet(프레임워크 지원 클래스)
			- 위 컨테이너 설정의 위치를 변경할 수 있다.
		요청값(get/post)의 한글 처리를 위한 filtering 선언
			(프레임워크 지원 클래스)
	5) MVC처리를 위한
		사용자 정의 controller/service/dao 선언
		view단 선언 : WEB-INF하위에 보안폴드로 jsp/html 호출
	6) 기타 front 프레임워크 및 lib 설정
		- boot strap 설정
		- jquery 설정
	7) 초기 view단에서 위 front단 프레임워크 lib 호출 처리

[1단계:개념] 6. dispather.xml와 web.xml의 역할을 기술하세요.
web.xml
스프링 프레임 워크 시작 front-controller 설정
요청값(get/post)의 한글 처리를 위한 filtering 선언(프레임워크 지원 클래스)

dispather.xml
src\main\webapp\WEB-INF 가 default 설정 위치
container에 등록(dispatcher-servlet.xml)
<bean class="springweb.a01_start.A01_Controller" />
스프링은 일단, 첫번째 컨트롤러를 호출할 때, 컨테이너에서 클래스를 
객체화하여 메모리에 로딩 후, 호출시에 로딩된 객체를 사용한다.

[1단계:확인]* 7. 다이나믹 웹프로젝트로 springweb2로 만들고, 스프링의 front단과 컨트롤러를 등록하고 backend를 호출하세요.
            ppt자료 작성 및 제출



[1단계:개념]* 8. 오늘 한 예제 밑에 바로 및에 기능 메서드 추가하여 start2.do로 a02_start.jsp가 호출되는 예제를 작성하세요.
[a01_controller]
// http://localhost:7080/springweb/start2.do
@RequestMapping("/start2.do")
public String start2() {
	return "\\WEB-INF\\views\\a01_start\\a02_start.jsp";
}

[a02_start.jsp]
<h2 data-toggle="modal" data-target="#exampleModalCenter">과제를 하는 중입니다.</h2>

 --%>
</body>
</html>