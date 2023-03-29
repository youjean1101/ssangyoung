<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<style>

input::placeholder {
  font-size: 1.2em;
  margin-left: 3%;
}
</style> 
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8" />
  <title>고객센터 등록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  <link href="${path}/resource/css/Community/CommunityBoard.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
  <script type="text/javascript">
     $(document).ready(function(){
        
        
     });
  </script>
</head>
<!-- nano regdate uptdate 두칸으로 게시글 나누기?-->
<body class="g-sidenav-show bg-gray-100">

    <div class="container-fluid py-4" style="margin-top:8%;">
            <!--form panels-->
            <form class="multisteps-form__form mb-8" method="post" enctype="multipart/form-data" action="${path}/QNAInsert.do">
            <div class="row" style="background:black;">
            

			</div>
			</form>
	</div>

  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/dropzone.min.js"></script>
  <script src="${path}/assets/js/plugins/quill.min.js"></script>
  <script src="${path}/assets/js/plugins/multistep-form.js"></script>
  <script>
    if (document.getElementById('edit-deschiption')) {
      var quill = new Quill('#edit-deschiption', {
        theme: 'snow' // Specify theme in configuration
      });
    };

    if (document.getElementById('choices-category')) {
      var element = document.getElementById('choices-category');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-sizes')) {
      var element = document.getElementById('choices-sizes');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-currency')) {
      var element = document.getElementById('choices-currency');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-tags')) {
      var tags = document.getElementById('choices-tags');
      const examples = new Choices(tags, {
        removeItemButton: true
      });

      examples.setChoices(
        [{
            value: 'One',
            label: 'Expired',
            disabled: true
          },
          {
            value: 'Two',
            label: 'Out of Stock',
            selected: true
          }
        ],
        'value',
        'label',
        false,
      );
    }
  </script>
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
  <script src="${path}/resource/js/Req4002/InsertContent.js"></script>
</body>
<script type="text/javascript">
   $(document).ready(function(){
      <%-- 
      
      --%>   
   });
</script>
</head>

</html>