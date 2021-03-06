package org.volunteertech.pledges.localisation.dao;
    
/**
 * The model to hold localisation messages
 * This class has been generated by the XSLT processor from the metadata and represents the
 * LoadException for the MessageResource entity.
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
public class MessageResourceLoadException extends Exception
{
    /**
     * Create a MessageResourceLoadException Object to give details
     * of issues loading from the database.
     * @param messageKey A supporting message
     * @param cause The Exception that caused the original error.
     */
    public MessageResourceLoadException(String message, Throwable cause)
    {
        super(message, cause);
    }
    
    
    /**
     * Create a MessageResourceLoadException Object to give details
     * of issues loading from the database.
     * @param messageKey A supporting message
     */
    public MessageResourceLoadException(String message)
    {
        super(message);
    }
    
}
