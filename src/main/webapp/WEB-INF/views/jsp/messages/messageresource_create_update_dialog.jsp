<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="messageResourceCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">MessageResource</h4>
      </div>
      <div class="modal-body">

        <form id="frmMessageResourceCreateUpdate" role="form" action="restful/messageresource" method="post">
          <input id="frmMessageResourceCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmMessageResourceCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmMessageResourceCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmMessageResourceCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmMessageResourceCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmMessageResourceCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmMessageResourceCreateUpdateMessageKeyFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="messageresource.messagekey.label" for="frmMessageResourceCreateUpdateMessageKey" class="control-label"><spring:message code="frmMessageResourceMessageKeyLabel"/></label>
			<input type="text" data-display-name="Message Key" data-minlength="10" data-required="true" maxlength="200" class="form-control" id="frmMessageResourceCreateUpdateMessageKey" placeholder="<spring:message code="frmMessageResourceMessageKeyPlaceHolder"/>" aria-describedby="frmMessageResourceCreateUpdateMessageKeyHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmMessageResourceCreateUpdateMessageKeyHelpBlock" class="help-block"><spring:message code="frmMessageResourceMessageKeyHelpBlock"/></span>
			<div id="frmMessageResourceCreateUpdateMessageKeyAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmMessageResourceCreateUpdateMessageKeyAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmMessageResourceCreateUpdateLocaleFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="messageresource.locale.label" for="frmMessageResourceCreateUpdateLocale" class="control-label"><spring:message code="frmMessageResourceLocaleLabel"/></label>
			<input type="text" data-display-name="Locale" data-minlength="3" data-required="true" maxlength="10" class="form-control" id="frmMessageResourceCreateUpdateLocale" placeholder="<spring:message code="frmMessageResourceLocalePlaceHolder"/>" aria-describedby="frmMessageResourceCreateUpdateLocaleHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmMessageResourceCreateUpdateLocaleHelpBlock" class="help-block"><spring:message code="frmMessageResourceLocaleHelpBlock"/></span>
			<div id="frmMessageResourceCreateUpdateLocaleAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmMessageResourceCreateUpdateLocaleAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmMessageResourceCreateUpdateLocaleReferenceIdFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="messageresource.localereferenceid.label" for="frmMessageResourceCreateUpdateLocaleReferenceId" class="control-label"><spring:message code="frmMessageResourceLocaleReferenceIdLabel"/></label>
			<input type="text" data-display-name="Reference Id" data-minlength="0" data-required="true" maxlength="10" class="form-control" id="frmMessageResourceCreateUpdateLocaleReferenceId" placeholder="<spring:message code="frmMessageResourceLocaleReferenceIdPlaceHolder"/>" aria-describedby="frmMessageResourceCreateUpdateLocaleReferenceIdHelpBlock" data-data-type="long" data-validate-key-press="true" data-toggle="popover" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmMessageResourceCreateUpdateLocaleReferenceIdHelpBlock'), 'The value that you attempted to paste into Reference Id can only contain digits 0-9', 'Valid')" />
    
			<span id="frmMessageResourceCreateUpdateLocaleReferenceIdHelpBlock" class="help-block"><spring:message code="frmMessageResourceLocaleReferenceIdHelpBlock"/></span>
			<div id="frmMessageResourceCreateUpdateLocaleReferenceIdAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmMessageResourceCreateUpdateLocaleReferenceIdAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmMessageResourceCreateUpdateMessageFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="messageresource.message.label" for="frmMessageResourceCreateUpdateMessage" class="control-label"><spring:message code="frmMessageResourceMessageLabel"/></label>
			<input type="text" data-display-name="Message" data-minlength="0" data-required="true" maxlength="2000" class="form-control" id="frmMessageResourceCreateUpdateMessage" placeholder="<spring:message code="frmMessageResourceMessagePlaceHolder"/>" aria-describedby="frmMessageResourceCreateUpdateMessageHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmMessageResourceCreateUpdateMessageHelpBlock" class="help-block"><spring:message code="frmMessageResourceMessageHelpBlock"/></span>
			<div id="frmMessageResourceCreateUpdateMessageAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmMessageResourceCreateUpdateMessageAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <%-- <div id="frmMessageResourceCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="messageresource.savebutton.label" for="frmMessageResourceCreateUpdateSaveButton" class="control-label"><spring:message code="frmMessageResourceSaveButtonLabel"/></label>
			<span id="frmMessageResourceCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmMessageResourceSaveButtonHelpBlock"/></span>
			<div id="frmMessageResourceCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmMessageResourceCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div> --%>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmMessageResourceCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmMessageResourceCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save Pledge</span></button>
      </div>
    </div>
  </div>
</div>
	
