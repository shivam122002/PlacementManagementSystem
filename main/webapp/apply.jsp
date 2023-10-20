<%@page import="placementMangmentSystem.entity.CompanyRecord"%>
<%@page import="placementMangmentSystem.Dao.CompanyDao"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String company_id = (request.getParameter("company_id"));
CompanyDao companyDao = new CompanyDao(FactoryProvider.getFactory());
CompanyRecord company = companyDao.getCompanyById(company_id);
%>
<%
Student currStudent = (Student) session.getAttribute("currentStudent");
if (currStudent == null) {
	response.sendRedirect("home.jsp");
}
%>
<%@include file="all_css_js.jsp"%>
<title>Application form:<%=company.getName()%></title>
</head>
<body>
    <%@include file="home-nav-bar.jsp"%>
    <br>
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header primary-background text-white text-center">
                    <span class="fa fa-user-plus fa-3x"></span>
                    <p>Apply Here</p>
                </div>
                <br>
                <div class="card-body">
                    <form id="reg-form" action="ApplyServlet" method="POST"
                        enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="companyName">Company Name</label> <input
                                type="text" class="form-control" id="companyName"
                                name="companyName" value="<%= company.getName() %>"
                                readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEnrollment">Enrollment No.</label> <input
                                name="enrollmentNumber" type="text" class="form-control"
                                id="Enrollment" value="<%=currStudent.getEnrollmentNumber()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="studentName"><span class=" "></span>Student
                                Name</label> <input type="text" name="name" class="form-control"
                                id="userName" value="<%=currStudent.getName()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email">Email address</label> <input type="email"
                                class="form-control" name="email" id="email"
                                aria-describedby="emailHelp" value="<%=currStudent.getEmail()%>" readonly>
                            <small id="emailHelp" class="form-text text-muted">
                        </div>
                        <div class="form-group">
                            <label for="email">Branch Name</label> <input type="text"
                                class="form-control" name="branch" id="branch"
                                aria-describedby="branchHelp" value="<%=currStudent.getBranch()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="resumeFile">Upload Resume (PDF only)</label> <input
                                type="file" class="form-control-file" name="resumeFile"
                                id="resumeFile" accept=".pdf" required>
                        </div>
                        <div class="form-check">
                            <input name="check" type="checkbox" class="form-check-input"
                                id="Check" required> <label class="form-check-label" for="Check">Terms
                                & condition</label>
                        </div>
                                                <br>
                        <div class="text-center">
                            <button type="submit" id="submit-btn" class="btn btn-primary">Apply</button>
                             <a class="btn btn-secondary" href="home.jsp">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
