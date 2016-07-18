package org.volunteertech.pledges.accommodationpledge.dao;
import java.util.Date;

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
 * 
 * I Changed this to show how annotations could be used for this project.
 * Michael generated this stuff but all that XML bullshit is a pain to use manually
 * Annotations make life a bit easier.Dessie.
 * ----------
 * $Log$
 *
 */
@Entity
@Table(name = "ACCOMMODATIONPLEDGEHISTORY", catalog = "netgrains")
public class AccommodationPledgeHistory
{
	
	private Long id;
	
	/** id from the parent table for which this represents an historic record **/
	private Long accommodationPledgeID;
	 
    
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
    private Long ownerOccupier;
	
    /** the participant date of birth */
    private Date accommodationDateFrom;
    
    /** the participant date of birth */
    private Date accommodationDateTo;
    
    /** the address type */
    private Long accommodationType;
	
    /** the address type */
    private Long accommodationCondition;
	
    /** the address type */
    private Long numberOfBeds;
	
    /** the address type */
    private Long vacantOrShared;
	
    /** the participant comments */
    private String otherAmenities;
	
    /** the address type */
    private Long canYouAccommodate;
	
    /** the participant comments */
    private String additionalInformation;
	     
    
    /** The user ID of the person that originally created the underlying record **/
    private Long createdByID;

    /** The user ID of the person that last updated the underlying record **/
    private Long updatedByID;

    /** The date that the underlying record was created DD/MM/YYYY-HH:MM format **/
    private Date dateCreated;

    /** The date that the underlying record was last updated DD/MM/YYYY-HH:MM format **/
    private Date dateUpdated;
    
    
    /**
     * Default Constructor for the AccommodationPledge bean
     */
    public AccommodationPledgeHistory()
    {
    	accommodationPledgeID = new Long(0);
    	addressOne = new String();
		addressTwo = new String();
		city = new String();
		stateProvinceRegion = new String();
		postCode = new String();
		country = new Long("0");
		ownerOccupier = new Long("0");
		accommodationDateFrom = new Date();
		accommodationDateTo = new Date();
		accommodationType = new Long("0");
		accommodationCondition = new Long("0");
		numberOfBeds = new Long("0");
		vacantOrShared = new Long("0");
		otherAmenities = new String();
		canYouAccommodate = new Long("0");
		additionalInformation = new String();
		
    }
    
    /*
     * Returns the Id for the underlying database table record
     */
    /** Hibernate Id */
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ACCOMMODATIONPLEDGEHISTORYID", unique = true, nullable = false)
	public Long getId()
	{
        return id;
    }

	/**
	 * We usually do not manipulate the identity of an object, hence the setter method should be private.
	 */
	@SuppressWarnings("unused")
    private void setId(Long id)
    {
        this.id = id;
    }    


    /*
     * Returns the AccommodationPledgeID for the parent record
     */
	@Column(name = "ACCOMMODATIONPLEDGEID")
	public Long getAccommodationPledgeID()
	{
        return accommodationPledgeID;
    }

	/**
	 * We usually do not manipulate the identity of an object, hence the setter method should be private.
	 */
	@SuppressWarnings("unused")
    private void setAccommodationPledgeID(Long accommodationPledgeID)
    {
        this.accommodationPledgeID = accommodationPledgeID;
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
    @Column(name = "ADDRESSONE", length = 50)
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
    @Column(name = "ADDRESSTWO", length = 50)
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
	@Column(name = "CITY", length = 50)
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
    @Column(name = "STATEPROVINCEREGION", length = 50)
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

	@Column(name = "POSTCODE", length = 10)
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
    @Column(name = "COUNTRY")
    public Long getCountry()
    {
      return country;
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

	@Column(name = "OWNEROCCUPIER")
    public Long getOwnerOccupier()
    {
      return ownerOccupier;
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
    @Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ACCOMMODATIONDATEFROM", length = 19)
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
    @Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ACCOMMODATIONDATETO", length = 19)
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
    @Column(name = "ACCOMMODATIONTYPE")
    public Long getAccommodationType()
    {
      return accommodationType;
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
    @Column(name = "ACCOMMODATIONCONDITION")
    public Long getAccommodationCondition()
    {
      return accommodationCondition;
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
	

	@Column(name = "NUMBEROFBEDS")
    public Long getNumberOfBeds()
    {
      return numberOfBeds;
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
    @Column(name = "VACANTORSHARED")
    public Long getVacantOrShared()
    {
      return vacantOrShared;
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
    @Column(name = "OTHERAMENITIES")
    public String getOtherAmenities()
    {
      return otherAmenities;
    }

    
//    /**
//     * Sets the address type that has been chosen by the user
//     * @param canYouAccommodate is the address type
//     */
//    public void setCanYouAccommodate(Long canYouAccommodate)
//    {
//      this.canYouAccommodate = canYouAccommodate;
//    }
//
//    /**
//     * Returns the address type that has been chosen by the user or saved in the database
//     * @return the address type
//     */
//    public Long getCanYouAccommodate()
//    {
//      return canYouAccommodate;
//    }

    
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
	
	@Column(name = "ADDITIONALINFORMATION")
    public String getAdditionalInformation()
    {
      return additionalInformation;
    }


    /**
     * sets the ID of the user that created the underlying record
     */
    public void setCreatedByID(Long createdByID)
    {
        this.createdByID = createdByID;
    }


    /**
     * gets the ID of the user that created the underlying record
     */

	@Column(name = "CREATEDBYID")
    public Long getCreatedByID()
    {
        return createdByID;
    }
     
     
    /**
     * sets the ID of the user that last updated the underlying record
     */
    public void setUpdatedByID(Long updatedByID)
    {
        this.updatedByID = updatedByID;
    }
     
     
    /**
     * gets the ID of the user that last updated the underlying record
     */
	@Column(name = "UPDATEDBYID")
    public Long getUpdatedByID()
    {
        return updatedByID;
    }


    /**
     * sets the date that the underlying record was first created as a <code>java.util.Date</code> object
     */
    public void setDateCreated(Date dateCreated)
    {
        this.dateCreated = dateCreated;
    }

     
    /**
     * Gets the date that the underlying record was first created as a <code>java.util.Date</code> object
     */
	

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATECREATED", length = 19)
    public Date getDateCreated()
    {
        return dateCreated;
    }

    /**
     * sets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     */
    public void setDateUpdated(Date dateUpdated)
    {
        this.dateUpdated = dateUpdated;
    }


    
    /**
     * Gets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     */
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATEUPDATED", length = 19)
    public Date getDateUpdated()
    {
        return dateUpdated;
    }
    	

}
    
    
    

