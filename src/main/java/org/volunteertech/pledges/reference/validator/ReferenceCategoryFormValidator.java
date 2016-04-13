package org.volunteertech.pledges.reference.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.reference.dao.ReferenceCategory;
import org.volunteertech.pledges.reference.business.ReferenceCategoryBo;

@Component
public class ReferenceCategoryFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	ReferenceCategoryBo referenceCategoryBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ReferenceCategory.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ReferenceCategory referenceCategory = (ReferenceCategory) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "referenceCategoryDesc", "referencecategory.referencecategorydesc.validation.required");    
        
		if (referenceCategory.getReferenceCategoryDesc().length() > 50){
			errors.rejectValue("referenceCategoryDesc", "referencecategory.referencecategorydesc.validation.length", new Object[] {50}, "< 50");
		}
		  
		if ( (referenceCategory.getReferenceCategoryDesc().length() > 0) && (referenceCategory.getReferenceCategoryDesc().length() < 5) ){
			errors.rejectValue("referenceCategoryDesc", "referencecategory.referencecategorydesc.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		if (referenceCategory.getDescription().length() > 200){
			errors.rejectValue("description", "referencecategory.description.validation.length", new Object[] {200}, "< 200");
		}
		  
		if ( (referenceCategory.getDescription().length() > 0) && (referenceCategory.getDescription().length() < 5) ){
			errors.rejectValue("description", "referencecategory.description.optional.validation.minimumlength", new Object[] {5}, "> 5");
		}
		    
		


	}

}

