<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="viewCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">View</h4>
      </div>
      <div class="modal-body">

        <form id="frmViewCreateUpdate" role="form" action="restful/view" method="post">
          <input id="frmViewCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmViewCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmViewCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmViewCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmViewCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmViewCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmViewCreateUpdateViewNameFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="view.viewname.label" for="frmViewCreateUpdateViewName" class="control-label"><spring:message code="frmViewViewNameLabel"/></label>
			<input type="text" data-display-name="View Name" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmViewCreateUpdateViewName" placeholder="<spring:message code="frmViewViewNamePlaceHolder"/>" aria-describedby="frmViewCreateUpdateViewNameHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmViewCreateUpdateViewNameHelpBlock" class="help-block"><spring:message code="frmViewViewNameHelpBlock"/></span>
			<div id="frmViewCreateUpdateViewNameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmViewCreateUpdateViewNameAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmViewCreateUpdateMessageResourceFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="view.messageresource.label" for="frmViewCreateUpdateMessageResource" class="control-label"><spring:message code="frmViewMessageResourceLabel"/></label>
			<span id="frmViewCreateUpdateMessageResourceHelpBlock" class="help-block"><spring:message code="frmViewMessageResourceHelpBlock"/></span>
			<div id="frmViewCreateUpdateMessageResourceAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmViewCreateUpdateMessageResourceAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmViewCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="view.savebutton.label" for="frmViewCreateUpdateSaveButton" class="control-label"><spring:message code="frmViewSaveButtonLabel"/></label>
			<span id="frmViewCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmViewSaveButtonHelpBlock"/></span>
			<div id="frmViewCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmViewCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmViewCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmViewCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Send message</span></button>
      </div>
    </div>
  </div>
</div>
	
