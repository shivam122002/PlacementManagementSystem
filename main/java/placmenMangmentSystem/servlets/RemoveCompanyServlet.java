package placmenMangmentSystem.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import placementMangmentSystem.entity.CompanyRecord;
import placementMangmentSystem.helper.FactoryProvider;


@MultipartConfig
public class RemoveCompanyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RemoveCompanyServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String company_id = request.getParameter("company_id");
            System.out.println(company_id);

            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            CompanyRecord company = session.get(CompanyRecord.class, company_id);

            if (company != null) {
                session.delete(company);
                transaction.commit();
                session.close();
                
                HttpSession httpSession=request.getSession();
    			httpSession.setAttribute("mssg"," company Remove Successfully!!.");

                response.sendRedirect("Admin/admin.jsp");
            } else {
                // If the company record does not exist, handle the error appropriately.
                response.sendRedirect("error.jsp"); // You can create an error page.
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
