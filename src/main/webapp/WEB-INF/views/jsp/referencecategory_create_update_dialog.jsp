<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="referenceCategoryCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">ReferenceCategory</h4>
      </div>
      <div class="modal-body">

        <form id="frmReferenceCategoryCreateUpdate" role="form" action="restful/referencecategory" method="post">
          <input id="frmReferenceCategoryCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmReferenceCategoryCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmReferenceCategoryCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmReferenceCategoryCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmReferenceCategoryCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmReferenceCategoryCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmReferenceCategoryCreateUpdateReferenceCategoryDescFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="referencecategory.referencecategorydesc.label" for="frmReferenceCategoryCreateUpdateReferenceCategoryDesc" class="control-label"><spring:message code="frmReferenceCategoryReferenceCategoryDescLabel"/></label>
			<input type="text" data-display-name="Reference Category" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmReferenceCategoryCreateUpdateReferenceCategoryDesc" placeholder="<spring:message code="frmReferenceCategoryReferenceCategoryDescPlaceHolder"/>" aria-describedby="frmReferenceCategoryCreateUpdateReferenceCategoryDescHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmReferenceCategoryCreateUpdateReferenceCategoryDescHelpBlock" class="help-block"><spring:message code="frmReferenceCategoryReferenceCategoryDescHelpBlock"/></span>
			<div id="frmReferenceCategoryCreateUpdateReferenceCategoryDescAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCategoryCreateUpdateReferenceCategoryDescAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCategoryCreateUpdateParentCategoryIdFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="referencecategory.parentcategoryid.label" for="frmReferenceCategoryCreateUpdateParentCategoryId" class="control-label"><spring:message code="frmReferenceCategoryParentCategoryIdLabel"/></label>
			<input type="text" data-display-name="Parent Category Id" data-minlength="5" data-required="false" maxlength="10" class="form-control" id="frmReferenceCategoryCreateUpdateParentCategoryId" placeholder="<spring:message code="frmReferenceCategoryParentCategoryIdPlaceHolder"/>" aria-describedby="frmReferenceCategoryCreateUpdateParentCategoryIdHelpBlock" data-data-type="long" data-validate-key-press="true" data-toggle="popover" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceCategoryCreateUpdateParentCategoryIdHelpBlock'), 'The value that you attempted to paste into Parent Category Id can only contain digits 0-9', 'Valid')" />
    
			<span id="frmReferenceCategoryCreateUpdateParentCategoryIdHelpBlock" class="help-block"><spring:message code="frmReferenceCategoryParentCategoryIdHelpBlock"/></span>
			<div id="frmReferenceCategoryCreateUpdateParentCategoryIdAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCategoryCreateUpdateParentCategoryIdAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCategoryCreateUpdateDescriptionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="referencecategory.description.label" for="frmReferenceCategoryCreateUpdateDescription" class="control-label"><spring:message code="frmReferenceCategoryDescriptionLabel"/></label>
			<textarea rows="5" data-display-name="Long Description" data-minlength="5" data-required="false" maxlength="200" class="form-control" id="frmReferenceCategoryCreateUpdateDescription" placeholder="<spring:message code="frmReferenceCategoryDescriptionPlaceHolder"/>" aria-describedby="frmReferenceCategoryCreateUpdateDescriptionHelpBlock" oninput="check_textarea_length(200, this, document.getElementById('frmReferenceCategoryCreateUpdateDescriptionCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmReferenceCategoryCreateUpdateDescriptionCountBlock" class="help-block"></span>
			<span id="frmReferenceCategoryCreateUpdateDescriptionHelpBlock" class="help-block"><spring:message code="frmReferenceCategoryDescriptionHelpBlock"/></span>
			<div id="frmReferenceCategoryCreateUpdateDescriptionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCategoryCreateUpdateDescriptionAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCategoryCreateUpdateReferencesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="referencecategory.references.label" for="frmReferenceCategoryCreateUpdateReferences" class="control-label"><spring:message code="frmReferenceCategoryReferencesLabel"/></label>
			<span id="frmReferenceCategoryCreateUpdateReferencesHelpBlock" class="help-block"><spring:message code="frmReferenceCategoryReferencesHelpBlock"/></span>
			<div id="frmReferenceCategoryCreateUpdateReferencesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCategoryCreateUpdateReferencesAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmReferenceCategoryCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="referencecategory.savebutton.label" for="frmReferenceCategoryCreateUpdateSaveButton" class="control-label"><spring:message code="frmReferenceCategorySaveButtonLabel"/></label>
			<span id="frmReferenceCategoryCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmReferenceCategorySaveButtonHelpBlock"/></span>
			<div id="frmReferenceCategoryCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmReferenceCategoryCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmReferenceCategoryCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmReferenceCategoryCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Send message</span></button>
      </div>
    </div>
  </div>
</div>
	
