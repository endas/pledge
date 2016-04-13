package org.volunteertech.pledges.main.web;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledgesImpl;
import org.volunteertech.pledges.pledge.service.RegisterOfPledgesService;
import org.volunteertech.pledges.users.security.SecurityUser;

import com.netgrains.security.HashEncoderGenerator;


/**
 * The Spring HomeController to handle requests for the root web context
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
@Controller
public class HomeController
{
	final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	RegisterOfPledgesService registerOfPledgesService;	
	
	/**
	 * Request mapping for the root or web context of the project
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showLandingPage(Model model) {

		logger.debug("showLandingPage()");
		return "forward:/landingwebpage";

	}
	
	
	/**
	 * Request mapping for the root or web context of the project
	 */
	@RequestMapping(value = "/entitylist", method = RequestMethod.GET)
	public String showEntityList(Authentication authentication, HttpServletRequest request, Model model) {
	
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		Long userId = user.getApplicationUser().getId();
		
		if (request.isUserInRole("ROLE_CLIENT")) {
			List <RegisterOfPledges> registerOfPledgesList = registerOfPledgesService.getRegisterOfPledgesBo().listRegisterOfPledgesByCreatedById(userId);
			RegisterOfPledges registerOfPledgesImpl = new RegisterOfPledgesImpl();
			if (registerOfPledgesList.size() == 0){
				try{
					
					registerOfPledgesService.storeRegisterOfPledges(registerOfPledgesImpl, userId);
				}
				catch(Exception ex){
					// Do nothing
				}
				return "forward:/applicationuserdetails/" + registerOfPledgesImpl.getId() + "/update";
			}
			else{
				registerOfPledgesImpl = registerOfPledgesList.get(0);
				return "forward:/registerofpledges/" + registerOfPledgesImpl.getId() + "/update";
			}
		
		}
	
		logger.debug("showEntityList()");
		return "entitylist";

	}


	
	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
		logger.debug("accesssDenied()");
		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}	
}
