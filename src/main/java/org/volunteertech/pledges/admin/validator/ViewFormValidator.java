package org.volunteertech.pledges.admin.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.admin.dao.View;
import org.volunteertech.pledges.admin.business.ViewBo;

@Component
public class ViewFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	ViewBo viewBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return View.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		View view = (View) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "viewName", "view.viewname.validation.required");    
        
		if (view.getViewName().length() > 50){
			errors.rejectValue("viewName", "view.viewname.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (view.getViewName().length() > 0) && (view.getViewName().length() < 5) ){
			errors.rejectValue("viewName", "view.viewname.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		


	}

}

