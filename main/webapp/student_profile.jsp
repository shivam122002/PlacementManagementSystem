<%@page import="placementMangmentSystem.entity.Student"%>
<%
Student student = (Student) session.getAttribute("currentStudent");
if (student == null) {
	response.sendRedirect("/login.jsp");
}
%>
<%@include file="/all_css_js.jsp"%>


<div class="modal fade" id="profile-model" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header primary-background text-white">
				<h5 class="modal-title" id="exampleModalLabel">Placement
					Management System</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container text-center">
					
					<span class="fa fa-user fa-5x"></span>
					<h5 class="modal-title mt-3" id="exampleModalLabel"><%=student.getName()%></h5>

                    <br><br>
					<!-- Other details -->
					<div id="profile-details">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Enrollment Number:</th>
									<td><%=student.getEnrollmentNumber()%></td>
								</tr>
								<tr>
									<th scope="row">College Name:</th>
									<td><%=student.getCollege()%></td>
								</tr>
								<tr>
									<th scope="row">Branch Name:</th>
									<td><%=student.getBranch()%></td>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<td><%=student.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Gender:</th>
									<td></td>
								</tr>

							</tbody>
						</table>
					</div>

					<!-- Profile Edit -->
					<%@include file="/mssg/updateMessage.jsp" %>
					<div id="profile-edit" style="display: none">
						<h5 class="mt-2">Update Your Information</h5>
						<form action="EditServlet" method="POST"
							enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>Enrollment:</td>
									<td><%=student.getEnrollmentNumber()%></td>
								</tr>
								<tr>
									<td>College:</td>
									<td><%=student.getCollege()%></td>
								</tr>
								<tr>
									<td>Branch:</td>
									<td><%=student.getBranch()%></td>
								</tr>
								<tr>
									<td>Email:</td>
									<td><input type="email" name="email"
										class="form-control" value="<%=student.getEmail()%>"></td>
								</tr>
								<tr>
									<td>Name:</td>
									<td><input type="text" name="name"
										class="form-control" value="<%=student.getName()%>"></td>
								</tr>
								<tr>
									<td>Password:</td>
									<td><input type="password" name="password"
										class="form-control" value="<%=student.getPassword()%>"></td>
								</tr>
								<tr>
									<td>Gender:</td>
									<td></td>
								</tr>

							</table>
							<div class="container">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id="edit-profile-button" type="button"
					class="btn btn-primary">Edit</button>
			</div>
		</div>
	</div>
</div>





<!-- End Of Profile Mode -->
<script>
	$(document).ready(function() {
		let editStatus = false;
		$('#edit-profile-button').click(function() {

			if (editStatus == false) {

				$("#profile-details").hide();
				$("#profile-edit").show();
				editStatus = true;
				$(this).text("Back");

			} else {
				$("#profile-details").show();
				$("#profile-edit").hide();
				editStatus = false;
				$(this).text("Edit")
			}

		})

	})
</script>