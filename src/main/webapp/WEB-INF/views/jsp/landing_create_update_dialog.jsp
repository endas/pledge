<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="landingCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Landing</h4>
      </div>
      <div class="modal-body">

        <form id="frmLandingCreateUpdate" role="form" action="restful/landing" method="post">
          <input id="frmLandingCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmLandingCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmLandingCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmLandingCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmLandingCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmLandingCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmLandingCreateUpdateLandingMainMessagesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="landing.landingmainmessages.label" for="frmLandingCreateUpdateLandingMainMessages" class="control-label"><spring:message code="frmLandingLandingMainMessagesLabel"/></label>
			<span id="frmLandingCreateUpdateLandingMainMessagesHelpBlock" class="help-block"><spring:message code="frmLandingLandingMainMessagesHelpBlock"/></span>
			<div id="frmLandingCreateUpdateLandingMainMessagesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmLandingCreateUpdateLandingMainMessagesAlertBlockText"></span>
			</div>
				  
		  </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmLandingCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmLandingCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Send message</span></button>
      </div>
    </div>
  </div>
</div>
	
