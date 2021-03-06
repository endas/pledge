package org.volunteertech.pledges.startup.business;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.startup.dao.Landing;
import org.volunteertech.pledges.startup.dao.LandingDao;
import org.volunteertech.pledges.startup.dao.LandingFilter;
import org.volunteertech.pledges.startup.dao.LandingHistory;
import org.volunteertech.pledges.startup.dao.LandingLoadException;
import org.volunteertech.pledges.startup.dao.LandingSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.math.BigDecimal;
import java.util.ArrayList;




/**
 * The main web screen
 * This Class has been generated by the XSLT processor from the meta data and represents the
 * implementation of the Business Object(BO) for the Landing entity. A Business Object
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
public class LandingBoImpl implements LandingBo
{
	/**
	 * The Data Access Object
	 */
	LandingDao  landingDao;
	    
    
    

    /**
     * Default Constructor for the Landing Business Object.
     */
    public LandingBoImpl()
    {
    	//Initialise the related Object stores
        
    }
    
    /**
     * Sets the required Data Access Object (DAO)
     * @param landingDao the landingDao used to access the landing entity.
     */
    public void setLandingDao(LandingDao landingDao){
    	this.landingDao = landingDao;
    }

    /**
     * Returns the required Data Access Object (DAO)
     * @return the LandingDao used to access the landing entity.
     */
    public LandingDao getLandingDao(){
    	return this.landingDao;
    }
    

    /**
     * Loads a Landing object based on the LANDINGID column
     * @param LANDINGId the primary key for the underlying record.
     * @param userId the userId is checked for authorisation to view the record
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
				landing = (Landing)this.getLandingDao().load(landingId, loggedInUserId);
        	}
			catch (Exception ex)
			{
			     throw new LandingLoadException("LandingDaoImpl::load", ex);
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
        List<Landing> result = this.getLandingDao().listLanding();

        return result;
    }
    
    
    
	/**
     * Load existing Landing objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of Landing objects that match the userId parameter.
     */
    public List<Landing> listLandingByCreatedById(Long userId)
    {
        List<Landing> result = this.getLandingDao().listLandingByCreatedById(userId);

        return result;
    }
    
    
    /**
     * Load all existing LandingHistory objects for a particular Landing.
     * The <code>List</code> of LandingHistory objects contains all of the changes that have been made to the
     * Landing object identified by the landing parameter'
     * @return List a List of LandingHistory objects.
     */
    public List<LandingHistory> listLandingHistory(Long landing)
    {
        List<LandingHistory> result = this.getLandingDao().listLandingHistory(landing);

        return result;
    }
    
    
    
    
    /**
     * Creates a new entry in the LANDING table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     * @throws LandingSaveException on failure to save.  
     */
    public Long createAndStoreLanding(Landing landing, Long userID)
        throws LandingSaveException
    {
    	Long returnValue = Long.valueOf(0);
        
		try
		{
            returnValue = this.getLandingDao().createAndStoreLanding(landing, userID);
		}
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingEntityDataManager::createAndStoreLanding", ex);
		}		
		
		return returnValue;
    }


    /**
     * Updates an existing entry in the LANDING table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws LandingLoadException if the existing record cannot be loaded
     * @throws LandingSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void updateLanding(Landing landing, Long userID)
        throws LandingSaveException, LandingLoadException, AuthorisationException, InvalidUserIDException
    {
    	
        if (Authorisation.isAuthorisedUpdate("Landing", userID, landing.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
		try
		{
            this.getLandingDao().updateLanding(landing, userID);
        }
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingEntityDataManager::updateLanding, LandingID: " + landing.getId(), ex);
		}		
        
    }
    
    
    /**
     * Loads a LandingFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per Landing.
     * @ return a LandingFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public LandingFilter loadLandingFilter(Long userId) throws LandingLoadException, AuthorisationException, InvalidUserIDException
    {
    	LandingFilter landingFilter = null;
    	
        /*if (Authorisation.isAuthorisedView("Landing", userId, LANDINGID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userId != null)
        {
        	
        	try
        	{
				landingFilter = (LandingFilter)this.getLandingDao().loadLandingFilter(userId);
        	}
			catch (Exception ex)
			{
			     throw new LandingLoadException("LandingBoImpl::loadLandingFilter", ex);
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
    public Long createAndStoreLandingFilter(LandingFilter landingFilter,  Long userId)
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

            returnValue = this.getLandingDao().createAndStoreLandingFilter(landingFilter, userId);
		}
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingBoImpl::createAndStoreLandingFilter", ex);
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
			landingFilter.setId(userId);
			landingFilter.setUpdatedByID(userId);
            landingFilter.setDateUpdated(new Date());
            returnValue = this.getLandingDao().updateLandingFilter(landingFilter, userId);
        }
		catch (Exception ex)
		{
		     throw new LandingSaveException("LandingBoImpl::updateLandingFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }
    

    
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
        super.finalize();
        
    }    
    
    
}
    
