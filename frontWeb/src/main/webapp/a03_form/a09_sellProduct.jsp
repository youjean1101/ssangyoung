<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<!-- post형식일 때 자바처리 -->
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- 
	 ex) a09_sellProduct.jsp
	 		물건명:[	] 구매갯수:[	]
	 		[구매]
	 		
	 		구매내역
	 		물건명 : @@@
	 		갯수 : @@
	  -->
	<h2>구매물건</h2>
	<form method="post">
		물건명:<input type="text" name="pname"><br>
		가격 : <input tupe="text" name="price"><br>
		구매갯수:<input type="text" name="count"><br>
		<input type="submit" value="구매">
	</form>
	
	<h3>구매내역</h3>
	<h4>물건명:${param.pname}</h4>
	<h4>가격:${param.price}</h4>
	<h4>구매갯수:${param.count}</h4>
	<h4>총계:${param.price*param.count}</h4>
</body>
</html>