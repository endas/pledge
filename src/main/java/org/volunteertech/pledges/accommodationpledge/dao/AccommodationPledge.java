package org.volunteertech.pledges.accommodationpledge.dao;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.math.BigDecimal;


import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;




/**
 * The Accommodation pledge screen is used to add/edit a new/existing pledge of accommodation
 * This Interface has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler interface for the AccommodationPledge entity.
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
public interface AccommodationPledge extends Serializable { 

    public enum CurrentMode{
    	ADD,UPDATE,LOCALIZE;
    	
    	public String toString(){
    		switch(this){
    			case ADD: return "ADD";
    			case UPDATE: return "UPDATE";
    			case LOCALIZE: return "LOCALIZE";
    			default: return "UNKNOWN";
    		}	
    	}
    }
    	
    /**
     * Returns the Id for the underlying database table record
     * @return the Id for the underlying database table record
     */
	public Long getId();
	
    /**
     * Sets the Id. This allows front-end forms to bind the id property.
     * @param id the Id for the underlying database table record.
     */
	public void setId(Long id);
	
    /**
     * Returns the parentObjectId when this object has been populated via a restful webservice JSON mapping
     * @return the parentObjectId when this object has been populated via a restful webservice JSON mapping
     */
	public Long getParentObjectId();
	
    /**
     * Sets the parentObjectId. This allows restful web services to bind the parentId property when adding a new record.
     * @param parentObjectId allows restful web services to bind the parentId property when adding a new record.
     */
	public void setParentObjectId(Long parentObjectId);
    
    
    /**
     * Sets the street or house address
     * @param addressOne is the street or house address
     */
    public void setAddressOne(String addressOne);

    /**
     * Returns the street or house address
     * @return the street or house address
     */
    public String getAddressOne();
    
    
    /**
     * Sets the town or city address
     * @param addressTwo is the town or city address
     */
    public void setAddressTwo(String addressTwo);

    /**
     * Returns the town or city address
     * @return the town or city address
     */
    public String getAddressTwo();
    
    
    /**
     * Sets the post code
     * @param city is the post code
     */
    public void setCity(String city);

    /**
     * Returns the post code
     * @return the post code
     */
    public String getCity();
    
    
    /**
     * Sets the post code
     * @param stateProvinceRegion is the post code
     */
    public void setStateProvinceRegion(String stateProvinceRegion);

    /**
     * Returns the post code
     * @return the post code
     */
    public String getStateProvinceRegion();
    
    
    /**
     * Sets the post code
     * @param postCode is the post code
     */
    public void setPostCode(String postCode);

    /**
     * Returns the post code
     * @return the post code
     */
    public String getPostCode();
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param country is the address type
     */
    public void setCountry(Long country);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getCountry();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for country is the address type
     */
    public void setCountryReferenceTranslation(String countryReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getCountryReferenceTranslation();
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param ownerOccupier is the address type
     */
    public void setOwnerOccupier(Long ownerOccupier);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getOwnerOccupier();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for ownerOccupier is the address type
     */
    public void setOwnerOccupierReferenceTranslation(String ownerOccupierReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getOwnerOccupierReferenceTranslation();
      
    
    /**
     * Sets the participant date of birth
     * @param accommodationDateFrom is the participant date of birth
     */
    public void setAccommodationDateFrom(Date accommodationDateFrom);

    /**
     * Returns the participant date of birth
     * @return the participant date of birth
     */
    public Date getAccommodationDateFrom();
    
    
    /**
     * Sets the participant date of birth
     * @param accommodationDateTo is the participant date of birth
     */
    public void setAccommodationDateTo(Date accommodationDateTo);

    /**
     * Returns the participant date of birth
     * @return the participant date of birth
     */
    public Date getAccommodationDateTo();
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param accommodationType is the address type
     */
    public void setAccommodationType(Long accommodationType);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getAccommodationType();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for accommodationType is the address type
     */
    public void setAccommodationTypeReferenceTranslation(String accommodationTypeReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getAccommodationTypeReferenceTranslation();
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param accommodationCondition is the address type
     */
    public void setAccommodationCondition(Long accommodationCondition);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getAccommodationCondition();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for accommodationCondition is the address type
     */
    public void setAccommodationConditionReferenceTranslation(String accommodationConditionReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getAccommodationConditionReferenceTranslation();
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param numberOfBeds is the address type
     */
    public void setNumberOfBeds(Long numberOfBeds);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getNumberOfBeds();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for numberOfBeds is the address type
     */
    public void setNumberOfBedsReferenceTranslation(String numberOfBedsReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getNumberOfBedsReferenceTranslation();
      
    
    /**
     * Sets the address type that has been chosen by the user
     * @param vacantOrShared is the address type
     */
    public void setVacantOrShared(Long vacantOrShared);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getVacantOrShared();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for vacantOrShared is the address type
     */
    public void setVacantOrSharedReferenceTranslation(String vacantOrSharedReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getVacantOrSharedReferenceTranslation();
      
    
    /**
     * Sets the participant comments
     * @param otherAmenities is the participant comments
     */
    public void setOtherAmenities(String otherAmenities);

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getOtherAmenities();
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param canYouAccommodate is the address type
     */
    public void setCanYouAccommodate(Long canYouAccommodate);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getCanYouAccommodate();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for canYouAccommodate is the address type
     */
    public void setCanYouAccommodateReferenceTranslation(String canYouAccommodateReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getCanYouAccommodateReferenceTranslation();
      
    
    /**
     * Sets the participant comments
     * @param additionalInformation is the participant comments
     */
    public void setAdditionalInformation(String additionalInformation);

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getAdditionalInformation();
    
    /**
     * Sets the associated RegisterOfPledges mapped as the registerOfPledges property
     * @param the associated RegisterOfPledges mapped as the registerOfPledges property
     */
    public void setRegisterOfPledges(RegisterOfPledges registerOfPledges);

    /**
     * Returns the associated RegisterOfPledges mapped as the registerOfPledges property
     * @return the associated RegisterOfPledges mapped as the registerOfPledges property
     */
    public RegisterOfPledges getRegisterOfPledges();
  

    /**
     * sets the Id of the user that created the underlying record
     * @param createdByID the Id of the user that created the underlying record
     */
    public void setCreatedByID(Long createdByID);
    
    /**
     * gets the Id of the user that created the underlying record
     * @return the Id of the user that created the underlying record
     */
    public Long getCreatedByID();
         
   	/**
     * sets the Id of the user that last updated the underlying record
     * @param updatedByID the Id of the user that last updated the underlying record
     */
    public void setUpdatedByID(Long updatedByID);
     
    /**
     * gets the Id of the user that last updated the underlying record
     * @return the Id of the user that last updated the underlying record
     */
    public Long getUpdatedByID();

    /**
     * sets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @param dateCreated the date that the underlying record was first created
     */
    public void setDateCreated(Date dateCreated);

    /**
     * Gets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @return the date that the underlying record was first created
     */
    public Date getDateCreated();

    /**
     * Sets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @param dateUpdated the date that the underlying record was last updated
     */
    public void setDateUpdated(Date dateUpdated);
    
    /**
     * Gets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @return the date that the underlying record was last updated
     */
    public Date getDateUpdated();
    
    /**
     * Checks for a newly created entity object
     * @return true if this is a newly created entity object meaning that it has not yet been persisted, otherwise false
     */
	public boolean isNew();
	
	/**
	 * Sets the current mode of use for the entity object;
	 * @param mode a member of the CurrentMode enumeration
	 */
	public void setCurrentMode(CurrentMode mode);

    /**
     * Returns the current mode under which the class instance was loaded
     * @return A member of the CurrentMode Enumeration
     */
	public CurrentMode getCurrentMode();
}
    
    
    

