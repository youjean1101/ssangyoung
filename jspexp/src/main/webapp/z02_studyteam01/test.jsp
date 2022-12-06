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

<body>
  <script>

    function checkmajor(form) { 
      alert("changed");
    }

    function setMajor(form) { 
 
      var frm = form; 
  
      frm.major.options[0] = new Option(' - 선 택 - ','','',''); 
      frm.major.options[1] = new Option('내과','AA005','',''); 
      frm.major.options[2] = new Option(' -Internal Medicine(일반내과)','AA010','',''); 
      frm.major.options[3] = new Option(' -Allergy(알러지)','AA020','',''); 
      frm.major.options[4] = new Option(' -Cardiology(순환기)','AA030','','true'); 
      frm.major.options[5] = new Option(' -Endocrinology(내분비)','AA040','',''); 
    } 

  </script>
</head>
 

<body>

  <form name=form>

    <input type="radio" name="domajor" value="submajor" onClick="setMajor(this.form)"> 
   
    <select name="major" onChange="checkmajor(this.form);"> 
      <option value="">-선택-</option> 
    </select> 
  </form>

</body>
</html>