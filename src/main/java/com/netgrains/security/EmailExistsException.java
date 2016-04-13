package com.netgrains.security;

public class EmailExistsException extends Exception
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String emailAddress;

	public EmailExistsException()
	{
		super("There is an account with that email address.");
	}
	
	public EmailExistsException(String exceptionMessage, String emailAddress)
	{
		super(exceptionMessage);
		setEmailAddress(emailAddress);
	}
	
	public String getEmailAddress(){
		return this.emailAddress;
	}
	
	public void setEmailAddress(String emailAddress){
		this.emailAddress = emailAddress;
	}
	
}
