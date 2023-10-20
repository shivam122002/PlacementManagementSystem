package placmenMangmentSystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.Student;
import placementMangmentSystem.helper.FactoryProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			String enrollmentNumber = request.getParameter("enrollmentNumber");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String college = request.getParameter("college");
			String branch = request.getParameter("branch");
			Student newStudent = new Student(enrollmentNumber, name, email, password, college, branch);

			// To save object in database using Hibernate
			Session s = FactoryProvider.getFactory().openSession();
			Transaction ts = s.beginTransaction();
			s.save(newStudent);
			ts.commit();
			s.close();
			out.println("Done");
			System.out.println(name + "---get register succesfully...!");

		} catch (Exception e) {
			out.println("Something went wrong ,Please try again");
			e.printStackTrace();

		}
	}

}
