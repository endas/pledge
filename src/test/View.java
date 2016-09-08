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
 * View generated by hbm2java
 */
@Entity
@Table(name = "VIEW", catalog = "netgrains")
public class View implements java.io.Serializable {

	private Long viewid;
	private String viewname;
	private Long createdbyid;
	private Long updatedbyid;
	private Date datecreated;
	private Date dateupdated;

	public View() {
	}

	public View(String viewname) {
		this.viewname = viewname;
	}

	public View(String viewname, Long createdbyid, Long updatedbyid, Date datecreated, Date dateupdated) {
		this.viewname = viewname;
		this.createdbyid = createdbyid;
		this.updatedbyid = updatedbyid;
		this.datecreated = datecreated;
		this.dateupdated = dateupdated;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "VIEWID", unique = true, nullable = false)
	public Long getViewid() {
		return this.viewid;
	}

	public void setViewid(Long viewid) {
		this.viewid = viewid;
	}

	@Column(name = "VIEWNAME", nullable = false, length = 50)
	public String getViewname() {
		return this.viewname;
	}

	public void setViewname(String viewname) {
		this.viewname = viewname;
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