function goDetail(qnano){
	location.href="/fleaMarket/GetQNA.do?qnano="+qnano
}
function goPage(cnt){
	$("[name=curPage]").val(cnt);
	$("#frm01").submit()
}	