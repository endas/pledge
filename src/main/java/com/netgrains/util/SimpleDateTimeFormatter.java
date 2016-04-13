package com.netgrains.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Static Singleton class that uses a simpleDateFormat to format dates across the application 
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
public class SimpleDateTimeFormatter
{
	final Logger logger = LoggerFactory.getLogger(SimpleDateFormatter.class);
	
	/**
	 * A handle to the unique Singleton instance.
	 */
	static private SimpleDateTimeFormatter instance = null;
	
    /** The SimpleDateFormat used to format dates and Strings to/from dd/MM/yyyy	**/
    SimpleDateFormat simpleDateFormat; 	
	
	/**
	 * Default Constructor for the SimpleDateTimeFormatter class
	 */
	private SimpleDateTimeFormatter()
	{
	    simpleDateFormat = (SimpleDateFormat)SimpleDateFormat.getInstance();
    	simpleDateFormat.applyPattern("dd/MM/yyyy KK:mma"); 
	}
 

 
	/**
	 * @return The unique instance of this class.
	 */
	static public SimpleDateTimeFormatter getInstance()
	{
		if(instance == null)
		{
		   instance = new SimpleDateTimeFormatter();
		}
		return instance;
	}
	
	/**
	 * Formats a String given as parameter to the correct format for display in the GUI
	 * @param date usually a long data format as returned from the database
	 * @return the date formatted according to the pattern of the underlying SimpleDateFormat
	 */
	public String format(Date date)
	{
		return simpleDateFormat.format(date);
	}
	
	public Date parse(String date)
	{
		return simpleDateFormat.parse(date , new ParsePosition(0));
	}
		
	
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
    	logger.debug("Setting simpleDateFormat object reference to null");
    	simpleDateFormat = null;
    }    
	
    
 
}
    
    
    

