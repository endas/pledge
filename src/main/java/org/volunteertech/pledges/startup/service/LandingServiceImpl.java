package org.volunteertech.pledges.startup.service;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.startup.dao.Landing;
import org.volunteertech.pledges.startup.business.LandingBo;
import org.volunteertech.pledges.startup.dao.LandingFilter;
import org.volunteertech.pledges.startup.dao.LandingHistory;
import org.volunteertech.pledges.startup.dao.LandingLoadException;
import org.volunteertech.pledges.startup.dao.LandingSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Locale;

import org.volunteertech.pledges.main.constants.Constants;
import org.springframework.beans.factory.annotation.Autowired;

import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  



/**
 * The main web screen
 * This Class has been generated by the XSLT processor from the meta data and represents the
 * implementation of the Service  Layer Object for the Landing entity. A Business Object
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
public class LandingServiceImpl implements LandingService
{
	/**
	 * The Business Object
	 */
	LandingBo  landingBo;
	
	/**
	 * Reference service for lookups of drop down contents
	 */
    ReferenceService referenceService;	  
	  
	/**
	 * The message resource service that allows access to locale specific messages
	 */
    MessageResourceService messageResourceService;	  
	  
    
    /**
     * Default Constructor for the Landing Business Object.
     */
    public LandingServiceImpl()
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
     * @param landingBo the landingBo used to access the landing entity
     * and it's associations.
     */
    public void setLandingBo(LandingBo landingBo){
    	this.landingBo = landingBo;
    }

    /**
     * Returns the required Business Object (BO)
     * @return the LandingBO used to access the landing entity
     * and it's associations.     
     */
    public LandingBo getLandingBo(){
    	return this.landingBo;
    }

    /**
     * Loads a Landing object based on the LANDINGID column
     * @param LANDINGID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a Landing object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public Landing load(Long landingId, Long loggedInUserId) throws LandingLoadException, AuthorisationException, InvalidUserIDException
    {
    	Landing landing = null;
    	
        if (Authorisation.isAuthorisedView("Landing", loggedInUserId, landingId) == false)
        {
        	throw new AuthorisationException();
        }
    	

        if (landingId != null)
        {
        	try
        	{
				landing = (Landing)this.getLandingBo().load(landingId, loggedInUserId);
        	}
			catch (Exception ex)
			{
			     throw new LandingLoadException("LandingServiceImpl::load(?, ?)", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return landing;
    }
    
    


    /**
     * Load all existing Landing objects. 
     * @return List a List of Landing objects.
     */
    public List<Landing> listLanding()
    {
        List<Landing> result = this.getLandingBo().listLanding();

        return result;
    }
    
    
    
    /**
     * Load existing Landing objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of Landing objects that match the userId parameter.
     */
    public List<Landing> listLandingByCreatedById(Long userId)
    {
        List<Landing> result = this.getLandingBo().listLanding();

        return result;
    }
    
    
    /**
     * Load all existing LandingHistory objects for a particular Landing.
     * The <code>List</code> of LandingHistory objects contains all of the changes that have been made to the
     * Landing object identified by the landing parameter'
     * @return List a List of LandingHistory objects.
     */
    public List<LandingHistory> listLandingHistory(Long landing) throws Exception
    {
        List<LandingHistory> result = this.getLandingBo().listLandingHistory(landing);

        return result;
    }
    
    
    
    /**
     * Either updates an existing entry in the LANDING table or adds a new entry if one does not exist.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws LandingLoadException if the existing record cannot be loaded
     * @throws LandingSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeLanding(Landing landing, Long userId)
        throws LandingSaveException, LandingLoadException, AuthorisationException, InvalidUserIDException
    {
    	
        if (Authorisation.isAuthorisedUpdate("Landing", userId, landing.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
		try
		{
			if(landing.isNew()){
		    	this.getLandingBo().createAndStoreLanding(landing, userId);
			}else{
		    	this.getLandingBo().updateLanding(landing, userId);
			}
        }
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingEntityDataManager::updateLanding, LandingID: " + landing.getId(), ex);
		}		
        
    }
    
    
    /**
     * Loads a LandingFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per Landing.
     * @ return a LandingFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public LandingFilter loadLandingFilter(Long userID) throws LandingLoadException, AuthorisationException, InvalidUserIDException
    {
    	LandingFilter landingFilter = null;
    	
        /*if (Authorisation.isAuthorisedView("Landing", userID, LANDINGID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userID != null)
        {
        	
        	try
        	{
				landingFilter = (LandingFilter)this.getLandingBo().loadLandingFilter(userID);
        	}
			catch (Exception ex)
			{
			     throw new LandingLoadException("LandingEntityDataManager::loadLandingFilter", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return landingFilter;
    }
    
    /**
     * Creates a new entry in the LANDINGFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws LandingSaveException on failure to save.  
     */
    public Long createAndStoreLandingFilter(LandingFilter landingFilter, Long userId)
        throws LandingSaveException
    {
    	Long returnValue = Long.valueOf(0);
        

		try
		{
            landingFilter.setId(userId);
			landingFilter.setCreatedByID(userId);
            landingFilter.setUpdatedByID(userId);
            landingFilter.setDateCreated(new Date());
            landingFilter.setDateUpdated(new Date());

            returnValue = this.getLandingBo().createAndStoreLandingFilter(landingFilter, userId);
		}
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingServiceImpl::createAndStoreLandingFilter", ex);
		}		
		
		return returnValue;
    }
    
    
    /**
     * Updates an existing entry in the LANDINGFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws LandingSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateLandingFilter(LandingFilter landingFilter, Long userId)
        throws LandingLoadException, LandingSaveException, AuthorisationException, InvalidUserIDException
    {
    	Long returnValue = Long.valueOf(0);
    	
        //if (Authorisation.isAuthorisedUpdate("Landing", userId, LANDINGID) == false)
        //{
        //	throw new AuthorisationException();
        //}
    	
		try
		{
        
			landingFilter.setUpdatedByID(userId);
            landingFilter.setDateUpdated(new Date());
            returnValue = this.getLandingBo().updateLandingFilter(landingFilter, userId);
        }
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingServiceImpl::updateLandingFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param landing the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public Landing translateReferenceValues(Landing landing, Locale locale){
    	
    	return landing;
    }
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param landingList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<Landing> translateReferenceValues(List<Landing> landingList, Locale locale){
    	for (Landing landing :  landingList){
    		landing = translateReferenceValues(landing, locale);
    	}
    	
    	return landingList;
    }
    
	
    
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
        super.finalize();
        
    }    
    
    
}
    
