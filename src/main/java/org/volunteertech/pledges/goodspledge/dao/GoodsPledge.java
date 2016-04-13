package org.volunteertech.pledges.goodspledge.dao;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.math.BigDecimal;


import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;




/**
 * The goods pledge screen is used to add/edit a new/existing pledge of services
 * This Interface has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler interface for the GoodsPledge entity.
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
public interface GoodsPledge extends Serializable { 

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
     * Sets the parent GoodsCategory of the address type that has been chosen by the user
     * @param pledgedGoodsGoodsCategory is the parent of the address type
     */
    public void setPledgedGoodsGoodsCategory(Long pledgedGoodsGoodsCategory);
    
    /**
     * Returns the parent GoodsCategory of the address type that has been chosen by the user or saved in the database
     * @return the parent GoodsCategory of the address type
     */
    public Long getPledgedGoodsGoodsCategory();
    
    /**
     * Sets the translated reference mapping for the parent GoodsCategory of the address type that has been chosen by the user
     * @param pledgedGoodsGoodsCategory is the the translated reference mapping for the parent of the address type
     */
    public void setPledgedGoodsGoodsCategoryReferenceTranslation(String pledgedGoodsGoodsCategory);

    /**
     * Returns the translated reference mapping for the parent GoodsCategory of the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the parent GoodsCategory of the address type
     */
    public String getPledgedGoodsGoodsCategoryReferenceTranslation();    
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param pledgedGoods is the address type
     */
    public void setPledgedGoods(Long pledgedGoods);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getPledgedGoods();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for pledgedGoods is the address type
     */
    public void setPledgedGoodsReferenceTranslation(String pledgedGoodsReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getPledgedGoodsReferenceTranslation();
      
    
    /**
     * Sets the participant comments
     * @param additionalInformation is the participant comments
     */
    public void setAdditionalInformation(String additionalInformation);

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getAdditionalInformation();
    
    
    /**
     * Sets the participant comments
     * @param itemSize is the participant comments
     */
    public void setItemSize(String itemSize);

    /**
     * Returns the participant comments
     * @return the participant comments
     */
    public String getItemSize();
    
    
    /**
     * Sets the address type that has been chosen by the user
     * @param goodsCondition is the address type
     */
    public void setGoodsCondition(Long goodsCondition);

    /**
     * Returns the address type that has been chosen by the user or saved in the database
     * @return the address type
     */
    public Long getGoodsCondition();
    
    /**
     * Sets the translated reference mapping for the address type that has been chosen by the user
     * @param the translated reference mapping for goodsCondition is the address type
     */
    public void setGoodsConditionReferenceTranslation(String goodsConditionReferenceTranslation);

    /**
     * Returns the translated reference mapping for the address type that has been chosen by the user or saved in the database
     * @return the translated reference mapping for the address type
     */
    public String getGoodsConditionReferenceTranslation();
      
    
    /**
     * Sets the address type
     * @param numberOfItems is the address type
     */
    public void setNumberOfItems(Long numberOfItems);

    /**
     * Returns the address type
     * @return the address type
     */
    public Long getNumberOfItems();
    
    /**
     * Sets the associated RegisterOfPledges mapped as the registerOfPledges property
     * @param the associated RegisterOfPledges mapped as the registerOfPledges property
     */
    public void setRegisterOfPledges(RegisterOfPledges registerOfPledges);

    /**
     * Returns the associated RegisterOfPledges mapped as the registerOfPledges property
     * @return the associated RegisterOfPledges mapped as the registerOfPledges property
     */
    public RegisterOfPledges getRegisterOfPledges();
  

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
    
    
    

