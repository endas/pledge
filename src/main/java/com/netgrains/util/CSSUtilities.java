package com.netgrains.util;

import java.util.Map;
import java.util.HashMap;

public class CSSUtilities
{
	static Map<String, String> backGroundColorMap;
	
	static
	{
		backGroundColorMap = new HashMap<String, String>();
		backGroundColorMap.put("Red", "#F61818");
		backGroundColorMap.put("Green", "#57F618");
		backGroundColorMap.put("Amber", "#F6B518");
	
	}	
	public static String mapBackgroundColor(String color)
	{
		String returnValue = null;
		
		returnValue = backGroundColorMap.get(color);
		
		return returnValue;
	}
}
