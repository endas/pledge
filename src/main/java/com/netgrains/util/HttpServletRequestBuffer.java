package com.netgrains.util;
import javax.servlet.http.HttpServletRequest;
import java.util.Hashtable;
import java.util.Enumeration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * This class can be used to buffer the parameter and header values of an HttpServletRequest.
 * The class uses a type of copy constructor to create a new object. There are no references stored
 * to any HttpServletRequest.
 * @author Michael O'Connor
 */
public class HttpServletRequestBuffer
{	
	final Logger logger = LoggerFactory.getLogger(HttpServletRequestBuffer.class);
	
	Hashtable<String, String> parameterValues;
	
	Hashtable<String, String> headerValues;
	
	/**
	 * Constructor that accepts an HttpServletRequest
	 * @param request the request to be buffered.
	 */
	public HttpServletRequestBuffer(HttpServletRequest request)
	{	
		parameterValues = new Hashtable<String, String>();
		headerValues = new Hashtable<String, String>();
		
		Enumeration<String> enumeration = request.getParameterNames();
		
		while(enumeration.hasMoreElements())
		{

			String paramName = (String) enumeration.nextElement();
			String paramValue = request.getParameter(paramName);
			
			parameterValues.put(paramName, paramValue);
			
			logger.debug("Parameter {} has value: {}", paramName, paramValue);
		}

		enumeration = request.getHeaderNames();
		while(enumeration.hasMoreElements())
		{
			String headerName = (String) enumeration.nextElement();
			String headerValue = request.getHeader(headerName);
			
			headerValues.put(headerName, headerValue);
			logger.debug("Header {} has value: {}", headerName, headerValue);
		}

	}
	
	/**
	 * Returns the value of a request parameter as a String, or null if the parameter does not exist.
	 * @param name
	 * @return
	 */
	public String getParameter(String name)
	{
		String returnValue = null;
		
		try
		{
			returnValue = (String)parameterValues.get(name);
		}
		catch(Exception ex)
		{
			
		}
		
		return returnValue;
	}
	
	/**
	 * Returns the value of the specified request header as a String, or null if the header does not exist.
	 * @param name
	 * @return
	 */
	public String getHeader(String name)
	{
		String returnValue = null;
		
		try
		{
			returnValue = (String)headerValues.get(name);
		}
		catch(Exception ex)
		{
			
		}
		
		return returnValue;
	}	


	/**
	 * Deconstructor called at garbage clean up.
	 */
	protected void finalize() throws Throwable
	{
		parameterValues.clear();
		headerValues.clear();
		parameterValues = null;
		headerValues = null;
		
		super.finalize();
	}
}
