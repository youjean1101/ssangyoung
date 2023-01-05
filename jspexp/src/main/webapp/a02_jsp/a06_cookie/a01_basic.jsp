<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
<%-- 
# Cookie란?
1. 웹프로그래밍에 있어서 서버와 클라이언트간에 접속하여 처리된 정보를
	임시 저장하는 경우가 간간히 발생한다. 이때, 이 정보를 서버에 보관하여
	사용하는 것을 session이라고 하고, 서버에 보관되는 메모리의 부담으로
	클라이언트에 저장하는 것을 쿠키라고 한다.
2. 쿠키의 생성 시점
	1) 쿠키는 클라이언트에서 요청에 의해서, 서버안에서 객체(key,value)를 생성하여 response
		객쳉에 쿠키를 추가하여 클라이언트에 보내어지면 클라이언트(브라우저)에서 
		지정한 경로에 저장이 된다.
3. 쿠키의 활용
	1) 쿠키가 서버에서 생성되어 클라이언트에 저장되면, 다시 요청객체 request에
		의해 서버에 보내지면서 쿠키값을 key/value 형식으로 호출하여 사용할 수 있다.
	2) 쿠키는 동일한 키로 addCookie로 할당하면 동일한 키로 설정된 내용을 변경해준다.
		price ==> 3000
		price ==> 5000 (최종으로 값으로 설정된 값이 해당 쿠키의 key에 할당된 값이 된다.)
		cf) 쿠키는 기존에 없는 키로 생성을 하면 새로운 쿠키값이 추가되고 기존에 있는키도 변경된 쿠키값을 추가하면
			쿠키값이 변경이 된다.
			response.addCookie(new Cookie("key", "value")) 
			
4. 쿠키의 소멸
	1) 쿠키는 서버에서 해당 쿠키의 키명으로 유효시간으로 기능메서드로 설정하여
		다시 클라이언트로 보내지면, 해당 시간이 지나면 클라이언트 안에서 사라지게 된다.
		삭제할 쿠키를 참조변수로 가져와서 setMaxAge(0)으로 설정하여 
		다시 response.addCookie(참조변수); 처리하면 해당 쿠기값을 삭제가 된다.
		ex) 
		new Cookie c = new Cookie("key","value");
		c.setMaxAge(0);
		response.addCookie(c)
		
# 쿠키의 구성
1. 쿠키는 이름, 값, 유효시간, 도메인, 경로로 구성된다.
2. 쿠키 이름은 아스키 코드의 알파벳과 숫자만을 포함할 수 있다.
	ex) 한글의 경우 encoding으로 저장했다가, decoding으로 가져와야 한다.
3. 콤마, 세미콜론, 공백 등의 문자는 포함할 수 없다.
4. $로 시작할 수 없다.
# 쿠키의 생성과 읽기
1. 쿠키의 생성
	Cookie c1 = new Cookie("쿠키의 이름","쿠키의 값")
2. 쿠키의 전달 : 쿠키는 response객체에 의해 클라이언트에 추가형식으로 전달된다.
	response.addCookie(c1);
3. 쿠키의 읽어오기
	쿠키의 요청객체(request)의 getCookies() 메서드로 클라이언트에서 
	서버로 전달되어 읽어 온다.
	쿠키는 배열로 읽어와서 각 데이터를 key, value형식으로 확인할 수 있다.
	Cookie[] cookie = request.getCookies();
	for(Cookie c:cookies){
		c.getName()
		c.getValue()
	}

# 쿠키의 생성과 활용 과정 #
request
response
둘다 서버에 있는 코드에서 수행된다.
1. request : 클라이언트에서 서버로 전달하는 데이털르 처리할 때
	주로 사용된다. ex) 요청값(quest string - ?key=value
						request.getParameter("key")
						),
	클라이언트에 저장된 쿠키값을 서버로 전송(request.getCookies(
2. response : 서버에서 클라이언트로 전달 할대 주로 활용
	만들어진 화면을 전달, 파일다운로드시 파일 전달, 쿠키를 생성한 것을
	클라이언트에서 전달한다.
	Cookie c1 = new Cookie(쿠키의 키, 쿠키의 값)
	c1.setMaxAge(클라이언트에 지속시간-초단위)
	response.addCookie(c1);

client		<====>		Server
						 쿠키를 생성(1)
						 쿠키를 전달(2)
쿠키가 브라우저내에 
특정한 경로와 기간동안 저장(3)
쿠키 정보를 전달(4)			요청객체를 통해서 현재 쿠키 정보 확인(5)

# 쿠키와 세션의 차이
1. 저장 장소가 서버이냐 클라이언이냐?
2. 쿠키는 데이터 분산해서 서버의 부담을 줄여준다.
3. 세션을 서버에서 관리하여 클라이언트와 연결되었을 때만 처리가 가능

# 한번 로그인하면 해당 클라이언트가 다시 로그인할 때 자동로그인 및 세션처리를 하려면?
1. 쿠키 + 세션 둘다 활용하여 처리.
2. 로그아웃하여 쿠키를 삭제하지 않는 이상, 
	특정한 기간동안 접속한 인증을 가지고 있다가 
3. 다시 접속 시 로그인 없이 바로 세션을 자동으로 만들어
	효율적인 시스템을 만드는데 있다.
# 쿠키 생성 핵심 코드
1. 쿠키 생성
	Cookie c1 = new Cookie(key, val);
	c1.setMaxAge(5*60*60*24) 초 분 시 날짜
	response.addCookie(c1)
2. 쿠키 확인
	Cookie[] carr = request.getCookies();
	if(carr!=null){
		for(Cookie c : carr){
			c.getName(); c.getValue()
			// 쿠키의 키와 값	
		}
	}
3. 쿠키값의 변경
	변경할 쿠키의 키에 해당하는 값을 새로운 값으로 할당하여 다시 response 객체를 통해서 전달
	if(c.getName().equals("변경할 쿠키의 키")){
		response.addCookie(new Cookie(c.getName(),"변경할값"));
	}
	2) 키를 알고 있을 때는 바로 처리..
		response.addCookie(
			new Cookie("변경할 쿠키의 키", "변경할 값"));
		cf) 쿠키는 동일한 키가 없을 떄는 새로운 쿠키가 생성이 되고 동일한 키를 읽을 때는 변경된 값으로 기존 쿠키가 변경된다.
4. 쿠킹의 삭제
	해당 쿠키의 키를 기준으로 속성메서드 setMaxAge(0)로 설정해서 다시 response객체로 할당하면 된다.
	Cookie c1 = new Cookie("삭제할 기존의 키","");
	c1.setMaxAge(0);
	response.addCookie(c1);
	
# session 생성 삭제 핵심 코드
1. 생성
	session.setAttribute("key", "할당할 객체")
	<jsp:useBean scope="session">
	<c:set var="" value="" scope="session">
2. 수정
	session.setAttribute("변경할 key","변경할 객체")
	${객체.setXXX('변경할데이터')}
3. 삭제
	1) 개별적인 session 삭제
	session.removeAttribute("삭제할 key");
	2) 전체 삭제
	session.invalidate();
--%>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>