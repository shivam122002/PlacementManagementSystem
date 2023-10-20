package placmenMangmentSystem.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.CompanyRecord;
import placementMangmentSystem.helper.FactoryProvider;
import placementMangmentSystem.helper.Helper;

@MultipartConfig
public class AddCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCompanyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String id =request.getParameter("company_id");
			String company_name = request.getParameter("company_name");
			String job_profile = request.getParameter("job_profile");
			String salary = request.getParameter("salary");
			String last_date_to_apply = request.getParameter("last_date_to_apply");
			String about_company = request.getParameter("about_company");
			String requirments = request.getParameter("requirments");
			Part part = request.getPart("company_pic");
            String eligible_branch=request.getParameter("branch");
            
			//If we want to fetch multiple feilds from from then we can use this concept
			
//			String[] multipleInputs = request.getParameterValues("multipleInputs[]");
//
//			// Convert the array to a List<String>
//			List<String> eligible_batch= new ArrayList();
//			if (multipleInputs != null) {
//				eligible_batch.addAll(Arrays.asList(multipleInputs));
//			}
			
			CompanyRecord newCompany = new CompanyRecord(id, part.getSubmittedFileName(), company_name, about_company,
					job_profile, eligible_branch, requirments, salary, last_date_to_apply);
			Session s = FactoryProvider.getFactory().openSession();
			Transaction ts = s.beginTransaction();
			s.save(newCompany);
			String path=request.getRealPath("companies_pics") + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			System.out.println(path);
			ts.commit();
			s.close();
			
			
			
			
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message"," company Added Successfully!!.");

			response.sendRedirect("Admin/admin.jsp");
//			System.out.println(company_name + "---succesfully Added !");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
