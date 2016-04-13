package org.volunteertech.pledges.admin.service;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.admin.dao.View;
import org.volunteertech.pledges.admin.business.ViewBo;
import org.volunteertech.pledges.admin.dao.ViewFilter;
import org.volunteertech.pledges.admin.dao.ViewHistory;
import org.volunteertech.pledges.admin.dao.ViewLoadException;
import org.volunteertech.pledges.admin.dao.ViewSaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;
import java.util.Locale;


import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  
import org.volunteertech.pledges.localisation.dao.MessageResource;



/**
 * The Views that are contained in the application
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the Service  Layer Object for the View entity. A Business Object
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
public interface ViewService
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
     * @param viewBo the viewBo used to access the view entity
     * and it's associations.
     */
    public void setViewBo(ViewBo viewBo);
    

    /**
     * Returns the required Business Object (BO)
     * @return the ViewBo used to access the view entity
     * and it's associations.
     */
    public ViewBo getViewBo();
    
    

    /**
     * Loads a View object based on the VIEWID column
     * @param VIEWID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a View object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public View load(Long viewID, Long loggedInUserId) throws ViewLoadException, AuthorisationException, InvalidUserIDException;
    
    

    /**
     * Load all existing View objects. 
     * @return List a List of View objects.
     */
    public List<View> listView();
    
    
    /**
     * Returns a <code>List</code> of View objects that have a matching viewName
     * @return List a List of View objects that match the viewName property given as parameter.
     * @param viewName the viewName on which to match the required records.
     */
    public List<View> listViewByViewName(String viewName);

    
    
    /**
     * Load existing View objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of View objects that match the userId parameter.
     */
    public List<View> listViewByCreatedById(Long userId);
    
    
    /**
     * Load all existing ViewHistory objects for a particular View.
     * The <code>List</code> of ViewHistory objects contains all of the changes that have been made to the
     * View object identified by the view parameter'
     * @return List a List of ViewHistory objects.
     */
    public List<ViewHistory> listViewHistory(Long view) throws Exception;
    
    
    /**
     * Returns a List representing the Set of associated MessageResource objects that represent the messageResource property
     * and that are defined by the one-to-many relationship defined as View.messageResource.
     * @return the <code>List</code> of the associated MessageResource objects that represent the messageResource property.
     */
    public List<MessageResource> getMessageResource(Long viewId, Long userId) throws ViewLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Adds a MessageResource to the Set of associated MessageResource objects that represent the messageResource property
     * and that are defined by the one-to-many relationship defined as View.messageResource.
     * @return the updated <code>List</code> of the associated MessageResource objects that represent the messageResource property.
     */
    public List<MessageResource> addMessageResourceToMessageResource(MessageResource messageResource, Long viewId, Long userId) throws ViewSaveException, ViewLoadException, AuthorisationException, InvalidUserIDException;
  
    
    /**
     * Either updates an existing entry in the VIEW table or adds a new entry if one does not exist.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ViewLoadException if the existing record cannot be loaded
     * @throws ViewSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeView(View view, Long userId)
        throws ViewSaveException, ViewLoadException, AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a ViewFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per View.
     * @ return a ViewFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ViewFilter loadViewFilter(Long userId) throws ViewLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the VIEWFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userID which is also the assigned Id for the newly created record.
     * @throws ViewSaveException on failure to save.  
     */
    public Long createAndStoreViewFilter(ViewFilter viewFilter, Long userId)
        throws ViewSaveException;
    
    
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
        throws ViewLoadException, ViewSaveException, AuthorisationException, InvalidUserIDException;
    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param view the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 * @return the same View object but with the locale translation fields populated with the message
	 * that is relevant to the current locale
	 */    
    public View translateReferenceValues(View view, Locale locale);
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param viewList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<View> translateReferenceValues(List<View> viewList, Locale locale);
    
	
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param messageResource the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public MessageResource translateMessageResourceReferenceValues(MessageResource messageResource, Locale locale);    

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param messageResourceList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<MessageResource> translateMessageResourceReferenceValues(List<MessageResource> messageResource, Locale locale);

    
}    
