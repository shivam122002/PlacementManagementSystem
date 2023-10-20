package placementMangmentSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Random;

@Entity
public class AppliedStudent {

	@Id
	private int id;
	private String enrollentNumber;
	private String student_name;
	private String email;
	private String branch;
	private String student_resume;
	private String companyName;

	public AppliedStudent(String enrollentNumber, String student_name, String email, String branch,
			String student_resume,String companyName) {
		super();
		this.id = new Random().nextInt(10000);
		this.enrollentNumber = enrollentNumber;
		this.student_name = student_name;
		this.email = email;
		this.branch = branch;
		this.student_resume = student_resume;
        this.companyName=companyName;
	}

	public AppliedStudent() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEnrollentNumber() {
		return enrollentNumber;
	}

	public void setEnrollentNumber(String enrollentNumber) {
		this.enrollentNumber = enrollentNumber;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getStudent_resume() {
		return student_resume;
	}

	public void setStudent_resume(String student_resume) {
		this.student_resume = student_resume;
	}

}
