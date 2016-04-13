package org.volunteertech.pledges.localisation.dao;
import org.hibernate.SessionFactory;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.dao.MessageResourceHistory;
import org.volunteertech.pledges.localisation.dao.MessageResourceLoadException;
import org.volunteertech.pledges.localisation.dao.MessageResourceSaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;

  
import org.volunteertech.pledges.admin.dao.View;



/**
 * The model to hold localisation messages
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the data access object(DAO) for the MessageResource entity.
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
public interface MessageResourceDao
{

    /**
     * Allows Spring to set the container managed SessionFactory instance
     * @param a Spring managed SessionFactory instance
     */    
    public void setSessionFactory(SessionFactory sessionFactory);


    /**
     * Loads a MessageResource object based on the messageResourceId column
     * @param messageResourceId the primary key for the underlying record.
     * @ return a MessageResource object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public MessageResource load(Long messageResourceId, Long loggedInUserId) throws AuthorisationException, InvalidUserIDException;
    

    /**
     * Load all existing MessageResource objects from the database. Hibernate will generate the appropriate SQL,
     * send it to the database and populate a List of MessageResource objects with the data.
     * @return List a List of MessageResource objects.
     */
    public List<MessageResource> listMessageResource();
    
    
    /**
     * Load existing MessageResource objects from the database that have a messageKey column
     * that matches the messageKey parameter.
     * @return List a List of MessageResource objects that match the messageKey parameter.
     */
    public List<MessageResource> listMessageResourceByMessageKey(String messageKey);

    /**
     * Load existing MessageResource objects from the database that have a locale column
     * that matches the locale parameter.
     * @return List a List of MessageResource objects that match the locale parameter.
     */
    public List<MessageResource> listMessageResourceByLocale(String locale);

    /**
     * Load existing MessageResource objects from the database that have a localeReferenceId column
     * that matches the localeReferenceId parameter.
     * @return List a List of MessageResource objects that match the localeReferenceId parameter.
     */
    public List<MessageResource> listMessageResourceByLocaleReferenceId(Long localeReferenceId);

    /**
     * Load existing MessageResource objects from the database that have a message column
     * that matches the message parameter.
     * @return List a List of MessageResource objects that match the message parameter.
     */
    public List<MessageResource> listMessageResourceByMessage(String message);

    
    /**
     * Load existing MessageResource objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of MessageResource objects that match the userId parameter.
     */
    public List<MessageResource> listMessageResourceByCreatedById(Long userId);
    
    
    /**
     * Load all existing MessageResourceHistory objects for a particular MessageResource from the database.
     * Hibernate will generate the appropriate SQL,
     * send it to the database and populate MessageResourceHistory objects with the data.
     * @return List a List of MessageResourceHistory objects.
     */
    public List<MessageResourceHistory> listMessageResourceHistory(Long messageResource);
    
    
    /**
     * Load a <code>List</code> of MessageResource objects from the database that match the
     * viewId parameter, the View and the MessageResource being related by an association.
     * @return a <code>List</code> of MessageResource objects that match the viewId parameter.
     */
    public List<MessageResource> listMessageResourceByViewId(Long  viewId);
  
      
    /**
     * Load a MessageResource object using the Locale and messageKey as search parameters.
     * @return a MessageResource object.
     */
    public MessageResource loadMessageResourceForLocale(String messageKey, String locale);
      
    
    
    /**
     * Creates a new entry in the MESSAGERESOURCE table containing the parameters passed here.
     *
     * @param userID the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     */
    public Long createAndStoreMessageResource(MessageResource messageResource, Long userId);


    /**
     * Updates an existing entry in the MESSAGERESOURCE table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     * @param the messageResource the MessageResource object to update in the database.
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     */
    public void updateMessageResource(MessageResource messageResource, Long userId) throws AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a MessageResourceFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per MessageResource.
     * @ return a MessageResourceFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public MessageResourceFilter loadMessageResourceFilter(Long userID) throws MessageResourceLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the MESSAGERESOURCEFILTER table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws MessageResourceSaveException on failure to save.  
     */
    public Long createAndStoreMessageResourceFilter(MessageResourceFilter messageResourceFilter, Long userId)
        throws MessageResourceSaveException;
    
    
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
        throws MessageResourceLoadException, MessageResourceSaveException, AuthorisationException, InvalidUserIDException;
    
	
	/**
	 * Returns a List of the View that own the MessageResource identified by the
	 * id given as a parameter.
	 * @param messageresourceId the id of the MessageResource for which the View should be resolved.
	 * @param userId the userId of the currently logged in user.
	 */
	public List<View> listViewByMessageResourceId(Long messageresourceId, Long userId);

}
    
