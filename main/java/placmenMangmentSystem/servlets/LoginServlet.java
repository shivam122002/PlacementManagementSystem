package placmenMangmentSystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			String enrollment = request.getParameter("enrollment");
			String password = request.getParameter("password");
			
            if("admin".equals(enrollment)&&"123".equals(password)) 
            {
            	response.sendRedirect("Admin/admin.jsp");
            	return;
            }
			StudentDao studentDao = new StudentDao(FactoryProvider.getFactory());
			Student student = studentDao.getStudentFromEnrollmentAndPassword(enrollment, password);

			if (student != null) {

				HttpSession s = request.getSession();
				s.setAttribute("currentStudent", student);
				response.sendRedirect("home.jsp");
			} else {

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Something went wrong");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
