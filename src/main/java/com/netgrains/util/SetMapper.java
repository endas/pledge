package com.netgrains.util;
import java.util.Set;
import java.util.HashSet;
import java.lang.NumberFormatException;
import java.util.Iterator;

public class SetMapper
{

	public SetMapper()
	{
		
	}
	
	public HashSet<Long> convertStringArraytoLongHashSet(String[] stringArray)
	{
		HashSet<Long> hashSet = new HashSet<Long>();
		
		if (stringArray != null)
		{
			for (int i = 0; i < stringArray.length; i++)
			{
				try
				{
					hashSet.add(Long.valueOf(stringArray[i]));
				}
				catch (NumberFormatException ex)
				{
					// Do nothing
				}
				
			}
		}
		
		return hashSet;
	}
	
	public static String[] convertLongHashSettoStringArray(Set<Long> hashSet)
	{
		String[] stringArray = new String[hashSet.size()]; 
		Iterator<Long> it = hashSet.iterator();
		int stringCounter = 0;
		
		while (it.hasNext())
		{
			Long element = it.next();
			stringArray[stringCounter] = element.toString();
			stringCounter++;
		}

		return stringArray;
	}
	
		
}
