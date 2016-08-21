package org.volunteertech.pledges.users.service;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;

import org.volunteertech.pledges.users.dao.ApplicationUser;
import org.volunteertech.pledges.users.dao.ApplicationUserDetails;
import org.volunteertech.pledges.users.business.ApplicationUserDetailsBo;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsFilter;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsHistory;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsLoadException;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsSaveException;
import org.volunteertech.pledges.users.web.ApplicationUserDetailsController;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Locale;

import org.volunteertech.pledges.main.constants.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  



/**
 * The contact information
 * This Class has been generated by the XSLT processor from the meta data and represents the
 * implementation of the Service  Layer Object for the ApplicationUserDetails entity. A Business Object
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
public class ApplicationUserDetailsServiceImpl implements ApplicationUserDetailsService
{
	final Logger logger = LoggerFactory.getLogger(ApplicationUserDetailsServiceImpl.class);
	/**
	 * The Business Object
	 */
	ApplicationUserDetailsBo  applicationUserDetailsBo;
	
	/**
	 * Reference service for lookups of drop down contents
	 */
    ReferenceService referenceService;	  
	  
	/**
	 * The message resource service that allows access to locale specific messages
	 */
    MessageResourceService messageResourceService;	  
	  
    
    /**
     * Default Constructor for the ApplicationUserDetails Business Object.
     */
    public ApplicationUserDetailsServiceImpl()
    {
    	//Initialise the related Object stores
        
    }
    
	
	/**
	 * Sets the reference Service to perform a user roles lookup
	 */
	public void setReferenceService(ReferenceService referenceService){
		this.referenceService = referenceService;
	}
	
	/**
	 * Returns a reference to reference Service.
	 */
	public ReferenceService getReferenceService(){
		return this.referenceService;
	}	
	  
	/**
	 * Sets the message resource service to perform localization lookups
	 */
	public void setMessageResourceService(MessageResourceService messageResourceService){
		this.messageResourceService = messageResourceService;
	}
	
	/**
	 * Returns a reference to the message resource service.
	 */
	public MessageResourceService getMessageResourceService(){
		return this.messageResourceService;
	}	
      
    
    /**
     * Sets the required Business Object (BO)
     * @param applicationUserDetailsBo the applicationUserDetailsBo used to access the applicationUserDetails entity
     * and it's associations.
     */
    public void setApplicationUserDetailsBo(ApplicationUserDetailsBo applicationUserDetailsBo){
    	this.applicationUserDetailsBo = applicationUserDetailsBo;
    }

    /**
     * Returns the required Business Object (BO)
     * @return the ApplicationUserDetailsBO used to access the applicationUserDetails entity
     * and it's associations.     
     */
    public ApplicationUserDetailsBo getApplicationUserDetailsBo(){
    	return this.applicationUserDetailsBo;
    }

    /**
     * Loads a ApplicationUserDetails object based on the APPLICATIONUSERDETAILSID column
     * @param APPLICATIONUSERDETAILSID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a ApplicationUserDetails object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public ApplicationUserDetails load(Long applicationUserDetailsId, Long loggedInUserId) throws ApplicationUserDetailsLoadException, AuthorisationException, InvalidUserIDException
    {
    	ApplicationUserDetails applicationUserDetails = null;
    	
        if (Authorisation.isAuthorisedView("ApplicationUserDetails", loggedInUserId, applicationUserDetailsId) == false)
        {
        	throw new AuthorisationException();
        }
    	

        if (applicationUserDetailsId != null)
        {
        	try
        	{
				applicationUserDetails = (ApplicationUserDetails)this.getApplicationUserDetailsBo().load(applicationUserDetailsId, loggedInUserId);
        	}
			catch (Exception ex)
			{
			     throw new ApplicationUserDetailsLoadException("ApplicationUserDetailsServiceImpl::load(?, ?)", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return applicationUserDetails;
    }
    
    


    /**
     * Load all existing ApplicationUserDetails objects. 
     * @return List a List of ApplicationUserDetails objects.
     */
    public List<ApplicationUserDetails> listApplicationUserDetails()
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetails();

        return result;
    }
    
    
    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching contactName
     * @return List a List of ApplicationUserDetails objects that match the contactName property given as parameter.
     * @param contactName the contactName on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByContactName(String contactName)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByContactName(contactName);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching representOrganisation
     * @return List a List of ApplicationUserDetails objects that match the representOrganisation property given as parameter.
     * @param representOrganisation the representOrganisation on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByRepresentOrganisation(Long representOrganisation)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByRepresentOrganisation(representOrganisation);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching telephoneNumber
     * @return List a List of ApplicationUserDetails objects that match the telephoneNumber property given as parameter.
     * @param telephoneNumber the telephoneNumber on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByTelephoneNumber(String telephoneNumber)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByTelephoneNumber(telephoneNumber);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching addressOne
     * @return List a List of ApplicationUserDetails objects that match the addressOne property given as parameter.
     * @param addressOne the addressOne on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByAddressOne(String addressOne)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByAddressOne(addressOne);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching addressTwo
     * @return List a List of ApplicationUserDetails objects that match the addressTwo property given as parameter.
     * @param addressTwo the addressTwo on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByAddressTwo(String addressTwo)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByAddressTwo(addressTwo);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching city
     * @return List a List of ApplicationUserDetails objects that match the city property given as parameter.
     * @param city the city on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByCity(String city)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByCity(city);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching stateProvinceRegion
     * @return List a List of ApplicationUserDetails objects that match the stateProvinceRegion property given as parameter.
     * @param stateProvinceRegion the stateProvinceRegion on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByStateProvinceRegion(String stateProvinceRegion)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByStateProvinceRegion(stateProvinceRegion);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching postCode
     * @return List a List of ApplicationUserDetails objects that match the postCode property given as parameter.
     * @param postCode the postCode on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByPostCode(String postCode)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByPostCode(postCode);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching country
     * @return List a List of ApplicationUserDetails objects that match the country property given as parameter.
     * @param country the country on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByCountry(Long country)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByCountry(country);

        return result;
    }

    /**
     * Returns a <code>List</code> of ApplicationUserDetails objects that have a matching emailAddress
     * @return List a List of ApplicationUserDetails objects that match the emailAddress property given as parameter.
     * @param emailAddress the emailAddress on which to match the required records.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByEmailAddress(String emailAddress)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsByEmailAddress(emailAddress);

        return result;
    }

    
    /**
     * Load existing ApplicationUserDetails objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of ApplicationUserDetails objects that match the userId parameter.
     */
    public List<ApplicationUserDetails> listApplicationUserDetailsByCreatedById(Long userId)
    {
        List<ApplicationUserDetails> result = this.getApplicationUserDetailsBo().listApplicationUserDetails();

        return result;
    }
    
    
    /**
     * Load all existing ApplicationUserDetailsHistory objects for a particular ApplicationUserDetails.
     * The <code>List</code> of ApplicationUserDetailsHistory objects contains all of the changes that have been made to the
     * ApplicationUserDetails object identified by the applicationUserDetails parameter'
     * @return List a List of ApplicationUserDetailsHistory objects.
     */
    public List<ApplicationUserDetailsHistory> listApplicationUserDetailsHistory(Long applicationUserDetails) throws Exception
    {
        List<ApplicationUserDetailsHistory> result = this.getApplicationUserDetailsBo().listApplicationUserDetailsHistory(applicationUserDetails);

        return result;
    }
    
    
    
    /**
     * Either updates an existing entry in the APPLICATIONUSERDETAILS table or adds a new entry if one does not exist.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ApplicationUserDetailsLoadException if the existing record cannot be loaded
     * @throws ApplicationUserDetailsSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeApplicationUserDetails(ApplicationUserDetails applicationUserDetails, Long userId)
        throws ApplicationUserDetailsSaveException, ApplicationUserDetailsLoadException, AuthorisationException, InvalidUserIDException
    {
    	
        if (Authorisation.isAuthorisedUpdate("ApplicationUserDetails", userId, applicationUserDetails.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
		try
		{
			if(applicationUserDetails.isNew()){
		    	this.getApplicationUserDetailsBo().createAndStoreApplicationUserDetails(applicationUserDetails, userId);
			}else{
				

		    	this.getApplicationUserDetailsBo().updateApplicationUserDetails(applicationUserDetails, userId);
			}
        }
		catch (Exception ex)
		{
		     throw new ApplicationUserDetailsSaveException("ApplicationUserDetailsEntityDataManager::updateApplicationUserDetails, ApplicationUserDetailsID: " + applicationUserDetails.getId(), ex);
		}		
        
    }
    
    
    /**
     * Loads a ApplicationUserDetailsFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per ApplicationUserDetails.
     * @ return a ApplicationUserDetailsFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ApplicationUserDetailsFilter loadApplicationUserDetailsFilter(Long userID) throws ApplicationUserDetailsLoadException, AuthorisationException, InvalidUserIDException
    {
    	ApplicationUserDetailsFilter applicationUserDetailsFilter = null;
    	
        /*if (Authorisation.isAuthorisedView("ApplicationUserDetails", userID, APPLICATIONUSERDETAILSID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userID != null)
        {
        	
        	try
        	{
				applicationUserDetailsFilter = (ApplicationUserDetailsFilter)this.getApplicationUserDetailsBo().loadApplicationUserDetailsFilter(userID);
        	}
			catch (Exception ex)
			{
			     throw new ApplicationUserDetailsLoadException("ApplicationUserDetailsEntityDataManager::loadApplicationUserDetailsFilter", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return applicationUserDetailsFilter;
    }
    
    /**
     * Creates a new entry in the APPLICATIONUSERDETAILSFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws ApplicationUserDetailsSaveException on failure to save.  
     */
    public Long createAndStoreApplicationUserDetailsFilter(ApplicationUserDetailsFilter applicationUserDetailsFilter, Long userId)
        throws ApplicationUserDetailsSaveException
    {
    	Long returnValue = new Long(0);
        

		try
		{
            applicationUserDetailsFilter.setId(userId);
			applicationUserDetailsFilter.setCreatedByID(userId);
            applicationUserDetailsFilter.setUpdatedByID(userId);
            applicationUserDetailsFilter.setDateCreated(new Date());
            applicationUserDetailsFilter.setDateUpdated(new Date());

            returnValue = this.getApplicationUserDetailsBo().createAndStoreApplicationUserDetailsFilter(applicationUserDetailsFilter, userId);
		}
		catch (Exception ex)
		{
		     throw new ApplicationUserDetailsSaveException("ApplicationUserDetailsServiceImpl::createAndStoreApplicationUserDetailsFilter", ex);
		}		
		
		return returnValue;
    }
    
    
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
        throws ApplicationUserDetailsLoadException, ApplicationUserDetailsSaveException, AuthorisationException, InvalidUserIDException
    {
    	Long returnValue = new Long(0);
    	
        //if (Authorisation.isAuthorisedUpdate("ApplicationUserDetails", userId, APPLICATIONUSERDETAILSID) == false)
        //{
        //	throw new AuthorisationException();
        //}
    	
		try
		{
        
			applicationUserDetailsFilter.setUpdatedByID(userId);
            applicationUserDetailsFilter.setDateUpdated(new Date());
            returnValue = this.getApplicationUserDetailsBo().updateApplicationUserDetailsFilter(applicationUserDetailsFilter, userId);
        }
		catch (Exception ex)
		{
		     throw new ApplicationUserDetailsSaveException("ApplicationUserDetailsServiceImpl::updateApplicationUserDetailsFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param applicationUserDetails the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public ApplicationUserDetails translateReferenceValues(ApplicationUserDetails applicationUserDetails, Locale locale){
			Boolean representOrganisation =  applicationUserDetails.getRepresentOrganisation();
			if(representOrganisation){
				applicationUserDetails.setRepresentOrganisationReferenceTranslation(messageResourceService.getMessage(Constants.REFERENCE_YES_NO__YES, new String[0], locale));
			}else{
				applicationUserDetails.setRepresentOrganisationReferenceTranslation(messageResourceService.getMessage(Constants.REFERENCE_YES_NO__NO, new String[0], locale));
			}

			Long countryReferenceId =  applicationUserDetails.getCountry();
			String countryLocaleReference = null;
			if (countryReferenceId == null || countryReferenceId <= 0){
				countryLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				countryLocaleReference = this.messageResourceService.getMessage(countryReferenceId, new String[0], locale);
			}
			
			applicationUserDetails.setCountryReferenceTranslation(countryLocaleReference);

    	return applicationUserDetails;
    }
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param applicationUserDetailsList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<ApplicationUserDetails> translateReferenceValues(List<ApplicationUserDetails> applicationUserDetailsList, Locale locale){
    	for (ApplicationUserDetails applicationUserDetails :  applicationUserDetailsList){
    		applicationUserDetails = translateReferenceValues(applicationUserDetails, locale);
    	}
    	
    	return applicationUserDetailsList;
    }
    
	
    
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
        super.finalize();
        
    }    
    
    
}
    
