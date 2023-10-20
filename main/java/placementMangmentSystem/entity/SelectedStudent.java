package placementMangmentSystem.entity;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SelectedStudent {

	@Id
	private int id;
	private String enrollmentNumber;
	private String name;
	private String branch;
	private String passout_year;
	private String salary;
	private String Company_name;
	private String job_profile;
	private String student_pic;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEnrollmentNumber() {
		return enrollmentNumber;
	}

	public void setEnrollmentNumber(String enrollmentNumber) {
		this.enrollmentNumber = enrollmentNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getPassout_year() {
		return passout_year;
	}

	public void setPassout_year(String passout_year) {
		this.passout_year = passout_year;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getCompany_name() {
		return Company_name;
	}

	public void setCompany_name(String company_name) {
		Company_name = company_name;
	}

	public String getJob_profile() {
		return job_profile;
	}

	public void setJob_profile(String job_profile) {
		this.job_profile = job_profile;
	}

	public String getStudent_pic() {
		return student_pic;
	}

	public void setStudent_pic(String student_pic) {
		this.student_pic = student_pic;
	}

	public SelectedStudent(String enrollmentNumber, String name, String branch, String passout_year, String salary,
			String company_name, String job_profile, String student_pic) {
		super();
		this.id=new Random().nextInt(10000);
		this.enrollmentNumber = enrollmentNumber;
		this.name = name;
		this.branch = branch;
		this.passout_year = passout_year;
		this.salary = salary;
		Company_name = company_name;
		this.job_profile = job_profile;
		this.student_pic = student_pic;
	}

	public SelectedStudent() {
		super();
		// TODO Auto-generated constructor stub
	}

}
