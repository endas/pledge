package org.volunteertech.pledges.startup.dao;
import org.hibernate.SessionFactory;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.startup.dao.Landing;
import org.volunteertech.pledges.startup.dao.LandingHistory;
import org.volunteertech.pledges.startup.dao.LandingLoadException;
import org.volunteertech.pledges.startup.dao.LandingSaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;




/**
 * The main web screen
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the data access object(DAO) for the Landing entity.
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
public interface LandingDao
{

    /**
     * Allows Spring to set the container managed SessionFactory instance
     * @param a Spring managed SessionFactory instance
     */    
    public void setSessionFactory(SessionFactory sessionFactory);


    /**
     * Loads a Landing object based on the landingId column
     * @param landingId the primary key for the underlying record.
     * @ return a Landing object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public Landing load(Long landingId, Long loggedInUserId) throws AuthorisationException, InvalidUserIDException;
    

    /**
     * Load all existing Landing objects from the database. Hibernate will generate the appropriate SQL,
     * send it to the database and populate a List of Landing objects with the data.
     * @return List a List of Landing objects.
     */
    public List<Landing> listLanding();
    
    
    
    /**
     * Load existing Landing objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of Landing objects that match the userId parameter.
     */
    public List<Landing> listLandingByCreatedById(Long userId);
    
    
    /**
     * Load all existing LandingHistory objects for a particular Landing from the database.
     * Hibernate will generate the appropriate SQL,
     * send it to the database and populate LandingHistory objects with the data.
     * @return List a List of LandingHistory objects.
     */
    public List<LandingHistory> listLandingHistory(Long landing);
    
    
    
    
    /**
     * Creates a new entry in the LANDING table containing the parameters passed here.
     *
     * @param userID the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     */
    public Long createAndStoreLanding(Landing landing, Long userId);


    /**
     * Updates an existing entry in the LANDING table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     * @param the landing the Landing object to update in the database.
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     */
    public void updateLanding(Landing landing, Long userId) throws AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a LandingFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per Landing.
     * @ return a LandingFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public LandingFilter loadLandingFilter(Long userID) throws LandingLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the LANDINGFILTER table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws LandingSaveException on failure to save.  
     */
    public Long createAndStoreLandingFilter(LandingFilter landingFilter, Long userId)
        throws LandingSaveException;
    
    
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
        throws LandingLoadException, LandingSaveException, AuthorisationException, InvalidUserIDException;
    
	
}
    
