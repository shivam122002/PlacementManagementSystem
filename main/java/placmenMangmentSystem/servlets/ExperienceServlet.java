package placmenMangmentSystem.servlets;


import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.StudentExperience;
import placementMangmentSystem.helper.FactoryProvider;

@MultipartConfig
public class ExperienceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExperienceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try 
		{
		   String user_name=request.getParameter("user_name");
		   String company_name=request.getParameter("company_name");
		   String job_profile=request.getParameter("job_profile");
		   String applyBy=request.getParameter("apply");
		   String experience=request.getParameter("experience");
		   StudentExperience newExperience=new StudentExperience(user_name,company_name,job_profile,applyBy,experience,new Date());
		   
		   Session s = FactoryProvider.getFactory().openSession();
		   Transaction ts = s.beginTransaction();
		   s.save(newExperience);
		   ts.commit();
		   s.close();
//		   
//		   HttpSession httpSession=request.getSession();
//		   httpSession.setAttribute("message"," Post Successfully");

		   response.sendRedirect("interview_Experience.jsp");

		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

}
