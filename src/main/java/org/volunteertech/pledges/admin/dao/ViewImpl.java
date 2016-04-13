package org.volunteertech.pledges.admin.dao;

import org.volunteertech.pledges.admin.dao.View;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonIgnore;


import org.volunteertech.pledges.localisation.dao.MessageResource;




/**
 * The Views that are contained in the application
 * This class has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler for the View entity.
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
public class ViewImpl implements View, Serializable { 

    private static final long serialVersionUID = 1L;
    
	/** Entity Id */
	private Long id;
	
    /** id of a parent object used when adding objects via JSON enabled restful web services */
    private Long parentObjectId;
    
    /**
     * Used to store the current processing mode during which the object was loaded
     */
    private CurrentMode currentMode;

    
    /** the name of the view */
    private String viewName;
	
    /** The Set of associated MessageResource Objects defined as View.messageResource in ApplicationDef.xml **/
    @JsonIgnore
    private Set<MessageResource> messageResource = new HashSet<MessageResource>();
  

    /** The user ID of the person that originally created the underlying record **/
    private Long createdByID;

    /** The user ID of the person that last updated the underlying record **/
    private Long updatedByID;

    /** The date that the underlying record was created DD/MM/YYYY-HH:MM format **/
    private Date dateCreated;

    /** The date that the underlying record was last updated DD/MM/YYYY-HH:MM format **/
    private Date dateUpdated;
    

    /**
     * Default Constructor for the View bean
     */
    public ViewImpl()
    {
    	
		this.viewName = new String();
		
    	this.dateCreated = new Date();
    	this.dateUpdated = new Date();
    }
    
    /**
     * Returns the Id for the underlying database table record
     * @return the Id for the underlying database table record
     */
	public Long getId()
	{
        return id;
    }

    /**
     * Sets the Id. This allows front-end forms to bind the id property.
     * @param id the Id for the underlying database table record.
     */
	public void setId(Long id)
	{
        this.id = id;
    }

    /**
     * Returns the parentObjectId when this object has been populated via a restful webservice JSON mapping
     * @return the parentObjectId when this object has been populated via a restful webservice JSON mapping
     */
	public Long getParentObjectId()
	{
        return parentObjectId;
    }

    /**
     * Sets the parentObjectId. This allows restful web services to bind the parentId property when adding a new record.
     * @param parentObjectId allows restful web services to bind the parentId property when adding a new record.
     */
	public void setParentObjectId(Long parentObjectId)
	{
        this.parentObjectId = parentObjectId;
    }

    
    
    /**
     * Sets the name of the view
     * @param viewName is the name of the view
     */
    public void setViewName(String viewName)
    {
      this.viewName = viewName;
    }

    /**
     * Returns the name of the view
     * @return the name of the view
     */
    public String getViewName()
    {
      return viewName;
    }
    
    
    /**
     * Sets the <code>Set</code> of MessageResource defined as the one-to-many association in View.messageResource in ApplicationDef.xml
     * @param messageResource is This section lists the localized messages that are displayed on this view. defined as the one-to-many association in View.messageResource in ApplicationDef.xml 
     */
    public void setMessageResource(Set<MessageResource> messageResource)
    {
      this.messageResource = messageResource;
    }

    /**
     * Returns the <code>Set</code> of MessageResource defined as the one-to-many association in View.messageResource in ApplicationDef.xml
     * @return This section lists the localized messages that are displayed on this view.. The <code>Set</code> of MessageResource defined as the one-to-many association in View.messageResource in ApplicationDef.xml
     */
    public Set<MessageResource> getMessageResource()
    {
      return this.messageResource;
    }
    

    /**
     * sets the Id of the user that created the underlying record
     * @param createdByID the Id of the user that created the underlying record
     */
    public void setCreatedByID(Long createdByID)
    {
        this.createdByID = createdByID;
    }

    /**
     * gets the Id of the user that created the underlying record
     * @return the Id of the user that created the underlying record
     */
    public Long getCreatedByID()
    {
        return createdByID;
    }
     
   	/**
     * sets the Id of the user that last updated the underlying record
     * @param updatedByID the Id of the user that last updated the underlying record
     */
    public void setUpdatedByID(Long updatedByID)
    {
        this.updatedByID = updatedByID;
    }
     
    /**
     * gets the Id of the user that last updated the underlying record
     * @return the Id of the user that last updated the underlying record
     */
    public Long getUpdatedByID()
    {
        return updatedByID;
    }

    /**
     * sets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @param dateCreated the date that the underlying record was first created
     */
    public void setDateCreated(Date dateCreated)
    {
        this.dateCreated = dateCreated;
    }

    /**
     * Gets the date that the underlying record was first created as a <code>java.util.Date</code> object
     * @return the date that the underlying record was first created
     */
    public Date getDateCreated()
    {
        return dateCreated;
    }

    /**
     * Sets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @param dateUpdated the date that the underlying record was last updated
     */
    public void setDateUpdated(Date dateUpdated)
    {
        this.dateUpdated = dateUpdated;
    }

    /**
     * Gets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     * @return the date that the underlying record was last updated
     */
    public Date getDateUpdated()
    {
        return dateUpdated;
    }
    
    /**
     * Checks for a newly created entity object
     * @return true if this is a newly created entity object meaning that it has not yet been persisted, otherwise false
     */
	public boolean isNew() {
		return (this.id == null);
	}
	
	/**
	 * Sets the current mode of use for the entity object;
	 * @param mode a member of the CurrentMode enumeration
	 */
	public void setCurrentMode(CurrentMode mode){
		this.currentMode = mode;
	}	

    /**
     * Returns the current mode under which the class instance was loaded
     * @return A member of the CurrentMode Enumeration
     */
	public CurrentMode getCurrentMode() {
		return this.currentMode;
	}
    
    
     @Override
     public String toString(){
    	return "View [id=" + id + ", " + "viewName=" + viewName + "]";
     }
}
    
    
    

