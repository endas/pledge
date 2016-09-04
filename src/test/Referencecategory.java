// default package
// Generated Jul 14, 2016 11:10:17 PM by Hibernate Tools 5.1.0.Alpha1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Referencecategory generated by hbm2java
 */
@Entity
@Table(name = "REFERENCECATEGORY", catalog = "netgrains")
public class Referencecategory implements java.io.Serializable {

	private Long referencecategoryid;
	private String referencecategorydesc;
	private Long parentcategoryid;
	private String description;
	private Long createdbyid;
	private Long updatedbyid;
	private Date datecreated;
	private Date dateupdated;

	public Referencecategory() {
	}

	public Referencecategory(String referencecategorydesc) {
		this.referencecategorydesc = referencecategorydesc;
	}

	public Referencecategory(String referencecategorydesc, Long parentcategoryid, String description, Long createdbyid,
			Long updatedbyid, Date datecreated, Date dateupdated) {
		this.referencecategorydesc = referencecategorydesc;
		this.parentcategoryid = parentcategoryid;
		this.description = description;
		this.createdbyid = createdbyid;
		this.updatedbyid = updatedbyid;
		this.datecreated = datecreated;
		this.dateupdated = dateupdated;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "REFERENCECATEGORYID", unique = true, nullable = false)
	public Long getReferencecategoryid() {
		return this.referencecategoryid;
	}

	public void setReferencecategoryid(Long referencecategoryid) {
		this.referencecategoryid = referencecategoryid;
	}

	@Column(name = "REFERENCECATEGORYDESC", nullable = false, length = 50)
	public String getReferencecategorydesc() {
		return this.referencecategorydesc;
	}

	public void setReferencecategorydesc(String referencecategorydesc) {
		this.referencecategorydesc = referencecategorydesc;
	}

	@Column(name = "PARENTCATEGORYID")
	public Long getParentcategoryid() {
		return this.parentcategoryid;
	}

	public void setParentcategoryid(Long parentcategoryid) {
		this.parentcategoryid = parentcategoryid;
	}

	@Column(name = "DESCRIPTION", length = 200)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "CREATEDBYID")
	public Long getCreatedbyid() {
		return this.createdbyid;
	}

	public void setCreatedbyid(Long createdbyid) {
		this.createdbyid = createdbyid;
	}

	@Column(name = "UPDATEDBYID")
	public Long getUpdatedbyid() {
		return this.updatedbyid;
	}

	public void setUpdatedbyid(Long updatedbyid) {
		this.updatedbyid = updatedbyid;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATECREATED", length = 19)
	public Date getDatecreated() {
		return this.datecreated;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATEUPDATED", length = 19)
	public Date getDateupdated() {
		return this.dateupdated;
	}

	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}

}
