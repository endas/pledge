package com.netgrains.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Hash coding facilities for encoding Strings.
 * @author Michael O'Connor
 *
 */
public class HashEncoderGenerator {

	/**
	 * Returns the hashed representation of the String passed as parameter. This can be used to hash passord provided by the user
	 * before storing in the database.
	 * @param stringToEncode the String to be hash encoded
	 * @return the hash encoded String.
	 */
	public static String encode(String stringToEncode){
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedString = passwordEncoder.encode(stringToEncode);
		
		return hashedString;
	}


}
