package org.volunteertech.pledges.users.web;

import com.netgrains.security.Authorisation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.SortedMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

import org.volunteertech.pledges.users.dao.ApplicationUserDetails;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsImpl;
import org.volunteertech.pledges.users.service.ApplicationUserDetailsService;
import org.volunteertech.pledges.users.service.ApplicationUserService;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsLoadException;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsSaveException;
import org.volunteertech.pledges.users.validator.ApplicationUserDetailsFormValidator;
import org.volunteertech.pledges.main.web.BaseController;
import org.volunteertech.pledges.users.security.SecurityUser;

import org.volunteertech.pledges.reference.ReferenceStore;


import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesImpl;




/**
 * The contact information
 * The Spring ApplicationUserDetailsRestController to handle restful web service requests.
 * This class has been generated by the XSLT processor from the metadata and represents the
 * the Spring ApplicationUserDetailsRestController to handle restful web service requests.
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
@RestController
public class ApplicationUserDetailsRestController extends BaseController
{
	final Logger logger = LoggerFactory.getLogger(ApplicationUserDetailsRestController.class);
	
	@Autowired
	private ReferenceStore referenceStore;
	
	@Autowired
	private ApplicationUserDetailsService applicationUserDetailsService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
	


	/**
	 * Returns a JSON representation of all ApplicationUserDetails records
	 * @return the JSON representation of all ApplicationUserDetails.
	 */
	@RequestMapping(value = "/restful/applicationuserdetails/list", method = RequestMethod.GET)
	@ResponseBody
    public List<ApplicationUserDetails> showAllApplicationUserDetails(Authentication authentication, Locale locale) {
		logger.info("Inside restful getApplicationUserDetails method...");
		List <ApplicationUserDetails> applicationUserDetailsList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	applicationUserDetailsList = applicationUserDetailsService.listApplicationUserDetails();
	    	applicationUserDetailsList = applicationUserDetailsService.translateReferenceValues(applicationUserDetailsList, locale);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return applicationUserDetailsList;
    }


	
	/**
	 * Returns a JSON representation of the ApplicationUserDetails record that matches the id parameter
	 * @param id the primary key by which to search
	 * @return the ApplicationUserDetails with the relevant primary key.
	 */
	@RequestMapping(value = "/restful/applicationuserdetails", method = RequestMethod.GET)
	@ResponseBody
    public ApplicationUserDetails getApplicationUserDetails(Authentication authentication, @RequestParam(value="id") String id) {
		logger.info("Inside restful getApplicationUserDetails method...");
		Authorisation.checkAccess(authentication, Integer.valueOf(id));
		ApplicationUserDetails applicationUserDetails = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	applicationUserDetails = applicationUserDetailsService.load(Long.valueOf(id), userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return applicationUserDetails;
    }
    
    @RequestMapping(value = "/restful/applicationuserdetails/update", method = RequestMethod.POST)
    @ResponseBody
    public List<ApplicationUserDetails> updateApplicationUserDetails(Authentication authentication, @RequestBody ApplicationUserDetails applicationUserDetails) {
        logger.info("In the updateApplicationUserDetails controller and got Id: " + applicationUserDetails.getId());

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
        
		try{
			// TODO needs security update
			applicationUserDetailsService.storeApplicationUserDetails(applicationUserDetails, userId);	
			if(user.getApplicationUser().getApplicationUserDetails().getId() == applicationUserDetails.getId()){
				logger.info("application user found DESX \n\n\n\n\n\n\n\n\n\n");
				user.getApplicationUser().setUsername(applicationUserDetails.getEmailAddress());
				applicationUserService.storeApplicationUser(user.getApplicationUser(), userId);
			}
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<ApplicationUserDetails> applicationUserDetailsList = applicationUserDetailsService.listApplicationUserDetails();
        
        return applicationUserDetailsList;
    }
    
    
    @RequestMapping(value = "/restful/applicationuserdetails/new", method = RequestMethod.POST)
    @ResponseBody
    public List<ApplicationUserDetails> addApplicationUserDetails(Authentication authentication, @RequestBody ApplicationUserDetails applicationUserDetails) {
        logger.debug("In the addApplicationUserDetails controller and got Id: " + applicationUserDetails.getId());
        SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();

		try{
			// TODO needs security update
			applicationUserDetailsService.storeApplicationUserDetails(applicationUserDetails, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<ApplicationUserDetails> applicationUserDetailsList = applicationUserDetailsService.listApplicationUserDetails();
        
        return applicationUserDetailsList;
    }
    
    
    
}
