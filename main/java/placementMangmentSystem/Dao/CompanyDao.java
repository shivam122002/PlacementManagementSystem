package placementMangmentSystem.Dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import placementMangmentSystem.entity.CompanyRecord;
import placementMangmentSystem.entity.Student;

public class CompanyDao 
{
	private SessionFactory factory;

	public CompanyDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public CompanyRecord getCompanyById(String company_id) {

		CompanyRecord company = null;
		try {
			String query = "from CompanyRecord where CompanyId=:cId";

			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("cId", company_id);

		    company = (CompanyRecord) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return company;
	}

}
