package com.netgrains.util;

import java.util.Date;



/**
 * Class to provide commonly reused Logging functions and methods - The methods within this
 * class can be used by both JSP's and other classes. This class logs errors to the error log but timestamps the
 * entries so that they can be cross-referenced.
 * <p>
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to
 * <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">How to Write Doc Comments for the JavadocTM Tool</a>
 *
 *
 * @author      Michael O'Connor
 * @version     1.00
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">JavaDoc Documentation</a>
 */

public class Logging
{

	public static final String REFER_TO_ERROR_LOG = "An error has occurred. Please refer to the Error Log for further details";
	/**
	 * Default Constructor for Logging
	 */
	public Logging() {
		super();
	}

	/**
 	 * Prints a standard message to the output stream that is the value of the field <code>System.out</code>.
 	 */
 	public static synchronized void log(String toLog)
 	{
 		System.out.println(toLog.toString());
 	}

	/**
 	 * Prints a standard message to the output stream that is the value of the field <code>System.err</code>.
 	 * This method can be called to inform the system operator that an error has occurred and to refer them
 	 * to the Error Log where further reporting can be made.
 	 */
 	public static synchronized void reportError()
 	{
 		System.err.println(REFER_TO_ERROR_LOG);
 	}


	/**
 	 * Prints the <code>String</code> given as parameter preceeded by a time stamp on
 	 * the error output stream that is the value of the field <code>System.err</code>
 	 * preceeded by a timestamp and the output stream that is the value of <code>System.out</code>
 	 * 
 	 * @param report  the <code>String</code> to print to <code>System.err</code>
 	 */
 	public static synchronized void reportError(String report)
 	{
 		Date currentTime = new Date();

 		if (report != null)
 		{
 			System.out.println(report);
	 		System.err.println(currentTime.toString() + ": " + report);
 		}
 	}

	/**
	 * Prints an error report proceeded by a time stamp and an exception dump on the error
	 * output stream that is the value of the field <code>System.err</code>
	 *
	 * @param report  the <code>String</code> to print to <code>System.err</code>
	 * @param thrown  the <code>Exception</code> object that indicated the error
	 */
	public static synchronized void reportError(String report, java.lang.Throwable thrown)
	{
		Date currentTime = new Date();

	 	if (report != null)
	 	{
	 		System.out.println(report);
	 		System.err.println(currentTime.toString() + ": " + report + ". Exception dump follows.");
	 	}

	 	if (thrown != null)
	 		thrown.printStackTrace();
	}
}

