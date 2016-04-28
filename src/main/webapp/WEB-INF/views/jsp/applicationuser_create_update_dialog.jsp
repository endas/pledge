<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="applicationUserCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">ApplicationUser</h4>
      </div>
      <div class="modal-body">

        <form id="frmApplicationUserCreateUpdate" role="form" action="restful/applicationuser" method="post">
          <input id="frmApplicationUserCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmApplicationUserCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmApplicationUserCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmApplicationUserCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmApplicationUserCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmApplicationUserCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmApplicationUserCreateUpdateUsernameFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuser.username.label" for="frmApplicationUserCreateUpdateUsername" class="control-label"><spring:message code="frmApplicationUserUsernameLabel"/></label>
			<input type="text" data-display-name="Email Address" data-minlength="5" data-required="false" maxlength="45" class="form-control" id="frmApplicationUserCreateUpdateUsername" placeholder="<spring:message code="frmApplicationUserUsernamePlaceHolder"/>" aria-describedby="frmApplicationUserCreateUpdateUsernameHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserCreateUpdateUsernameHelpBlock" class="help-block"><spring:message code="frmApplicationUserUsernameHelpBlock"/></span>
			<div id="frmApplicationUserCreateUpdateUsernameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserCreateUpdateUsernameAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserCreateUpdatePasswordFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuser.password.label" for="frmApplicationUserCreateUpdatePassword" class="control-label"><spring:message code="frmApplicationUserPasswordLabel"/></label>
			<input type="text" data-display-name="Password" data-minlength="5" data-required="true" maxlength="60" class="form-control" id="frmApplicationUserCreateUpdatePassword" placeholder="<spring:message code="frmApplicationUserPasswordPlaceHolder"/>" aria-describedby="frmApplicationUserCreateUpdatePasswordHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmApplicationUserCreateUpdatePasswordHelpBlock" class="help-block"><spring:message code="frmApplicationUserPasswordHelpBlock"/></span>
			<div id="frmApplicationUserCreateUpdatePasswordAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserCreateUpdatePasswordAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmApplicationUserCreateUpdateEnabledFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuser.enabled.label" for="frmApplicationUserCreateUpdateEnabled" class="control-label"><spring:message code="frmApplicationUserEnabledLabel"/></label>
    		<div class="checkbox">
				<label>
					<input type="checkbox" data-display-name="User Enabled" data-required="false" id="frmApplicationUserCreateUpdateEnabled" aria-describedby="frmApplicationUserCreateUpdateEnabledHelpBlock"/>
				</label>
					<span id="frmApplicationUserCreateUpdateEnabledFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
					<span id="frmApplicationUserCreateUpdateEnabledHelpBlock" class="help-block"> </span>
				<div id="frmApplicationUserCreateUpdateEnabledAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserCreateUpdateEnabledAlertBlockText"></span>
				</div>
			</div>
    
		  </div>
  
		  <div id="frmApplicationUserCreateUpdateUserRolesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuser.userroles.label" for="frmApplicationUserCreateUpdateUserRoles" class="control-label"><spring:message code="frmApplicationUserUserRolesLabel"/></label>
				<div id="frmApplicationUserCreateUpdateUserRolesCheckBoxContainer">
				</div> 
					<span id="frmApplicationUserCreateUpdateUserRolesFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
					<span id="frmApplicationUserCreateUpdateUserRolesHelpBlock" class="help-block"> </span>
				<div id="frmApplicationUserCreateUpdateUserRolesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserCreateUpdateUserRolesAlertBlockText"></span>
				</div>
    
		  </div>
  
		  <%-- <div id="frmApplicationUserCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="applicationuser.savebutton.label" for="frmApplicationUserCreateUpdateSaveButton" class="control-label"><spring:message code="frmApplicationUserSaveButtonLabel"/></label>
			<span id="frmApplicationUserCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmApplicationUserSaveButtonHelpBlock"/></span>
			<div id="frmApplicationUserCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmApplicationUserCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div> --%>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmApplicationUserCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmApplicationUserCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save</span></button>
      </div>
    </div>
  </div>
</div>
	
