package placmenMangmentSystem.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.Query;
import placementMangmentSystem.helper.FactoryProvider;

public class StudentQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try 
		{
			
			String enrollment=request.getParameter("enrollment");
			String email=request.getParameter("email");
			String query=request.getParameter("message");
			
			Query newQuery=new Query(enrollment,email,query);
			
			//To save object in database using Hibernate
			Session s=FactoryProvider.getFactory().openSession();
			Transaction ts=s.beginTransaction();
			s.save(newQuery);
			ts.commit();
			s.close();

//			HttpSession httpSession=request.getSession();
//			httpSession.setAttribute("query","Message send Successfully!!.");
			response.sendRedirect("contact.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
