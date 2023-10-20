<%@page import="placementMangmentSystem.entity.CompanyRecord"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>

<section class="bg-light text-dark py-5">

	<%
	Session s = FactoryProvider.getFactory().openSession();
	List<CompanyRecord> companies = s.createQuery("from CompanyRecord", CompanyRecord.class).list();
	for (CompanyRecord company : companies) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<div class="rounded-lg overflow-hidden text-center">
					<img alt="content" class="img-fluid" src="companies_pics/<%=company.getImage() %>">
				</div>
				<div class="row mt-4">
					<div class="col-sm-4 text-center">
						<div class="rounded-circle bg-secondary text-white mx-auto"
							style="width: 100px; height: 100px;">
							<svg fill="none" stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								class="w-50 h-50 mx-auto my-3">
                <circle cx="50" cy="50" r="40"></circle>
              </svg>
						</div>
						<h2 class="font-weight-bold mt-3">New Hiring</h2>
						<div class="bg-primary"
							style="height: 2px; width: 50px; margin: 10px auto;"></div>
						<p class="text-center">Exciting campus Hiring for final year
							student,Please do check once.</p>
					</div>
					<div class="col-sm-8 border-left mt-4 pt-4">
						<p class="lead mb-4"><%=company.getName()%></p>
						<h4>About Company:</h4><%=company.getAbout_company()%>
						<br> <br> <br> <a class="btn btn-primary"
							href="companyPage.jsp?company_id=<%=company.getCompanyId()%>">Apply Here</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	<br><br>
	<div class="text-center">
     	
	<h1>*****************</h1>
         
    </div>
    <br>
	<%
	}
	s.close();
	%>
</section>


