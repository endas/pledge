<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="registerOfPledgesCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">RegisterOfPledges</h4>
      </div>
      <div class="modal-body">

        <form id="frmRegisterOfPledgesCreateUpdate" role="form" action="restful/registerofpledges" method="post">
          <input id="frmRegisterOfPledgesCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmRegisterOfPledgesCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmRegisterOfPledgesCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmRegisterOfPledgesCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmRegisterOfPledgesCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmRegisterOfPledgesCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmRegisterOfPledgesCreateUpdateContactInformationInstructionsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.contactinformationinstructions.label" for="frmRegisterOfPledgesCreateUpdateContactInformationInstructions" class="control-label"><spring:message code="frmRegisterOfPledgesContactInformationInstructionsLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateContactInformationInstructionsHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesContactInformationInstructionsHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateContactInformationInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateContactInformationInstructionsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateApplicationUserDetailsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.applicationuserdetails.label" for="frmRegisterOfPledgesCreateUpdateApplicationUserDetails" class="control-label"><spring:message code="frmRegisterOfPledgesApplicationUserDetailsLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateApplicationUserDetailsHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesApplicationUserDetailsHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateApplicationUserDetailsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateApplicationUserDetailsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateAccommodationPledgeInstructionsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.accommodationpledgeinstructions.label" for="frmRegisterOfPledgesCreateUpdateAccommodationPledgeInstructions" class="control-label"><spring:message code="frmRegisterOfPledgesAccommodationPledgeInstructionsLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateAccommodationPledgeInstructionsHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesAccommodationPledgeInstructionsHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateAccommodationPledgeInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateAccommodationPledgeInstructionsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateAccommodationPledgesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.accommodationpledges.label" for="frmRegisterOfPledgesCreateUpdateAccommodationPledges" class="control-label"><spring:message code="frmRegisterOfPledgesAccommodationPledgesLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateAccommodationPledgesHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesAccommodationPledgesHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateAccommodationPledgesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateAccommodationPledgesAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateServicePledgeInstructionsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.servicepledgeinstructions.label" for="frmRegisterOfPledgesCreateUpdateServicePledgeInstructions" class="control-label"><spring:message code="frmRegisterOfPledgesServicePledgeInstructionsLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateServicePledgeInstructionsHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesServicePledgeInstructionsHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateServicePledgeInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateServicePledgeInstructionsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateServicePledgesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.servicepledges.label" for="frmRegisterOfPledgesCreateUpdateServicePledges" class="control-label"><spring:message code="frmRegisterOfPledgesServicePledgesLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateServicePledgesHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesServicePledgesHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateServicePledgesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateServicePledgesAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateGoodsPledgeInstructionsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.goodspledgeinstructions.label" for="frmRegisterOfPledgesCreateUpdateGoodsPledgeInstructions" class="control-label"><spring:message code="frmRegisterOfPledgesGoodsPledgeInstructionsLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateGoodsPledgeInstructionsHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesGoodsPledgeInstructionsHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateGoodsPledgeInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateGoodsPledgeInstructionsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmRegisterOfPledgesCreateUpdateGoodsPledgesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="registerofpledges.goodspledges.label" for="frmRegisterOfPledgesCreateUpdateGoodsPledges" class="control-label"><spring:message code="frmRegisterOfPledgesGoodsPledgesLabel"/></label>
			<span id="frmRegisterOfPledgesCreateUpdateGoodsPledgesHelpBlock" class="help-block"><spring:message code="frmRegisterOfPledgesGoodsPledgesHelpBlock"/></span>
			<div id="frmRegisterOfPledgesCreateUpdateGoodsPledgesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmRegisterOfPledgesCreateUpdateGoodsPledgesAlertBlockText"></span>
			</div>
				  
		  </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmRegisterOfPledgesCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmRegisterOfPledgesCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Send message</span></button>
      </div>
    </div>
  </div>
</div>
	
