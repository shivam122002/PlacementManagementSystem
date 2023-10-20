<%@page import="placementMangmentSystem.entity.Query"%>
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
<title>Student's Queries - PMS</title>
</head>
<body>
	<%@include file="admin-nav-bar.jsp"%>
	<br>

	<%
	Session s = FactoryProvider.getFactory().openSession();
	List<Query> queries = s.createQuery("from Query", Query.class).list();
	for (Query query : queries) {
	%>

	<div class="card text-center">
		<div class="card-header">
			Query ID:
			<%=query.getQueryId()%></div>
		<div class="card-body">
			<p class="card-text"><%=query.getQuery()%></p>
			<!-- Use interpolation to display query text -->
			<a href="../SolveQueryServlet?query_id=<%=query.getQueryId()%>" class="btn btn-primary">Resolve Query</a>
		</div>
		<div class="card-footer text-muted">
			<h6>
				Email:<%=query.getEmail()%></h6>
			<h6>
				Enrollment Number:<%=query.getEnrollmentNumber()%></h6>
		</div>
	</div>
	<br><br>
	<div class="text-center">
     <h1>**********</h1>
     </div>    
	<%
	}
	%>

</body>
</html>
