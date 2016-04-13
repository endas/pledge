package org.volunteertech.pledges.pledge.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.pledge.dao.RegisterOfPledges;
import org.volunteertech.pledges.pledge.business.RegisterOfPledgesBo;

@Component
public class RegisterOfPledgesFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	RegisterOfPledgesBo registerOfPledgesBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterOfPledges.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		RegisterOfPledges registerOfPledges = (RegisterOfPledges) target;
		
		


	}

}

