/**
 * 
 */
package org.volunteertech.pledges.pledge.status;

/**
 * @author Keegan
 *
 */
public interface HasStatusFields {
	public Long getStatus();

	public void setStatus(Long status);
	
	public String getStatusReferenceTranslation();

	public void setStatusReferenceTranslation(String statusReferenceTranslation);
	
	public ActiveStatusEnum getActiveStatus();
	
	public void setActiveStatus(ActiveStatusEnum a);
	
	public PledgeTakenStatusEnum getPledgeTakenStatus();

	public void setPledgeTakenStatus(PledgeTakenStatusEnum pledgeTakenStatus);

	public VerificationProgressEnum getVerificationProgress();

	public void setVerificationProgress(VerificationProgressEnum verificationProgress);
}
