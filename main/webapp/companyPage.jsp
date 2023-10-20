<%@page import="placementMangmentSystem.entity.CompanyRecord"%>
<%@page import="placementMangmentSystem.Dao.CompanyDao"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

  String company_id=(request.getParameter("company_id"));
  CompanyDao companyDao =new CompanyDao(FactoryProvider.getFactory());
  CompanyRecord company=companyDao.getCompanyById(company_id);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_css_js.jsp"%>
<title>Company Details</title>
<style>
    /* Add custom CSS styles */
    .profile-box {
        background-color: #f5f5f5;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 20px;
        display: flex;
        flex-direction: row;
    }
    .profile-heading {
        font-size: 18px;
        font-weight: bold;
        width: 30%;
    }
    .profile-content {
        padding-left: 20px;
        text-align: justify;
        width: 70%;
    }
</style>
</head>
<body>
    <%@include file="home-nav-bar.jsp"%>
    <section class="bg-light text-dark py-5">
        <div
            class="container mx-auto d-flex px-5 py-24 align-items-center justify-content-center flex-column">
            <img class="lg:w-2/6 md:w-3/6 w-5/6 mb-10 img-fluid rounded"
                alt="company-image" src="companies_pics/<%=company.getImage()%>">
            <div class="text-center lg:w-2/3 w-full">
                <div id="profile-details" class="text-center">
                <br><br>
                <div class="profile-box">
                    <div class="profile-heading">About-company:</div>
                    <div class="profile-content">
                        <p><%=company.getAbout_company()%></p>
                    </div>
                </div>
                <br>
                <div class="profile-box">
                    <div class="profile-heading">Requirements:</div>
                    <div class="profile-content">
                        <ul>
                            <%
                            String requirements = company.getRequirments();
                            String[] requirementLines = requirements.split("\\n"); // Split requirements by newline
                            for (String requirement : requirementLines) {
                            %>
                            <li><%= requirement %></li>
                            <%
                            }
                            %>
                        </ul>
                    </div>
                </div>
                <br>    
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">Company Name</th>
                                <td><%=company.getName()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Job Profile</th>
                                <td><%=company.getJob_role() %></td>
                            </tr>
                            <tr>
                                <th scope="row">Eligible Branches:</th>
                                <td><%=company.getEligible_batch() %></td>
                            </tr>
                            <tr>
                                <th scope="row">Package:</th>
                                <td><%=company.getPeckage() %></td>
                            </tr>
                            <tr>
                                <th scope="row">Last Date To Apply</th>
                                <td><%=company.getLast_date_to_apply() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-center">
                    <a class="btn btn-primary" href="apply.jsp?company_id=<%=company.getCompanyId()%>">Apply Now</a>
                    &nbsp;&nbsp; <a class="btn btn-secondary" href="home.jsp">Cancel</a>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
