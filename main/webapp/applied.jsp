<%@page import="java.util.List"%>
<%@page import="placementMangmentSystem.entity.AppliedStudent"%>
<%@page import="placementMangmentSystem.Dao.StudentDao"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>
<%
String student_id = (request.getParameter("student_id"));
StudentDao studentDao = new StudentDao(FactoryProvider.getFactory());
List<AppliedStudent> appliedstudent = studentDao.getAppliedStudentsByEnrollment(student_id);
%>
<%@page import="placementMangmentSystem.entity.Student"%>
<%
Student student = (Student) session.getAttribute("currentStudent");
if (student == null) {
	response.sendRedirect("home.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_css_js.jsp"%>

<link rel="stylesheet" href="./css/myStyle.css">
<title>You Applied Jobs-PMS</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="home.jsp"><span
			class="fa fa-handshake-o"style="font-size:36px"></span> PMS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item"><a class="nav-link" href="home.jsp"><span
						class="fa fa-home"></span> Home</a></li>

				<%
				if (appliedstudent != null) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="offers.jsp?student_id=<%=student.getEnrollmentNumber()%>"><span
						class="fa fa-check-square"></span> Job Offers</a></li>
				<%
				} else {
				// Handle the case where appliedstudent is null
				}
				%>
			</ul>
			
		</div>
	</nav>


	<div class="container text-center">
		<div class="row">
			<div class="col-12">
				<table id="companyTable" class="table table-bordered mt-3">
					<thead>
						<tr>
							<th> Applied Companies</th>

						</tr>
					</thead>
					<tbody>
						<%
						if (appliedstudent != null) {
						%>
						<%
						   for(AppliedStudent stdnt:appliedstudent)
						   {
						%>
						<tr>
							<td><%=stdnt.getCompanyName()%></td>
						</tr>
						<%
						   }
						} else {
						// Handle the case where selectedstudent is null

						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>