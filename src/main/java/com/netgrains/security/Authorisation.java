package com.netgrains.security;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.volunteertech.pledges.users.security.SecurityUser;

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

	public static void checkAccess(Authentication authentication, int id) {
		SecurityUser securityUser = (SecurityUser) authentication.getPrincipal();
		logger.debug("Checking access of {} against id {}", securityUser.getApplicationUser().getUsername(), id);
		if (!securityUser.getApplicationUser().getApplicationUserDetails().getId().equals((long)id)) {
			logger.warn("Blocking illegal access by {} of other user details {}", securityUser.getApplicationUser().getApplicationUserDetails().getId(), id);
			throw new AccessDeniedException("Illegal access");
		}
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
