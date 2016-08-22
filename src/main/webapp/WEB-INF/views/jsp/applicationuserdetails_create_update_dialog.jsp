<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="applicationUserDetailsCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">ApplicationUserDetails</h4>
      </div>
      <div class="modal-body">

        <form id="frmApplicationUserDetailsCreateUpdate" role="form" action="restful/applicationuserdetails" method="post">
          <input id="frmApplicationUserDetailsCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmApplicationUserDetailsCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmApplicationUserDetailsCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmApplicationUserDetailsCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmApplicationUserDetailsCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmApplicationUserDetailsCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmApplicationUserDetailsCreateUpdateContactInformationInstructionsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.contactinformationinstructions.label" for="frmApplicationUserDetailsCreateUpdateContactInformationInstructions" class="control-label"><spring:message code="frmApplicationUserDetailsContactInformationInstructionsLabel"/></label>
			<span id="frmApplicationUserDetailsCreateUpdateContactInformationInstructionsHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsContactInformationInstructionsHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateContactInformationInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateContactInformationInstructionsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateContactNameFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.contactname.label" for="frmApplicationUserDetailsCreateUpdateContactName" class="control-label"><spring:message code="frmApplicationUserDetailsContactNameLabel"/></label>
			<input type="text" data-display-name="Contact Name" data-minlength="2" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsCreateUpdateContactName" placeholder="<spring:message code="frmApplicationUserDetailsContactNamePlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateContactNameHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateContactNameHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsContactNameHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateContactNameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateContactNameAlertBlockText"></span>
			</div>
				  
		  </div>
  
		
		  <div id="frmApplicationUserDetailsCreateUpdateTelephoneNumberFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.telephonenumber.label" for="frmApplicationUserDetailsCreateUpdateTelephoneNumber" class="control-label"><spring:message code="frmApplicationUserDetailsTelephoneNumberLabel"/></label>
			<input type="tel" data-display-name="Phone Number" data-minlength="7" data-required="false" maxlength="20" class="form-control" id="frmApplicationUserDetailsCreateUpdateTelephoneNumber" placeholder="<spring:message code="frmApplicationUserDetailsTelephoneNumberPlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateTelephoneNumberHelpBlock" data-data-type="long" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateTelephoneNumberHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsTelephoneNumberHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateTelephoneNumberAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateTelephoneNumberAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateAddressOneFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.addressone.label" for="frmApplicationUserDetailsCreateUpdateAddressOne" class="control-label"><spring:message code="frmApplicationUserDetailsAddressOneLabel"/></label>
			<input type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsCreateUpdateAddressOne" placeholder="<spring:message code="frmApplicationUserDetailsAddressOnePlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateAddressOneHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateAddressOneHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsAddressOneHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateAddressOneAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateAddressTwoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.addresstwo.label" for="frmApplicationUserDetailsCreateUpdateAddressTwo" class="control-label"><spring:message code="frmApplicationUserDetailsAddressTwoLabel"/></label>
			<input type="text" data-display-name="Address Line 2" data-minlength="5" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsCreateUpdateAddressTwo" placeholder="<spring:message code="frmApplicationUserDetailsAddressTwoPlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateAddressTwoHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateAddressTwoHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsAddressTwoHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateAddressTwoAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateCityFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.city.label" for="frmApplicationUserDetailsCreateUpdateCity" class="control-label"><spring:message code="frmApplicationUserDetailsCityLabel"/></label>
			<input type="text" data-display-name="Townland/Town/City" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsCreateUpdateCity" placeholder="<spring:message code="frmApplicationUserDetailsCityPlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateCityHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateCityHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsCityHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateCityAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateStateProvinceRegionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.stateprovinceregion.label" for="frmApplicationUserDetailsCreateUpdateStateProvinceRegion" class="control-label"><spring:message code="frmApplicationUserDetailsStateProvinceRegionLabel"/></label>
			<input type="text" data-display-name="State/Province/Region" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsCreateUpdateStateProvinceRegion" placeholder="<spring:message code="frmApplicationUserDetailsStateProvinceRegionPlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateStateProvinceRegionHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateStateProvinceRegionHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsStateProvinceRegionHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateStateProvinceRegionAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdatePostCodeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.postcode.label" for="frmApplicationUserDetailsCreateUpdatePostCode" class="control-label"><spring:message code="frmApplicationUserDetailsPostCodeLabel"/></label>
			<input type="text" data-display-name="Eircode" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmApplicationUserDetailsCreateUpdatePostCode" placeholder="<spring:message code="frmApplicationUserDetailsPostCodePlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdatePostCodeHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdatePostCodeHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsPostCodeHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdatePostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdatePostCodeAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateCountryFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.country.label" for="frmApplicationUserDetailsCreateUpdateCountry" class="control-label"><spring:message code="frmApplicationUserDetailsCountryLabel"/></label>	
			<select class="form-control" data-display-name="Country" data-select-type="standalone" data-required="true" id="frmApplicationUserDetailsCreateUpdateCountry" aria-describedby="frmApplicationUserDetailsCreateUpdateCountryHelpBlock">
			</select>
	  
			<span id="frmApplicationUserDetailsCreateUpdateCountryHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsCountryHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateCountryAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserDetailsCreateUpdateEmailAddressFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.emailaddress.label" for="frmApplicationUserDetailsCreateUpdateEmailAddress" class="control-label"><spring:message code="frmApplicationUserDetailsEmailAddressLabel"/></label>
			<input type="email" data-display-name="Email Address" data-minlength="5" data-required="true" maxlength="256" class="form-control" id="frmApplicationUserDetailsCreateUpdateEmailAddress" placeholder="<spring:message code="frmApplicationUserDetailsEmailAddressPlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateEmailAddressHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserDetailsCreateUpdateEmailAddressHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsEmailAddressHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateEmailAddressAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateEmailAddressAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <%-- <div id="frmApplicationUserDetailsCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.savebutton.label" for="frmApplicationUserDetailsCreateUpdateSaveButton" class="control-label"><spring:message code="frmApplicationUserDetailsSaveButtonLabel"/></label>
			<span id="frmApplicationUserDetailsCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsSaveButtonHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div> --%>
		  <div id="frmApplicationUserDetailsCreateUpdateRepresentOrganisationFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.representorganisation.label" for="frmApplicationUserDetailsCreateUpdateRepresentOrganisation" class="control-label"><spring:message code="frmApplicationUserDetailsRepresentOrganisationLabel"/></label>	
			<select class="form-control" data-display-name="Are you pledging on behalf of an organisation?." data-select-type="standalone" data-required="true" id="frmApplicationUserDetailsCreateUpdateRepresentOrganisation" aria-describedby="frmApplicationUserDetailsCreateUpdateRepresentOrganisationHelpBlock">
			</select>
	  
			<span id="frmApplicationUserDetailsCreateUpdateRepresentOrganisationHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsRepresentOrganisationHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateRepresentOrganisationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateRepresentOrganisationAlertBlockText"></span>
			</div>
				  
		  </div>
		  
		   <div id="frmApplicationUserDetailsCreateUpdateOrganisationNameFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuserdetails.representorganisation.label" for="frmApplicationUserDetailsCreateUpdateOrganisationName" class="control-label"><spring:message code="frmApplicationUserDetailsOrganisationNameLabel"/></label>	
		
	  		<input type="text" data-display-name="Organisation Name" data-minlength="2" data-required="false" maxlength="80" class="form-control" id="frmApplicationUserDetailsCreateUpdateOrganisationName" placeholder="<spring:message code="frmApplicationUserDetailsOrganisationNamePlaceHolder"/>" aria-describedby="frmApplicationUserDetailsCreateUpdateOrganisationNameHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    	
			<span id="frmApplicationUserDetailsCreateUpdateOrganisationNameHelpBlock" class="help-block"><spring:message code="frmApplicationUserDetailsOrganisationNameHelpBlock"/></span>
			<div id="frmApplicationUserDetailsCreateUpdateOrganisationNameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserDetailsCreateUpdateOrganisationNameAlertBlockText"></span>
			</div>
				  
		  </div>
		  
		  
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmApplicationUserDetailsCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmApplicationUserDetailsCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save Pledge</span></button>
      </div>
    </div>
  </div>
</div>
	
