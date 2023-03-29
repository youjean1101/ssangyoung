$("#regBtn").click(function(){
	location.href="MemberQnAreg.do"	
	})

function goDetail(qnano){
	$.ajax({
		url:"CheckGetQNA.do",
		type:"post",
		data:"qnano="+qnano,
		dataType:"json",
		success:function(data){
			console.log(data)
			if(data.CheckGetQNA=='false'){alert('작성자만 들어갈 수 있습니다.')}
			else{
				location.href="GetQNA.do?qnano="+qnano
			}
		},
		error:function(xhr,status,error){
              console.log(xhr)
              console.log(status)
              console.log(error)
        }
	})
}



function goPage(cnt){
	$("[name=curPage]").val(cnt);
	$("#SeachQNAForm").submit()
}
  if (document.getElementById('products-list')) {
      const dataTableSearch = new simpleDatatables.DataTable("#products-list", {
        searchable: true,
        fixedHeight: false,
        perPage: 7
      });

      document.querySelectorAll(".export").forEach(function(el) {
        el.addEventListener("click", function(e) {
          var type = el.dataset.type;

          var data = {
            type: type,
            filename: "soft-ui-" + type,
          };

          if (type === "csv") {
            data.columnDelimiter = "|";
          }

          dataTableSearch.export(data);
        });
      });
    };
