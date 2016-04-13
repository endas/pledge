package org.volunteertech.pledges.reference.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.reference.dao.Reference;
import org.volunteertech.pledges.reference.business.ReferenceBo;

@Component
public class ReferenceFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	ReferenceBo referenceBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Reference.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Reference reference = (Reference) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "refType", "reference.reftype.validation.required");    
        
		if (reference.getRefType().length() > 50){
			errors.rejectValue("refType", "reference.reftype.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (reference.getRefType().length() > 0) && (reference.getRefType().length() < 5) ){
			errors.rejectValue("refType", "reference.reftype.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "refDesc", "reference.refdesc.validation.required");    
        
		if (reference.getRefDesc().length() > 50){
			errors.rejectValue("refDesc", "reference.refdesc.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (reference.getRefDesc().length() > 0) && (reference.getRefDesc().length() < 5) ){
			errors.rejectValue("refDesc", "reference.refdesc.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "parentId", "reference.parentid.validation.required");    
        
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "refIndex", "reference.refindex.validation.required");    
        
		if (reference.getDescription().length() > 200){
			errors.rejectValue("description", "reference.description.validation.length", new Object[] {200}, "< 200");
		}
		  
		if ( (reference.getDescription().length() > 0) && (reference.getDescription().length() < 5) ){
			errors.rejectValue("description", "reference.description.optional.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		


	}

}

