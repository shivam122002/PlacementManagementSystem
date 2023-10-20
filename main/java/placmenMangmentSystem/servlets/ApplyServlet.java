package placmenMangmentSystem.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.AppliedStudent;
import placementMangmentSystem.helper.FactoryProvider;
import placementMangmentSystem.helper.Helper;

@MultipartConfig
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			String enrollment =request.getParameter("enrollmentNumber");
			String student_name = request.getParameter("name");
			String email = request.getParameter("email");
			String branch = request.getParameter("branch");
			Part part = request.getPart("resumeFile");
			String companyName=request.getParameter("companyName");
			
			
			AppliedStudent newStudent = new AppliedStudent(enrollment,student_name,email,branch, part.getSubmittedFileName(),companyName);
			Session s = FactoryProvider.getFactory().openSession();
			Transaction ts = s.beginTransaction();
			s.save(newStudent);
			String path=request.getRealPath("student_resume") + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			System.out.println(path);
			ts.commit();
			s.close();

			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("res","Form submited Successfully");

			response.sendRedirect("home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
