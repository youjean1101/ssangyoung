function goDetail(postingNumber){
	location.href="/fleaMarket/fmView.do?postingNumber="+postingNumber
}
function goPage(cnt){
	$("[name=curPage]").val(cnt);
	$("#frm01").submit()
}
