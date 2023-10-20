package placmenMangmentSystem.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.Query;
import placementMangmentSystem.helper.FactoryProvider;
public class SolveQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SolveQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int queryId = Integer.parseInt(request.getParameter("query_id").trim());

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Query query = (Query) s.get(Query.class, queryId);
			s.delete(query);
			tx.commit();
			s.close();

			response.sendRedirect("Admin/queries.jsp");

		} catch (Exception e) {
			// TODO: handle exception
		}
	}


}
