package com.netgrains.security;

public class AuthorisationException extends Exception
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AuthorisationException()
	{
		super("The current user is not authorised to view/update this record.");
	}
}
