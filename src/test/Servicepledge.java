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
 * Servicepledge generated by hbm2java
 */
@Entity
@Table(name = "SERVICEPLEDGE", catalog = "netgrains")
public class Servicepledge implements java.io.Serializable {

	private Long servicepledgeid;
	private Long pledgeservicelevelone;
	private Long pledgeserviceleveltwo;
	private Long pledgeservicelevelthree;
	private String additionalinformation;
	private String pledgeservicequalification;
	private Date pledgeservicedateavailable;
	private Date pledgeservicedateavailableto;
	private Long pledgeservicehoursperweek;
	private Long registerofpledgesid;
	private Long createdbyid;
	private Long updatedbyid;
	private Date datecreated;
	private Date dateupdated;

	public Servicepledge() {
	}

	public Servicepledge(Long pledgeservicelevelone, Long pledgeserviceleveltwo, Long pledgeservicelevelthree,
			String additionalinformation, String pledgeservicequalification, Date pledgeservicedateavailable,
			Date pledgeservicedateavailableto, Long pledgeservicehoursperweek, Long registerofpledgesid,
			Long createdbyid, Long updatedbyid, Date datecreated, Date dateupdated) {
		this.pledgeservicelevelone = pledgeservicelevelone;
		this.pledgeserviceleveltwo = pledgeserviceleveltwo;
		this.pledgeservicelevelthree = pledgeservicelevelthree;
		this.additionalinformation = additionalinformation;
		this.pledgeservicequalification = pledgeservicequalification;
		this.pledgeservicedateavailable = pledgeservicedateavailable;
		this.pledgeservicedateavailableto = pledgeservicedateavailableto;
		this.pledgeservicehoursperweek = pledgeservicehoursperweek;
		this.registerofpledgesid = registerofpledgesid;
		this.createdbyid = createdbyid;
		this.updatedbyid = updatedbyid;
		this.datecreated = datecreated;
		this.dateupdated = dateupdated;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "SERVICEPLEDGEID", unique = true, nullable = false)
	public Long getServicepledgeid() {
		return this.servicepledgeid;
	}

	public void setServicepledgeid(Long servicepledgeid) {
		this.servicepledgeid = servicepledgeid;
	}

	@Column(name = "PLEDGESERVICELEVELONE")
	public Long getPledgeservicelevelone() {
		return this.pledgeservicelevelone;
	}

	public void setPledgeservicelevelone(Long pledgeservicelevelone) {
		this.pledgeservicelevelone = pledgeservicelevelone;
	}

	@Column(name = "PLEDGESERVICELEVELTWO")
	public Long getPledgeserviceleveltwo() {
		return this.pledgeserviceleveltwo;
	}

	public void setPledgeserviceleveltwo(Long pledgeserviceleveltwo) {
		this.pledgeserviceleveltwo = pledgeserviceleveltwo;
	}

	@Column(name = "PLEDGESERVICELEVELTHREE")
	public Long getPledgeservicelevelthree() {
		return this.pledgeservicelevelthree;
	}

	public void setPledgeservicelevelthree(Long pledgeservicelevelthree) {
		this.pledgeservicelevelthree = pledgeservicelevelthree;
	}

	@Column(name = "ADDITIONALINFORMATION")
	public String getAdditionalinformation() {
		return this.additionalinformation;
	}

	public void setAdditionalinformation(String additionalinformation) {
		this.additionalinformation = additionalinformation;
	}

	@Column(name = "PLEDGESERVICEQUALIFICATION")
	public String getPledgeservicequalification() {
		return this.pledgeservicequalification;
	}

	public void setPledgeservicequalification(String pledgeservicequalification) {
		this.pledgeservicequalification = pledgeservicequalification;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PLEDGESERVICEDATEAVAILABLE", length = 19)
	public Date getPledgeservicedateavailable() {
		return this.pledgeservicedateavailable;
	}

	public void setPledgeservicedateavailable(Date pledgeservicedateavailable) {
		this.pledgeservicedateavailable = pledgeservicedateavailable;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PLEDGESERVICEDATEAVAILABLETO", length = 19)
	public Date getPledgeservicedateavailableto() {
		return this.pledgeservicedateavailableto;
	}

	public void setPledgeservicedateavailableto(Date pledgeservicedateavailableto) {
		this.pledgeservicedateavailableto = pledgeservicedateavailableto;
	}

	@Column(name = "PLEDGESERVICEHOURSPERWEEK")
	public Long getPledgeservicehoursperweek() {
		return this.pledgeservicehoursperweek;
	}

	public void setPledgeservicehoursperweek(Long pledgeservicehoursperweek) {
		this.pledgeservicehoursperweek = pledgeservicehoursperweek;
	}

	@Column(name = "REGISTEROFPLEDGESID")
	public Long getRegisterofpledgesid() {
		return this.registerofpledgesid;
	}

	public void setRegisterofpledgesid(Long registerofpledgesid) {
		this.registerofpledgesid = registerofpledgesid;
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
