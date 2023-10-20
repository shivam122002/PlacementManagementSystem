<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="placementMangmentSystem.entity.Student"%>
<%
Student st = (Student) session.getAttribute("currentStudent");
if (st == null) {
	response.sendRedirect("home.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Placement Management System(PSM)</title>
<%@include file="all_css_js.jsp"%>
<link rel="stylesheet" href="./css/myStyle.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="home.jsp"><span
			class="fa fa-handshake-o" style="font-size: 36px"></span> PMS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="offers.jsp?student_id=<%=st.getEnrollmentNumber()%>"><span
						class="fa fa-check-square"></span> Job Offers</a></li>
				<li class="nav-item"><a class="nav-link"
					href="applied.jsp?student_id=<%=st.getEnrollmentNumber()%>"><span
						class="fa fa-paper-plane"></span> Applied</a></li>
				<li class="nav-item"><a class="nav-link"
					href="interview_Experience.jsp?student_id=<%=st.getEnrollmentNumber()%>"><span
						class="fa fa-comments-o" style="font-size:20px"></span> Interview Experiences</a></li>
			</ul>
			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile-model"><span
						class="	fa fa-user-circle"></span></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"
					method="GET"><span class="	fa fa-sign-out"></span> Log out</a></li>
			</ul>
		</div>
	</nav>

</body>
</html>
