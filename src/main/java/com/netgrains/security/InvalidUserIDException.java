package com.netgrains.security;

public class InvalidUserIDException extends Exception
{
	public static String NULL_USER_ID = "The UserID was null";

	public InvalidUserIDException() {
		// TODO Auto-generated constructor stub
	}

	public InvalidUserIDException(String arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	public InvalidUserIDException(Throwable arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	public InvalidUserIDException(String arg0, Throwable arg1) {
		super(arg0, arg1);
		// TODO Auto-generated constructor stub
	}

}
