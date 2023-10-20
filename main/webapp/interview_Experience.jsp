<%@page import="java.util.List"%>
<%@page import="placementMangmentSystem.Dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="placementMangmentSystem.entity.Student"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>
<%@page import="placementMangmentSystem.entity.StudentExperience"%>
<%
Student students = (Student) session.getAttribute("currentStudent");
if (students == null) {
	response.sendRedirect("home.jsp");
}
%>
<%
 StudentDao studentDao = new StudentDao(FactoryProvider.getFactory());
 List<StudentExperience>experience=studentDao.getExperiences();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview Experiences-PMS</title>
<%@include file="all_css_js.jsp"%>

<link rel="stylesheet" href="./css/myStyle.css">

</head>
<body>
	<%@include file="student_profile.jsp"%>
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

				<li class="nav-item"><a class="nav-link" href="home.jsp"><span
						class="fa fa-home"></span> Home</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#shareExperienceModel"><span
						class="fa fa-edit"></span> Share Experience</a></li>
			</ul>

		</div>
	</nav>
	<!-- Share Experience form  -->
	<div class="modal fade" id="shareExperienceModel" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Share Your
						Experience</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ExperienceServlet" method="POST"
						id="add-experience-form" enctype="multipart/form-data">

						<div class="form-group">
							<input name="user_name" type="text" value="<%=students.getName() %>"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<input name="company_name" type="text"
								placeholder="Enter Company Name" class="form-control" required>
						</div>

						<div class="form-group">
							<input name="job_profile" type="text" placeholder="Job Profile"
								class="form-control" required>
						</div>
						<div class="from-group">
							<textArea name="apply" class="form-control"
								placeholder="How did you applied" style="height: 100px" required></textArea>
						</div>
						<br>
						<div class="from-group">
							<textArea name="experience" class="form-control"
								placeholder="Write Your Experience" style="height: 200px"
								required></textArea>
						</div>
						<br> <br>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Share
								Now</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<br>

	<!-- Field Page of Interview Experience page -->
	
	<%
	   for(StudentExperience exp:experience)
	   {
	%>
	<div class="card" style="margin-left: 50px; margin-right: 50px">
		<div class="card-header">
			<i class="fa fa-user"></i><b> <%=exp.getUserName() %></b> <br> <i
				style="font-size: 12px">Posted date- <%=exp.getPostDate() %></i>
		</div>
		<div class="card-body">
			<h5 class="card-title"><%=exp.getJobRole() %> at <%=exp.getCompanyName() %></h5>
			<p class="card-text"><%=exp.getApplyProcess() %>...<a href="#">Read More</a>
			</p>
			<a href="#!" class="btn btn-outline-dark btn-sm"> <i
				class="fa fa-thumbs-o-up"></i> <span class="like-counter">
					100K</span>
			</a> <a href="#!" class="btn btn-outline-dark btn-sm"> <i
				class="fa fa-commenting-o"></i> <span>20K</span>
			</a>
		</div>
	</div>
	<br>
	<%
	   }
	%>
	

</body>
</html>