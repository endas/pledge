package org.volunteertech.pledges.admin.dao;
    
/**
 * The Views that are contained in the application
 * This class has been generated by the XSLT processor from the metadata and represents the
 * SaveException for the View entity.
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
public class ViewSaveException extends Exception
{
    /**
     * Create a ViewSaveException Object to give details
     * of issues saving to the database.
     * @param viewName The primary key of the Object that could not be saved
     * @param cause The Exception that caused the original error.
     */
    public ViewSaveException(String message, Throwable cause)
    {
        super(message, cause);
    }
    
    /**
     * Create a ViewSaveException Object to give details
     * of issues saving to the database.
     * @param message A message detailing the cause
     */
    public ViewSaveException(String message)
    {
        super(message);
    }
    
}
