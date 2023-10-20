package placementMangmentSystem.entity;


import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class StudentExperience {
	@Id
	private int id;
	private String userName;
	private String CompanyName;
	private String jobRole;
	private String applyProcess;
	private String experience;
	private Date postDate;

	public StudentExperience(String userName, String companyName, String jobRole, String applyProcess,
			String experience, Date postDate) {
		super();
		this.id = new Random().nextInt(10000);
		this.userName = userName;
		CompanyName = companyName;
		this.jobRole = jobRole;
		this.applyProcess = applyProcess;
		this.experience = experience;
		this.postDate = postDate;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCompanyName() {
		return CompanyName;
	}

	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}

	public String getJobRole() {
		return jobRole;
	}

	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}

	public String getApplyProcess() {
		return applyProcess;
	}

	public void setApplyProcess(String applyProcess) {
		this.applyProcess = applyProcess;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public StudentExperience() {
		super();
		// TODO Auto-generated constructor stub
	}

}
