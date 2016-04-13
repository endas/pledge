package org.volunteertech.pledges.pledge.service;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;
import org.volunteertech.pledges.pledge.business.RegisterOfPledgesBo;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesFilter;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesHistory;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesLoadException;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesSaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;
import java.util.Locale;


import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  
import org.volunteertech.pledges.users.dao.ApplicationUserDetails;

import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledge;

import org.volunteertech.pledges.servicepledge.dao.ServicePledge;

import org.volunteertech.pledges.goodspledge.dao.GoodsPledge;



/**
 * The register of pledges screen is used to add/edit new/existing pledges
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the Service  Layer Object for the RegisterOfPledges entity. A Business Object
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
public interface RegisterOfPledgesService
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
     * @param registerOfPledgesBo the registerOfPledgesBo used to access the registerOfPledges entity
     * and it's associations.
     */
    public void setRegisterOfPledgesBo(RegisterOfPledgesBo registerOfPledgesBo);
    

    /**
     * Returns the required Business Object (BO)
     * @return the RegisterOfPledgesBo used to access the registerOfPledges entity
     * and it's associations.
     */
    public RegisterOfPledgesBo getRegisterOfPledgesBo();
    
    

    /**
     * Loads a RegisterOfPledges object based on the REGISTEROFPLEDGESID column
     * @param REGISTEROFPLEDGESID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a RegisterOfPledges object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public RegisterOfPledges load(Long registerOfPledgesID, Long loggedInUserId) throws RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
    
    

    /**
     * Load all existing RegisterOfPledges objects. 
     * @return List a List of RegisterOfPledges objects.
     */
    public List<RegisterOfPledges> listRegisterOfPledges();
    
    
    
    
    /**
     * Load existing RegisterOfPledges objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of RegisterOfPledges objects that match the userId parameter.
     */
    public List<RegisterOfPledges> listRegisterOfPledgesByCreatedById(Long userId);
    
    
    /**
     * Load all existing RegisterOfPledgesHistory objects for a particular RegisterOfPledges.
     * The <code>List</code> of RegisterOfPledgesHistory objects contains all of the changes that have been made to the
     * RegisterOfPledges object identified by the registerOfPledges parameter'
     * @return List a List of RegisterOfPledgesHistory objects.
     */
    public List<RegisterOfPledgesHistory> listRegisterOfPledgesHistory(Long registerOfPledges) throws Exception;
    
    
    /**
     * Returns a List representing the Set of associated AccommodationPledge objects that represent the accommodationPledges property
     * and that are defined by the one-to-many relationship defined as RegisterOfPledges.accommodationPledges.
     * @return the <code>List</code> of the associated AccommodationPledge objects that represent the accommodationPledges property.
     */
    public List<AccommodationPledge> getAccommodationPledges(Long registerOfPledgesId, Long userId) throws RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Adds a AccommodationPledge to the Set of associated AccommodationPledge objects that represent the accommodationPledges property
     * and that are defined by the one-to-many relationship defined as RegisterOfPledges.accommodationPledges.
     * @return the updated <code>List</code> of the associated AccommodationPledge objects that represent the accommodationPledges property.
     */
    public List<AccommodationPledge> addAccommodationPledgeToAccommodationPledges(AccommodationPledge accommodationPledges, Long registerOfPledgesId, Long userId) throws RegisterOfPledgesSaveException, RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
  
    /**
     * Returns a List representing the Set of associated ServicePledge objects that represent the servicePledges property
     * and that are defined by the one-to-many relationship defined as RegisterOfPledges.servicePledges.
     * @return the <code>List</code> of the associated ServicePledge objects that represent the servicePledges property.
     */
    public List<ServicePledge> getServicePledges(Long registerOfPledgesId, Long userId) throws RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Adds a ServicePledge to the Set of associated ServicePledge objects that represent the servicePledges property
     * and that are defined by the one-to-many relationship defined as RegisterOfPledges.servicePledges.
     * @return the updated <code>List</code> of the associated ServicePledge objects that represent the servicePledges property.
     */
    public List<ServicePledge> addServicePledgeToServicePledges(ServicePledge servicePledges, Long registerOfPledgesId, Long userId) throws RegisterOfPledgesSaveException, RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
  
    /**
     * Returns a List representing the Set of associated GoodsPledge objects that represent the goodsPledges property
     * and that are defined by the one-to-many relationship defined as RegisterOfPledges.goodsPledges.
     * @return the <code>List</code> of the associated GoodsPledge objects that represent the goodsPledges property.
     */
    public List<GoodsPledge> getGoodsPledges(Long registerOfPledgesId, Long userId) throws RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Adds a GoodsPledge to the Set of associated GoodsPledge objects that represent the goodsPledges property
     * and that are defined by the one-to-many relationship defined as RegisterOfPledges.goodsPledges.
     * @return the updated <code>List</code> of the associated GoodsPledge objects that represent the goodsPledges property.
     */
    public List<GoodsPledge> addGoodsPledgeToGoodsPledges(GoodsPledge goodsPledges, Long registerOfPledgesId, Long userId) throws RegisterOfPledgesSaveException, RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
  
    
    /**
     * Either updates an existing entry in the REGISTEROFPLEDGES table or adds a new entry if one does not exist.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws RegisterOfPledgesLoadException if the existing record cannot be loaded
     * @throws RegisterOfPledgesSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeRegisterOfPledges(RegisterOfPledges registerOfPledges, Long userId)
        throws RegisterOfPledgesSaveException, RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a RegisterOfPledgesFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per RegisterOfPledges.
     * @ return a RegisterOfPledgesFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public RegisterOfPledgesFilter loadRegisterOfPledgesFilter(Long userId) throws RegisterOfPledgesLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the REGISTEROFPLEDGESFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userID which is also the assigned Id for the newly created record.
     * @throws RegisterOfPledgesSaveException on failure to save.  
     */
    public Long createAndStoreRegisterOfPledgesFilter(RegisterOfPledgesFilter registerOfPledgesFilter, Long userId)
        throws RegisterOfPledgesSaveException;
    
    
    /**
     * Updates an existing entry in the REGISTEROFPLEDGESFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws RegisterOfPledgesSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateRegisterOfPledgesFilter(RegisterOfPledgesFilter registerOfPledgesFilter, Long userId)
        throws RegisterOfPledgesLoadException, RegisterOfPledgesSaveException, AuthorisationException, InvalidUserIDException;
    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param registerOfPledges the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 * @return the same RegisterOfPledges object but with the locale translation fields populated with the message
	 * that is relevant to the current locale
	 */    
    public RegisterOfPledges translateReferenceValues(RegisterOfPledges registerOfPledges, Locale locale);
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param registerOfPledgesList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<RegisterOfPledges> translateReferenceValues(List<RegisterOfPledges> registerOfPledgesList, Locale locale);
    
	
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param applicationUserDetails the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public ApplicationUserDetails translateApplicationUserDetailsReferenceValues(ApplicationUserDetails applicationUserDetails, Locale locale);    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param applicationUserDetailsList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<ApplicationUserDetails> translateApplicationUserDetailsReferenceValues(List<ApplicationUserDetails> applicationUserDetails, Locale locale);

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param accommodationPledge the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public AccommodationPledge translateAccommodationPledgeReferenceValues(AccommodationPledge accommodationPledge, Locale locale);    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param accommodationPledgeList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<AccommodationPledge> translateAccommodationPledgeReferenceValues(List<AccommodationPledge> accommodationPledge, Locale locale);

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param servicePledge the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public ServicePledge translateServicePledgeReferenceValues(ServicePledge servicePledge, Locale locale);    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param servicePledgeList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<ServicePledge> translateServicePledgeReferenceValues(List<ServicePledge> servicePledge, Locale locale);

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param goodsPledge the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public GoodsPledge translateGoodsPledgeReferenceValues(GoodsPledge goodsPledge, Locale locale);    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param goodsPledgeList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<GoodsPledge> translateGoodsPledgeReferenceValues(List<GoodsPledge> goodsPledge, Locale locale);

    
}    
