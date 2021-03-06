package org.volunteertech.pledges.users.service;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.users.dao.ApplicationUserDetails;
import org.volunteertech.pledges.users.business.ApplicationUserDetailsBo;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsFilter;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsHistory;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsLoadException;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsSaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;
import java.util.Locale;


import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  


/**
 * The contact information
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the Service  Layer Object for the ApplicationUserDetails entity. A Business Object
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
public interface ApplicationUserDetailsService
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
     * @param applicationUserDetailsBo the applicationUserDetailsBo used to access the applicationUserDetails entity
     * and it's associations.
     */
    public void setApplicationUserDetailsBo(ApplicationUserDetailsBo applicationUserDetailsBo);
    

    /**
     * Returns the required Business Object (BO)
     * @return the ApplicationUserDetailsBo used to access the applicationUserDetails entity
     * and it's associations.
     */
    public ApplicationUserDetailsBo getApplicationUserDetailsBo();
    
    

    /**
     * Loads a ApplicationUserDetails object based on the APPLICATIONUSERDETAILSID column
     * @param APPLICATIONUSERDETAILSID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a ApplicationUserDetails object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public ApplicationUserDetails load(Long applicationUserDetailsID, Long loggedInUserId) throws ApplicationUserDetailsLoadException, AuthorisationException, InvalidUserIDException;
    
    

    /**
     * Load all existing ApplicationUserDetails objects. 
     * @return List a List of ApplicationUserDetails objects.
     */
    public List<ApplicationUserDetails> listApplicationUserDetails();
    
    
    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching contactName
     * @return List a List of ApplicationUserDetails objects that match the contactName property given as parameter.
     * @param contactName the contactName on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByContactName(String contactName);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching representOrganisation
     * @return List a List of ApplicationUserDetails objects that match the representOrganisation property given as parameter.
     * @param representOrganisation the representOrganisation on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByRepresentOrganisation(Long representOrganisation);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching telephoneNumber
     * @return List a List of ApplicationUserDetails objects that match the telephoneNumber property given as parameter.
     * @param telephoneNumber the telephoneNumber on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByTelephoneNumber(String telephoneNumber);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching addressOne
     * @return List a List of ApplicationUserDetails objects that match the addressOne property given as parameter.
     * @param addressOne the addressOne on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByAddressOne(String addressOne);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching addressTwo
     * @return List a List of ApplicationUserDetails objects that match the addressTwo property given as parameter.
     * @param addressTwo the addressTwo on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByAddressTwo(String addressTwo);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching city
     * @return List a List of ApplicationUserDetails objects that match the city property given as parameter.
     * @param city the city on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByCity(String city);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching stateProvinceRegion
     * @return List a List of ApplicationUserDetails objects that match the stateProvinceRegion property given as parameter.
     * @param stateProvinceRegion the stateProvinceRegion on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByStateProvinceRegion(String stateProvinceRegion);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching postCode
     * @return List a List of ApplicationUserDetails objects that match the postCode property given as parameter.
     * @param postCode the postCode on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByPostCode(String postCode);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching country
     * @return List a List of ApplicationUserDetails objects that match the country property given as parameter.
     * @param country the country on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByCountry(Long country);

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching emailAddress
     * @return List a List of ApplicationUserDetails objects that match the emailAddress property given as parameter.
     * @param emailAddress the emailAddress on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByEmailAddress(String emailAddress);

    
    
    /**
     * Load existing ApplicationUserDetails objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of ApplicationUserDetails objects that match the userId parameter.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByCreatedById(Long userId);
    
    
    /**
     * Load all existing ApplicationUserDetailsHistory objects for a particular ApplicationUserDetails.
     * The <code>List</code> of ApplicationUserDetailsHistory objects contains all of the changes that have been made to the
     * ApplicationUserDetails object identified by the applicationUserDetails parameter'
     * @return List a List of ApplicationUserDetailsHistory objects.
     */
    public List<ApplicationUserDetailsHistory> listApplicationUserDetailsHistory(Long applicationUserDetails) throws Exception;
    
    
    
    /**
     * Either updates an existing entry in the APPLICATIONUSERDETAILS table or adds a new entry if one does not exist.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ApplicationUserDetailsLoadException if the existing record cannot be loaded
     * @throws ApplicationUserDetailsSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeApplicationUserDetails(ApplicationUserDetails applicationUserDetails, Long userId)
        throws ApplicationUserDetailsSaveException, ApplicationUserDetailsLoadException, AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a ApplicationUserDetailsFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per ApplicationUserDetails.
     * @ return a ApplicationUserDetailsFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ApplicationUserDetailsFilter loadApplicationUserDetailsFilter(Long userId) throws ApplicationUserDetailsLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the APPLICATIONUSERDETAILSFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userID which is also the assigned Id for the newly created record.
     * @throws ApplicationUserDetailsSaveException on failure to save.  
     */
    public Long createAndStoreApplicationUserDetailsFilter(ApplicationUserDetailsFilter applicationUserDetailsFilter, Long userId)
        throws ApplicationUserDetailsSaveException;
    
    
    /**
     * Updates an existing entry in the APPLICATIONUSERDETAILSFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ApplicationUserDetailsSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateApplicationUserDetailsFilter(ApplicationUserDetailsFilter applicationUserDetailsFilter, Long userId)
        throws ApplicationUserDetailsLoadException, ApplicationUserDetailsSaveException, AuthorisationException, InvalidUserIDException;
    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param applicationUserDetails the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 * @return the same ApplicationUserDetails object but with the locale translation fields populated with the message
	 * that is relevant to the current locale
	 */    
    public ApplicationUserDetails translateReferenceValues(ApplicationUserDetails applicationUserDetails, Locale locale);
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param applicationUserDetailsList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<ApplicationUserDetails> translateReferenceValues(List<ApplicationUserDetails> applicationUserDetailsList, Locale locale);
    
	
    
}    
