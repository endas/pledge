package org.volunteertech.pledges.localisation.dao;
import org.hibernate.SessionFactory;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.dao.MessageResourceHistory;
import org.volunteertech.pledges.localisation.dao.MessageResourceLoadException;
import org.volunteertech.pledges.localisation.dao.MessageResourceSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;


import org.volunteertech.pledges.admin.dao.View;




/**
 * The model to hold localisation messages
 * This class has been generated by the XSLT processor from the metadata and represents the
 * implementation of the data access object for the MessageResource entity.
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
@Repository 
public class MessageResourceDaoImpl implements MessageResourceDao
{
    /**
     * The Hibernate SessionFactory instance
     */
    private SessionFactory sessionFactory;
    
    
    

    /**
     * Default Constructor for the MessageResource entity data manager
     */
    public MessageResourceDaoImpl()
    {
    	//Initialise the related Object stores
        
    }
    

    /**
     * Allows Spring to set the container managed SessionFactory instance
     * @param a Spring managed SessionFactory instance
     */    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    /**
     * Loads a MessageResource object based on the messageResourceId column
     * @param MessageResourceId the primary key for the underlying record.
     * @ return a MessageResource object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public MessageResource load(Long messageResourceId, Long loggedInUserId) throws AuthorisationException, InvalidUserIDException
    {
        if (Authorisation.isAuthorisedView("MessageResource", loggedInUserId, messageResourceId) == false)
        {
        	throw new AuthorisationException();
        }
    
    	MessageResource hibernateEntity = null;
    	
        if (messageResourceId != null)
        {
			hibernateEntity = (MessageResource)this.sessionFactory.getCurrentSession().get(MessageResourceImpl.class, messageResourceId);

            // Load all related singular objects
            
        }
    	
        return hibernateEntity;
    }
    
    
    

    /**
     * Load all existing MessageResource objects from the database. Hibernate will generate the appropriate SQL,
     * send it to the database and populate MessageResource objects with the data.
     * @return List a List of MessageResource objects.
     */
    public List<MessageResource> listMessageResource()
    {
        @SuppressWarnings("unchecked")
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource order by messageResource.id asc").list();

        return result;
    }

    
    /**
     * Load existing MessageResource objects from the database that have a messageKey column
     * that matches the messageKey parameter.
     * @return List a List of MessageResource objects that match the messageKey parameter.
     */
    public List<MessageResource> listMessageResourceByMessageKey(String messageKey)
    {
        @SuppressWarnings("unchecked")
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.messageKey = :messagekey order by messageResource.id asc").setParameter("messagekey", messageKey).list();

        return result;
    }

    /**
     * Load existing MessageResource objects from the database that have a locale column
     * that matches the locale parameter.
     * @return List a List of MessageResource objects that match the locale parameter.
     */
    public List<MessageResource> listMessageResourceByLocale(String locale)
    {
        @SuppressWarnings("unchecked")
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.locale = :locale order by messageResource.id asc").setParameter("locale", locale).list();

        return result;
    }

    /**
     * Load existing MessageResource objects from the database that have a localeReferenceId column
     * that matches the localeReferenceId parameter.
     * @return List a List of MessageResource objects that match the localeReferenceId parameter.
     */
    public List<MessageResource> listMessageResourceByLocaleReferenceId(Long localeReferenceId)
    {
        @SuppressWarnings("unchecked")
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.localeReferenceId = :localereferenceid order by messageResource.id asc").setParameter("localereferenceid", localeReferenceId).list();

        return result;
    }

    /**
     * Load existing MessageResource objects from the database that have a message column
     * that matches the message parameter.
     * @return List a List of MessageResource objects that match the message parameter.
     */
    public List<MessageResource> listMessageResourceByMessage(String message)
    {
        @SuppressWarnings("unchecked")
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.message = :message order by messageResource.id asc").setParameter("message", message).list();

        return result;
    }

    
    /**
     * Load existing MessageResource objects from the database that have a createdByID column
     * that matches the createdById parameter.
     * @return List a List of MessageResource objects that match the createdById parameter.
     */
    public List<MessageResource> listMessageResourceByCreatedById(Long userId)
    {
        @SuppressWarnings("unchecked")
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.createdByID = :userId order by messageResource.id asc").setParameter("userId", userId).list();

        return result;
    }
    
    
    /**
     * Load all existing MessageResourceHistory objects for a particular MessageResource from the database.
     * Hibernate will generate the appropriate SQL,
     * send it to the database and populate a List of MessageResourceHistory objects with the data.
     * @return List a List of MessageResourceHistory objects.
     */
    public List<MessageResourceHistory> listMessageResourceHistory(Long messageResource)
    {
        
        @SuppressWarnings("unchecked")
        List<MessageResourceHistory> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceHistory as messageResourceHistory where messageResourceHistory.messageResourceId = ? order by messageResourceHistory.id asc").setLong(0, messageResource).list();

        return result;
    }
    
    
    /**
     * Load a <code>List</code> of MessageResource objects from the database that match the
     * viewId parameter, the View and the MessageResource defined as the one-to-many association in View.messageResource in ApplicationDef.xml.
     * @return a <code>List</code> of MessageResource objects that match the viewId parameter.
     */
    public List<MessageResource> listMessageResourceByViewId(Long  viewId)
    {
        @SuppressWarnings("unchecked")
        
        List<MessageResource> result = this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.view.id = :viewId order by messageResource.id asc").setParameter("viewId", viewId).list();

        return result;
    }
  
      
    /**
     * Load a MessageResource object using the Locale and messageKey as search parameters.
     * @return a MessageResource object.
     */
    public MessageResource loadMessageResourceForLocale(String messageKey, String locale)
    {
        
        @SuppressWarnings("unchecked")
        MessageResource result = (MessageResource)this.sessionFactory.getCurrentSession().createQuery("from MessageResourceImpl as messageResource where messageResource.messageKey = :messageKey and messageResource.locale = :locale").setString("messageKey", messageKey).setString("locale", locale).uniqueResult();

        return result;
    }
      
    
    /**
     * Creates a new entry in the MESSAGERESOURCE table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     * @throws MessageResourceSaveException on failure to save.  
     */
    public Long createAndStoreMessageResource(MessageResource messageResource, Long userId)
    {
    	Long returnValue = new Long(0);

        messageResource.setCreatedByID(userId);
        messageResource.setUpdatedByID(userId);
        messageResource.setDateCreated(new Date());
        messageResource.setDateUpdated(new Date());
        
        this.sessionFactory.getCurrentSession().save(messageResource);
            
        returnValue = messageResource.getId();
		
		return returnValue;
    }


    /**
     * Updates an existing entry in the MESSAGERESOURCE table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @param the messageResource the MessageResource object to update in the database.
     * @param userId the userId of the currently logged in user. 
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userId passed as parameter is not valid
     */
    public void updateMessageResource(MessageResource messageResource, Long userId) throws AuthorisationException, InvalidUserIDException
    {
        if (Authorisation.isAuthorisedUpdate("MessageResource", userId, messageResource.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
        messageResource.setUpdatedByID(userId);
        messageResource.setDateUpdated(new Date());
        this.sessionFactory.getCurrentSession().update(messageResource);
    }
    
    
    /**
     * Loads a MessageResourceFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per MessageResource.
     * @ return a MessageResourceFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public MessageResourceFilter loadMessageResourceFilter(Long userID) throws MessageResourceLoadException, AuthorisationException, InvalidUserIDException
    {
    	MessageResourceFilter hibernateEntity = null;
    	
        /*if (Authorisation.isAuthorisedView("MessageResource", userID, MESSAGERESOURCEID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userID != null)
        {
        	
        	try
        	{
				hibernateEntity = (MessageResourceFilter)this.sessionFactory.getCurrentSession().load(MessageResourceFilter.class, userID);
        	}
			catch (Exception ex)
			{
			     throw new MessageResourceLoadException("MessageResourceEntityDataManager::loadMessageResourceFilter", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return hibernateEntity;
    }
    
    /**
     * Creates a new entry in the MESSAGERESOURCEFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userID which is also the assigned Id for the newly created record.
     * @throws MessageResourceSaveException on failure to save.  
     */
    public Long createAndStoreMessageResourceFilter(MessageResourceFilter messageResourceFilter,  Long userId)
        throws MessageResourceSaveException
    {
    	Long returnValue = new Long(0);
        

		try
		{
            messageResourceFilter.setId(userId);
            messageResourceFilter.setCreatedByID(userId);
            messageResourceFilter.setUpdatedByID(userId);
            messageResourceFilter.setDateCreated(new Date());
            messageResourceFilter.setDateUpdated(new Date());

            this.sessionFactory.getCurrentSession().save(messageResourceFilter);
            
            returnValue = messageResourceFilter.getId();
		}
		catch (Exception ex)
		{
		     throw new MessageResourceSaveException("MessageResourceEntityDataManager::createAndStoreMessageResourceFilter", ex);
		}		
		
		return returnValue;
    }
    
    
    /**
     * Updates an existing entry in the MESSAGERESOURCEFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws MessageResourceSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateMessageResourceFilter(MessageResourceFilter messageResourceFilter, Long userId)
        throws MessageResourceLoadException, MessageResourceSaveException, AuthorisationException, InvalidUserIDException
    {
    	Long returnValue = new Long(0);
    	
        //if (Authorisation.isAuthorisedUpdate("MessageResource", userID, MESSAGERESOURCEID) == false)
        //{
        //	throw new AuthorisationException();
        //}
    	
		try
		{
			messageResourceFilter.setId(userId);
            messageResourceFilter.setUpdatedByID(userId);
            messageResourceFilter.setDateUpdated(new Date());
            this.sessionFactory.getCurrentSession().update(messageResourceFilter);
            returnValue = messageResourceFilter.getId();
        }
		catch (Exception ex)
		{
		     throw new MessageResourceSaveException("MessageResourceDaoImpl::updateMessageResourceFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }
    
	
	/**
	 * Returns a List of the View that own the MessageResource identified by the
	 * id given as a parameter.
	 * @param messageResourceId the id of the MessageResource for which the View should be resolved.
	 * @param userId the userId of the currently logged in user.
	 */
	public List<View> listViewByMessageResourceId(Long messageResourceId, Long userId){
		@SuppressWarnings("unchecked")
		List<View> result = this.sessionFactory.getCurrentSession().createQuery("select distinct view from ViewImpl as view inner join view.messageResource as messageResource where messageResource.id = :messageResourceId order by view.id asc").setParameter("messageResourceId", messageResourceId).list();
    	return result;
	}

    
    /**
     * Converts a Comma Seperated Volume (delimited by ",") to a <code>List<code/> of type <code>String<code/>
     */
	private static List<String> convertCommaDelimitedStringToList(String delimitedString) {

		List<String> result = new ArrayList<String>();

		if (!StringUtils.isEmpty(delimitedString)) {
			result = Arrays.asList(StringUtils.delimitedListToStringArray(delimitedString, ","));
		}
		return result;

	}

    /**
     * Converts a List of type String to a Comma Seperated Volume (delimited by ",") 
     */
	private String convertListToCommaDelimitedString(List<String> list) {

		String result = "";
		if (list != null) {
			result = StringUtils.arrayToCommaDelimitedString(list.toArray());
		}
		return result;

	}

    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
        super.finalize();
        
    }    
    
}
    
