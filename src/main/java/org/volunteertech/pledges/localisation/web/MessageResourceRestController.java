package org.volunteertech.pledges.localisation.web;

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

import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.dao.MessageResourceImpl;
import org.volunteertech.pledges.localisation.service.MessageResourceService;
import org.volunteertech.pledges.localisation.dao.MessageResourceLoadException;
import org.volunteertech.pledges.localisation.dao.MessageResourceSaveException;
import org.volunteertech.pledges.localisation.validator.MessageResourceFormValidator;
import org.volunteertech.pledges.main.web.BaseController;
import org.volunteertech.pledges.users.security.SecurityUser;

import org.volunteertech.pledges.reference.ReferenceStore;


import org.volunteertech.pledges.admin.dao.ViewImpl;




/**
 * The model to hold localisation messages
 * The Spring MessageResourceRestController to handle restful web service requests.
 * This class has been generated by the XSLT processor from the metadata and represents the
 * the Spring MessageResourceRestController to handle restful web service requests.
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
public class MessageResourceRestController extends BaseController
{
	final Logger logger = LoggerFactory.getLogger(MessageResourceRestController.class);
	
	@Autowired
	private ReferenceStore referenceStore;
	
	@Autowired
	private MessageResourceService messageResourceService;
	
	


	/**
	 * Returns a JSON representation of all MessageResource records
	 * @return the JSON representation of all MessageResource.
	 */
	@RequestMapping(value = "/restful/messageresource/list", method = RequestMethod.GET)
	@ResponseBody
    public List<MessageResource> showAllMessageResource(Authentication authentication, Locale locale) {
		logger.info("Inside restful getMessageResource method...");
		List <MessageResource> messageResourceList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	messageResourceList = messageResourceService.listMessageResource();
	    	messageResourceList = messageResourceService.translateReferenceValues(messageResourceList, locale);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return messageResourceList;
    }


	
	/**
	 * Returns a JSON representation of the MessageResource record that matches the id parameter
	 * @param id the primary key by which to search
	 * @return the MessageResource with the relevant primary key.
	 */
	@RequestMapping(value = "/restful/messageresource", method = RequestMethod.GET)
	@ResponseBody
    public MessageResource getMessageResource(Authentication authentication, @RequestParam(value="id") String id) {
		logger.info("Inside restful getMessageResource method...");
		MessageResource messageResource = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	messageResource = messageResourceService.load(new Long(id), userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return messageResource;
    }
    
    @RequestMapping(value = "/restful/messageresource/update", method = RequestMethod.POST)
    @ResponseBody
    public List<MessageResource> updateMessageResource(Authentication authentication, @RequestBody MessageResource messageResource) {
        logger.debug("In the updateMessageResource controller and got Id: " + messageResource.getId());

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
        
		try{
			// TODO needs security update
			messageResourceService.storeMessageResource(messageResource, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<MessageResource> messageResourceList = messageResourceService.listMessageResource();
        
        return messageResourceList;
    }
    
    
    @RequestMapping(value = "/restful/messageresource/new", method = RequestMethod.POST)
    @ResponseBody
    public List<MessageResource> addMessageResource(Authentication authentication, @RequestBody MessageResource messageResource) {
        logger.debug("In the addMessageResource controller and got Id: " + messageResource.getId());
        SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();

		try{
			// TODO needs security update
			messageResourceService.storeMessageResource(messageResource, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<MessageResource> messageResourceList = messageResourceService.listMessageResource();
        
        return messageResourceList;
    }
    
    
    
	/**
	 * Returns a JSON representation of a list of MessageResource entries that match the viewId
	 * parameter.
	 * @param viewId by which to filter.
	 * @return a <code>List<MessageResource></code> containing the MessageResource
	 * entries that match the viewId
	 */
	@RequestMapping(value = "/restful/messageresourcebyviewlist", method = RequestMethod.GET)
    public List<MessageResource> getMessageResourceByViewId(@RequestParam(value="viewId") String viewId) {
		logger.info("Inside getMessageResourceByViewId() method...");
		
    	List<MessageResource> messageResourceList = messageResourceService.getMessageResourceBo().getMessageResourceDao().listMessageResourceByViewId(new Long(viewId));
		
    	return messageResourceList;
    }
  
}
