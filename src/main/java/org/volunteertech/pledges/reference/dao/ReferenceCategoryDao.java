package org.volunteertech.pledges.reference.dao;
import org.hibernate.SessionFactory;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.reference.dao.ReferenceCategory;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryHistory;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryLoadException;
import org.volunteertech.pledges.reference.dao.ReferenceCategorySaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;


import org.volunteertech.pledges.reference.dao.Reference;



/**
 * The reference category screen is used to add/edit new/existing reference category entries. The reference entries are used to populate dropdowns where a group of reference entries with a common column-value can be associated with a dropdown.
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the data access object(DAO) for the ReferenceCategory entity.
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
public interface ReferenceCategoryDao
{

    /**
     * Allows Spring to set the container managed SessionFactory instance
     * @param a Spring managed SessionFactory instance
     */    
    public void setSessionFactory(SessionFactory sessionFactory);


    /**
     * Loads a ReferenceCategory object based on the referenceCategoryId column
     * @param referenceCategoryId the primary key for the underlying record.
     * @ return a ReferenceCategory object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public ReferenceCategory load(Long referenceCategoryId, Long loggedInUserId) throws AuthorisationException, InvalidUserIDException;
    

    /**
     * Load all existing ReferenceCategory objects from the database. Hibernate will generate the appropriate SQL,
     * send it to the database and populate a List of ReferenceCategory objects with the data.
     * @return List a List of ReferenceCategory objects.
     */
    public List<ReferenceCategory> listReferenceCategory();
    
    
    /**
     * Load existing ReferenceCategory objects from the database that have a referenceCategoryDesc column
     * that matches the referenceCategoryDesc parameter.
     * @return List a List of ReferenceCategory objects that match the referenceCategoryDesc parameter.
     */
    public List<ReferenceCategory> listReferenceCategoryByReferenceCategoryDesc(String referenceCategoryDesc);

    /**
     * Load existing ReferenceCategory objects from the database that have a parentCategoryId column
     * that matches the parentCategoryId parameter.
     * @return List a List of ReferenceCategory objects that match the parentCategoryId parameter.
     */
    public List<ReferenceCategory> listReferenceCategoryByParentCategoryId(Long parentCategoryId);

    /**
     * Load existing ReferenceCategory objects from the database that have a description column
     * that matches the description parameter.
     * @return List a List of ReferenceCategory objects that match the description parameter.
     */
    public List<ReferenceCategory> listReferenceCategoryByDescription(String description);

    
    /**
     * Load existing ReferenceCategory objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of ReferenceCategory objects that match the userId parameter.
     */
    public List<ReferenceCategory> listReferenceCategoryByCreatedById(Long userId);
    
    
    /**
     * Load all existing ReferenceCategoryHistory objects for a particular ReferenceCategory from the database.
     * Hibernate will generate the appropriate SQL,
     * send it to the database and populate ReferenceCategoryHistory objects with the data.
     * @return List a List of ReferenceCategoryHistory objects.
     */
    public List<ReferenceCategoryHistory> listReferenceCategoryHistory(Long referenceCategory);
    
    
    /**
     * Adds a Reference to the Set of associated Reference objects that represent the references property
     * and that are defined by the many-to-many relationship defined as ReferenceCategory.references.
     * @return the updated <code>List</code> of the associated Reference objects that represent the references property.
     */
    public List<Reference> addReferenceToReferences(Reference references, Long referenceCategoryId, Long userId) throws ReferenceCategorySaveException, ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Returns a List representing the Set of associated Reference objects that represent the references property
     * and that are defined by the many-to-many relationship defined as ReferenceCategory.references.
     * @return the <code>List</code> of the associated Reference objects that represent the references property.
     */
    public List<Reference> getReferences(Long referenceCategoryId, Long userId) throws ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Updates an Reference in the references property and returns a List representing the Set of associated Reference objects that represent the references property
     * and that are defined by the many-to-many relationship defined as ReferenceCategory.references.
     * @return the <code>List</code> of the associated Reference objects that represent the references property.
     */
    public List<Reference> updateReferences(Long referenceCategoryId, Reference reference, Long userId) throws ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
  
    
    
    /**
     * Creates a new entry in the REFERENCECATEGORY table containing the parameters passed here.
     *
     * @param userID the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     */
    public Long createAndStoreReferenceCategory(ReferenceCategory referenceCategory, Long userId);


    /**
     * Updates an existing entry in the REFERENCECATEGORY table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     * @param the referenceCategory the ReferenceCategory object to update in the database.
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     */
    public void updateReferenceCategory(ReferenceCategory referenceCategory, Long userId) throws AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a ReferenceCategoryFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per ReferenceCategory.
     * @ return a ReferenceCategoryFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ReferenceCategoryFilter loadReferenceCategoryFilter(Long userID) throws ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the REFERENCECATEGORYFILTER table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws ReferenceCategorySaveException on failure to save.  
     */
    public Long createAndStoreReferenceCategoryFilter(ReferenceCategoryFilter referenceCategoryFilter, Long userId)
        throws ReferenceCategorySaveException;
    
    
    /**
     * Updates an existing entry in the REFERENCECATEGORYFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ReferenceCategorySaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateReferenceCategoryFilter(ReferenceCategoryFilter referenceCategoryFilter, Long userId)
        throws ReferenceCategoryLoadException, ReferenceCategorySaveException, AuthorisationException, InvalidUserIDException;
    
	
}
    
