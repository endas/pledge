package org.volunteertech.pledges.users.web;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.HashMap;
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
import org.volunteertech.pledges.users.dao.ApplicationUserDetails;
import org.volunteertech.pledges.users.dao.ApplicationUserDetailsImpl;
import org.volunteertech.pledges.users.service.ApplicationUserDetailsService;
import org.volunteertech.pledges.users.validator.ApplicationUserDetailsFormValidator;
import org.volunteertech.pledges.users.view.ApplicationUserDetailsTranslationBackingBean;
import org.volunteertech.pledges.users.view.ApplicationUserDetailsTranslationBackingBeanImpl;
import org.volunteertech.pledges.main.web.BaseController;
import org.volunteertech.pledges.main.constants.Constants;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.service.MessageResourceService;

import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;


import org.volunteertech.pledges.reference.ReferenceStore;

/**
 * The contact information
 * GUIHandler is attached to a form on JSP and contains all getters and setters for values displayed on the form.
 * GUIHandler accesses the business layer for loading/saving data. 
 * This class has been generated by the XSLT processor from the metadata and represents the
 * the GUI layer javabean for the ApplicationUserDetails Form.
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
public class ApplicationUserDetailsController extends BaseController
{


	 
	final Logger logger = LoggerFactory.getLogger(ApplicationUserDetailsController.class);
	
	@Autowired
	private ReferenceStore referenceStore;
	
	@Autowired
	private ApplicationUserDetailsService applicationUserDetailsService;

	@Autowired
	private ApplicationUserDetailsFormValidator applicationUserDetailsFormValidator;
	
    @Autowired
    private DatabaseDrivenMessageSource messageSource;
    


    @Autowired
    private MessageResourceService messageResourceService;
  
    
	
	//Set a form validator
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(applicationUserDetailsFormValidator);
	}
	
	
	/**
	 * Open the list page
	 */
	@RequestMapping(value = "/applicationuserdetails/all", method = RequestMethod.GET)
	public String showAllApplicationUserDetails(Model model, Locale locale) {

		logger.debug("showAllApplicationUserDetails()");
			
		return "users/applicationuserdetails_table";

	}
	
	/**
	 * Open the localize page
	 */
	@RequestMapping(value = "/applicationuserdetails/localize", method = RequestMethod.GET)
	public String localizeApplicationUserDetails(Model model, Locale locale) {

		logger.debug("localizeApplicationUserDetails()");

		ApplicationUserDetailsTranslationBackingBean applicationUserDetailsTranslationBackingBean = new ApplicationUserDetailsTranslationBackingBeanImpl();
		applicationUserDetailsTranslationBackingBean.setCurrentMode(ApplicationUserDetails.CurrentMode.LOCALIZE);
		model.addAttribute("applicationUserDetailsTranslationFormModel", applicationUserDetailsTranslationBackingBean);
		Long defaultLocale = Long.valueOf(Constants.REFERENCE_LOCALE__EN);
		setTranslationDropDownContents(model, locale);
		setDropDownContents(model, null, locale);		
		model.addAttribute("defaultLocale", defaultLocale);
		
		return "users/applicationuserdetails_localize";

	}
	
	
	

	// save or update ApplicationUserDetails
	// 1. @ModelAttribute bind form value
	// 2. @Validated form validator
	// 3. RedirectAttributes for flash value
	@RequestMapping(value = "/applicationuserdetails/post", method = RequestMethod.POST)
	public String saveOrUpdateApplicationUserDetails(Authentication authentication, @ModelAttribute("applicationUserDetailsFormModel") @Validated ApplicationUserDetailsImpl applicationUserDetails,
			BindingResult result, Model model, Locale locale,
			final RedirectAttributes redirectAttributes) {

		logger.debug("saveOrUpdateApplicationUserDetails() : {}", applicationUserDetails);
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		

		if (result.hasErrors()) {
			setDropDownContents(model, applicationUserDetails, locale);
			String updateIssueMessage = messageSource.getMessage("applicationUserDetailsUpdateIssueMessage", new String[0], locale);
			model.addAttribute("msg", updateIssueMessage);
			model.addAttribute("css", "alert-danger");
			
			return "users/applicationuserdetails";
		} else {

			// Add message to flash scope
			redirectAttributes.addFlashAttribute("css", "success");
			if(applicationUserDetails.isNew()){
				String addedSuccessMessage = messageSource.getMessage("applicationUserDetailsAddedSuccessMessage", new String[0], locale);
				// Add message to flash scope
				redirectAttributes.addFlashAttribute("msg", addedSuccessMessage);
				redirectAttributes.addFlashAttribute("css", "alert-success");
			}else{
				String updateSuccessMessage = messageSource.getMessage("applicationUserDetailsUpdateSuccessMessage", new String[0], locale);
				// Add message to flash scope
				redirectAttributes.addFlashAttribute("msg", updateSuccessMessage);
				redirectAttributes.addFlashAttribute("css", "alert-success");
			}


			try{
				// TODO: Needs exception handling policy
			    	applicationUserDetailsService.storeApplicationUserDetails(applicationUserDetails, userId);
			    	user.getApplicationUser().setApplicationUserDetails(applicationUserDetails);
			}
			catch (Exception ex){
				logger.error("Exception caught !!!!!!!!!!!!!!", ex);
			}
			
	
			

			
			// POST/REDIRECT/GET
			return "redirect:/registerofpledges/" + applicationUserDetails.getId() + "/update";
		}

	}

	// show add user form
	@RequestMapping(value = "/applicationuserdetails/add", method = RequestMethod.GET)
	public String showAddApplicationUserDetailsForm(Model model, Locale locale) {

		logger.debug("showAddApplicationUserDetailsForm()");

		ApplicationUserDetails applicationUserDetails = new ApplicationUserDetailsImpl();
		
		applicationUserDetails.setCurrentMode(ApplicationUserDetails.CurrentMode.ADD);

		model.addAttribute("applicationUserDetailsFormModel", applicationUserDetails);

		setDropDownContents(model, applicationUserDetails, locale);

		return "users/applicationuserdetails";

	}
	
	// support access to the supporting webpage by creating a new instance and returning 
	@RequestMapping(value = "/applicationuserdetailswebpage", method = RequestMethod.GET)
	public String createApplicationUserDetailsForWebPageView(Authentication authentication, Model model, HttpServletRequest request, Locale locale) {

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		List<ApplicationUserDetails> applicationUserDetailsList = applicationUserDetailsService.getApplicationUserDetailsBo().getApplicationUserDetailsDao().getApplicationUserDetailsByApplicationUser(userId);
		ApplicationUserDetails applicationUserDetails;
		if (applicationUserDetailsList.size() > 0){
			applicationUserDetails = applicationUserDetailsList.get(0);//assumes only one exists.(should be true as it is constrained)
		}else{
			applicationUserDetails = new ApplicationUserDetailsImpl();
		}
		try{
			// TODO: Needs exception handling policy
	    	applicationUserDetailsService.storeApplicationUserDetails(applicationUserDetails, userId);
	    	user.getApplicationUser().setApplicationUserDetails(applicationUserDetails);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
		

		model.addAttribute("applicationUserDetailsFormModel", applicationUserDetails);

		setDropDownContents(model, applicationUserDetails, locale);

		return "users/applicationuserdetailswebpage";

	}
	

	// show update form
	@RequestMapping(value = "/applicationuserdetails/{id}/update", method = RequestMethod.GET)
	public String showUpdateApplicationUserDetailsForm(Authentication authentication, @PathVariable("id") int id, Model model, Locale locale) {

		logger.debug("showUpdateApplicationUserDetailsForm() : {}", id);
		ApplicationUserDetails applicationUserDetails = null;
		try{
			// TODO: Needs exception handling policy
			SecurityUser user = (SecurityUser)authentication.getPrincipal();
	        Long userId = user.getApplicationUser().getId();
			applicationUserDetails = applicationUserDetailsService.load(Long.valueOf(id), userId);
			logger.info("\n\n\n\n Application user details : " + applicationUserDetails.toString());
			applicationUserDetails.setCurrentMode(ApplicationUserDetails.CurrentMode.UPDATE);
			applicationUserDetailsService.translateReferenceValues(applicationUserDetails, locale);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}

		
		model.addAttribute("applicationUserDetailsFormModel", applicationUserDetails);
		
		setDropDownContents(model, applicationUserDetails, locale);
		
		return "users/applicationuserdetails";

	}

	// delete applicationUserDetails
	@RequestMapping(value = "/applicationuserdetails/{id}/delete", method = RequestMethod.POST)
	public String deleteApplicationUserDetails(@PathVariable("id") int id, 
		final RedirectAttributes redirectAttributes) {

		logger.debug("deleteUser() : {}", id);

		//applicationUserDetailsService.delete(id);
		
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "User is deleted!");
		
		return "redirect:/applicationuserdetails/all";

	}

	// show user
	@RequestMapping(value = "/applicationuserdetails/{id}", method = RequestMethod.GET)
	public String showApplicationUserDetails(Authentication authentication,@PathVariable("id") int id, Model model, Locale locale) {

		logger.debug("showApplicationUserDetails() id: {}", id);
		ApplicationUserDetails applicationUserDetails = null;
		try{
			// TODO: Needs exception handling policy
			SecurityUser user = (SecurityUser)authentication.getPrincipal();
	        Long userId = user.getApplicationUser().getId();
			applicationUserDetails = applicationUserDetailsService.load(Long.valueOf(id), userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}

		
		if (applicationUserDetails == null) {
			model.addAttribute("css", "danger");
			model.addAttribute("msg", "User not found");
		}
		model.addAttribute("applicationUserDetails", applicationUserDetails);
		
		setDropDownContents(model, applicationUserDetails, locale);

		return "users/showapplicationuserdetails";

	}
	
	
	// save or update ApplicationUserDetailsTranslation
	// 1. @ModelAttribute bind form value
	// 2. @Validated form validator
	// 3. RedirectAttributes for flash value
	@RequestMapping(value = "/applicationuserdetails/translate", method = RequestMethod.POST)
	public String saveOrUpdateApplicationUserDetailsTranslation(Authentication authentication, @ModelAttribute("applicationUserDetailsTranslationFormModel") ApplicationUserDetailsTranslationBackingBeanImpl applicationUserDetailsTranslationBackingBean,
			BindingResult result, Model model, Locale locale,
			final RedirectAttributes redirectAttributes) {

		logger.debug("saveOrUpdateApplicationUserDetailsTranslation() : {}", applicationUserDetailsTranslationBackingBean);
		Long translationLocaleReferenceId = applicationUserDetailsTranslationBackingBean.getNewLocale();
		String translationLocale = messageSource.getMessage(referenceStore.getRefDesc(translationLocaleReferenceId), new String[0], new Locale("en"));
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		

		try{
			
			// TODO: Needs exception handling policy
			List<MessageResource> messageResourceList  = new ArrayList<MessageResource>();
			
			MessageResource messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.APPLICATIONUSERDETAILS_HEADER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getViewTitle());
			messageResourceList.add(messageResource);
			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.APPLICATIONUSERDETAILS_TITLE_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getFormTitle());
			messageResourceList.add(messageResource);
			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.APPLICATIONUSERDETAILS_SUBHEADER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getFormSubHeader());
			messageResourceList.add(messageResource);
			
			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTINFORMATIONINSTRUCTIONS_MESSAGE_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactInformationInstructionsMessage());
  			messageResourceList.add(messageResource);
  		messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTINFORMATIONINSTRUCTIONS_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactInformationInstructionsLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTINFORMATIONINSTRUCTIONS_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactInformationInstructionsPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTINFORMATIONINSTRUCTIONS_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactInformationInstructionsHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTNAME_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactNameLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTNAME_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactNamePlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CONTACTNAME_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getContactNameHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.REPRESENTORGANISATION_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getRepresentOrganisationLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.REPRESENTORGANISATION_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getRepresentOrganisationPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.REPRESENTORGANISATION_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getRepresentOrganisationHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.TELEPHONENUMBER_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getTelephoneNumberLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.TELEPHONENUMBER_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getTelephoneNumberPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.TELEPHONENUMBER_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getTelephoneNumberHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.ADDRESSONE_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getAddressOneLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.ADDRESSONE_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getAddressOnePlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.ADDRESSONE_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getAddressOneHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.ADDRESSTWO_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getAddressTwoLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.ADDRESSTWO_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getAddressTwoPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.ADDRESSTWO_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getAddressTwoHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CITY_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getCityLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CITY_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getCityPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.CITY_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getCityHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.STATEPROVINCEREGION_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getStateProvinceRegionLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.STATEPROVINCEREGION_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getStateProvinceRegionPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.STATEPROVINCEREGION_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getStateProvinceRegionHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.POSTCODE_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getPostCodeLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.POSTCODE_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getPostCodePlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.POSTCODE_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getPostCodeHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.COUNTRY_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getCountryLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.COUNTRY_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getCountryPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.COUNTRY_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getCountryHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.EMAILADDRESS_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getEmailAddressLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.EMAILADDRESS_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getEmailAddressPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.EMAILADDRESS_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getEmailAddressHelpText());
  			messageResourceList.add(messageResource);
  		
	messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.SAVEBUTTON_LABEL_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getSaveButtonLabel());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.SAVEBUTTON_PLACEHOLDER_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getSaveButtonPlaceHolder());
  			messageResourceList.add(messageResource);
  			messageResource = populateMessageResource(ApplicationUserDetailsTranslationBackingBeanImpl.SAVEBUTTON_HELPBLOCK_MAPPING_KEY, translationLocale, translationLocaleReferenceId, applicationUserDetailsTranslationBackingBean.getSaveButtonHelpText());
  			messageResourceList.add(messageResource);
  		

			

			this.messageSource.updateTexts(messageResourceList, userId);			
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
			
		// POST/REDIRECT/GET
		return "redirect:/applicationuserdetails/add?language=" + translationLocale;

	}
	
	/**
	 * Opens the details of the RegisterOfPledges that owns the ApplicationUserDetails identified by the
	 * id given as a parameter.
	 * @param id the id of the ApplicationUserDetails for which the RegisterOfPledges should be resolved.
	 */
	@RequestMapping(value = "/applicationuserdetails/{id}/registerofpledges", method = RequestMethod.GET)
	public String showRegisterOfPledges(Authentication authentication, @PathVariable("id") int id, 
		final RedirectAttributes redirectAttributes) {
		String returnPath = null;

		logger.debug("showRegisterOfPledges() : {}", id);
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		//TODO: Needs exception handling
		
		List<RegisterOfPledges> registerOfPledgesList = this.applicationUserDetailsService.getApplicationUserDetailsBo().getApplicationUserDetailsDao().listRegisterOfPledgesByApplicationUserDetailsId(Long.valueOf(id), userId);

		if (registerOfPledgesList.size() == 1){
			returnPath = "forward:/registerofpledges/" + registerOfPledgesList.get(0).getId() + "/update";
		}
		else{
			returnPath = "forward:/registerofpledges/all";
		}
		
		return returnPath;

	}

	

	private void setDropDownContents(Model model, ApplicationUserDetails applicationUserDetails, Locale locale) {
		
		Map<Long, String> representOrganisationMap = referenceStore.getYes_No();
		//All This stuff is completely ridiculous IMO -It is just a boolean field.. Dessie..
		Map<Boolean, String> localizedrepresentOrganisationMap = new HashMap<Boolean, String>();
		localizedrepresentOrganisationMap.put(false,  messageSource.getMessage(representOrganisationMap.get(Constants.REFERENCE_YES_NO__NO), new String[0], locale));
		localizedrepresentOrganisationMap.put(true,  messageSource.getMessage(representOrganisationMap.get(Constants.REFERENCE_YES_NO__YES), new String[0], locale));
		model.addAttribute("representOrganisationMap", localizedrepresentOrganisationMap);
	      
		Map<Long, String> countryMap = referenceStore.getEuropeCountry();
		SortedMap<Long, String> localizedcountryMap = new TreeMap<Long, String>(countryMap);
		for (Map.Entry<Long, String> entry : countryMap.entrySet()) {
			localizedcountryMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
		}
		model.addAttribute("countryMap", localizedcountryMap);
	      
		
		Map<Long, String> localeMap = referenceStore.getLocale();
		SortedMap<Long, String> localizedLocaleMap = new TreeMap<Long, String>(localeMap);
		for (Map.Entry<Long, String> entry : localeMap.entrySet()) {
			localizedLocaleMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
		}
		
		model.addAttribute("localeMap", localizedLocaleMap);
	}
	


}
