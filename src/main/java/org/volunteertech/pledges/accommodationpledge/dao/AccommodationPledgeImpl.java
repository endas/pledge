package org.volunteertech.pledges.accommodationpledge.dao;

import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledge;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.util.List;
import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import org.volunteertech.pledges.pledge.dao.PledgeStatus;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;
import org.volunteertech.pledges.pledge.status.ActiveStatusEnum;
import org.volunteertech.pledges.pledge.status.PledgeTakenStatusEnum;
import org.volunteertech.pledges.pledge.status.VerificationProgressEnum;




/**
 * The Accommodation pledge screen is used to add/edit a new/existing pledge of accommodation
 * This class has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler for the AccommodationPledge entity.
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
public class AccommodationPledgeImpl implements AccommodationPledge, Serializable { 

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
    private String countryReferenceTranslation;
    
	
    /** the address type */
    private Long ownerOccupier;
    
    /** the address type */
    private String ownerOccupierReferenceTranslation;
    
	
    /** the participant date of birth */
    private Date accommodationDateFrom;
    
    /** the participant date of birth */
    private Date accommodationDateTo;
    
    /** the address type */
    private Long accommodationType;
    
    /** the address type */
    private String accommodationTypeReferenceTranslation;
    
	
    /** the address type */
    private Long accommodationCondition;
    
    /** the address type */
    private String accommodationConditionReferenceTranslation;
    
	
    /** the address type */
    private Long numberOfBeds;
    
    private Long numberOfBedrooms;
    
    /** the address type */
    private String numberOfBedsReferenceTranslation;
    
	
    /** the address type */
    private Long vacantOrShared;
    
    /** the address type */
    private String vacantOrSharedReferenceTranslation;
    
	

    private String otherAmenities;
	

	
    /** the participant comments */
    private String additionalInformation;
	
	/** the reference to the foreign associated RegisterOfPledges **/
	@JsonBackReference(value="registerofpledges-accommodationpledge")
	private RegisterOfPledges registerOfPledges;
  

    /** The user ID of the person that originally created the underlying record **/
    private Long createdByID;

    /** The user ID of the person that last updated the underlying record **/
    private Long updatedByID;

    /** The date that the underlying record was created DD/MM/YYYY-HH:MM format **/
    private Date dateCreated;

    /** The date that the underlying record was last updated DD/MM/YYYY-HH:MM format **/
    private Date dateUpdated;

    private AccommodationFlaggedIssuesEnum flaggedIssue;
    
   
    private Set<Long> amenities = new HashSet<Long>();
    private Set<Long> facilities = new HashSet<Long>();
    private Set<Long> accommodateWho = new HashSet<Long>();
    
    private Long status = new Long(0);
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
     * Default Constructor for the AccommodationPledge bean
     */
    public AccommodationPledgeImpl()
    {
    	
		this.addressOne = new String();
		
		this.addressTwo = new String();
		
		this.city = new String();
		
		this.stateProvinceRegion = new String();
		
		this.postCode = new String();
		
		this.country = new Long("0");
		
		this.ownerOccupier = new Long("0");
		
		this.accommodationDateFrom = null;
		
		this.accommodationDateTo = null;
		
		this.accommodationType = new Long("0");
		
		this.accommodationCondition = new Long("0");
		
		this.numberOfBeds = new Long("0");
		
		this.vacantOrShared = new Long("0");
		
		this.otherAmenities = new String();
		
		this.additionalInformation = new String();
		
    	this.dateCreated = new Date();
    	this.dateUpdated = new Date();
        this.sameAsProfileAddress = true;
        this.status = new Long("0");
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

    @Override
    public void setSameAsProfileAddress(Boolean sameAsProfileAddress) {
        this.sameAsProfileAddress = sameAsProfileAddress;

    }

    @Override
    public Boolean getSameAsProfileAddress() {
        return this.sameAsProfileAddress;
    }


    /**
     * Sets the street or house address
     * @param addressOne is the street or house address
     */
    public void setAddressOne(String addressOne)
    {
      this.addressOne = addressOne;
    }

    /**
     * Returns the street or house address
     * @return the street or house address
     */
    public String getAddressOne()
    {
      return addressOne;
    }
    
    
    
    /**
     * Sets the town or city address
     * @param addressTwo is the town or city address
     */
    public void setAddressTwo(String addressTwo)
    {
      this.addressTwo = addressTwo;
    }

    /**
     * Returns the town or city address
     * @return the town or city address
     */
    public String getAddressTwo()
    {
      return addressTwo;
    }
    
    
    
    /**
     * Sets the post code
     * @param city is the post code
     */
    public void setCity(String city)
    {
      this.city = city;
    }

    /**
     * Returns the post code
     * @return the post code
     */
    public String getCity()
    {
      return city;
    }
    
    
    
    /**
     * Sets the post code
     * @param stateProvinceRegion is the post code
     */
    public void setStateProvinceRegion(String stateProvinceRegion)
    {
      this.stateProvinceRegion = stateProvinceRegion;
    }

    /**
     * Returns the post code
     * @return the post code
     */
    public String getStateProvinceRegion()
    {
      return stateProvinceRegion;
    }
    
    
    
    /**
     * Sets the post code
     * @param postCode is the post code
     */
    public void setPostCode(String postCode)
    {
      this.postCode = postCode;
    }

    /**
     * Returns the post code
     * @return the post code
     */
    public String getPostCode()
    {
      return postCode;
    }
    
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param country is the address type
     */
    public void setCountry(Long country)
    {
      this.country = country;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getCountry()
    {
      return country;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for country is the address type
     */
    public void setCountryReferenceTranslation(String countryReferenceTranslation)
    {
      this.countryReferenceTranslation = countryReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getCountryReferenceTranslation()
    {
      return countryReferenceTranslation;
    }
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param ownerOccupier is the address type
     */
    public void setOwnerOccupier(Long ownerOccupier)
    {
      this.ownerOccupier = ownerOccupier;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getOwnerOccupier()
    {
      return ownerOccupier;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for ownerOccupier is the address type
     */
    public void setOwnerOccupierReferenceTranslation(String ownerOccupierReferenceTranslation)
    {
      this.ownerOccupierReferenceTranslation = ownerOccupierReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getOwnerOccupierReferenceTranslation()
    {
      return ownerOccupierReferenceTranslation;
    }
      
    
    /**
     * Sets the participant date of birth
     * @param accommodationDateFrom is the participant date of birth
     */
    public void setAccommodationDateFrom(Date accommodationDateFrom)
    {
      this.accommodationDateFrom = accommodationDateFrom;
    }

    /**
     * Returns the participant date of birth
     * @return the participant date of birth
     */
    public Date getAccommodationDateFrom()
    {
      return accommodationDateFrom;
    }
    
    
    
    /**
     * Sets the participant date of birth
     * @param accommodationDateTo is the participant date of birth
     */
    public void setAccommodationDateTo(Date accommodationDateTo)
    {
      this.accommodationDateTo = accommodationDateTo;
    }

    /**
     * Returns the participant date of birth
     * @return the participant date of birth
     */
    public Date getAccommodationDateTo()
    {
      return accommodationDateTo;
    }
    
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param accommodationType is the address type
     */
    public void setAccommodationType(Long accommodationType)
    {
      this.accommodationType = accommodationType;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getAccommodationType()
    {
      return accommodationType;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for accommodationType is the address type
     */
    public void setAccommodationTypeReferenceTranslation(String accommodationTypeReferenceTranslation)
    {
      this.accommodationTypeReferenceTranslation = accommodationTypeReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getAccommodationTypeReferenceTranslation()
    {
      return accommodationTypeReferenceTranslation;
    }
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param accommodationCondition is the address type
     */
    public void setAccommodationCondition(Long accommodationCondition)
    {
      this.accommodationCondition = accommodationCondition;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getAccommodationCondition()
    {
      return accommodationCondition;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for accommodationCondition is the address type
     */
    public void setAccommodationConditionReferenceTranslation(String accommodationConditionReferenceTranslation)
    {
      this.accommodationConditionReferenceTranslation = accommodationConditionReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getAccommodationConditionReferenceTranslation()
    {
      return accommodationConditionReferenceTranslation;
    }
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param numberOfBeds is the address type
     */
    public void setNumberOfBeds(Long numberOfBeds)
    {
      this.numberOfBeds = numberOfBeds;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getNumberOfBeds()
    {
      return numberOfBeds;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for numberOfBeds is the address type
     */
    public void setNumberOfBedsReferenceTranslation(String numberOfBedsReferenceTranslation)
    {
      this.numberOfBedsReferenceTranslation = numberOfBedsReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getNumberOfBedsReferenceTranslation()
    {
      return numberOfBedsReferenceTranslation;
    }
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param vacantOrShared is the address type
     */
    public void setVacantOrShared(Long vacantOrShared)
    {
      this.vacantOrShared = vacantOrShared;
    }

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getVacantOrShared()
    {
      return vacantOrShared;
    }
    
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for vacantOrShared is the address type
     */
    public void setVacantOrSharedReferenceTranslation(String vacantOrSharedReferenceTranslation)
    {
      this.vacantOrSharedReferenceTranslation = vacantOrSharedReferenceTranslation;
    }

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getVacantOrSharedReferenceTranslation()
    {
      return vacantOrSharedReferenceTranslation;
    }
      
    
    /**
     * Sets the participant comments
     * @param otherAmenities is the participant comments
     */
    public void setOtherAmenities(String otherAmenities)
    {
      this.otherAmenities = otherAmenities;
    }

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getOtherAmenities()
    {
      return otherAmenities;
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
    
	@Override
     public String toString(){
    	return "AccommodationPledge [id=" + id + ", " + "addressOne=" + addressOne + ", " + "addressTwo=" + addressTwo + ", " + "city=" + city + ", " + "stateProvinceRegion=" + stateProvinceRegion + ", " + "postCode=" + postCode + ", " + "country=" + country + ", " + "ownerOccupier=" + ownerOccupier + ", " + "accommodationDateFrom=" + accommodationDateFrom + ", " + "accommodationDateTo=" + accommodationDateTo + ", " + "accommodationType=" + accommodationType + ", " + "accommodationCondition=" + accommodationCondition + ", " + "numberOfBeds=" + numberOfBeds + ", " + "vacantOrShared=" + vacantOrShared + ", " + "otherAmenities=" + otherAmenities + ", " + "additionalInformation=" + additionalInformation + "]";
     }

	public Set<Long> getAmenities() {
		return this.amenities;
	}

	public void setAmenities(Set<Long> amenities) {
		this.amenities = amenities;
	}

	public Set<Long> getFacilities() {
		return facilities;
	}

	public void setFacilities(Set<Long> facilities) {
		this.facilities = facilities;
	}

	public Set<Long> getAccommodateWho() {
		return accommodateWho;
	}

	public void setAccommodateWho(Set<Long> accommodateWho) {
		this.accommodateWho = accommodateWho;
	}

	public Long getNumberOfBedrooms() {
		return numberOfBedrooms;
	}

	public void setNumberOfBedrooms(Long numberOfBedrooms) {
		this.numberOfBedrooms = numberOfBedrooms;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}


    public AccommodationFlaggedIssuesEnum getFlaggedIssue() {
        return flaggedIssue;
    }

    public void setFlaggedIssue(AccommodationFlaggedIssuesEnum flaggedIssue) {
        this.flaggedIssue = flaggedIssue;
    }

	@Override
	public ActiveStatusEnum getActiveStatus() {
		// TODO Auto-generated method stub
		return this.activeStatus;
	}

	@Override
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
    
    
    

