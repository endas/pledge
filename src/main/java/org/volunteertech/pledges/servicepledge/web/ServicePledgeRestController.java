package org.volunteertech.pledges.servicepledge.web;

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

import org.volunteertech.pledges.servicepledge.dao.ServicePledge;
import org.volunteertech.pledges.servicepledge.dao.ServicePledgeImpl;
import org.volunteertech.pledges.servicepledge.service.ServicePledgeService;
import org.volunteertech.pledges.servicepledge.dao.ServicePledgeLoadException;
import org.volunteertech.pledges.servicepledge.dao.ServicePledgeSaveException;
import org.volunteertech.pledges.servicepledge.validator.ServicePledgeFormValidator;
import org.volunteertech.pledges.main.web.BaseController;
import org.volunteertech.pledges.users.security.SecurityUser;

import org.volunteertech.pledges.reference.ReferenceStore;


import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesImpl;




/**
 * The pledge services screen is used to add/edit a new/existing pledge of services
 * The Spring ServicePledgeRestController to handle restful web service requests.
 * This class has been generated by the XSLT processor from the metadata and represents the
 * the Spring ServicePledgeRestController to handle restful web service requests.
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
public class ServicePledgeRestController extends BaseController
{
	final Logger logger = LoggerFactory.getLogger(ServicePledgeRestController.class);
	
	@Autowired
	private ReferenceStore referenceStore;
	
	@Autowired
	private ServicePledgeService servicePledgeService;
	
	


	/**
	 * Returns a JSON representation of all ServicePledge records
	 * @return the JSON representation of all ServicePledge.
	 */
	@RequestMapping(value = "/restful/servicepledge/list", method = RequestMethod.GET)
	@ResponseBody
    public List<ServicePledge> showAllServicePledge(Authentication authentication, Locale locale) {
		logger.info("Inside restful getServicePledge method...");
		List <ServicePledge> servicePledgeList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	servicePledgeList = servicePledgeService.listServicePledge();
	    	servicePledgeList = servicePledgeService.translateReferenceValues(servicePledgeList, locale);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return servicePledgeList;
    }


	
	/**
	 * Returns a JSON representation of the ServicePledge record that matches the id parameter
	 * @param id the primary key by which to search
	 * @return the ServicePledge with the relevant primary key.
	 */
	@RequestMapping(value = "/restful/servicepledge", method = RequestMethod.GET)
	@ResponseBody
    public ServicePledge getServicePledge(Authentication authentication, @RequestParam(value="id") String id) {
		logger.info("Inside restful getServicePledge method...");
		ServicePledge servicePledge = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	servicePledge = servicePledgeService.load(new Long(id), userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return servicePledge;
    }
    
    @RequestMapping(value = "/restful/servicepledge/update", method = RequestMethod.POST)
    @ResponseBody
    public List<ServicePledge> updateServicePledge(Authentication authentication, @RequestBody ServicePledge servicePledge) {
        logger.debug("In the updateServicePledge controller and got Id: " + servicePledge.getId());

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
        
		try{
			// TODO needs security update
			servicePledgeService.storeServicePledge(servicePledge, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<ServicePledge> servicePledgeList = servicePledgeService.listServicePledge();
        
        return servicePledgeList;
    }
    
    
    @RequestMapping(value = "/restful/servicepledge/new", method = RequestMethod.POST)
    @ResponseBody
    public List<ServicePledge> addServicePledge(Authentication authentication, @RequestBody ServicePledge servicePledge) {
        logger.debug("In the addServicePledge controller and got Id: " + servicePledge.getId());
        SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();

		try{
			// TODO needs security update
			servicePledgeService.storeServicePledge(servicePledge, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<ServicePledge> servicePledgeList = servicePledgeService.listServicePledge();
        
        return servicePledgeList;
    }
    
    
    
	/**
	 * Returns a JSON representation of a list of ServicePledge entries that match the registerOfPledgesId
	 * parameter.
	 * @param registerOfPledgesId by which to filter.
	 * @return a <code>List<ServicePledge></code> containing the ServicePledge
	 * entries that match the registerOfPledgesId
	 */
	@RequestMapping(value = "/restful/servicepledgebyregisterofpledgeslist", method = RequestMethod.GET)
    public List<ServicePledge> getServicePledgeByRegisterOfPledgesId(@RequestParam(value="registerOfPledgesId") String registerOfPledgesId) {
		logger.info("Inside getServicePledgeByRegisterOfPledgesId() method...");
		
    	List<ServicePledge> servicePledgeList = servicePledgeService.getServicePledgeBo().getServicePledgeDao().listServicePledgeByRegisterOfPledgesId(new Long(registerOfPledgesId));
		
    	return servicePledgeList;
    }
  
}
