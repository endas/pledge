<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="referenceCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Reference</h4>
      </div>
      <div class="modal-body">

        <form id="frmReferenceCreateUpdate" role="form" action="restful/reference" method="post">
          <input id="frmReferenceCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmReferenceCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmReferenceCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmReferenceCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmReferenceCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmReferenceCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmReferenceCreateUpdateRefTypeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="reference.reftype.label" for="frmReferenceCreateUpdateRefType" class="control-label"><spring:message code="frmReferenceRefTypeLabel"/></label>
			<input type="text" data-display-name="Reference Type" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmReferenceCreateUpdateRefType" placeholder="<spring:message code="frmReferenceRefTypePlaceHolder"/>" aria-describedby="frmReferenceCreateUpdateRefTypeHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmReferenceCreateUpdateRefTypeHelpBlock" class="help-block"><spring:message code="frmReferenceRefTypeHelpBlock"/></span>
			<div id="frmReferenceCreateUpdateRefTypeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCreateUpdateRefTypeAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCreateUpdateRefDescFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="reference.refdesc.label" for="frmReferenceCreateUpdateRefDesc" class="control-label"><spring:message code="frmReferenceRefDescLabel"/></label>
			<input type="text" data-display-name="Reference Description" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmReferenceCreateUpdateRefDesc" placeholder="<spring:message code="frmReferenceRefDescPlaceHolder"/>" aria-describedby="frmReferenceCreateUpdateRefDescHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmReferenceCreateUpdateRefDescHelpBlock" class="help-block"><spring:message code="frmReferenceRefDescHelpBlock"/></span>
			<div id="frmReferenceCreateUpdateRefDescAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCreateUpdateRefDescAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCreateUpdateParentIdFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="reference.parentid.label" for="frmReferenceCreateUpdateParentId" class="control-label"><spring:message code="frmReferenceParentIdLabel"/></label>
			<input type="text" data-display-name="Parent Id" data-minlength="5" data-required="true" maxlength="10" class="form-control" id="frmReferenceCreateUpdateParentId" placeholder="<spring:message code="frmReferenceParentIdPlaceHolder"/>" aria-describedby="frmReferenceCreateUpdateParentIdHelpBlock" data-data-type="long" data-validate-key-press="true" data-toggle="popover" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceCreateUpdateParentIdHelpBlock'), 'The value that you attempted to paste into Parent Id can only contain digits 0-9', 'Valid')" />
    
			<span id="frmReferenceCreateUpdateParentIdHelpBlock" class="help-block"><spring:message code="frmReferenceParentIdHelpBlock"/></span>
			<div id="frmReferenceCreateUpdateParentIdAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCreateUpdateParentIdAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCreateUpdateRefIndexFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="reference.refindex.label" for="frmReferenceCreateUpdateRefIndex" class="control-label"><spring:message code="frmReferenceRefIndexLabel"/></label>
			<input type="text" data-display-name="Reference Index" data-minlength="5" data-required="true" maxlength="10" class="form-control" id="frmReferenceCreateUpdateRefIndex" placeholder="<spring:message code="frmReferenceRefIndexPlaceHolder"/>" aria-describedby="frmReferenceCreateUpdateRefIndexHelpBlock" data-data-type="long" data-validate-key-press="true" data-toggle="popover" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceCreateUpdateRefIndexHelpBlock'), 'The value that you attempted to paste into Reference Index can only contain digits 0-9', 'Valid')" />
    
			<span id="frmReferenceCreateUpdateRefIndexHelpBlock" class="help-block"><spring:message code="frmReferenceRefIndexHelpBlock"/></span>
			<div id="frmReferenceCreateUpdateRefIndexAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCreateUpdateRefIndexAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCreateUpdateDescriptionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="reference.description.label" for="frmReferenceCreateUpdateDescription" class="control-label"><spring:message code="frmReferenceDescriptionLabel"/></label>
			<textarea rows="5" data-display-name="Long Description" data-minlength="5" data-required="false" maxlength="200" class="form-control" id="frmReferenceCreateUpdateDescription" placeholder="<spring:message code="frmReferenceDescriptionPlaceHolder"/>" aria-describedby="frmReferenceCreateUpdateDescriptionHelpBlock" oninput="check_textarea_length(200, this, document.getElementById('frmReferenceCreateUpdateDescriptionCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmReferenceCreateUpdateDescriptionCountBlock" class="help-block"></span>
			<span id="frmReferenceCreateUpdateDescriptionHelpBlock" class="help-block"><spring:message code="frmReferenceDescriptionHelpBlock"/></span>
			<div id="frmReferenceCreateUpdateDescriptionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCreateUpdateDescriptionAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="reference.savebutton.label" for="frmReferenceCreateUpdateSaveButton" class="control-label"><spring:message code="frmReferenceSaveButtonLabel"/></label>
			<span id="frmReferenceCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmReferenceSaveButtonHelpBlock"/></span>
			<div id="frmReferenceCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmReferenceCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmReferenceCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Send message</span></button>
      </div>
    </div>
  </div>
</div>
	
