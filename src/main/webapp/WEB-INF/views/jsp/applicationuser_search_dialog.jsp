

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${applicationUserFormModel['new']}">
		<spring:message code="applicationuser.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="applicationuser.update.title" var="title"/>
	</c:otherwise>
</c:choose>
<br />


<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="subtitle" value="${title}" />
</jsp:include>
<body>


<div class="container">

	<h1>${title}</h1>
	<br />
	
	<c:if test="${not empty msg}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<strong>${msg}</strong>
		</div>
	</c:if>	
	

	<spring:url value="/applicationusers" var="applicationUserActionUrl" />
	
	<div class="well">
	<form:form id="frmApplicationUser" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="applicationUserFormModel" action="${applicationUserActionUrl}">

		<form:hidden id="frmApplicationUserApplicationUserId" path="id" />
		
		<spring:bind path="username">
		  <div id="frmApplicationUserUsernameFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Email Address</label>
			<div class="col-sm-10">
				
				<form:input path="username" type="text" maxlength="45" class="form-control" id="frmApplicationUserUsername" placeholder="Email Address"  />
    
				<span id="frmApplicationUserUsernameJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="username" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="password">
		  <div id="frmApplicationUserPasswordFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Password</label>
			<div class="col-sm-10">
				
				<form:input path="password" type="text" maxlength="60" class="form-control" id="frmApplicationUserPassword" placeholder="Password"  />
    
				<span id="frmApplicationUserPasswordJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="password" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="enabled">
		  <div id="frmApplicationUserEnabledFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">User Enabled</label>
			<div class="col-sm-10">
				
    			<div class="checkbox">
					<label>
						<form:checkbox path="enabled" id="frmApplicationUserEnabled" />
					</label>
					<span id="frmApplicationUserEnabledJavascriptErrorDisplay" class="control-label"> </span>
					<form:errors path="enabled" class="control-label" />
				</div>
    
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="userRoles">
		  <div id="frmApplicationUserUserRolesFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">User Roles</label>
			<div class="col-sm-10">
				
				<form:checkboxes path="userRoles" items="${userRolesMap}" 
                                 element="label class='checkbox-inline'" />
				<br />
				<form:errors path="userRoles" class="control-label" />
    
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmApplicationUserSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmApplicationUserSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmApplicationUserExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${applicationUserFormModel['new']}">
			     <button type="submit" class="btn-lg btn-primary pull-right">Add</button>
			  </c:when>
			  <c:otherwise>
			     <button type="submit" class="btn-lg btn-primary pull-right">Update</button>
			  </c:otherwise>
			</c:choose>
		  </div>
		</div>
		

	</form:form>
	</div>

</div>
<jsp:include page="../jsp/includes/footer.jsp" />
<script>

var rootContext = "${pageContext.request.contextPath}";

$( document ).ready(function() {
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmApplicationUser"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

});


      var frmApplicationUserUsernameBuffer = document.getElementById("frmApplicationUserUsername").value;
      
      var frmApplicationUserPasswordBuffer = document.getElementById("frmApplicationUserPassword").value;
      
      var frmApplicationUserEnabledBuffer = document.getElementById("frmApplicationUserEnabled").checked;
      
      var userRolesBuffer1 = document.getElementById("userRoles1").checked;
      
      var userRolesBuffer2 = document.getElementById("userRoles2").checked;
      
      var userRolesBuffer3 = document.getElementById("userRoles3").checked;
      
      var userRolesBuffer4 = document.getElementById("userRoles4").checked;
      
      var frmApplicationUserSaveButtonBuffer = document.getElementById("frmApplicationUserSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmApplicationUserExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmApplicationUserUsername").value != frmApplicationUserUsernameBuffer){
			document.getElementById("frmApplicationUserUsernameFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserUsernameJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserUsernameBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserUsername");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserPassword").value != frmApplicationUserPasswordBuffer){
			document.getElementById("frmApplicationUserPasswordFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserPasswordJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserPasswordBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserPassword");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserEnabled").checked != frmApplicationUserEnabledBuffer){
			document.getElementById("frmApplicationUserEnabledFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserEnabledJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserEnabledBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserEnabled");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("userRoles1").checked != userRolesBuffer1){
			$('label[for="userRoles1"]').css("color", "red");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles1");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("userRoles2").checked != userRolesBuffer2){
			$('label[for="userRoles2"]').css("color", "red");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles2");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("userRoles3").checked != userRolesBuffer3){
			$('label[for="userRoles3"]').css("color", "red");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles3");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("userRoles4").checked != userRolesBuffer4){
			$('label[for="userRoles4"]').css("color", "red");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles4");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("frmApplicationUserSaveButton").value != frmApplicationUserSaveButtonBuffer){
			document.getElementById("frmApplicationUserSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserSaveButton");
				focusSet = true;
			}
			changedCounter++;
		}
	
	
		if (changedCounter > 0){
	
			BootstrapDialog.confirm({
            	title: 'WARNING',
            	message: 'Warning! You are exiting without saving your work. Exit without saving?',
            	type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
            	closable: false, // <-- Default value is false
            	draggable: true, // <-- Default value is false
            	btnCancelLabel: 'Review my changes!', // <-- Default value is 'Cancel',
            	btnOKLabel: 'Exit without saving!', // <-- Default value is 'OK',
            	btnOKClass: 'btn-warning', // <-- If you didn't specify it, dialog type will be used,
            	callback: function(result) {
                	// result will be true if button was click, while it will be false if users close the dialog directly.
                	if(result) {
                		document.getElementById("frmApplicationUser").method = "get";
                    	document.getElementById("frmApplicationUser").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmApplicationUser").method = "get";
			document.getElementById("frmApplicationUser").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

