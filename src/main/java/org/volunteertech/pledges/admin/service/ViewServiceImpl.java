package org.volunteertech.pledges.admin.service;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.admin.dao.View;
import org.volunteertech.pledges.admin.business.ViewBo;
import org.volunteertech.pledges.admin.dao.ViewFilter;
import org.volunteertech.pledges.admin.dao.ViewHistory;
import org.volunteertech.pledges.admin.dao.ViewLoadException;
import org.volunteertech.pledges.admin.dao.ViewSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Locale;

import org.volunteertech.pledges.main.constants.Constants;
import org.springframework.beans.factory.annotation.Autowired;

import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.dao.MessageResourceImpl;
import org.volunteertech.pledges.localisation.service.MessageResourceService;

import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  



/**
 * The Views that are contained in the application
 * This Class has been generated by the XSLT processor from the meta data and represents the
 * implementation of the Service  Layer Object for the View entity. A Business Object
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
public class ViewServiceImpl implements ViewService
{
	/**
	 * The Business Object
	 */
	ViewBo  viewBo;
	
	/**
	 * Reference service for lookups of drop down contents
	 */
    ReferenceService referenceService;	  
	  
	/**
	 * The message resource service that allows access to locale specific messages
	 */
    MessageResourceService messageResourceService;	  
	  
    
    /**
     * Default Constructor for the View Business Object.
     */
    public ViewServiceImpl()
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
     * @param viewBo the viewBo used to access the view entity
     * and it's associations.
     */
    public void setViewBo(ViewBo viewBo){
    	this.viewBo = viewBo;
    }

    /**
     * Returns the required Business Object (BO)
     * @return the ViewBO used to access the view entity
     * and it's associations.     
     */
    public ViewBo getViewBo(){
    	return this.viewBo;
    }

    /**
     * Loads a View object based on the VIEWID column
     * @param VIEWID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
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
				view = (View)this.getViewBo().load(viewId, loggedInUserId);
        	}
			catch (Exception ex)
			{
			     throw new ViewLoadException("ViewServiceImpl::load(?, ?)", ex);
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
        List<View> result = this.getViewBo().listView();

        return result;
    }
    
    
    /**
     * Returns a <code>List</code> of View objects that have a matching viewName
     * @return List a List of View objects that match the viewName property given as parameter.
     * @param viewName the viewName on which to match the required records.
     */
    public List<View> listViewByViewName(String viewName)
    {
        List<View> result = this.getViewBo().listViewByViewName(viewName);

        return result;
    }

    
    /**
     * Load existing View objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of View objects that match the userId parameter.
     */
    public List<View> listViewByCreatedById(Long userId)
    {
        List<View> result = this.getViewBo().listView();

        return result;
    }
    
    
    /**
     * Load all existing ViewHistory objects for a particular View.
     * The <code>List</code> of ViewHistory objects contains all of the changes that have been made to the
     * View object identified by the view parameter'
     * @return List a List of ViewHistory objects.
     */
    public List<ViewHistory> listViewHistory(Long view) throws Exception
    {
        List<ViewHistory> result = this.getViewBo().listViewHistory(view);

        return result;
    }
    
    
    /**
     * Returns a List representing the Set of associated MessageResource objects that represent the messageResource property
     * and that are defined by the one-to-many relationship defined as View.messageResource.
     * @return the <code>List</code> of the associated MessageResource objects that represent the messageResource property.
     */
    public List<MessageResource> getMessageResource(Long viewId, Long userId) throws ViewLoadException, AuthorisationException, InvalidUserIDException{
    	return this.getViewBo().getMessageResource(viewId, userId);
    }
    
    /**
     * Adds a MessageResource to the Set of associated MessageResource objects that represent the messageResource property
     * and that are defined by the one-to-many relationship defined as View.messageResource.
     * @return the updated <code>List</code> of the associated MessageResource objects that represent the messageResource property.
     */
    public List<MessageResource> addMessageResourceToMessageResource(MessageResource messageResource, Long viewId, Long userId) throws ViewSaveException, ViewLoadException, AuthorisationException, InvalidUserIDException{
    	return this.getViewBo().addMessageResourceToMessageResource(messageResource, viewId, userId);
	}
  
    
    /**
     * Either updates an existing entry in the VIEW table or adds a new entry if one does not exist.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ViewLoadException if the existing record cannot be loaded
     * @throws ViewSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeView(View view, Long userId)
        throws ViewSaveException, ViewLoadException, AuthorisationException, InvalidUserIDException
    {
    	
        if (Authorisation.isAuthorisedUpdate("View", userId, view.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
		try
		{
			if(view.isNew()){
		    	this.getViewBo().createAndStoreView(view, userId);
			}else{
		    	this.getViewBo().updateView(view, userId);
			}
        }
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewEntityDataManager::updateView, ViewID: " + view.getId(), ex);
		}		
        
    }
    
    
    /**
     * Loads a ViewFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per View.
     * @ return a ViewFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ViewFilter loadViewFilter(Long userID) throws ViewLoadException, AuthorisationException, InvalidUserIDException
    {
    	ViewFilter viewFilter = null;
    	
        /*if (Authorisation.isAuthorisedView("View", userID, VIEWID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userID != null)
        {
        	
        	try
        	{
				viewFilter = (ViewFilter)this.getViewBo().loadViewFilter(userID);
        	}
			catch (Exception ex)
			{
			     throw new ViewLoadException("ViewEntityDataManager::loadViewFilter", ex);
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
    public Long createAndStoreViewFilter(ViewFilter viewFilter, Long userId)
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

            returnValue = this.getViewBo().createAndStoreViewFilter(viewFilter, userId);
		}
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewServiceImpl::createAndStoreViewFilter", ex);
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
        
			viewFilter.setUpdatedByID(userId);
            viewFilter.setDateUpdated(new Date());
            returnValue = this.getViewBo().updateViewFilter(viewFilter, userId);
        }
		catch (Exception ex)
		{
		     throw new ViewSaveException("ViewServiceImpl::updateViewFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param view the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public View translateReferenceValues(View view, Locale locale){
    	
    	return view;
    }
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param viewList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<View> translateReferenceValues(List<View> viewList, Locale locale){
    	for (View view :  viewList){
    		view = translateReferenceValues(view, locale);
    	}
    	
    	return viewList;
    }
    
	
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param messageResource the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public MessageResource translateMessageResourceReferenceValues(MessageResource messageResource, Locale locale){
    	return this.messageResourceService.translateReferenceValues(messageResource, locale);
    }
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param messageResourceList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<MessageResource> translateMessageResourceReferenceValues(List<MessageResource> messageResourceList, Locale locale){
    	return this.messageResourceService.translateReferenceValues(messageResourceList, locale);
    }


    
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
        super.finalize();
        
    }    
    
    
}
    
