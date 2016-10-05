	<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<div class="modal fade" id="servicePledgeCreateUpdateModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">ServicePledge</h4>
      </div>
      <div class="modal-body">

        <form id="frmServicePledgeCreateUpdate" role="form" action="restful/servicepledge" method="post">
          <input id="frmServicePledgeCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmServicePledgeCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmServicePledgeCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmServicePledgeCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmServicePledgeCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmServicePledgeCreateUpdateTitle" type="hidden"/>
		 
		  <div id="frmServicePledgeCreateUpdatePledgeServiceLevelOneFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.pledgeservicelevelone.label" for="frmServicePledgeCreateUpdatePledgeServiceLevelOne" class="control-label"><spring:message code="frmServicePledgePledgeServiceLevelOneLabel"/></label>	
			<select class="form-control" data-display-name="Your Service" data-select-type="standalone" data-required="false" id="frmServicePledgeCreateUpdatePledgeServiceLevelOne" aria-describedby="frmServicePledgeCreateUpdatePledgeServiceLevelOneHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledgeCreateUpdatePledgeServiceLevelTwo'), 'theValueToSet', 'PledgeServiceLevelTwo', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>')">
			</select>
			<span id="frmServicePledgeCreateUpdatePledgeServiceLevelOneHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceLevelOneHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceLevelOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceLevelOneAlertBlockText"></span>
			</div>	  
		  </div>
  
		  <div id="frmServicePledgeCreateUpdatePledgeServiceLevelTwoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="servicepledge.pledgeserviceleveltwo.label" for="frmServicePledgeCreateUpdatePledgeServiceLevelTwo" class="control-label"><spring:message code="frmServicePledgePledgeServiceLevelTwoLabel"/></label>	
			<select class="form-control" data-display-name="" data-select-type="standalone" data-required="false" id="frmServicePledgeCreateUpdatePledgeServiceLevelTwo" aria-describedby="frmServicePledgeCreateUpdatePledgeServiceLevelTwoHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledgeCreateUpdatePledgeServiceLevelThree'), 'theValueToSet', 'PledgeServiceLevelThree', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>')">
			</select>
	  
			<span id="frmServicePledgeCreateUpdatePledgeServiceLevelTwoHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceLevelTwoHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceLevelTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceLevelTwoAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmServicePledgeCreateUpdatePledgeServiceLevelThreeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="servicepledge.pledgeservicelevelthree.label" for="frmServicePledgeCreateUpdatePledgeServiceLevelThree" class="control-label"><spring:message code="frmServicePledgePledgeServiceLevelThreeLabel"/></label>	
			<select class="form-control" data-display-name="" data-select-type="standalone" data-required="false" id="frmServicePledgeCreateUpdatePledgeServiceLevelThree" aria-describedby="frmServicePledgeCreateUpdatePledgeServiceLevelThreeHelpBlock">
			</select>
	  
			<span id="frmServicePledgeCreateUpdatePledgeServiceLevelThreeHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceLevelThreeHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceLevelThreeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceLevelThreeAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmServicePledgeCreateUpdateAdditionalInformationFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.additionalinformation.label" for="frmServicePledgeCreateUpdateAdditionalInformation" class="control-label"><spring:message code="frmServicePledgeAdditionalInformationLabel"/></label>
			<textarea rows="5" data-display-name="Additional Information" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmServicePledgeCreateUpdateAdditionalInformation" placeholder="<spring:message code="frmServicePledgeAdditionalInformationPlaceHolder"/>" aria-describedby="frmServicePledgeCreateUpdateAdditionalInformationHelpBlock" oninput="check_textarea_length(500, this, document.getElementById('frmServicePledgeCreateUpdateAdditionalInformationCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmServicePledgeCreateUpdateAdditionalInformationCountBlock" class="help-block"></span>
			<span id="frmServicePledgeCreateUpdateAdditionalInformationHelpBlock" class="help-block"><spring:message code="frmServicePledgeAdditionalInformationHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdateAdditionalInformationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdateAdditionalInformationAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmServicePledgeCreateUpdatePledgeServiceQualificationFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.pledgeservicequalification.label" for="frmServicePledgeCreateUpdatePledgeServiceQualification" class="control-label"><spring:message code="frmServicePledgePledgeServiceQualificationLabel"/></label>
			<textarea rows="5" data-display-name="Qualification to provide Service" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmServicePledgeCreateUpdatePledgeServiceQualification" placeholder="<spring:message code="frmServicePledgePledgeServiceQualificationPlaceHolder"/>" aria-describedby="frmServicePledgeCreateUpdatePledgeServiceQualificationHelpBlock" oninput="check_textarea_length(500, this, document.getElementById('frmServicePledgeCreateUpdatePledgeServiceQualificationCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmServicePledgeCreateUpdatePledgeServiceQualificationCountBlock" class="help-block"></span>
			<span id="frmServicePledgeCreateUpdatePledgeServiceQualificationHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceQualificationHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceQualificationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceQualificationAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.pledgeservicedateavailable.label" for="frmServicePledgeCreateUpdatePledgeServiceDateAvailable" class="control-label"><spring:message code="frmServicePledgePledgeServiceDateAvailableLabel"/></label>
			<input type="text" data-display-name="Date Available for Use" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmServicePledgeCreateUpdatePledgeServiceDateAvailable" 
			placeholder="<spring:message code="frmAccommodationPledgeAccommodationDateToPlaceHolder"/>" aria-describedby="frmServicePledgeCreateUpdatePledgeServiceDateAvailableHelpBlock"  data-toggle="popover"/>
    
			<span id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceDateAvailableHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableAlertBlockText"></span>
			</div>
				  
		  </div>
  
 		 <div id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableToFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.pledgeservicedateavailableto.label" for="frmServicePledgeCreateUpdatePledgeServiceDateAvailableTo" class="control-label"><spring:message code="frmServicePledgePledgeServiceDateAvailableToLabel"/></label>
			<input type="text" data-display-name="Date Available Until" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" 
			id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableTo" 
			placeholder="<spring:message code="frmAccommodationPledgeAccommodationDateToPlaceHolder"/>"
			aria-describedby="frmServicePledgeCreateUpdatePledgeServiceDateAvailableToHelpBlock"  data-toggle="popover"/>
			<span id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableToHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceDateAvailableToHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableToAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceDateAvailableToAlertBlockText"></span>
			</div> 
		  </div>
  
  
  
		  <div id="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeekFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.pledgeservicehoursperweek.label" for="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeek" class="control-label"><spring:message code="frmServicePledgePledgeServiceHoursPerWeekLabel"/></label>	
			<select class="form-control" data-display-name="Hours per week" data-select-type="standalone" data-required="false" id="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeek" aria-describedby="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeekHelpBlock">
			
			</select>
	  
			<span id="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeekHelpBlock" class="help-block"><spring:message code="frmServicePledgePledgeServiceHoursPerWeekHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeekAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdatePledgeServiceHoursPerWeekAlertBlockText"></span>
			</div>
				  
		  </div>
  
  		 <div id="frmServicePledgeCreateUpdateTravelAbilitiesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.travel.label" for="frmServicePledgeCreateUpdateTravelAbilities" class="control-label"><spring:message code="frmServicePledgeTravelLabel"/></label>
			<select id="frmServicePledgeCreateUpdateTravelAbilitiesSelect" name="amenities" class="chosen" multiple style="width: 500px;" data-placeholder="<spring:message code="frmServicePledgeTravelAbilitiesPlaceHolder"/>" >
      			  
   			 </select>
			<span id="frmServicePledgeCreateUpdateTravelAbilitiesCountBlock" class="help-block"></span>
			<div id="frmServicePledgeCreateUpdateTravelAbilitiesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdateTravelAbilitiesAlertBlockText"></span>
			</div>	  
		  </div>
					<div id="frmServicePledgeCreateUpdatePledgeStatusFormGroup"
						<sec:authorize access="hasRole('ROLE_ADMIN')">class="form-group has-feedback  ${status.error ? 'has-error' : ''}"</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_ADMIN')">class="hidden"</sec:authorize>
						>
						<label id="servicepledge.travel.label"
							for="frmServicePledgeCreateUpdatePledgeStatus"
							class="control-label"><spring:message
								code="frmPledgeStatusLabel" /></label> 
								<select class="form-control js-status-select"
							id="frmServicePledgeStatusSelect" name="servicePledgeStatus"
							data-select-type="standalone" data-required="true"
							style="width: 500px;"
							data-placeholder="<spring:message code="frmPledgeStatusPlaceHolder"/>">
					
						</select> <span id="frmServicePledgeCreateUpdatePledgeStatusCountBlock"
							class="help-block"></span>
						<div id="frmServicePledgeCreateUpdatePledgeStatusAlertBlock"
							class="alert alert-dismissible hidden" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<span id="frmServicePledgeCreateUpdatePledgeStatusAlertBlockText"></span>
						</div>
					</div>




					<%--  <div id="frmServicePledgeCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="servicepledge.savebutton.label" for="frmServicePledgeCreateUpdateSaveButton" class="control-label"><spring:message code="frmServicePledgeSaveButtonLabel"/></label>
			<span id="frmServicePledgeCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmServicePledgeSaveButtonHelpBlock"/></span>
			<div id="frmServicePledgeCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmServicePledgeCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div> --%>
		  	 <div class="form-group">
            <input type="checkbox" data-display-name="Same Address as Profile"
              data-required="false" id="pledgeSameAsProfileAddress" class="js-address-same-as-profile"
              /> <label id="pledge.sameAsProfileAddress.label" for="pledgeSameAsProfileAddress" class="control-label"><spring:message code="frmServiceSameAsProfileAddress"/></label> 
        </div>
			<jsp:include page="../includes/address_modal_fields.jsp"></jsp:include>
      	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmServicePledgeCreateUpdateCloseButton" class="btn btn-primary">Close</button>
        <button type="button" id="frmServicePledgeCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save Pledge</span></button>
      </div>
    </div>
  </div>
</div>
	
