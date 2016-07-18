package org.volunteertech.pledges.accommodationpledge.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledge;
import org.volunteertech.pledges.accommodationpledge.business.AccommodationPledgeBo;

@Component
public class AccommodationPledgeFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	AccommodationPledgeBo accommodationPledgeBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return AccommodationPledge.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		AccommodationPledge accommodationPledge = (AccommodationPledge) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressOne", "accommodationpledge.addressone.validation.required");    
        
		if (accommodationPledge.getAddressOne().length() > 50){
			errors.rejectValue("addressOne", "accommodationpledge.addressone.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (accommodationPledge.getAddressOne().length() > 0) && (accommodationPledge.getAddressOne().length() < 5) ){
			errors.rejectValue("addressOne", "accommodationpledge.addressone.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressTwo", "accommodationpledge.addresstwo.validation.required");    
        
		if (accommodationPledge.getAddressTwo().length() > 50){
			errors.rejectValue("addressTwo", "accommodationpledge.addresstwo.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (accommodationPledge.getAddressTwo().length() > 0) && (accommodationPledge.getAddressTwo().length() < 5) ){
			errors.rejectValue("addressTwo", "accommodationpledge.addresstwo.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		if (accommodationPledge.getCity().length() > 50){
			errors.rejectValue("city", "accommodationpledge.city.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (accommodationPledge.getCity().length() > 0) && (accommodationPledge.getCity().length() < 2) ){
			errors.rejectValue("city", "accommodationpledge.city.optional.validation.minimumlength", new Object[] {2}, "> 2");
		}
		    
		if (accommodationPledge.getStateProvinceRegion().length() > 50){
			errors.rejectValue("stateProvinceRegion", "accommodationpledge.stateprovinceregion.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (accommodationPledge.getStateProvinceRegion().length() > 0) && (accommodationPledge.getStateProvinceRegion().length() < 2) ){
			errors.rejectValue("stateProvinceRegion", "accommodationpledge.stateprovinceregion.optional.validation.minimumlength", new Object[] {2}, "> 2");
		}
		    
		if (accommodationPledge.getPostCode().length() > 10){
			errors.rejectValue("postCode", "accommodationpledge.postcode.validation.length", new Object[] {10}, "< 10");
		}
		  
		if ( (accommodationPledge.getPostCode().length() > 0) && (accommodationPledge.getPostCode().length() < 0) ){
			errors.rejectValue("postCode", "accommodationpledge.postcode.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if(accommodationPledge.getCountry() == 0 || accommodationPledge.getCountry() == -1){
			errors.rejectValue("country", "accommodationpledge.country.validation.required");
		}
        
		if (accommodationPledge.getOtherAmenities().length() > 500){
			errors.rejectValue("otherAmenities", "accommodationpledge.otheramenities.validation.length", new Object[] {500}, "< 500");
		}
		  
		if ( (accommodationPledge.getOtherAmenities().length() > 0) && (accommodationPledge.getOtherAmenities().length() < 0) ){
			errors.rejectValue("otherAmenities", "accommodationpledge.otheramenities.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if (accommodationPledge.getAdditionalInformation().length() > 500){
			errors.rejectValue("additionalInformation", "accommodationpledge.additionalinformation.validation.length", new Object[] {500}, "< 500");
		}
		  
		if ( (accommodationPledge.getAdditionalInformation().length() > 0) && (accommodationPledge.getAdditionalInformation().length() < 0) ){
			errors.rejectValue("additionalInformation", "accommodationpledge.additionalinformation.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		
		
	

	}

}

