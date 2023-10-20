package placmenMangmentSystem.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import placementMangmentSystem.Dao.StudentDao;
import placementMangmentSystem.entity.Student;
import placementMangmentSystem.helper.FactoryProvider;


@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

    			String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
                System.out.print(name);
	            // Get the user from the session
	            HttpSession session = request.getSession();
	            Student student = (Student) session.getAttribute("currentStudent");

	            // Setting updated values of student
	            student.setName(name);
	            student.setEmail(email);
	            student.setPassword(password);
	            
                System.out.println(student.getName());
                System.out.println(student.getPassword());
                
 	            StudentDao studentDao = new StudentDao(FactoryProvider.getFactory());
	            boolean isUpdate = studentDao.updateValues(student); // Assuming your DAO method is named updateStudent

	            if (isUpdate==true) {
	            	HttpSession httpSession=request.getSession();
	    			httpSession.setAttribute("message","Updated Successfully!!.");

	    			response.sendRedirect("home.jsp");

	            } else {
	                response.sendRedirect("error.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
