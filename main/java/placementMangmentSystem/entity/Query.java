package placementMangmentSystem.entity;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Query 
{
  @Id
  private int queryId;
  private String enrollmentNumber;
  private String email;
  @Column(length=1000)
  private String query;
public int getQueryId() {
	return queryId;
}
public void setQueryId(int queryId) {
	this.queryId = queryId;
}
public String getEnrollmentNumber() {
	return enrollmentNumber;
}
public void setEnrollmentNumber(String enrollmentNumber) {
	this.enrollmentNumber = enrollmentNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getQuery() {
	return query;
}
public void setQuery(String query) {
	this.query = query;
}
public Query(String enrollmentNumber, String email, String query) {
	super();
	this.queryId = new Random().nextInt(1000);
	this.enrollmentNumber = enrollmentNumber;
	this.email = email;
	this.query = query;
}
public Query() {
	super();
	// TODO Auto-generated constructor stub
}

  
  
}
