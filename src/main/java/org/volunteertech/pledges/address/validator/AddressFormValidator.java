package org.volunteertech.pledges.address.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.address.dao.Address;
import org.volunteertech.pledges.address.business.AddressBo;

@Component
public class AddressFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	AddressBo addressBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Address.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Address address = (Address) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressOne", "address.addressone.validation.required");    
        
		if (address.getAddressOne().length() > 50){
			errors.rejectValue("addressOne", "address.addressone.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (address.getAddressOne().length() > 0) && (address.getAddressOne().length() < 5) ){
			errors.rejectValue("addressOne", "address.addressone.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressTwo", "address.addresstwo.validation.required");    
        
		if (address.getAddressTwo().length() > 50){
			errors.rejectValue("addressTwo", "address.addresstwo.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (address.getAddressTwo().length() > 0) && (address.getAddressTwo().length() < 5) ){
			errors.rejectValue("addressTwo", "address.addresstwo.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		if (address.getCity().length() > 50){
			errors.rejectValue("city", "address.city.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (address.getCity().length() > 0) && (address.getCity().length() < 0) ){
			errors.rejectValue("city", "address.city.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if (address.getStateProvinceRegion().length() > 50){
			errors.rejectValue("stateProvinceRegion", "address.stateprovinceregion.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (address.getStateProvinceRegion().length() > 0) && (address.getStateProvinceRegion().length() < 0) ){
			errors.rejectValue("stateProvinceRegion", "address.stateprovinceregion.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if (address.getPostCode().length() > 10){
			errors.rejectValue("postCode", "address.postcode.validation.length", new Object[] {10}, "< 10");
		}
		  
		if ( (address.getPostCode().length() > 0) && (address.getPostCode().length() < 0) ){
			errors.rejectValue("postCode", "address.postcode.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if(address.getCountry() == 0 || address.getCountry() == -1){
			errors.rejectValue("country", "address.country.validation.required");
		}
        
		


	}

}

