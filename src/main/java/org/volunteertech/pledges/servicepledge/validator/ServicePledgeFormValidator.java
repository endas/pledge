package org.volunteertech.pledges.servicepledge.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.netgrains.validators.EmailValidator;
import org.volunteertech.pledges.servicepledge.dao.ServicePledge;
import org.volunteertech.pledges.servicepledge.business.ServicePledgeBo;

@Component
public class ServicePledgeFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;
	
	@Autowired
	ServicePledgeBo servicePledgeBo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ServicePledge.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ServicePledge servicePledge = (ServicePledge) target;
		
		if (servicePledge.getAdditionalInformation().length() > 500){
			errors.rejectValue("additionalInformation", "servicepledge.additionalinformation.validation.length", new Object[] {500}, "< 500");
		}
		  
		if ( (servicePledge.getAdditionalInformation().length() > 0) && (servicePledge.getAdditionalInformation().length() < 0) ){
			errors.rejectValue("additionalInformation", "servicepledge.additionalinformation.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		if (servicePledge.getPledgeServiceQualification().length() > 500){
			errors.rejectValue("pledgeServiceQualification", "servicepledge.pledgeservicequalification.validation.length", new Object[] {500}, "< 500");
		}
		  
		if ( (servicePledge.getPledgeServiceQualification().length() > 0) && (servicePledge.getPledgeServiceQualification().length() < 0) ){
			errors.rejectValue("pledgeServiceQualification", "servicepledge.pledgeservicequalification.optional.validation.minimumlength", new Object[] {0}, "> 0");
		}
		    
		


	}

}

