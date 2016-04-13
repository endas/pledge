package org.volunteertech.pledges.reference.dao;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.math.BigDecimal;


import org.volunteertech.pledges.reference.dao.Reference;




/**
 * The reference category screen is used to add/edit new/existing reference category entries. The reference entries are used to populate dropdowns where a group of reference entries with a common column-value can be associated with a dropdown.
 * This Interface has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler interface for the ReferenceCategory entity.
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public interface ReferenceCategory extends Serializable { 

    public enum CurrentMode{
    	ADD,UPDATE,LOCALIZE;
    	
    	public String toString(){
    		switch(this){
    			case ADD: return "ADD";
    			case UPDATE: return "UPDATE";
    			case LOCALIZE: return "LOCALIZE";
    			default: return "UNKNOWN";
    		}	
    	}
    }
    	
    /**
     * Returns the Id for the underlying database table record
     * @return the Id for the underlying database table record
     */
	public Long getId();
	
    /**
     * Sets the Id. This allows front-end forms to bind the id property.
     * @param id the Id for the underlying database table record.
     */
	public void setId(Long id);
	
    /**
     * Returns the parentObjectId when this object has been populated via a restful webservice JSON mapping
     * @return the parentObjectId when this object has been populated via a restful webservice JSON mapping
     */
	public Long getParentObjectId();
	
    /**
     * Sets the parentObjectId. This allows restful web services to bind the parentId property when adding a new record.
     * @param parentObjectId allows restful web services to bind the parentId property when adding a new record.
     */
	public void setParentObjectId(Long parentObjectId);
    
    
    /**
     * Sets the reference category
     * @param referenceCategoryDesc is the reference category
     */
    public void setReferenceCategoryDesc(String referenceCategoryDesc);

    /**
     * Returns the reference category
     * @return the reference category
     */
    public String getReferenceCategoryDesc();
    
    
    /**
     * Sets the column-value that allows an entry to be linked to a parent entity
     * @param parentCategoryId is the column-value that allows an entry to be linked to a parent entity
     */
    public void setParentCategoryId(Long parentCategoryId);

    /**
     * Returns the column-value that allows an entry to be linked to a parent entity
     * @return the column-value that allows an entry to be linked to a parent entity
     */
    public Long getParentCategoryId();
    
    
    /**
     * Sets a user friendly description of the reference item
     * @param description is a user friendly description of the reference item
     */
    public void setDescription(String description);

    /**
     * Returns a user friendly description of the reference item
     * @return a user friendly description of the reference item
     */
    public String getDescription();
    
    /**
     * Sets the <code>Set</code> of Reference defined as the many-to-many association in ReferenceCategory.references in ApplicationDef.xml
     * @param references is This section lists the referencees that belong to this caregory. defined as the many-to-many association in ReferenceCategory.references in ApplicationDef.xml 
     */
    public void setReferences(Set<Reference> references);

    /**
     * Returns the <code>Set</code> of Reference defined as the many-to-many association in ReferenceCategory.references in ApplicationDef.xml
     * @return This section lists the referencees that belong to this caregory.. The <code>Set</code> of Reference defined as the many-to-many association in ReferenceCategory.references in ApplicationDef.xml
     */
    public Set<Reference> getReferences();
    

    /**
     * sets the Id of the user that created the underlying record
     * @param createdByID the Id of the user that created the underlying record
     */
    public void setCreatedByID(Long createdByID);
    
    /**
     * gets the Id of the user that created the underlying record
     * @return the Id of the user that created the underlying record
     */
    public Long getCreatedByID();
         
   	/**
     * sets the Id of the user that last updated the underlying record
     * @param updatedByID the Id of the user that last updated the underlying record
     */
    public void setUpdatedByID(Long updatedByID);
     
    /**
     * gets the Id of the user that last updated the underlying record
     * @return the Id of the user that last updated the underlying record
     */
    public Long getUpdatedByID();

    /**
     * sets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @param dateCreated the date that the underlying record was first created
     */
    public void setDateCreated(Date dateCreated);

    /**
     * Gets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @return the date that the underlying record was first created
     */
    public Date getDateCreated();

    /**
     * Sets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @param dateUpdated the date that the underlying record was last updated
     */
    public void setDateUpdated(Date dateUpdated);
    
    /**
     * Gets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @return the date that the underlying record was last updated
     */
    public Date getDateUpdated();
    
    /**
     * Checks for a newly created entity object
     * @return true if this is a newly created entity object meaning that it has not yet been persisted, otherwise false
     */
	public boolean isNew();
	
	/**
	 * Sets the current mode of use for the entity object;
	 * @param mode a member of the CurrentMode enumeration
	 */
	public void setCurrentMode(CurrentMode mode);

    /**
     * Returns the current mode under which the class instance was loaded
     * @return A member of the CurrentMode Enumeration
     */
	public CurrentMode getCurrentMode();
}
    
    
    

