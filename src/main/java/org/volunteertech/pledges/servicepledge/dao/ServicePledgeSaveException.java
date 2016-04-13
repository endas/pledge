package org.volunteertech.pledges.servicepledge.dao;
    
/**
 * The pledge services screen is used to add/edit a new/existing pledge of services
 * This class has been generated by the XSLT processor from the metadata and represents the
 * SaveException for the ServicePledge entity.
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
@SuppressWarnings("serial")
public class ServicePledgeSaveException extends Exception
{
    /**
     * Create a ServicePledgeSaveException Object to give details
     * of issues saving to the database.
     * @param pledgeServiceLevelOne The primary key of the Object that could not be saved
     * @param cause The Exception that caused the original error.
     */
    public ServicePledgeSaveException(String message, Throwable cause)
    {
        super(message, cause);
    }
    
    /**
     * Create a ServicePledgeSaveException Object to give details
     * of issues saving to the database.
     * @param message A message detailing the cause
     */
    public ServicePledgeSaveException(String message)
    {
        super(message);
    }
    
}
