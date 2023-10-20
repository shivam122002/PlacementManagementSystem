<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_css_js.jsp"%>
<title>Register here</title>
</head>
<body>

	<!-- Nav Bar -->
	<%@include file="nav-bar.jsp"%>
	<br>

	<main style="height: 100vh">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span>
						<p>Register Yourself</p>
					</div>
					<br>
					<div class="card-body">
						<form id="reg-form" action="RgisterServlet" method="POST">
							<div class="form-group">
								<label for="exampleInputEnrollment">Enrollment No.</label> <input
									name="enrollmentNumber" type="text" class="form-control"
									id="Enrollment" placeholder="Enter Enrollment No."
									required>

							</div>
							<div class="form-group">
								<label for="userName"><span class=" "></span>User Name</label> <input
									type="text" name="name" class="form-control" id="userName"
									placeholder="Enter user name" required>
							</div>
							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" name="email" id="eamil"
									aria-describedby="emailHelp" placeholder="Enter email" required>
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									name="password" class="form-control" id="password"
									placeholder="Password" required>
							</div>
							<div class="form-group">
								<label for="college">College</label> <select name="college"
									class="form-control" id="college" required>
									<option value="XYZ IT">XYZ Institute of Technology</option>
									<option value="XYZ Pharmecy">XYZ Institute of Pharmaceutical </option>
									<option value="XYZ Management">XYZ Institue of Management</option>
									<!-- Add more college options as needed -->
								</select>
							</div>

							<div class="form-group">
								<label for="branch">Branch</label> <select name="branch"
									class="form-control" id="branch" required>
									<option value="CSE">CSE</option>
									<option value="IT">IT</option>
									<option value="AI/DS">AI/DS</option>
									<option value="Mech">Mech</option>
									<option value="ECE">ECE</option>
									<option value="EXE">EXE</option>
									<option value="Civil">Civil</option>
									<option value="Chemical">Chemical</option>
									
									<!-- Add more branch options as needed -->
								</select>
							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="Check"> <label class="form-check-label" for="Check">terms and condition</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none">
								<span class="fa fa-spinner fa-spin fa-4x"></span>
								<h4>Please Wait..</h4>
							</div>
							<div class="text-center">

								<button type="submit" id="smbit-btn" class="btn btn-primary">Register</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RgisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'Done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
	<%@include file="footer.jsp"%>

	
</body>
</html>