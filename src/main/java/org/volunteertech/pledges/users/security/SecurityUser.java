package org.volunteertech.pledges.users.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.GrantedAuthority;
import org.volunteertech.pledges.users.dao.ApplicationUser;

import java.util.Collection;

/**
 * The Custom Spring User implementation to allow user related data to be stored with the Spring Security User
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">>JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public class SecurityUser extends User
{
	final Logger logger = LoggerFactory.getLogger(SecurityUser.class);
	private static final long serialVersionUID = 1L;
	
	/**
	 * The user access model object containing data about the current user
	 */
	private ApplicationUser applicationUser;

	/**
	 * Gets the user access model object containing data about the current user
	 * @return the user access model object containing data about the current user
	 */
	public ApplicationUser getApplicationUser(){
		return this.applicationUser;
	}

	/**
	 * Sets the user access model object containing data about the current user
	 * @param applicationUser the user access model object containing data about the current user
	 */
	public void setApplicationUser(ApplicationUser applicationUser){
		this.applicationUser = applicationUser;
	}	
	
	public SecurityUser(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, ApplicationUser applicationUser) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		this.applicationUser = applicationUser;
	}
	
	

}
