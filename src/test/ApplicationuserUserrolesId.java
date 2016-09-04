// default package
// Generated Jul 14, 2016 11:10:17 PM by Hibernate Tools 5.1.0.Alpha1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * ApplicationuserUserrolesId generated by hbm2java
 */
@Embeddable
public class ApplicationuserUserrolesId implements java.io.Serializable {

	private long applicationuserid;
	private Long referenceid;

	public ApplicationuserUserrolesId() {
	}

	public ApplicationuserUserrolesId(long applicationuserid) {
		this.applicationuserid = applicationuserid;
	}

	public ApplicationuserUserrolesId(long applicationuserid, Long referenceid) {
		this.applicationuserid = applicationuserid;
		this.referenceid = referenceid;
	}

	@Column(name = "APPLICATIONUSERID", nullable = false)
	public long getApplicationuserid() {
		return this.applicationuserid;
	}

	public void setApplicationuserid(long applicationuserid) {
		this.applicationuserid = applicationuserid;
	}

	@Column(name = "REFERENCEID")
	public Long getReferenceid() {
		return this.referenceid;
	}

	public void setReferenceid(Long referenceid) {
		this.referenceid = referenceid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ApplicationuserUserrolesId))
			return false;
		ApplicationuserUserrolesId castOther = (ApplicationuserUserrolesId) other;

		return (this.getApplicationuserid() == castOther.getApplicationuserid())
				&& ((this.getReferenceid() == castOther.getReferenceid())
						|| (this.getReferenceid() != null && castOther.getReferenceid() != null
								&& this.getReferenceid().equals(castOther.getReferenceid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (int) this.getApplicationuserid();
		result = 37 * result + (getReferenceid() == null ? 0 : this.getReferenceid().hashCode());
		return result;
	}

}
