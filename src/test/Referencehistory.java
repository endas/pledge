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
 * Referencehistory generated by hbm2java
 */
@Entity
@Table(name = "REFERENCEHISTORY", catalog = "netgrains")
public class Referencehistory implements java.io.Serializable {

	private Long referencehistoryid;
	private Long referenceid;
	private String reftype;
	private String refdesc;
	private Long parentid;
	private Long refindex;
	private String description;
	private Long createdbyid;
	private Long updatedbyid;
	private Date datecreated;
	private Date dateupdated;

	public Referencehistory() {
	}

	public Referencehistory(Long referenceid, String reftype, String refdesc, Long parentid, Long refindex,
			String description, Long createdbyid, Long updatedbyid, Date datecreated, Date dateupdated) {
		this.referenceid = referenceid;
		this.reftype = reftype;
		this.refdesc = refdesc;
		this.parentid = parentid;
		this.refindex = refindex;
		this.description = description;
		this.createdbyid = createdbyid;
		this.updatedbyid = updatedbyid;
		this.datecreated = datecreated;
		this.dateupdated = dateupdated;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "REFERENCEHISTORYID", unique = true, nullable = false)
	public Long getReferencehistoryid() {
		return this.referencehistoryid;
	}

	public void setReferencehistoryid(Long referencehistoryid) {
		this.referencehistoryid = referencehistoryid;
	}

	@Column(name = "REFERENCEID")
	public Long getReferenceid() {
		return this.referenceid;
	}

	public void setReferenceid(Long referenceid) {
		this.referenceid = referenceid;
	}

	@Column(name = "REFTYPE", length = 50)
	public String getReftype() {
		return this.reftype;
	}

	public void setReftype(String reftype) {
		this.reftype = reftype;
	}

	@Column(name = "REFDESC", length = 50)
	public String getRefdesc() {
		return this.refdesc;
	}

	public void setRefdesc(String refdesc) {
		this.refdesc = refdesc;
	}

	@Column(name = "PARENTID")
	public Long getParentid() {
		return this.parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	@Column(name = "REFINDEX")
	public Long getRefindex() {
		return this.refindex;
	}

	public void setRefindex(Long refindex) {
		this.refindex = refindex;
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
