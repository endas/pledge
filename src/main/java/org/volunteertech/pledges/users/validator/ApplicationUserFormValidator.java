package org.volunteertech.pledges.users.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.users.dao.ApplicationUser;
import org.volunteertech.pledges.users.business.ApplicationUserBo;

@Component
public class ApplicationUserFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	ApplicationUserBo applicationUserBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ApplicationUser.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ApplicationUser applicationUser = (ApplicationUser) target;
		
		if (applicationUser.getUsername().length() > 45){
			errors.rejectValue("username", "applicationuser.username.validation.length", new Object[] {45}, "< 45");
		}
		  
		if ( (applicationUser.getUsername().length() > 0) && (applicationUser.getUsername().length() < 5) ){
			errors.rejectValue("username", "applicationuser.username.optional.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "applicationuser.password.validation.required");    
        
		if (applicationUser.getPassword().length() > 60){
			errors.rejectValue("password", "applicationuser.password.validation.length", new Object[] {60}, "< 60");
		}
		  
		if ( (applicationUser.getPassword().length() > 0) && (applicationUser.getPassword().length() < 5) ){
			errors.rejectValue("password", "applicationuser.password.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		


	}

}

