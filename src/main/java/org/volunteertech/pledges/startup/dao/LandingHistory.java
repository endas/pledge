package org.volunteertech.pledges.startup.dao;
import java.util.Date;
import java.math.BigDecimal;

/**
 * The main web screen
 * This class has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler for the Landing entity.
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
public class LandingHistory
{
	/** Hibernate Id */
	private Long id;
	
	/** id from the parent table for which this represents an historic record **/
	private Long landingID;
	 
         
    
    /** The user ID of the person that originally created the underlying record **/
    private Long createdByID;

    /** The user ID of the person that last updated the underlying record **/
    private Long updatedByID;

    /** The date that the underlying record was created DD/MM/YYYY-HH:MM format **/
    private Date dateCreated;

    /** The date that the underlying record was last updated DD/MM/YYYY-HH:MM format **/
    private Date dateUpdated;
    

    /**
     * Default Constructor for the Landing bean
     */
    public LandingHistory()
    {
    	landingID = new Long(0);
    	
    }
    
    /*
     * Returns the Id for the underlying database table record
     */
	public Long getId()
	{
        return id;
    }

	/**
	 * We usually do not manipulate the identity of an object, hence the setter method should be private.
	 */
	@SuppressWarnings("unused")
    private void setId(Long id)
    {
        this.id = id;
    }    


    /*
     * Returns the LandingID for the parent record
     */
	public Long getLandingID()
	{
        return landingID;
    }

	/**
	 * We usually do not manipulate the identity of an object, hence the setter method should be private.
	 */
	@SuppressWarnings("unused")
    private void setLandingID(Long landingID)
    {
        this.landingID = landingID;
    }    

    

    

    /**
     * sets the ID of the user that created the underlying record
     */
    public void setCreatedByID(Long createdByID)
    {
        this.createdByID = createdByID;
    }


    /**
     * gets the ID of the user that created the underlying record
     */
    public Long getCreatedByID()
    {
        return createdByID;
    }
     
     
    /**
     * sets the ID of the user that last updated the underlying record
     */
    public void setUpdatedByID(Long updatedByID)
    {
        this.updatedByID = updatedByID;
    }
     
     
    /**
     * gets the ID of the user that last updated the underlying record
     */
    public Long getUpdatedByID()
    {
        return updatedByID;
    }


    /**
     * sets the date that the underlying record was first created as a <code>java.util.Date</code> object
     */
    public void setDateCreated(Date dateCreated)
    {
        this.dateCreated = dateCreated;
    }

     
    /**
     * Gets the date that the underlying record was first created as a <code>java.util.Date</code> object
     */
    public Date getDateCreated()
    {
        return dateCreated;
    }

    /**
     * sets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     */
    public void setDateUpdated(Date dateUpdated)
    {
        this.dateUpdated = dateUpdated;
    }


    
    /**
     * Gets the date that the underlying record was last updated as a <code>java.util.Date</code> object
     */
    public Date getDateUpdated()
    {
        return dateUpdated;
    }
    
     
}
    
    
    

