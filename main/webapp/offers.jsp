<%@page import="java.util.List"%>
<%@page import="placementMangmentSystem.entity.SelectedStudent"%>
<%@page import="placementMangmentSystem.Dao.StudentDao"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String student_id = (request.getParameter("student_id"));
StudentDao studentDao = new StudentDao(FactoryProvider.getFactory());
List<SelectedStudent> selectedstudent = studentDao.getSelectedStudentsFromEnrollment(student_id);
%>
<%
Student s = (Student) session.getAttribute("currentStudent");
if (s == null) {
	response.sendRedirect("home.jsp");
}
%>
<%@include file="/all_css_js.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Offers-PMS</title>
<link rel="stylesheet" href="./css/myStyle.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="home.jsp"><span
			class="fa fa-handshake-o" style="font-size:36px"></span> PMS</a>
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
				if (selectedstudent != null) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="applied.jsp?student_id=<%=s.getEnrollmentNumber()%>"><span
						class="fa fa-paper-plane"></span> Applied</a></li>
				<%
				} else {
				// Handle the case where appliedstudent is null
				}
				%>
			</ul>
		</div>
	</nav>
	<%@include file="student_profile.jsp"%>
	<br>
	<div class="text-center">
		<h5>Your Jobs</h5>

	</div>
	<div class="container text-center">
		<div class="row">
			<div class="col-12">
				<table id="companyTable" class="table table-bordered mt-3">
					<thead>
						<tr>
							<th>Company Name</th>
							<th>Job Profile</th>
							<th>Package</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (selectedstudent != null) {
						%>
						<%
						   for(SelectedStudent stnt:selectedstudent)
						   {
						%>
						<tr>
							<td><%=stnt.getCompany_name()%></td>
							<td><%=stnt.getJob_profile()%></td>
							<td><%=stnt.getSalary()%></td>
						</tr>
						<%
						   }
						
						} 
						else {

						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>