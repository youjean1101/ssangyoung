<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
	width:1000px;
}
table td,th{
	text-align:center;
}

</style>
<body>
	<table>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<tr>
		<td>매표구매</td>
		<td>계양CGV</td>
		<th>${param.startdate}</th>
		<td class="point">1,200 P</td>
		</tr>
		<tr>
		<td>매표 구매</td>
		<td>홍대입구역CGV</td>
		<th>${param.lastdate}</th>
		<td>1,200 P</td>
		</tr>
		<td>매점&씨네샵 구매</td>
		<td>홍대입구역CGV</td>
		<th>${param.lastdate}</th>
		<td>500 P</td>
		<tr>
		</tr>
	</table>
</body>
</html>