package placementMangmentSystem.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CompanyRecord {
	
	@Id
	private String companyId;
	private String image;
	private String name;
	@Column(length=3000)
	private String about_company;
	private String job_role;
	@Column(length=3000)
	private String requirments;
	private String peckage;
	private String last_date_to_apply;
    private String eligible_branches;
	// if we want to store multiple data or List into database then we can use this concept
	
//	@ElementCollection
//	@CollectionTable(name = "eligible_batches")
//	@Column(name = "batch")
//	private List<String> eligible_batch = new ArrayList();
//	
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAbout_company() {
		return about_company;
	}

	public void setAbout_company(String about_company) {
		this.about_company = about_company;
	}

	public String getJob_role() {
		return job_role;
	}

	public void setJob_role(String job_role) {
		this.job_role = job_role;
	}

	
	public String getEligible_batch() {
		return eligible_branches;
	}

	public void setEligible_batch(String eligible_branches) {
		this.eligible_branches = eligible_branches;
	}

	public String getRequirments() {
		return requirments;
	}

	public void setRequirments(String requirments) {
		this.requirments = requirments;
	}

	public String getPeckage() {
		return peckage;
	}

	public void setPeckage(String peckage) {
		this.peckage = peckage;
	}

	public String getLast_date_to_apply() {
		return last_date_to_apply;
	}

	public void setLast_date_to_apply(String last_date_to_apply) {
		this.last_date_to_apply = last_date_to_apply;
	}

	
	public CompanyRecord(String companyId,
			String image,String name, String about_company, String job_role,
			String eligible_branches, String requirments, String peckage, String last_date_to_apply) {
		super();
		this.companyId = companyId;
		this.image = image;
		this.about_company = about_company;
		this.job_role = job_role;
		this.eligible_branches = eligible_branches;
		this.requirments = requirments;
		this.peckage = peckage;
		this.name=name;
		this.last_date_to_apply = last_date_to_apply;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CompanyRecord() {
		super();
		// TODO Auto-generated constructor stub
	}

}
