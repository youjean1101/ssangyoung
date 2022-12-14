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
		

--%>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>