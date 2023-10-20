<%@include file="/all_css_js.jsp"%>
<div class="modal fade" id="addCompanyModel" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Company</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="../AddCompanyServlet" method="POST"
					id="add-company-form" enctype="multipart/form-data">


					<div class="form-group">
						<input name="company_id" type="text"
							placeholder="Enter Company ID" class="form-control" required>
					</div>

					<div class="form-group">
						<input name="company_name" type="text"
							placeholder="Enter Company Name" class="form-control" required>
					</div>

					<div class="form-group">
						<input name="job_profile" type="text" placeholder="Job Profile"
							class="form-control" required>
					</div>

					<div class="form-group">
						<input name="salary" type="text" placeholder="Salary"
							class="form-control" required>
					</div>
					<div class="form-group">
						<input name="last_date_to_apply" type="text"
							placeholder="last Date to apply" class="form-control" required>
					</div>

					<div class="from-group">
						<textArea name="about_company" class="form-control"
							placeholder="Enter about company" style="height: 200px" required></textArea>
					</div>
					<br>
					<div class="from-group">
						<textArea name="requirments" class="form-control"
							placeholder="Requirements" style="height: 200px" required></textArea>
					</div>
					<br>
					<div class="form-group">
						<input name="branch" type="text" placeholder="Enter Eligible Branches"
							class="form-control" required>
					</div>

					<br>
					<div class="form-group">
						<label>Select company pic:</label> <br> <input type="file"
							class="from-control" name="company_pic">
					</div>

					<div class="container text-center">
						<button type="submit" class="btn btn-outline-primary">Add
							Company</button>
					</div>

				</form>

				<%@include file="mssg/updateMessage.jsp"%>

			</div>

		</div>
	</div>
</div>
