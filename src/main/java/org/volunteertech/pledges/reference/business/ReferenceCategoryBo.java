package org.volunteertech.pledges.reference.business;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.reference.dao.ReferenceCategory;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryDao;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryFilter;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryHistory;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryLoadException;
import org.volunteertech.pledges.reference.dao.ReferenceCategorySaveException;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.math.BigDecimal;

import org.volunteertech.pledges.reference.business.ReferenceBo;
import org.volunteertech.pledges.reference.dao.Reference;



/**
 * The reference category screen is used to add/edit new/existing reference category entries. The reference entries are used to populate dropdowns where a group of reference entries with a common column-value can be associated with a dropdown.
 * This Interface has been generated by the XSLT processor from the meta data and represents the
 * interface of the Business Object(BO) for the ReferenceCategory entity. A Business Object
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
public interface ReferenceCategoryBo
{
    
    
    /**
     * Sets the required Data Access Object (DAO)
     * @param referenceCategoryDao the referenceCategoryDao used to access the referenceCategory entity.
     */
    public void setReferenceCategoryDao(ReferenceCategoryDao referenceCategoryDao);
    

    /**
     * Returns the required Data Access Object (DAO)
     * @return the ReferenceCategoryDao used to access the referenceCategory entity.
     */
    public ReferenceCategoryDao getReferenceCategoryDao();
    
    /**
     * Sets the required Business Object (BO) for the references association to
     * allow access to the underlying business methods.
     * @param referencesBo the ReferenceBo used to
     * access the business methods of the associated Reference entity.
     */
    public void setReferencesBo(ReferenceBo referencesBo);
    

    /**
     * Returns the required Business Object (BO) to allow access to the underlying Reference
     * business object that supports the referencesBo property 
     * @return the ReferenceBo used to manipulate the underlying Reference object.
     */
    public ReferenceBo getReferencesBo();
        


    
    /**
     * Loads a ReferenceCategory object based on the REFERENCECATEGORYID column
     * @param REFERENCECATEGORYID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a ReferenceCategory object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public ReferenceCategory load(Long referenceCategoryID, Long loggedInUserId) throws ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
    
    

    /**
     * Load all existing ReferenceCategory objects. 
     * @return List a List of ReferenceCategory objects.
     */
    public List<ReferenceCategory> listReferenceCategory();
    
    
    /**
     * Returns a <code>List</code> of ReferenceCategory objects that have a matching referenceCategoryDesc
     * @return List a List of ReferenceCategory objects that match the referenceCategoryDesc property given as parameter.
     * @param referenceCategoryDesc the referenceCategoryDesc on which to match the required records.
     */
    public List<ReferenceCategory> listReferenceCategoryByReferenceCategoryDesc(String referenceCategoryDesc);

    /**
     * Returns a <code>List</code> of ReferenceCategory objects that have a matching parentCategoryId
     * @return List a List of ReferenceCategory objects that match the parentCategoryId property given as parameter.
     * @param parentCategoryId the parentCategoryId on which to match the required records.
     */
    public List<ReferenceCategory> listReferenceCategoryByParentCategoryId(Long parentCategoryId);

    /**
     * Returns a <code>List</code> of ReferenceCategory objects that have a matching description
     * @return List a List of ReferenceCategory objects that match the description property given as parameter.
     * @param description the description on which to match the required records.
     */
    public List<ReferenceCategory> listReferenceCategoryByDescription(String description);

    
    /**
     * Load existing ReferenceCategory objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of ReferenceCategory objects that match the userId parameter.
     */
    public List<ReferenceCategory> listReferenceCategoryByCreatedById(Long userId);
    
    
    /**
     * Load all existing ReferenceCategoryHistory objects for a particular ReferenceCategory.
     * The <code>List</code> of ReferenceCategoryHistory objects contains all of the changes that have been made to the
     * ReferenceCategory object identified by the referenceCategory parameter'
     * @return List a List of ReferenceCategoryHistory objects.
     */
    public List<ReferenceCategoryHistory> listReferenceCategoryHistory(Long referenceCategory) throws Exception;
    
    
    /**
     * Returns a List of associated Reference objects that represent the references property
     * and that are defined by the many-to-many relationship defined as ReferenceCategory.references.
     * @return the <code>List</code> of the associated Reference objects that represent the references property.
     */
    public List<Reference> getReferences(Long referenceCategoryId, Long userId) throws ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
    
    /**
     * Adds a Reference to the Set of associated Reference objects that represent the references property
     * and that are defined by the many-to-many relationship defined as ReferenceCategory.references.
     * @return the updated <code>List</code> of the associated Reference objects that represent the references property.
     */
    public List<Reference> addReferenceToReferences(Reference references, Long referenceCategoryId, Long userId) throws ReferenceCategorySaveException, ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
      
    
    /**
     * Creates a new entry in the REFERENCECATEGORY table containing the parameters passed here.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the database generated Id of the newly created record.
     * @throws ReferenceCategorySaveException on failure to save.  
     */
    public Long createAndStoreReferenceCategory(ReferenceCategory referenceCategory, Long userID)
        throws ReferenceCategorySaveException;


    /**
     * Updates an existing entry in the REFERENCECATEGORY table containing the parameters passed here.
     * Only non-null parameters will be applied to the underlying table so preserving any existing entries.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws ReferenceCategoryLoadException if the existing record cannot be loaded
     * @throws ReferenceCategorySaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void updateReferenceCategory(ReferenceCategory referenceCategory, Long userID)
        throws ReferenceCategorySaveException, ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;
    
    
    /**
     * Loads a ReferenceCategoryFilter object based on the participantID of the currently logged in user
     * @param userId the userId is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per ReferenceCategory.
     * @ return a ReferenceCategoryFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public ReferenceCategoryFilter loadReferenceCategoryFilter(Long userId) throws ReferenceCategoryLoadException, AuthorisationException, InvalidUserIDException;


    
    /**
     * Creates a new entry in the REFERENCECATEGORYFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
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
    
