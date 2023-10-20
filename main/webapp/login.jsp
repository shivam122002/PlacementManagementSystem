<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_css_js.jsp"%>
<title>Login</title>
</head>
<body>

	<!-- Nav Bar -->
	<%@include file="nav-bar.jsp"%>
	<br>
	<!-- Login page -->

	<main style="height: 100vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user fa-3x"></span>
							<p>Login Here</p>
						</div>
						<br>
						<div class="card-body">
						
							<form action="LoginServlet" method="POST" id="login-form">
								<div class="form-group">
									<label for="exampleInputEnrollment">Enrollment No.</label> <input
										name="enrollment" type="text" class="form-control"
										id="Enrollment" placeholder="Enter Enrollment Mo."
										required>

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="Password" placeholder="Password" required>
								</div>
								<div class="container text-center" id="loader"
									style="display: none">
									<span class="fa fa-spinner fa-spin fa-3x"></span>
									<h5>Please Wait..</h5>
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary" id="submit-btn">Login</button>
								</div>
								<%@include file="mssg/message.jsp" %>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	
	<%@include file="footer.jsp"%>
</body>
</html>