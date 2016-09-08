package org.volunteertech.pledges.startup.web;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.volunteertech.pledges.users.security.SecurityUser;

import org.volunteertech.pledges.main.localisation.DatabaseDrivenMessageSource;
import org.volunteertech.pledges.startup.dao.Landing;
import org.volunteertech.pledges.startup.dao.LandingImpl;
import org.volunteertech.pledges.startup.service.LandingService;
import org.volunteertech.pledges.startup.validator.LandingFormValidator;
import org.volunteertech.pledges.startup.view.LandingTranslationBackingBean;
import org.volunteertech.pledges.startup.view.LandingTranslationBackingBeanImpl;
import org.volunteertech.pledges.main.web.BaseController;
import org.volunteertech.pledges.main.constants.Constants;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.service.MessageResourceService;


import org.volunteertech.pledges.reference.ReferenceStore;

/**
 * The main web screen
 * GUIHandler is attached to a form on JSP and contains all getters and setters for values displayed on the form.
 * GUIHandler accesses the business layer for loading/saving data. 
 * This class has been generated by the XSLT processor from the metadata and represents the
 * the GUI layer javabean for the Landing Form.
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
public class LandingController extends BaseController
{

    /**
     * userId used for development. This should be taken from the session.
     */
	private Long userId = new Long(0);
	 
	final Logger logger = LoggerFactory.getLogger(LandingController.class);
	
	@Autowired
	private ReferenceStore referenceStore;
	
	@Autowired
	private LandingService landingService;

	@Autowired
	private LandingFormValidator landingFormValidator;
	
    @Autowired
    private DatabaseDrivenMessageSource messageSource;
    


    @Autowired
    private MessageResourceService messageResourceService;
  
    
	
	//Set a form validator
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(landingFormValidator);
	}
	
	
	/**
	 * Open the list page
	 */
	@RequestMapping(value = "/landing/all", method = RequestMethod.GET)
	public String showAllLanding(Model model, Locale locale) {

		logger.debug("showAllLanding()");
			
		return "ladnings/landing_table";

	}
	
	/**
	 * Open the localize page
	 */
	@RequestMapping(value = "/landing/localize", method = RequestMethod.GET)
	public String localizeLanding(Model model, Locale locale) {

		logger.debug("localizeLanding()");

		LandingTranslationBackingBean landingTranslationBackingBean = new LandingTranslationBackingBeanImpl();
		landingTranslationBackingBean.setCurrentMode(Landing.CurrentMode.LOCALIZE);
		model.addAttribute("landingTranslationFormModel", landingTranslationBackingBean);
		Long defaultLocale = new Long(Constants.REFERENCE_LOCALE__EN);
		setTranslationDropDownContents(model, locale);
		setDropDownContents(model, null, locale);		
		model.addAttribute("defaultLocale", defaultLocale);
		
		return "ladnings/landing_localize";

	}
	
	
	

	// save or update Landing
	// 1. @ModelAttribute bind form value
	// 2. @Validated form validator
	// 3. RedirectAttributes for flash value
	@RequestMapping(value = "/landing/post", method = RequestMethod.POST)
	public String saveOrUpdateLanding(Authentication authentication, @ModelAttribute("landingFormModel") @Validated LandingImpl landing,
			BindingResult result, Model model, Locale locale,
			final RedirectAttributes redirectAttributes) {

		logger.debug("saveOrUpdateLanding() : {}", landing);
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		

		if (result.hasErrors()) {
			setDropDownContents(model, landing, locale);
			String updateIssueMessage = messageSource.getMessage("landingUpdateIssueMessage", new String[0], locale);
			model.addAttribute("msg", updateIssueMessage);
			model.addAttribute("css", "alert-danger");
			
			return "ladnings/landing";
		} else {

			// Add message to flash scope
			redirectAttributes.addFlashAttribute("css", "success");
			if(landing.isNew()){
				String addedSuccessMessage = messageSource.getMessage("landingAddedSuccessMessage", new String[0], locale);
				// Add message to flash scope
				redirectAttributes.addFlashAttribute("msg", addedSuccessMessage);
				redirectAttributes.addFlashAttribute("css", "alert-success");
			}else{
				String updateSuccessMessage = messageSource.getMessage("landingUpdateSuccessMessage", new String[0], locale);
				// Add message to flash scope
				redirectAttributes.addFlashAttribute("msg", updateSuccessMessage);
				redirectAttributes.addFlashAttribute("css", "alert-success");
			}


			try{
				// TODO: Needs exception handling policy
			    	landingService.storeLanding(landing, userId);
			}
			catch (Exception ex){
				logger.error("Exception caught !!!!!!!!!!!!!!", ex);
			}
			
	
			

			
			// POST/REDIRECT/GET
			return "redirect:/landing/" + landing.getId() + "/update";
		}

	}

	// show add user form
	@RequestMapping(value = "/landing/add", method = RequestMethod.GET)
	public String showAddLandingForm(Model model, Locale locale) {

		logger.debug("showAddLandingForm()");

		Landing landing = new LandingImpl();
		
		landing.setCurrentMode(Landing.CurrentMode.ADD);

		model.addAttribute("landingFormModel", landing);

		setDropDownContents(model, landing, locale);

		return "ladnings/landing";

	}
	
	// support access to the supporting webpage by creating a new instance and returning 
	@RequestMapping(value = "/landingwebpage", method = RequestMethod.GET)
	public String createLandingForWebPageView(Model model, HttpServletRequest request, Locale locale) {

		logger.debug("createLandingForWebPageView()");

		Landing landing = new LandingImpl();
		
		try{
			// TODO: Needs exception handling policy
	    	landingService.storeLanding(landing, userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
		

		model.addAttribute("landingFormModel", landing);

		setDropDownContents(model, landing, locale);

		return "ladnings/landingwebpage";

	}
	

	// show update form
	@RequestMapping(value = "/landing/{id}/update", method = RequestMethod.GET)
	public String showUpdateLandingForm(@PathVariable("id") int id, Model model, Locale locale) {

		logger.debug("showUpdateLandingForm() : {}", id);
		Landing landing = null;
		try{
			// TODO: Needs exception handling policy
			landing = landingService.load(new Long(id), userId);
			landing.setCurrentMode(Landing.CurrentMode.UPDATE);
			this.landingService.translateReferenceValues(landing, locale);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}

		
		model.addAttribute("landingFormModel", landing);
		
		setDropDownContents(model, landing, locale);
		
		return "ladnings/landing";

	}

	// delete landing
	@RequestMapping(value = "/landing/{id}/delete", method = RequestMethod.POST)
	public String deleteLanding(@PathVariable("id") int id, 
		final RedirectAttributes redirectAttributes) {

		logger.debug("deleteUser() : {}", id);

		//landingService.delete(id);
		
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "User is deleted!");
		
		return "redirect:/landing/all";

	}

	// show user
	@RequestMapping(value = "/landing/{id}", method = RequestMethod.GET)
	public String showLanding(@PathVariable("id") int id, Model model, Locale locale) {

		logger.debug("showLanding() id: {}", id);
		Landing landing = null;
		try{
			// TODO: Needs exception handling policy
			landing = landingService.load(new Long(id), userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}

		
		if (landing == null) {
			model.addAttribute("css", "danger");
			model.addAttribute("msg", "User not found");
		}
		model.addAttribute("landing", landing);
		
		setDropDownContents(model, landing, locale);

		return "showlanding";

	}
	
	
	// save or update LandingTranslation
	// 1. @ModelAttribute bind form value
	// 2. @Validated form validator
	// 3. RedirectAttributes for flash value
	@RequestMapping(value = "/landing/translate", method = RequestMethod.POST)
	public String saveOrUpdateLandingTranslation(Authentication authentication, @ModelAttribute("landingTranslationFormModel") LandingTranslationBackingBeanImpl landingTranslationBackingBean,
			BindingResult result, Model model, Locale locale,
			final RedirectAttributes redirectAttributes) {

		logger.debug("saveOrUpdateLandingTranslation() : {}", landingTranslationBackingBean);
		Long translationLocaleReferenceId = landingTranslationBackingBean.getNewLocale();
		String translationLocale = messageSource.getMessage(referenceStore.getRefDesc(translationLocaleReferenceId), new String[0], new Locale("en"));
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		

		try{
			
			// TODO: Needs exception handling policy
			List<MessageResource> messageResourceList  = new ArrayList<MessageResource>();
			
			MessageResource messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDING_HEADER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getViewTitle());
			messageResourceList.add(messageResource);
			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDING_TITLE_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getFormTitle());
			messageResourceList.add(messageResource);
			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDING_SUBHEADER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getFormSubHeader());
			messageResourceList.add(messageResource);
			
			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_1_MESSAGE_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages1Message());
  			messageResourceList.add(messageResource);
  		messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_1_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages1Label());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_1_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages1PlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_1_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages1HelpText());
  			messageResourceList.add(messageResource);
  		
			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_2_MESSAGE_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages2Message());
  			messageResourceList.add(messageResource);
  		messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_2_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages2Label());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_2_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages2PlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(LandingTranslationBackingBeanImpl.LANDINGMAINMESSAGES_2_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, landingTranslationBackingBean.getLandingMainMessages2HelpText());
  			messageResourceList.add(messageResource);
  		

			

			this.messageSource.updateTexts(messageResourceList, userId);			
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
			
		// POST/REDIRECT/GET
		return "redirect:/landing/add?language=" + translationLocale;

	}

	private void setDropDownContents(Model model, Landing landing, Locale locale) {
		
		
		Map<Long, String> localeMap = referenceStore.getLocale();
		SortedMap<Long, String> localizedLocaleMap = new TreeMap<Long, String>(localeMap);
		for (Map.Entry<Long, String> entry : localeMap.entrySet()) {
			localizedLocaleMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
		}
		
		model.addAttribute("localeMap", localizedLocaleMap);
	}
	


}
