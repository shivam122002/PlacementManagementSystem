<%@include file="/all_css_js.jsp"%>
<%@include file="mssg/RemoveMessage.jsp" %>
<div class="modal fade" id="removeCompanyModel" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Remove Company</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="../RemoveCompanyServlet" method="POST"
					id="remove-company-form">


					<div class="form-group">
						<input name="company_id" type="text"
							placeholder="Enter Company ID" class="form-control">
					</div>

					<div class="form-group">
						<input name="company_name" type="text"
							placeholder="Enter Company Name" class="form-control">
					</div>
					<div class="container text-center">
						<button type="submit" class="btn btn-outline-primary">Delete
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>