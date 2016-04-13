package org.volunteertech.pledges.goodspledge.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.goodspledge.dao.GoodsPledge;
import org.volunteertech.pledges.goodspledge.business.GoodsPledgeBo;

@Component
public class GoodsPledgeFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	GoodsPledgeBo goodsPledgeBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return GoodsPledge.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		GoodsPledge goodsPledge = (GoodsPledge) target;
		
		if (goodsPledge.getAdditionalInformation().length() > 500){
			errors.rejectValue("additionalInformation", "goodspledge.additionalinformation.validation.length", new Object[] {500}, "< 500");
		}
		  
		if ( (goodsPledge.getAdditionalInformation().length() > 0) && (goodsPledge.getAdditionalInformation().length() < 0) ){
			errors.rejectValue("additionalInformation", "goodspledge.additionalinformation.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if (goodsPledge.getItemSize().length() > 500){
			errors.rejectValue("itemSize", "goodspledge.itemsize.validation.length", new Object[] {500}, "< 500");
		}
		  
		if ( (goodsPledge.getItemSize().length() > 0) && (goodsPledge.getItemSize().length() < 0) ){
			errors.rejectValue("itemSize", "goodspledge.itemsize.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		


	}

}

