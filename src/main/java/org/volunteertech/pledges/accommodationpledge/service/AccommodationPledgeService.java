package org.volunteertech.pledges.accommodationpledge.service;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledge;
import org.volunteertech.pledges.accommodationpledge.business.AccommodationPledgeBo;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledgeFilter;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledgeHistory;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledgeLoadException;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledgeSaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;
import java.util.Locale;


import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  


/**
 * The Accommodation pledge screen is used to add/edit a new/existing pledge of accommodation
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the Service  Layer Object for the AccommodationPledge entity. A Business Object
 * is provided in order to provide a seperation from the Data Access implementation. 
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: * $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">>JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public interface AccommodationPledgeService
{
    
	/**
	 * Sets the reference Service to perform a user roles lookup
	 */
	public void setReferenceService(ReferenceService referenceService);
	
	/**
	 * Returns a reference to reference Service.
	 */
	public ReferenceService getReferenceService();
	  
	/**
	 * Sets the message resource service to perform localization lookups
	 */
	public void setMessageResourceService(MessageResourceService messageResourceService);
	
	/**
	 * Returns a reference to the message resource service.
	 */
	public MessageResourceService getMessageResourceService();
  
    
    /**
     * Sets the required Business Object (BO)
     * @param accommodationPledgeBo the accommodationPledgeBo used to access the accommodationPledge entity
     * and it's associations.
     */
    public void setAccommodationPledgeBo(AccommodationPledgeBo accommodationPledgeBo);
    

    /**
     * Returns the required Business Object (BO)
     * @return the AccommodationPledgeBo used to access the accommodationPledge entity
     * and it's associations.
     */
    public AccommodationPledgeBo getAccommodationPledgeBo();
    
    

    /**
     * Loads a AccommodationPledge object based on the ACCOMMODATIONPLEDGEID column
     * @param ACCOMMODATIONPLEDGEID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a AccommodationPledge object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public AccommodationPledge load(Long accommodationPledgeID, Long loggedInUserId) throws AccommodationPledgeLoadException, AuthorisationException, InvalidUserIDException;
    
    

    /**
     * Load all existing AccommodationPledge objects. 
     * @return List a List of AccommodationPledge objects.
     */
    public List<AccommodationPledge> listAccommodationPledge();
    
    
    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching addressOne
     * @return List a List of AccommodationPledge objects that match the addressOne property given as parameter.
     * @param addressOne the addressOne on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAddressOne(String addressOne);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching addressTwo
     * @return List a List of AccommodationPledge objects that match the addressTwo property given as parameter.
     * @param addressTwo the addressTwo on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAddressTwo(String addressTwo);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching city
     * @return List a List of AccommodationPledge objects that match the city property given as parameter.
     * @param city the city on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByCity(String city);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching stateProvinceRegion
     * @return List a List of AccommodationPledge objects that match the stateProvinceRegion property given as parameter.
     * @param stateProvinceRegion the stateProvinceRegion on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByStateProvinceRegion(String stateProvinceRegion);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching postCode
     * @return List a List of AccommodationPledge objects that match the postCode property given as parameter.
     * @param postCode the postCode on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByPostCode(String postCode);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching country
     * @return List a List of AccommodationPledge objects that match the country property given as parameter.
     * @param country the country on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByCountry(Long country);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching ownerOccupier
     * @return List a List of AccommodationPledge objects that match the ownerOccupier property given as parameter.
     * @param ownerOccupier the ownerOccupier on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByOwnerOccupier(Long ownerOccupier);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching accommodationDateFrom
     * @return List a List of AccommodationPledge objects that match the accommodationDateFrom property given as parameter.
     * @param accommodationDateFrom the accommodationDateFrom on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAccommodationDateFrom(Date accommodationDateFrom);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching accommodationDateTo
     * @return List a List of AccommodationPledge objects that match the accommodationDateTo property given as parameter.
     * @param accommodationDateTo the accommodationDateTo on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAccommodationDateTo(Date accommodationDateTo);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching accommodationType
     * @return List a List of AccommodationPledge objects that match the accommodationType property given as parameter.
     * @param accommodationType the accommodationType on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAccommodationType(Long accommodationType);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching accommodationCondition
     * @return List a List of AccommodationPledge objects that match the accommodationCondition property given as parameter.
     * @param accommodationCondition the accommodationCondition on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAccommodationCondition(Long accommodationCondition);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching numberOfBeds
     * @return List a List of AccommodationPledge objects that match the numberOfBeds property given as parameter.
     * @param numberOfBeds the numberOfBeds on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByNumberOfBeds(Long numberOfBeds);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching vacantOrShared
     * @return List a List of AccommodationPledge objects that match the vacantOrShared property given as parameter.
     * @param vacantOrShared the vacantOrShared on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByVacantOrShared(Long vacantOrShared);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching otherAmenities
     * @return List a List of AccommodationPledge objects that match the otherAmenities property given as parameter.
     * @param otherAmenities the otherAmenities on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByOtherAmenities(String otherAmenities);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching canYouAccommodate
     * @return List a List of AccommodationPledge objects that match the canYouAccommodate property given as parameter.
     * @param canYouAccommodate the canYouAccommodate on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByCanYouAccommodate(Long canYouAccommodate);

    /**
     * Returns a <code>List</code> of AccommodationPledge objects that have a matching additionalInformation
     * @return List a List of AccommodationPledge objects that match the additionalInformation property given as parameter.
     * @param additionalInformation the additionalInformation on which to match the required records.
     */
    public List<AccommodationPledge> listAccommodationPledgeByAdditionalInformation(String additionalInformation);

    
    
    /**
     * Load existing AccommodationPledge objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of AccommodationPledge objects that match the userId parameter.
     */
    public List<AccommodationPledge> listAccommodationPledgeByCreatedById(Long userId);
    
    
    /**
     * Load all existing AccommodationPledgeHistory objects for a particular AccommodationPledge.
     * The <code>List</code> of AccommodationPledgeHistory objects contains all of the changes that have been made to the
     * AccommodationPledge object identified by the accommodationPledge parameter'
     * @return List a List of AccommodationPledgeHistory objects.
     */
    public List<AccommodationPledgeHistory> listAccommodationPledgeHistory(Long accommodationPledge) throws Exception;
    
    
    
    /**
     * Either updates an existing entry in the ACCOMMODATIONPLEDGE table or adds a new entry if one does not exist.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws AccommodationPledgeLoadException if the existing record cannot be loaded
     * @throws AccommodationPledgeSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeAccommodationPledge(AccommodationPledge accommodationPledge, Long userId)
        throws AccommodationPledgeSaveException, AccommodationPledgeLoadException, AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a AccommodationPledgeFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per AccommodationPledge.
     * @ return a AccommodationPledgeFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public AccommodationPledgeFilter loadAccommodationPledgeFilter(Long userId) throws AccommodationPledgeLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the ACCOMMODATIONPLEDGEFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userID which is also the assigned Id for the newly created record.
     * @throws AccommodationPledgeSaveException on failure to save.  
     */
    public Long createAndStoreAccommodationPledgeFilter(AccommodationPledgeFilter accommodationPledgeFilter, Long userId)
        throws AccommodationPledgeSaveException;
    
    
    /**
     * Updates an existing entry in the ACCOMMODATIONPLEDGEFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws AccommodationPledgeSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateAccommodationPledgeFilter(AccommodationPledgeFilter accommodationPledgeFilter, Long userId)
        throws AccommodationPledgeLoadException, AccommodationPledgeSaveException, AuthorisationException, InvalidUserIDException;
    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param accommodationPledge the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 * @return the same AccommodationPledge object but with the locale translation fields populated with the message
	 * that is relevant to the current locale
	 */    
    public AccommodationPledge translateReferenceValues(AccommodationPledge accommodationPledge, Locale locale);
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param accommodationPledgeList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<AccommodationPledge> translateReferenceValues(List<AccommodationPledge> accommodationPledgeList, Locale locale);
    
	
    
}    
