package com.netgrains.util;

public class StringUtilities
{
	public static String mapBooleanToGUI(Boolean internalBoolean)
	{
		String returnValue = null;
		
		if (internalBoolean.booleanValue() == true)
		{
			returnValue = new String("Yes");
		}
		else
		{
			returnValue = new String("No");
		}
		
		return returnValue;
	}
}
