package org.volunteertech.pledges.admin.business;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.admin.dao.View;
import org.volunteertech.pledges.admin.dao.ViewDao;
import org.volunteertech.pledges.admin.dao.ViewFilter;
import org.volunteertech.pledges.admin.dao.ViewHistory;
import org.volunteertech.pledges.admin.dao.ViewLoadException;
import org.volunteertech.pledges.admin.dao.ViewSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.math.BigDecimal;
import java.util.ArrayList;


import org.volunteertech.pledges.localisation.business.MessageResourceBo;
import org.volunteertech.pledges.localisation.dao.MessageResource;



/**
 * The Views that are contained in the application
 * This Class has been generated by the XSLT processor from the meta data and represents the
 * implementation of the Business Object(BO) for the View entity. A Business Object
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
public class ViewBoImpl implements ViewBo
{
	/**
	 * The Data Access Object
	 */
	ViewDao  viewDao;
	    
    
    /**
     * The Business Object (BO) for the messageResource association to
     * allow access to the underlying business methods of the associated MessageResource entity.
     */
    private MessageResourceBo messageResourceBo;

    

    /**
     * Default Constructor for the View Business Object.
     */
    public ViewBoImpl()
    {
    	//Initialise the related Object stores
        
    }
    
    /**
     * Sets the required Data Access Object (DAO)
     * @param viewDao the viewDao used to access the view entity.
     */
    public void setViewDao(ViewDao viewDao){
    	this.viewDao = viewDao;
    }

    /**
     * Returns the required Data Access Object (DAO)
     * @return the ViewDao used to access the view entity.
     */
    public ViewDao getViewDao(){
    	return this.viewDao;
    }
    
    /**
     * Sets the required Business Object (BO) for the messageResource association to
     * allow access to the underlying business methods.
     * @param messageResourceBo the MessageResourceBo used to
     * access the business methods of the associated MessageResource entity.
     */
    public void setMessageResourceBo(MessageResourceBo messageResourceBo){
    	this.messageResourceBo = messageResourceBo;
    }
    

    /**
     * Returns the required Business Object (BO) to allow access to the underlying MessageResource
     * business object that supports the messageResourceBo property 
     * @return the MessageResourceBo used to manipulate the underlying MessageResource object.
     */
    public MessageResourceBo getMessageResourceBo(){
    	return this.messageResourceBo;
    }
        


    /**
     * Loads a View object based on the VIEWID column
     * @param VIEWId the primary key for the underlying record.
     * @param userId the userId is checked for authorisation to view the record
     * @ return a View object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public View load(Long viewId, Long loggedInUserId) throws ViewLoadException, AuthorisationException, InvalidUserIDException
    {
    	View view = null;
    	
        if (Authorisation.isAuthorisedView("View", loggedInUserId, viewId) == false)
        {
        	throw new AuthorisationException();
        }
    	

        if (viewId != null)
        {
        	try
        	{
				view = (View)this.getViewDao().load(viewId, loggedInUserId);
        	}
			catch (Exception ex)
			{
			     throw new ViewLoadException("ViewDaoImpl::load", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return view;
    }
    
    
    


    /**
     * Load all existing View objects. 
     * @return List a List of View objects.
     */
    public List<View> listView()
    {
        List<View> result = this.getViewDao().listView();

        return result;
    }
    
    
    /**
     * Returns a <code>List</code> of View objects that have a matching viewName
     * @return List a List of View objects that match the viewName property given as parameter.
     * @param viewName the viewName on which to match the required records.
     */
    public List<View> listViewByViewName(String viewName)
    {
        List<View> result = this.getViewDao().listViewByViewName(viewName);

        return result;
    }

    
	/**
     * Load existing View objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of View objects that match the userId parameter.
     */
    public List<View> listViewByCreatedById(Long userId)
    {
        List<View> result = this.getViewDao().listViewByCreatedById(userId);

        return result;
    }
    
    
    /**
     * Load all existing ViewHistory objects for a particular View.
     * The <code>List</code> of ViewHistory objects contains all of the changes that have been made to the
     * View object identified by the view parameter'
     * @return List a List of ViewHistory objects.
     */
    public List<ViewHistory> listViewHistory(Long view)
    {
        List<ViewHistory> result = this.getViewDao().listViewHistory(view);

        return result;
    }
    
    
    /**
     * Returns a List of associated MessageResource objects that represent the messageResource property
     * and that are defined by the one-to-many relationship defined as View.messageResource.
     * @return the <code>List</code> of the associated MessageResource objects that represent the messageResource property.
     */
    public List<MessageResource> getMessageResource(Long viewId, Long userId) throws ViewLoadException, AuthorisationException, InvalidUserIDException{
    	return this.getViewDao().getMessageResource(viewId, userId);
    }
    
    /**
     * Adds a MessageResource to the Set of associated MessageResource objects that represent the messageResource property
     * and that are defined by the one-to-many relationship defined as View.messageResource.
     * @return the updated <code>List</code> of the associated MessageResource objects that represent the messageResource property.
     */
    public List<MessageResource> addMessageResourceToMessageResource(MessageResource messageResource, Long viewId, Long userId) throws ViewSaveException, ViewLoadException, AuthorisationException, InvalidUserIDException{
    	return this.getViewDao().addMessageResourceToMessageResource(messageResource, viewId, userId);
	}
  
    
    
    /**
     * Creates a new entry in the VIEW table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     * @throws ViewSaveException on failure to save.  
     */
    public Long createAndStoreView(View view, Long userID)
        throws ViewSaveException
    {
    	Long returnValue = Long.valueOf(0);
        
		try
		{
            returnValue = this.getViewDao().createAndStoreView(view, userID);
		}
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewEntityDataManager::createAndStoreView", ex);
		}		
		
		return returnValue;
    }


    /**
     * Updates an existing entry in the VIEW table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ViewLoadException if the existing record cannot be loaded
     * @throws ViewSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void updateView(View view, Long userID)
        throws ViewSaveException, ViewLoadException, AuthorisationException, InvalidUserIDException
    {
    	
        if (Authorisation.isAuthorisedUpdate("View", userID, view.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
		try
		{
            this.getViewDao().updateView(view, userID);
        }
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewEntityDataManager::updateView, ViewID: " + view.getId(), ex);
		}		
        
    }
    
    
    /**
     * Loads a ViewFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per View.
     * @ return a ViewFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ViewFilter loadViewFilter(Long userId) throws ViewLoadException, AuthorisationException, InvalidUserIDException
    {
    	ViewFilter viewFilter = null;
    	
        /*if (Authorisation.isAuthorisedView("View", userId, VIEWID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userId != null)
        {
        	
        	try
        	{
				viewFilter = (ViewFilter)this.getViewDao().loadViewFilter(userId);
        	}
			catch (Exception ex)
			{
			     throw new ViewLoadException("ViewBoImpl::loadViewFilter", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return viewFilter;
    }
    
    /**
     * Creates a new entry in the VIEWFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws ViewSaveException on failure to save.  
     */
    public Long createAndStoreViewFilter(ViewFilter viewFilter,  Long userId)
        throws ViewSaveException
    {
    	Long returnValue = Long.valueOf(0);
        
		try
		{
            viewFilter.setId(userId);
			viewFilter.setCreatedByID(userId);
            viewFilter.setUpdatedByID(userId);
            viewFilter.setDateCreated(new Date());
            viewFilter.setDateUpdated(new Date());

            returnValue = this.getViewDao().createAndStoreViewFilter(viewFilter, userId);
		}
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewBoImpl::createAndStoreViewFilter", ex);
		}		
		
		return returnValue;
    }
    
    
    /**
     * Updates an existing entry in the VIEWFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ViewSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateViewFilter(ViewFilter viewFilter, Long userId)
        throws ViewLoadException, ViewSaveException, AuthorisationException, InvalidUserIDException
    {
    	Long returnValue = Long.valueOf(0);
    	
        //if (Authorisation.isAuthorisedUpdate("View", userId, VIEWID) == false)
        //{
        //	throw new AuthorisationException();
        //}
    	
		try
		{
			viewFilter.setId(userId);
			viewFilter.setUpdatedByID(userId);
            viewFilter.setDateUpdated(new Date());
            returnValue = this.getViewDao().updateViewFilter(viewFilter, userId);
        }
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewBoImpl::updateViewFilter, userId: " + userId, ex);
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
    
