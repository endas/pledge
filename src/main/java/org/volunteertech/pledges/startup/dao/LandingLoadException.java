package org.volunteertech.pledges.startup.dao;
    
/**
 * The main web screen
 * This class has been generated by the XSLT processor from the metadata and represents the
 * LoadException for the Landing entity.
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
public class LandingLoadException extends Exception
{
    /**
     * Create a LandingLoadException Object to give details
     * of issues loading from the database.
     * @param landingMainMessages A supporting message
     * @param cause The Exception that caused the original error.
     */
    public LandingLoadException(String message, Throwable cause)
    {
        super(message, cause);
    }
    
    
    /**
     * Create a LandingLoadException Object to give details
     * of issues loading from the database.
     * @param landingMainMessages A supporting message
     */
    public LandingLoadException(String message)
    {
        super(message);
    }
    
}
