<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>navigation bar</title>
<%@include file="/all_css_js.jsp" %>
<link rel="stylesheet" href="../css/myStyle.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="admin.jsp"><span class="fa fa-asterisk"></span> Admin</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="fa-fa-user"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-right">
   
   <li class="nav-item">
        <a class="nav-link" href="admin.jsp"><span class="	fa fa-home"> Home</span></a>
      </li>
   
      <li class="nav-item">
        <a class="nav-link" href="../LogoutServlet" method="GET"><span class="	fa fa-sign-out"></span> Log out</a>
      </li>
    </ul>
  </div>
</nav>

</body>
</html>