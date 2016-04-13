package org.volunteertech.pledges.servicepledge.dao;
import org.hibernate.SessionFactory;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.servicepledge.dao.ServicePledge;
import org.volunteertech.pledges.servicepledge.dao.ServicePledgeHistory;
import org.volunteertech.pledges.servicepledge.dao.ServicePledgeLoadException;
import org.volunteertech.pledges.servicepledge.dao.ServicePledgeSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;


import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;




/**
 * The pledge services screen is used to add/edit a new/existing pledge of services
 * This class has been generated by the XSLT processor from the metadata and represents the
 * implementation of the data access object for the ServicePledge entity.
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
public class ServicePledgeDaoImpl implements ServicePledgeDao
{
    /**
     * The Hibernate SessionFactory instance
     */
    private SessionFactory sessionFactory;
    
    
    

    /**
     * Default Constructor for the ServicePledge entity data manager
     */
    public ServicePledgeDaoImpl()
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
     * Loads a ServicePledge object based on the servicePledgeId column
     * @param ServicePledgeId the primary key for the underlying record.
     * @ return a ServicePledge object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public ServicePledge load(Long servicePledgeId, Long loggedInUserId) throws AuthorisationException, InvalidUserIDException
    {
        if (Authorisation.isAuthorisedView("ServicePledge", loggedInUserId, servicePledgeId) == false)
        {
        	throw new AuthorisationException();
        }
    
    	ServicePledge hibernateEntity = null;
    	
        if (servicePledgeId != null)
        {
			hibernateEntity = (ServicePledge)this.sessionFactory.getCurrentSession().get(ServicePledgeImpl.class, servicePledgeId);

            // Load all related singular objects
            
        }
    	
        return hibernateEntity;
    }
    
    
    

    /**
     * Load all existing ServicePledge objects from the database. Hibernate will generate the appropriate SQL,
     * send it to the database and populate ServicePledge objects with the data.
     * @return List a List of ServicePledge objects.
     */
    public List<ServicePledge> listServicePledge()
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge order by servicePledge.id asc").list();

        return result;
    }

    
    /**
     * Load existing ServicePledge objects from the database that have a pledgeServiceLevelOne column
     * that matches the pledgeServiceLevelOne parameter.
     * @return List a List of ServicePledge objects that match the pledgeServiceLevelOne parameter.
     */
    public List<ServicePledge> listServicePledgeByPledgeServiceLevelOne(Long pledgeServiceLevelOne)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.pledgeServiceLevelOne = :pledgeservicelevelone order by servicePledge.id asc").setParameter("pledgeservicelevelone", pledgeServiceLevelOne).list();

        return result;
    }

    /**
     * Load existing ServicePledge objects from the database that have a pledgeServiceLevelTwo column
     * that matches the pledgeServiceLevelTwo parameter.
     * @return List a List of ServicePledge objects that match the pledgeServiceLevelTwo parameter.
     */
    public List<ServicePledge> listServicePledgeByPledgeServiceLevelTwo(Long pledgeServiceLevelTwo)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.pledgeServiceLevelTwo = :pledgeserviceleveltwo order by servicePledge.id asc").setParameter("pledgeserviceleveltwo", pledgeServiceLevelTwo).list();

        return result;
    }

    /**
     * Load existing ServicePledge objects from the database that have a pledgeServiceLevelThree column
     * that matches the pledgeServiceLevelThree parameter.
     * @return List a List of ServicePledge objects that match the pledgeServiceLevelThree parameter.
     */
    public List<ServicePledge> listServicePledgeByPledgeServiceLevelThree(Long pledgeServiceLevelThree)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.pledgeServiceLevelThree = :pledgeservicelevelthree order by servicePledge.id asc").setParameter("pledgeservicelevelthree", pledgeServiceLevelThree).list();

        return result;
    }

    /**
     * Load existing ServicePledge objects from the database that have a additionalInformation column
     * that matches the additionalInformation parameter.
     * @return List a List of ServicePledge objects that match the additionalInformation parameter.
     */
    public List<ServicePledge> listServicePledgeByAdditionalInformation(String additionalInformation)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.additionalInformation = :additionalinformation order by servicePledge.id asc").setParameter("additionalinformation", additionalInformation).list();

        return result;
    }

    /**
     * Load existing ServicePledge objects from the database that have a pledgeServiceQualification column
     * that matches the pledgeServiceQualification parameter.
     * @return List a List of ServicePledge objects that match the pledgeServiceQualification parameter.
     */
    public List<ServicePledge> listServicePledgeByPledgeServiceQualification(String pledgeServiceQualification)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.pledgeServiceQualification = :pledgeservicequalification order by servicePledge.id asc").setParameter("pledgeservicequalification", pledgeServiceQualification).list();

        return result;
    }

    /**
     * Load existing ServicePledge objects from the database that have a pledgeServiceDateAvailable column
     * that matches the pledgeServiceDateAvailable parameter.
     * @return List a List of ServicePledge objects that match the pledgeServiceDateAvailable parameter.
     */
    public List<ServicePledge> listServicePledgeByPledgeServiceDateAvailable(Date pledgeServiceDateAvailable)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.pledgeServiceDateAvailable = :pledgeservicedateavailable order by servicePledge.id asc").setParameter("pledgeservicedateavailable", pledgeServiceDateAvailable).list();

        return result;
    }

    /**
     * Load existing ServicePledge objects from the database that have a pledgeServiceHoursPerWeek column
     * that matches the pledgeServiceHoursPerWeek parameter.
     * @return List a List of ServicePledge objects that match the pledgeServiceHoursPerWeek parameter.
     */
    public List<ServicePledge> listServicePledgeByPledgeServiceHoursPerWeek(Long pledgeServiceHoursPerWeek)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.pledgeServiceHoursPerWeek = :pledgeservicehoursperweek order by servicePledge.id asc").setParameter("pledgeservicehoursperweek", pledgeServiceHoursPerWeek).list();

        return result;
    }

    
    /**
     * Load existing ServicePledge objects from the database that have a createdByID column
     * that matches the createdById parameter.
     * @return List a List of ServicePledge objects that match the createdById parameter.
     */
    public List<ServicePledge> listServicePledgeByCreatedById(Long userId)
    {
        @SuppressWarnings("unchecked")
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.createdByID = :userId order by servicePledge.id asc").setParameter("userId", userId).list();

        return result;
    }
    
    
    /**
     * Load all existing ServicePledgeHistory objects for a particular ServicePledge from the database.
     * Hibernate will generate the appropriate SQL,
     * send it to the database and populate a List of ServicePledgeHistory objects with the data.
     * @return List a List of ServicePledgeHistory objects.
     */
    public List<ServicePledgeHistory> listServicePledgeHistory(Long servicePledge)
    {
        
        @SuppressWarnings("unchecked")
        List<ServicePledgeHistory> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeHistory as servicePledgeHistory where servicePledgeHistory.servicePledgeId = ? order by servicePledgeHistory.id asc").setLong(0, servicePledge).list();

        return result;
    }
    
    
    /**
     * Load a <code>List</code> of ServicePledge objects from the database that match the
     * registerOfPledgesId parameter, the RegisterOfPledges and the ServicePledge defined as the one-to-many association in RegisterOfPledges.servicePledges in ApplicationDef.xml.
     * @return a <code>List</code> of ServicePledge objects that match the registerOfPledgesId parameter.
     */
    public List<ServicePledge> listServicePledgeByRegisterOfPledgesId(Long  registerOfPledgesId)
    {
        @SuppressWarnings("unchecked")
        
        List<ServicePledge> result = this.sessionFactory.getCurrentSession().createQuery("from ServicePledgeImpl as servicePledge where servicePledge.registerOfPledges.id = :registerOfPledgesId order by servicePledge.id asc").setParameter("registerOfPledgesId", registerOfPledgesId).list();

        return result;
    }
  
    
    /**
     * Creates a new entry in the SERVICEPLEDGE table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     * @throws ServicePledgeSaveException on failure to save.  
     */
    public Long createAndStoreServicePledge(ServicePledge servicePledge, Long userId)
    {
    	Long returnValue = new Long(0);

        servicePledge.setCreatedByID(userId);
        servicePledge.setUpdatedByID(userId);
        servicePledge.setDateCreated(new Date());
        servicePledge.setDateUpdated(new Date());
        
        this.sessionFactory.getCurrentSession().save(servicePledge);
            
        returnValue = servicePledge.getId();
		
		return returnValue;
    }


    /**
     * Updates an existing entry in the SERVICEPLEDGE table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @param the servicePledge the ServicePledge object to update in the database.
     * @param userId the userId of the currently logged in user. 
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userId passed as parameter is not valid
     */
    public void updateServicePledge(ServicePledge servicePledge, Long userId) throws AuthorisationException, InvalidUserIDException
    {
        if (Authorisation.isAuthorisedUpdate("ServicePledge", userId, servicePledge.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
        servicePledge.setUpdatedByID(userId);
        servicePledge.setDateUpdated(new Date());
        this.sessionFactory.getCurrentSession().update(servicePledge);
    }
    
    
    /**
     * Loads a ServicePledgeFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per ServicePledge.
     * @ return a ServicePledgeFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ServicePledgeFilter loadServicePledgeFilter(Long userID) throws ServicePledgeLoadException, AuthorisationException, InvalidUserIDException
    {
    	ServicePledgeFilter hibernateEntity = null;
    	
        /*if (Authorisation.isAuthorisedView("ServicePledge", userID, SERVICEPLEDGEID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userID != null)
        {
        	
        	try
        	{
				hibernateEntity = (ServicePledgeFilter)this.sessionFactory.getCurrentSession().load(ServicePledgeFilter.class, userID);
        	}
			catch (Exception ex)
			{
			     throw new ServicePledgeLoadException("ServicePledgeEntityDataManager::loadServicePledgeFilter", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return hibernateEntity;
    }
    
    /**
     * Creates a new entry in the SERVICEPLEDGEFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userID which is also the assigned Id for the newly created record.
     * @throws ServicePledgeSaveException on failure to save.  
     */
    public Long createAndStoreServicePledgeFilter(ServicePledgeFilter servicePledgeFilter,  Long userId)
        throws ServicePledgeSaveException
    {
    	Long returnValue = new Long(0);
        

		try
		{
            servicePledgeFilter.setId(userId);
            servicePledgeFilter.setCreatedByID(userId);
            servicePledgeFilter.setUpdatedByID(userId);
            servicePledgeFilter.setDateCreated(new Date());
            servicePledgeFilter.setDateUpdated(new Date());

            this.sessionFactory.getCurrentSession().save(servicePledgeFilter);
            
            returnValue = servicePledgeFilter.getId();
		}
		catch (Exception ex)
		{
		     throw new ServicePledgeSaveException("ServicePledgeEntityDataManager::createAndStoreServicePledgeFilter", ex);
		}		
		
		return returnValue;
    }
    
    
    /**
     * Updates an existing entry in the SERVICEPLEDGEFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ServicePledgeSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateServicePledgeFilter(ServicePledgeFilter servicePledgeFilter, Long userId)
        throws ServicePledgeLoadException, ServicePledgeSaveException, AuthorisationException, InvalidUserIDException
    {
    	Long returnValue = new Long(0);
    	
        //if (Authorisation.isAuthorisedUpdate("ServicePledge", userID, SERVICEPLEDGEID) == false)
        //{
        //	throw new AuthorisationException();
        //}
    	
		try
		{
			servicePledgeFilter.setId(userId);
            servicePledgeFilter.setUpdatedByID(userId);
            servicePledgeFilter.setDateUpdated(new Date());
            this.sessionFactory.getCurrentSession().update(servicePledgeFilter);
            returnValue = servicePledgeFilter.getId();
        }
		catch (Exception ex)
		{
		     throw new ServicePledgeSaveException("ServicePledgeDaoImpl::updateServicePledgeFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }
    
	
	/**
	 * Returns a List of the RegisterOfPledges that own the ServicePledge identified by the
	 * id given as a parameter.
	 * @param servicePledgeId the id of the ServicePledge for which the RegisterOfPledges should be resolved.
	 * @param userId the userId of the currently logged in user.
	 */
	public List<RegisterOfPledges> listRegisterOfPledgesByServicePledgeId(Long servicePledgeId, Long userId){
		@SuppressWarnings("unchecked")
		List<RegisterOfPledges> result = this.sessionFactory.getCurrentSession().createQuery("select distinct registerOfPledges from RegisterOfPledgesImpl as registerOfPledges inner join registerOfPledges.servicePledges as servicePledge where servicePledge.id = :servicePledgeId order by registerOfPledges.id asc").setParameter("servicePledgeId", servicePledgeId).list();
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
    
