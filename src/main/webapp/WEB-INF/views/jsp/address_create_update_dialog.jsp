<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="addressCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Address</h4>
      </div>
      <div class="modal-body">

        <form id="frmAddressCreateUpdate" role="form" action="restful/address" method="post">
          <input id="frmAddressCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmAddressCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmAddressCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmAddressCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmAddressCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmAddressCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmAddressCreateUpdateAddressOneFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.addressone.label" for="frmAddressCreateUpdateAddressOne" class="control-label"><spring:message code="frmAddressAddressOneLabel"/></label>
			<input type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAddressCreateUpdateAddressOne" placeholder="<spring:message code="frmAddressAddressOnePlaceHolder"/>" aria-describedby="frmAddressCreateUpdateAddressOneHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAddressCreateUpdateAddressOneHelpBlock" class="help-block"><spring:message code="frmAddressAddressOneHelpBlock"/></span>
			<div id="frmAddressCreateUpdateAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdateAddressOneAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAddressCreateUpdateAddressTwoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.addresstwo.label" for="frmAddressCreateUpdateAddressTwo" class="control-label"><spring:message code="frmAddressAddressTwoLabel"/></label>
			<input type="text" data-display-name="Address Line 2" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAddressCreateUpdateAddressTwo" placeholder="<spring:message code="frmAddressAddressTwoPlaceHolder"/>" aria-describedby="frmAddressCreateUpdateAddressTwoHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAddressCreateUpdateAddressTwoHelpBlock" class="help-block"><spring:message code="frmAddressAddressTwoHelpBlock"/></span>
			<div id="frmAddressCreateUpdateAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdateAddressTwoAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAddressCreateUpdateCityFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.city.label" for="frmAddressCreateUpdateCity" class="control-label"><spring:message code="frmAddressCityLabel"/></label>
			<input type="text" data-display-name="Town/Townland/City" data-minlength="0" data-required="false" maxlength="50" class="form-control" id="frmAddressCreateUpdateCity" placeholder="<spring:message code="frmAddressCityPlaceHolder"/>" aria-describedby="frmAddressCreateUpdateCityHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAddressCreateUpdateCityHelpBlock" class="help-block"><spring:message code="frmAddressCityHelpBlock"/></span>
			<div id="frmAddressCreateUpdateCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdateCityAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAddressCreateUpdateStateProvinceRegionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.stateprovinceregion.label" for="frmAddressCreateUpdateStateProvinceRegion" class="control-label"><spring:message code="frmAddressStateProvinceRegionLabel"/></label>
			<input type="text" data-display-name="State/Province/Region" data-minlength="0" data-required="false" maxlength="50" class="form-control" id="frmAddressCreateUpdateStateProvinceRegion" placeholder="<spring:message code="frmAddressStateProvinceRegionPlaceHolder"/>" aria-describedby="frmAddressCreateUpdateStateProvinceRegionHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAddressCreateUpdateStateProvinceRegionHelpBlock" class="help-block"><spring:message code="frmAddressStateProvinceRegionHelpBlock"/></span>
			<div id="frmAddressCreateUpdateStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdateStateProvinceRegionAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAddressCreateUpdatePostCodeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.postcode.label" for="frmAddressCreateUpdatePostCode" class="control-label"><spring:message code="frmAddressPostCodeLabel"/></label>
			<input type="text" data-display-name="Post Code" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmAddressCreateUpdatePostCode" placeholder="<spring:message code="frmAddressPostCodePlaceHolder"/>" aria-describedby="frmAddressCreateUpdatePostCodeHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAddressCreateUpdatePostCodeHelpBlock" class="help-block"><spring:message code="frmAddressPostCodeHelpBlock"/></span>
			<div id="frmAddressCreateUpdatePostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdatePostCodeAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAddressCreateUpdateCountryFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.country.label" for="frmAddressCreateUpdateCountry" class="control-label"><spring:message code="frmAddressCountryLabel"/></label>	
			<select class="form-control" data-display-name="Country" data-select-type="standalone" data-required="true" id="frmAddressCreateUpdateCountry" aria-describedby="frmAddressCreateUpdateCountryHelpBlock">
			</select>
	  
			<span id="frmAddressCreateUpdateCountryHelpBlock" class="help-block"><spring:message code="frmAddressCountryHelpBlock"/></span>
			<div id="frmAddressCreateUpdateCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdateCountryAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAddressCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="address.savebutton.label" for="frmAddressCreateUpdateSaveButton" class="control-label"><spring:message code="frmAddressSaveButtonLabel"/></label>
			<span id="frmAddressCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmAddressSaveButtonHelpBlock"/></span>
			<div id="frmAddressCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAddressCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmAddressCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmAddressCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Send message</span></button>
      </div>
    </div>
  </div>
</div>
	
