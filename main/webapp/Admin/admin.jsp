<%@page import="placementMangmentSystem.entity.CompanyRecord"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/all_css_js.jsp"%>
<title>Admin Block-PMS</title>
</head>
<body>
	<%@include file="admin-nav-bar.jsp"%>
	<br>
	<br>
	<div class="d-flex justify-content-center">
		<a class="btn btn-primary" href="#" data-toggle="modal"
			data-target="#addCompanyModel">Add Company</a> &nbsp;&nbsp; <a
			class="btn btn-primary" href="#" data-toggle="modal"
			data-target="#removeCompanyModel">Remove Company</a>&nbsp;&nbsp; <a
			class="btn btn-primary" href="#" data-toggle="modal"
			data-target="#addSelectedStudentModel">Add Selected student</a>
		&nbsp;&nbsp; <a class="btn btn-primary" id="showTableButton">Check
			Listed Company</a>&nbsp;&nbsp; <a class="btn btn-primary"
			href="queries.jsp">Check Queries</a> &nbsp;&nbsp;
	</div>
	<br>
	<br>

	<%@include file="addCompany.jsp"%>
	<%@include file="removeCompany.jsp"%>
	<%@include file="addSelectedStudent.jsp"%>

	<!-- Listed Companies -->

	<div class="container">
		<div class="row">
			<div class="col-12">
				<table id="companyTable" class="table table-bordered mt-3">
					<thead>
						<tr>
							<th>Company ID</th>
							<th>Company Name</th>
						</tr>
					</thead>
					<tbody>
						<%
						Session s = FactoryProvider.getFactory().openSession();
						List<CompanyRecord> companies = s.createQuery("from CompanyRecord", CompanyRecord.class).list();
						for (CompanyRecord company : companies) {
						%>
						<tr>
							<td><%=company.getCompanyId()%></td>
							<td><%=company.getName()%></td>
						</tr>
						<%
						}
						s.close();
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		// Initially hide the table
		document.getElementById('companyTable').style.display = 'none';

		// Add click event listener to the button
		document.getElementById('showTableButton').addEventListener('click',
				function() {
					// Get the table element
					var table = document.getElementById('companyTable');

					// Check if the table is currently hidden
					if (table.style.display === 'none') {
						// Show the table
						table.style.display = 'table';
					} else {
						// Hide the table
						table.style.display = 'none';
					}
				});
	</script>
	<!-- Listed Companies -->

</body>
</html>
