package org.volunteertech.pledges.servicepledge.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;

import com.fasterxml.jackson.annotation.JsonBackReference;

import org.volunteertech.pledges.accommodationpledge.dao.AccommodationFlaggedIssuesEnum;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;
import org.volunteertech.pledges.pledge.status.ActiveStatusEnum;
import org.volunteertech.pledges.pledge.status.PledgeTakenStatusEnum;
import org.volunteertech.pledges.pledge.status.VerificationProgressEnum;




/**
 * The pledge services screen is used to add/edit a new/existing pledge of services
 * This class has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler for the ServicePledge entity.
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public class ServicePledgeImpl implements ServicePledge, Serializable {

    private static final long serialVersionUID = 1L;
    
	/** Entity Id */
	private Long id;
	
    /** id of a parent object used when adding objects via JSON enabled restful web services */
    private Long parentObjectId;
    
    /**
     * Used to store the current processing mode during which the object was loaded
     */
    private CurrentMode currentMode;

    private Boolean sameAsProfileAddress;
    
    /** the street or house address */
    private String addressOne;
	
    /** the town or city address */
    private String addressTwo;
	
    /** the post code */
    private String city;
	
    /** the post code */
    private String stateProvinceRegion;
	
    /** the post code */
    private String postCode;
	
    /** the address type */
    private Long country;
    
    /** the address type */
    private Long pledgeServiceLevelOne;
    
    /** the address type */
    private String pledgeServiceLevelOneReferenceTranslation;
    
	
    /** the address type */
    private Long pledgeServiceLevelTwo;
    
    /** the address type */
    private String pledgeServiceLevelTwoReferenceTranslation;
    
	
    /** the address type */
    private Long pledgeServiceLevelThree;
    
    /** the address type */
    private String pledgeServiceLevelThreeReferenceTranslation;
    
	
    /** the participant comments */
    private String additionalInformation;
	
    /** the participant comments */
    private String pledgeServiceQualification;
	
    /** date available from */
    private Date pledgeServiceDateAvailable;
    
    /** available to */
    private Date pledgeServiceDateAvailableTo;
    
    /** the address type */
    private Long pledgeServiceHoursPerWeek;
    
    /** the address type */
    private String pledgeServiceHoursPerWeekReferenceTranslation;
    
    private Set<Long> pledgeServiceTravelAbilities = new HashSet<Long>();
    
	/** the reference to the foreign associated RegisterOfPledges **/
	@JsonBackReference(value="registerofpledges-servicepledge")
	private RegisterOfPledges registerOfPledges;
  

    /** The user ID of the person that originally created the underlying record **/
    private Long createdByID;

    /** The user ID of the person that last updated the underlying record **/
    private Long updatedByID;

    /** The date that the underlying record was created DD/MM/YYYY-HH:MM format **/
    private Date dateCreated;

    /** The date that the underlying record was last updated DD/MM/YYYY-HH:MM format **/
    private Date dateUpdated;

    private ServicePlegdeFlaggedIssuesEnum flaggedIssue;
    private Long status = Long.valueOf(0);
    private String statusReferenceTranslation;
    
    private ActiveStatusEnum activeStatus = ActiveStatusEnum.ACTIVE;
 
    private PledgeTakenStatusEnum pledgeTakenStatus = PledgeTakenStatusEnum.NOT_TAKEN;
    private VerificationProgressEnum verificationProgress = VerificationProgressEnum.NOT_READY_TO_PROGRESS;	
    
	
    public String getStatusReferenceTranslation() {
		return statusReferenceTranslation;
	}

	public void setStatusReferenceTranslation(String statusReferenceTranslation) {
		this.statusReferenceTranslation = statusReferenceTranslation;
	}

	/**
     * Default Constructor for the ServicePledge bean
     */
    public ServicePledgeImpl()
    {
    	
		this.pledgeServiceLevelOne = Long.valueOf("0");
		
		this.pledgeServiceLevelTwo = Long.valueOf("0");
		
		this.pledgeServiceLevelThree = Long.valueOf("0");

		this.additionalInformation = "";
		
		this.pledgeServiceQualification = "";
		
		this.pledgeServiceDateAvailable = null;
		
		this.pledgeServiceHoursPerWeek = Long.valueOf("0");
    	this.dateCreated = new Date();
    	this.dateUpdated = new Date();
    }
    
    /**
     * Returns the Id for the underlying database table record
     * @return the Id for the underlying database table record
     */
	public Long getId()
	{
        return id;
    }

    /**
     * Sets the Id. This allows front-end forms to bind the id property.
     * @param id the Id for the underlying database table record.
     */
	public void setId(Long id)
	{
        this.id = id;
    }

    /**
     * Returns the parentObjectId when this object has been populated via a restful webservice JSON mapping
     * @return the parentObjectId when this object has been populated via a restful webservice JSON mapping
     */
	public Long getParentObjectId()
	{
        return parentObjectId;
    }

    /**
     * Sets the parentObjectId. This allows restful web services to bind the parentId property when adding a new record.
     * @param parentObjectId allows restful web services to bind the parentId property when adding a new record.
     */
	public void setParentObjectId(Long parentObjectId)
	{
        this.parentObjectId = parentObjectId;
    }

    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param pledgeServiceLevelOne is the address type
     */
    public void setPledgeServiceLevelOne(Long pledgeServiceLevelOne)
    {
      this.pledgeServiceLevelOne = pledgeServiceLevelOne;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getPledgeServiceLevelOne()
    {
      return pledgeServiceLevelOne;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for pledgeServiceLevelOne is the address type
     */
    public void setPledgeServiceLevelOneReferenceTranslation(String pledgeServiceLevelOneReferenceTranslation)
    {
      this.pledgeServiceLevelOneReferenceTranslation = pledgeServiceLevelOneReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getPledgeServiceLevelOneReferenceTranslation()
    {
      return pledgeServiceLevelOneReferenceTranslation;
    }
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param pledgeServiceLevelTwo is the address type
     */
    public void setPledgeServiceLevelTwo(Long pledgeServiceLevelTwo)
    {
      this.pledgeServiceLevelTwo = pledgeServiceLevelTwo;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getPledgeServiceLevelTwo()
    {
      return pledgeServiceLevelTwo;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for pledgeServiceLevelTwo is the address type
     */
    public void setPledgeServiceLevelTwoReferenceTranslation(String pledgeServiceLevelTwoReferenceTranslation)
    {
      this.pledgeServiceLevelTwoReferenceTranslation = pledgeServiceLevelTwoReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getPledgeServiceLevelTwoReferenceTranslation()
    {
      return pledgeServiceLevelTwoReferenceTranslation;
    }
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param pledgeServiceLevelThree is the address type
     */
    public void setPledgeServiceLevelThree(Long pledgeServiceLevelThree)
    {
      this.pledgeServiceLevelThree = pledgeServiceLevelThree;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getPledgeServiceLevelThree()
    {
      return pledgeServiceLevelThree;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for pledgeServiceLevelThree is the address type
     */
    public void setPledgeServiceLevelThreeReferenceTranslation(String pledgeServiceLevelThreeReferenceTranslation)
    {
      this.pledgeServiceLevelThreeReferenceTranslation = pledgeServiceLevelThreeReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getPledgeServiceLevelThreeReferenceTranslation()
    {
      return pledgeServiceLevelThreeReferenceTranslation;
    }
      
    
    /**
     * Sets the participant comments
     * @param additionalInformation is the participant comments
     */
    public void setAdditionalInformation(String additionalInformation)
    {
      this.additionalInformation = additionalInformation;
    }

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getAdditionalInformation()
    {
      return additionalInformation;
    }
    
    
    
    /**
     * Sets the participant comments
     * @param pledgeServiceQualification is the participant comments
     */
    public void setPledgeServiceQualification(String pledgeServiceQualification)
    {
      this.pledgeServiceQualification = pledgeServiceQualification;
    }

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getPledgeServiceQualification()
    {
      return pledgeServiceQualification;
    }
    
    
    
    /**
     * Sets the participant date of birth
     * @param pledgeServiceDateAvailable is the participant date of birth
     */
    public void setPledgeServiceDateAvailable(Date pledgeServiceDateAvailable)
    {
      this.pledgeServiceDateAvailable = pledgeServiceDateAvailable;
    }

    /**
     * Returns the participant date of birth
     * @return the participant date of birth
     */
    public Date getPledgeServiceDateAvailable()
    {
      return pledgeServiceDateAvailable;
    }
    
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param pledgeServiceHoursPerWeek is the address type
     */
    public void setPledgeServiceHoursPerWeek(Long pledgeServiceHoursPerWeek)
    {
      this.pledgeServiceHoursPerWeek = pledgeServiceHoursPerWeek;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getPledgeServiceHoursPerWeek()
    {
      return pledgeServiceHoursPerWeek;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for pledgeServiceHoursPerWeek is the address type
     */
    public void setPledgeServiceHoursPerWeekReferenceTranslation(String pledgeServiceHoursPerWeekReferenceTranslation)
    {
      this.pledgeServiceHoursPerWeekReferenceTranslation = pledgeServiceHoursPerWeekReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getPledgeServiceHoursPerWeekReferenceTranslation()
    {
      return pledgeServiceHoursPerWeekReferenceTranslation;
    }
      
    /**
     * Sets the associated RegisterOfPledges mapped as the registerOfPledges property
     * @param the associated RegisterOfPledges mapped as the registerOfPledges property
     */
    public void setRegisterOfPledges(RegisterOfPledges registerOfPledges)
    {
      this.registerOfPledges = registerOfPledges;
    }

    /**
     * Returns the associated RegisterOfPledges mapped as the registerOfPledges property
     * @return the associated RegisterOfPledges mapped as the registerOfPledges property
     */
    public RegisterOfPledges getRegisterOfPledges()
    {
      return registerOfPledges;
    }
  

    /**
     * sets the Id of the user that created the underlying record
     * @param createdByID the Id of the user that created the underlying record
     */
    public void setCreatedByID(Long createdByID)
    {
        this.createdByID = createdByID;
    }

    /**
     * gets the Id of the user that created the underlying record
     * @return the Id of the user that created the underlying record
     */
    public Long getCreatedByID()
    {
        return createdByID;
    }
     
   	/**
     * sets the Id of the user that last updated the underlying record
     * @param updatedByID the Id of the user that last updated the underlying record
     */
    public void setUpdatedByID(Long updatedByID)
    {
        this.updatedByID = updatedByID;
    }
     
    /**
     * gets the Id of the user that last updated the underlying record
     * @return the Id of the user that last updated the underlying record
     */
    public Long getUpdatedByID()
    {
        return updatedByID;
    }

    /**
     * sets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @param dateCreated the date that the underlying record was first created
     */
    public void setDateCreated(Date dateCreated)
    {
        this.dateCreated = dateCreated;
    }

    /**
     * Gets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @return the date that the underlying record was first created
     */
    public Date getDateCreated()
    {
        return dateCreated;
    }

    /**
     * Sets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @param dateUpdated the date that the underlying record was last updated
     */
    public void setDateUpdated(Date dateUpdated)
    {
        this.dateUpdated = dateUpdated;
    }

    /**
     * Gets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @return the date that the underlying record was last updated
     */
    public Date getDateUpdated()
    {
        return dateUpdated;
    }
    
    /**
     * Checks for a newly created entity object
     * @return true if this is a newly created entity object meaning that it has not yet been persisted, otherwise false
     */
	public boolean isNew() {
		return (this.id == null);
	}
	
	/**
	 * Sets the current mode of use for the entity object;
	 * @param mode a member of the CurrentMode enumeration
	 */
	public void setCurrentMode(CurrentMode mode){
		this.currentMode = mode;
	}	

    /**
     * Returns the current mode under which the class instance was loaded
     * @return A member of the CurrentMode Enumeration
     */
	public CurrentMode getCurrentMode() {
		return this.currentMode;
	}
    
	public Boolean getSameAsProfileAddress() {
		return sameAsProfileAddress;
	}

	public void setSameAsProfileAddress(Boolean sameAsProfileAddress) {
		this.sameAsProfileAddress = sameAsProfileAddress;
	}

	public String getAddressOne() {
		return addressOne;
	}

	public void setAddressOne(String addressOne) {
		this.addressOne = addressOne;
	}

	public String getAddressTwo() {
		return addressTwo;
	}

	public void setAddressTwo(String addressTwo) {
		this.addressTwo = addressTwo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStateProvinceRegion() {
		return stateProvinceRegion;
	}

	public void setStateProvinceRegion(String stateProvinceRegion) {
		this.stateProvinceRegion = stateProvinceRegion;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public Long getCountry() {
		return country;
	}

	public void setCountry(Long country) {
		this.country = country;
	}

	public void setPledgeServiceDateAvailableTo(Date date){
		this.pledgeServiceDateAvailableTo = date;
	}
	
	public Date getPledgeServiceDateAvailableTo(){
		return this.pledgeServiceDateAvailableTo;
	}

    @Override
	public String toString() {
		return "ServicePledgeImpl [id=" + id + ", parentObjectId=" + parentObjectId + ", currentMode=" + currentMode
				+ ", pledgeServiceLevelOne=" + pledgeServiceLevelOne + ", pledgeServiceLevelOneReferenceTranslation="
				+ pledgeServiceLevelOneReferenceTranslation + ", pledgeServiceLevelTwo=" + pledgeServiceLevelTwo
				+ ", pledgeServiceLevelTwoReferenceTranslation=" + pledgeServiceLevelTwoReferenceTranslation
				+ ", pledgeServiceLevelThree=" + pledgeServiceLevelThree
				+ ", pledgeServiceLevelThreeReferenceTranslation=" + pledgeServiceLevelThreeReferenceTranslation
				+ ", additionalInformation=" + additionalInformation + ", pledgeServiceQualification="
				+ pledgeServiceQualification + ", pledgeServiceDateAvailable=" + pledgeServiceDateAvailable
				+ ", pledgeServiceDateAvailableTo=" + pledgeServiceDateAvailableTo + ", pledgeServiceHoursPerWeek="
				+ pledgeServiceHoursPerWeek + ", pledgeServiceHoursPerWeekReferenceTranslation="
				+ pledgeServiceHoursPerWeekReferenceTranslation + ", registerOfPledges=" + registerOfPledges
				+ ", createdByID=" + createdByID + ", updatedByID=" + updatedByID + ", dateCreated=" + dateCreated
				+ ", dateUpdated=" + dateUpdated + "]";
	}

	@Override
	public Set<Long> getPledgeServiceTravelAbilities() {
		return this.pledgeServiceTravelAbilities;
	}

	@Override
	public void setPledgeServiceTravelAbilities(Set<Long> pledgeServiceTravelAbilities) {
		this.pledgeServiceTravelAbilities = pledgeServiceTravelAbilities;	
	}


	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}



    public ServicePlegdeFlaggedIssuesEnum getFlaggedIssue() {
        return flaggedIssue;
    }

    public void setFlaggedIssue(ServicePlegdeFlaggedIssuesEnum flaggedIssue) {
        this.flaggedIssue = flaggedIssue;
    }


	public ActiveStatusEnum getActiveStatus() {
		// TODO Auto-generated method stub
		return this.activeStatus;
	}


	public void setActiveStatus(ActiveStatusEnum a) {
		this.activeStatus = a;
		
	}

	public PledgeTakenStatusEnum getPledgeTakenStatus() {
		return pledgeTakenStatus;
	}

	public void setPledgeTakenStatus(PledgeTakenStatusEnum pledgeTakenStatus) {
		this.pledgeTakenStatus = pledgeTakenStatus;
	}

	public VerificationProgressEnum getVerificationProgress() {
		return verificationProgress;
	}

	public void setVerificationProgress(VerificationProgressEnum verificationProgress) {
		this.verificationProgress = verificationProgress;
	}
}
    
    
    

