package com.netgrains.security;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.netgrains.security.InvalidUserIDException;

public class Authorisation
{
	/**
	 * Provides authorisation to update a record of an underlying table
	 * @param entityName the name of the table/hibernate entity
	 * @param userID the userID of the currently logged in user
	 * @param id the primary key of the underlying table
	 * @return true if the user is authorised to update the record otherwise false
	 */
	static final Logger logger = LoggerFactory.getLogger(Authorisation.class);
	
	public static boolean isAuthorisedUpdate(String entityName, Long userID, Long id) throws InvalidUserIDException
	{
		if (userID == null)
		{
			logger.error("The userID passed as parameter was null, userID: " + userID + ", id: " + id);
			throw new InvalidUserIDException(InvalidUserIDException.NULL_USER_ID);
		}
			
		logger.debug("Checking update authorisation, userID: " + userID + ", id: " + id);
		if (userID.equals(id))
		{
			logger.debug("AUTHORISED");
			return true;
		}

		logger.debug("NOT AUTHORISED");
		//return false;
		//for development
		return true;
	}
	
	/**
	 * Provides authorisation to view a record of an underlying table
	 * @param entityName the name of the table/hibernate entity
	 * @param userID the userID of the currently logged in user
	 * @param id the primary key of the underlying table
	 * @return true if the user is authorised to update the record otherwise false
	 */
	public static boolean isAuthorisedView(String entityName, Long userID, Long id) throws InvalidUserIDException
	{
		if (userID == null)
		{
			logger.error("The userID passed as parameter was null, userID: " + userID + ", id: " + id);
			throw new InvalidUserIDException("The userID was null");
		}
		
		logger.debug("Checking view authorisation, userID: " + userID + ", id: " + id);
		if (userID.equals(id))
		{
			logger.debug("AUTHORISED");
			return true;
		}

		logger.debug("NOT AUTHORISED");
		//return false;
		//for development
		return true;
	}
	

}
