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

import placementMangmentSystem.entity.SelectedStudent;
import placementMangmentSystem.helper.FactoryProvider;
import placementMangmentSystem.helper.Helper;

@MultipartConfig
public class AddSelectedStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddSelectedStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			String enrollment = request.getParameter("student_id");
			String name = request.getParameter("student_name");
			String branch = request.getParameter("branch");
			String passout_year = request.getParameter("passout_year");
			String salary = request.getParameter("package");
			String company_name = request.getParameter("company_name");
			String job_profile = request.getParameter("job_profile");
			Part part = request.getPart("student_pic");

			SelectedStudent newStudent = new SelectedStudent(enrollment, name, branch, passout_year, salary,
					company_name, job_profile, part.getSubmittedFileName());
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction ts = s.beginTransaction();
			s.save(newStudent);
			String path=request.getRealPath("student_photoes") + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			ts.commit();
			s.close();
			
			HttpSession httpSession=request.getSession();
			response.sendRedirect("Admin/admin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
