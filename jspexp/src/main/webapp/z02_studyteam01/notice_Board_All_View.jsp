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
<style>
	input[type="button"]{
		background-color:green;
		color:white;
		border:1px solid green; 
		border-radius:5px;
	}
	input[type="text"]{
		width:250px;
		height:30px;
		border:1px solid grey; 
		border-radius:30px;
	}
	select{
		width:70px;
		height:35px;
		border:1px solid grey; 
		border-radius:30px;
	}
	/* #All #noticeIndex input[type="button"]{
		position:fixed;
		left:0%
	}
	
	#All #noticeIndex select{
		position:fixed;
		left:45%
	}
	
	#All #noticeIndex input[type="text"]{
		position:fixed;
		left:60%
	}
	#All #notice_table_view{
		position:fixed;
		left:0%
		top:10%
	} */
	
	.next_pre_class:hover{
		background-color:lightgreen;
		border:none; 
	}
	#next_previous{
		position:fixed;
		bottom:10%
		left:40%
	}
	#All{
		position:fixed;
		margin:auto 5%;
		left:20%;
		bottom:60%;
	}
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<jsp:include page="noticeBoard_topMenu.jsp"></jsp:include>
	<box id="All">
		<box id="noticeIndex">
			<input type="button" value="게시판 작성" onclick="boardInsertGo()"/>
			<select>
				<option selected>전체</option>
				<option>구분</option>
				<option>제목</option>
				<option>내용</option>
			</select>
			<input type="text" name="noticeIndex" placeholder="검색하실 내용을 입력해주세요."/>
		</box>
		<box id="notice_table_view">
			<table>
				<tr><th>No.</th><th>구분</th><th>제목</th></tr>
				<tr><td>서버에서 불러오기()</td><td>서버에서 불러오기(idx 사용)</td><td>서버에서 불러오기(idx 사용)</td></tr>
			</table>
		</box>
		<box id="next_previous">
			<input class="next_pre_class" type="button" value="<" onclick="" />
			<input class="next_pre_class" type="button" value="1" onclick="" />
			<input class="next_pre_class" type="button" value="2" onclick="" />
			<input class="next_pre_class" type="button" value="3" onclick="" />
			<input class="next_pre_class" type="button" value="4" onclick="" />
			<input class="next_pre_class" type="button" value=">" onclick="" />
		</box>
	</box>
</body>
<script type="text/javascript">
	function boardInsertGo(){
		location.replace("notice_Board_insert.jsp");
	}
		
</script>
</html>