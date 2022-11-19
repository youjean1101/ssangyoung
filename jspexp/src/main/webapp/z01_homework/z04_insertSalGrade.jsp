<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
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
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
	
<% 
	A06_PareparedDao dao = new  A06_PareparedDao();
	String grade = request.getParameter("grade");
	String loSalS = request.getParameter("loSal");
	double loSal = 0;
	if(loSalS!=null&&!loSalS.equals("")){
		loSal = Double.parseDouble(loSalS);
	}
	String hiSalS = request.getParameter("hiSal");
	double hiSal = 0;
	if(hiSalS!=null&&!hiSalS.equals("")){
		hiSal = Double.parseDouble(hiSalS);
	}
	boolean isInsert = false;
	if(grade!=null&&!grade.equals("")){
		Salgrade ins = new Salgrade(grade,loSal,hiSal);
		isInsert = true;
		dao.insertSalgrade(ins);
	}
%>
<h2>이동성공</h2>
	<form>
		등급: <input type="number" name="grade" min="6" max="9999" step="1" /><br>
		최저급여: <input type="text" name="loSal" />
		최고급여: <input type="text" name="hiSal" />
		<input type="submit" value="등록" />
	</form>
	
</body>
<script type="text/javascript">
	var isInsert = <%= isInsert%>
	if(isInsert){
		if(confirm("조회화면으로 이동하시겠습니까?")){
			location.href="1117.jsp"
		}
	}
</script>
</html>