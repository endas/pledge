package org.volunteertech.pledges.users.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.users.dao.ApplicationUserDetails;
import org.volunteertech.pledges.users.business.ApplicationUserDetailsBo;

@Component
public class ApplicationUserDetailsFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	ApplicationUserDetailsBo applicationUserDetailsBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ApplicationUserDetails.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ApplicationUserDetails applicationUserDetails = (ApplicationUserDetails) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contactName", "applicationuserdetails.contactname.validation.required");    
        
		if (applicationUserDetails.getContactName().length() > 50){
			errors.rejectValue("contactName", "applicationuserdetails.contactname.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (applicationUserDetails.getContactName().length() > 0) && (applicationUserDetails.getContactName().length() < 2) ){
			errors.rejectValue("contactName", "applicationuserdetails.contactname.validation.minimumlength", new Object[] {2}, "> 2");
		}
		    
		if(applicationUserDetails.getRepresentOrganisation() == 0 || applicationUserDetails.getRepresentOrganisation() == -1){
			errors.rejectValue("representOrganisation", "applicationuserdetails.representorganisation.validation.required");
		}
        
		if (applicationUserDetails.getTelephoneNumber().length() > 20){
			errors.rejectValue("telephoneNumber", "applicationuserdetails.telephonenumber.validation.length", new Object[] {20}, "< 20");
		}
		  
		if ( (applicationUserDetails.getTelephoneNumber().length() > 0) && (applicationUserDetails.getTelephoneNumber().length() < 7) ){
			errors.rejectValue("telephoneNumber", "applicationuserdetails.telephonenumber.optional.validation.minimumlength", new Object[] {7}, "> 7");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressOne", "applicationuserdetails.addressone.validation.required");    
        
		if (applicationUserDetails.getAddressOne().length() > 50){
			errors.rejectValue("addressOne", "applicationuserdetails.addressone.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (applicationUserDetails.getAddressOne().length() > 0) && (applicationUserDetails.getAddressOne().length() < 5) ){
			errors.rejectValue("addressOne", "applicationuserdetails.addressone.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressTwo", "applicationuserdetails.addresstwo.validation.required");    
        
		if (applicationUserDetails.getAddressTwo().length() > 50){
			errors.rejectValue("addressTwo", "applicationuserdetails.addresstwo.validation.length", new Object[] {50}, "< 50");
		}
		  
//		if ( (applicationUserDetails.getAddressTwo().length() > 0) && (applicationUserDetails.getAddressTwo().length() < 5) ){
//			errors.rejectValue("addressTwo", "applicationuserdetails.addresstwo.validation.minimumlength", new Object[] {5}, "> 5");
//		}
		    
		if (applicationUserDetails.getCity().length() > 50){
			errors.rejectValue("city", "applicationuserdetails.city.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (applicationUserDetails.getCity().length() > 0) && (applicationUserDetails.getCity().length() < 2) ){
			errors.rejectValue("city", "applicationuserdetails.city.optional.validation.minimumlength", new Object[] {2}, "> 2");
		}
		    
		if (applicationUserDetails.getStateProvinceRegion().length() > 50){
			errors.rejectValue("stateProvinceRegion", "applicationuserdetails.stateprovinceregion.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (applicationUserDetails.getStateProvinceRegion().length() > 0) && (applicationUserDetails.getStateProvinceRegion().length() < 2) ){
			errors.rejectValue("stateProvinceRegion", "applicationuserdetails.stateprovinceregion.optional.validation.minimumlength", new Object[] {2}, "> 2");
		}
		    
		if (applicationUserDetails.getPostCode().length() > 10){
			errors.rejectValue("postCode", "applicationuserdetails.postcode.validation.length", new Object[] {10}, "< 10");
		}
		  
		if ( (applicationUserDetails.getPostCode().length() > 0) && (applicationUserDetails.getPostCode().length() < 0) ){
			errors.rejectValue("postCode", "applicationuserdetails.postcode.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		   
		applicationUserDetails.setCountry(159L);//always ireland for the time being
		if(applicationUserDetails.getCountry() == 0 || applicationUserDetails.getCountry() == -1){
			errors.rejectValue("country", "applicationuserdetails.country.validation.required");
		}
        
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailAddress", "applicationuserdetails.emailaddress.validation.required");    
//        
//		if(!emailValidator.valid(applicationUserDetails.getEmailAddress())){
//			errors.rejectValue("emailAddress", "applicationuserdetails.emailaddress.email.invalid");
//		}
//    
		


	}

}

