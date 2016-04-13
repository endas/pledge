package org.volunteertech.pledges.localisation.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.business.MessageResourceBo;

@Component
public class MessageResourceFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	MessageResourceBo messageResourceBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MessageResource.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		MessageResource messageResource = (MessageResource) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "messageKey", "messageresource.messagekey.validation.required");    
        
		if (messageResource.getMessageKey().length() > 200){
			errors.rejectValue("messageKey", "messageresource.messagekey.validation.length", new Object[] {200}, "< 200");
		}
		  
		if ( (messageResource.getMessageKey().length() > 0) && (messageResource.getMessageKey().length() < 10) ){
			errors.rejectValue("messageKey", "messageresource.messagekey.validation.minimumlength", new Object[] {10}, "> 10");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "locale", "messageresource.locale.validation.required");    
        
		if (messageResource.getLocale().length() > 10){
			errors.rejectValue("locale", "messageresource.locale.validation.length", new Object[] {10}, "< 10");
		}
		  
		if ( (messageResource.getLocale().length() > 0) && (messageResource.getLocale().length() < 3) ){
			errors.rejectValue("locale", "messageresource.locale.validation.minimumlength", new Object[] {3}, "> 3");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "localeReferenceId", "messageresource.localereferenceid.validation.required");    
        
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "message", "messageresource.message.validation.required");    
        
		if (messageResource.getMessage().length() > 2000){
			errors.rejectValue("message", "messageresource.message.validation.length", new Object[] {2000}, "< 2000");
		}
		  
		if ( (messageResource.getMessage().length() > 0) && (messageResource.getMessage().length() < 0) ){
			errors.rejectValue("message", "messageresource.message.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		


	}

}

