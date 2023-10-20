package placementMangmentSystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Student {

	@Id
	private String enrollmentNumber;
	@Column(name = "student_name")
	private String name;
	@Column(name = "student_email")
	private String email;
	@Column(name = "password")
	private String password;
	@Column(name = "college_name")
	private String college;
	private String branch;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public Student(String enrollmentNumber, String name, String email, String password, String college, String branch) {
		super();
		this.enrollmentNumber = enrollmentNumber;
		this.name = name;
		this.email = email;
		this.password = password;
		this.college = college;
		this.branch = branch;
	}

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

}
