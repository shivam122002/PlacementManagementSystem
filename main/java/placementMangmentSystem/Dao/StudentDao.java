package placementMangmentSystem.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import placementMangmentSystem.entity.AppliedStudent;
import placementMangmentSystem.entity.SelectedStudent;
import placementMangmentSystem.entity.Student;
import placementMangmentSystem.entity.StudentExperience;

public class StudentDao {

	private SessionFactory factory;

	public StudentDao(SessionFactory factory) {
		this.factory = factory;
	}

	public Student getStudentFromEnrollmentAndPassword(String enrollment, String password) {

		Student student = null;
		try {
			String query = "from Student where enrollmentNumber=:e and password=:p";

			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", enrollment);
			q.setParameter("p", password);

			student = (Student) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return student;
	}

	public boolean updateValues(Student student) {
		// TODO Auto-generated method stub

		boolean flag = false;
		Session session = null;
		Transaction transaction = null;

		try {
			session = this.factory.openSession();
			transaction = session.beginTransaction();

			// Retrieve the Student entity by its ID
			Student studentToUpdate = session.get(Student.class, student.getEnrollmentNumber());
			if (studentToUpdate != null) {
				// Update the properties of the Student entity
				studentToUpdate.setName(student.getName());
				studentToUpdate.setEmail(student.getEmail());
				studentToUpdate.setPassword(student.getPassword());

				session.update(studentToUpdate);
				transaction.commit();
				flag = true;
			}
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return flag;

	}

	public List<SelectedStudent> getSelectedStudentsFromEnrollment(String enrollment) {

		List<SelectedStudent> students = new ArrayList<SelectedStudent>();
		try {
			String query = "from SelectedStudent where enrollmentNumber=:e";

			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", enrollment);
			students = q.list();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return students;
	}

	public List<AppliedStudent> getAppliedStudentsByEnrollment(String enrollment) {
		List<AppliedStudent> students = new ArrayList<AppliedStudent>();

		try {
			String query = "from AppliedStudent where enrollentNumber = :e";

			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", enrollment);

			students = q.list(); // Use list() method to retrieve a list of results
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return students;
	}
	public List<StudentExperience>getExperiences()
	{
		List<StudentExperience>experience=new ArrayList<StudentExperience>();
		try 
		{
			String query="from StudentExperience";
			Session session =this.factory.openSession();
			Query q=session.createQuery(query);
			experience=q.list();
			session.close();
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return experience;
	}

}

/*
 * Google is a multinational technology company that specializes in
 * Internet-related services and products. It was founded in September 1998 by
 * Larry Page and Sergey Brin while they were Ph.D. students at Stanford
 * University. Google has since grown to become one of the largest and most
 * influential technology companies in the world.
 * 
 * 
 * Education: A bachelor's degree in computer science or software engineering.
 * Programming Skills: Proficiency in programming languages. Problem-Solving
 * Skills: Ability to solve problems. Data Structures and Algorithms: Knowledge
 * of data structures and algorithms. Software Development Tools: Experience
 * with software development tools. Computer Science Fundamentals: Understanding
 * of computer science basics. Coding and Testing: Ability to write clean code
 * and perform testing. Collaboration and Communication: Strong teamwork and
 * communication skills. Problem Domain Knowledge: Industry-specific knowledge
 * (if applicable). Soft Skills: Adaptability, attention to detail, and time
 * management.
 * 
 * 
 * Amazon.com, Inc., commonly referred to as Amazon, is one of the world's
 * largest and most influential multinational technology and e-commerce
 * companies. It was founded by Jeff Bezos on July 5, 1994, initially as an
 * online bookstore. Over the years, Amazon has expanded its business
 * significantly, becoming a diverse conglomerate with a wide range of products
 * and services.
 * 
 * 
 * Facebook, Inc. is a prominent American social media conglomerate
 * headquartered in Menlo Park, California. Founded on February 4, 2004, by Mark
 * Zuckerberg along with his college roommates Andrew McCollum, Eduardo Saverin,
 * Chris Hughes, and Dustin Moskovitz, Facebook has since grown into one of the
 * largest and most influential technology companies in the world.

 * 
 * 
 */