package org.volunteertech.pledges.startup.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.startup.dao.Landing;
import org.volunteertech.pledges.startup.business.LandingBo;

@Component
public class LandingFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	LandingBo landingBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Landing.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Landing landing = (Landing) target;
		
		


	}

}

