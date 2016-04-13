

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${messageResourceFormModel['new']}">
		<spring:message code="messageresource.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="messageresource.update.title" var="title"/>
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
	

	<spring:url value="/messageresources" var="messageResourceActionUrl" />
	
	<div class="well">
	<form:form id="frmMessageResource" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="messageResourceFormModel" action="${messageResourceActionUrl}">

		<form:hidden id="frmMessageResourceMessageResourceId" path="id" />
		
		<spring:bind path="messageKey">
		  <div id="frmMessageResourceMessageKeyFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Message Key</label>
			<div class="col-sm-10">
				
				<form:input path="messageKey" type="text" maxlength="200" class="form-control" id="frmMessageResourceMessageKey" placeholder="Message Key"  />
    
				<span id="frmMessageResourceMessageKeyJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="messageKey" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="locale">
		  <div id="frmMessageResourceLocaleFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Locale</label>
			<div class="col-sm-10">
				
				<form:input path="locale" type="text" maxlength="10" class="form-control" id="frmMessageResourceLocale" placeholder="Locale"  />
    
				<span id="frmMessageResourceLocaleJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="locale" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="localeReferenceId">
		  <div id="frmMessageResourceLocaleReferenceIdFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Reference Id</label>
			<div class="col-sm-10">
				
				<form:input path="localeReferenceId" type="text" maxlength="10" class="form-control" id="frmMessageResourceLocaleReferenceId" placeholder="Reference Id"  onkeypress="return checkIntegerKeyPressAndRenderErrorMessage(event, this, document.getElementById('frmMessageResourceLocaleReferenceIdJavascriptErrorDisplay'), document.getElementById('frmMessageResourceLocaleReferenceIdFormGroup'), 'The Reference Id can only accept digits 0-9', 'has-error', 'Valid', false)"  onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmMessageResourceLocaleReferenceIdJavascriptErrorDisplay'), 'The value that you attempted to paste into Reference Id can only contain digits 0-9', 'Valid')"  />
    
				<span id="frmMessageResourceLocaleReferenceIdJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="localeReferenceId" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="message">
		  <div id="frmMessageResourceMessageFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Message</label>
			<div class="col-sm-10">
				
				<form:input path="message" type="text" maxlength="2000" class="form-control" id="frmMessageResourceMessage" placeholder="Message"  />
    
				<span id="frmMessageResourceMessageJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="message" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmMessageResourceSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmMessageResourceSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmMessageResourceExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${messageResourceFormModel['new']}">
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
	checkFocus(document.getElementById("frmMessageResource"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

});


      var frmMessageResourceMessageKeyBuffer = document.getElementById("frmMessageResourceMessageKey").value;
      
      var frmMessageResourceLocaleBuffer = document.getElementById("frmMessageResourceLocale").value;
      
      var frmMessageResourceLocaleReferenceIdBuffer = document.getElementById("frmMessageResourceLocaleReferenceId").value;
      
      var frmMessageResourceMessageBuffer = document.getElementById("frmMessageResourceMessage").value;
      
      var frmMessageResourceSaveButtonBuffer = document.getElementById("frmMessageResourceSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmMessageResourceExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmMessageResourceMessageKey").value != frmMessageResourceMessageKeyBuffer){
			document.getElementById("frmMessageResourceMessageKeyFormGroup").className += " has-error";
			replaceText(document.getElementById("frmMessageResourceMessageKeyJavascriptErrorDisplay"), "Previous Value: " + frmMessageResourceMessageKeyBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmMessageResourceMessageKey");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmMessageResourceLocale").value != frmMessageResourceLocaleBuffer){
			document.getElementById("frmMessageResourceLocaleFormGroup").className += " has-error";
			replaceText(document.getElementById("frmMessageResourceLocaleJavascriptErrorDisplay"), "Previous Value: " + frmMessageResourceLocaleBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmMessageResourceLocale");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmMessageResourceLocaleReferenceId").value != frmMessageResourceLocaleReferenceIdBuffer){
			document.getElementById("frmMessageResourceLocaleReferenceIdFormGroup").className += " has-error";
			replaceText(document.getElementById("frmMessageResourceLocaleReferenceIdJavascriptErrorDisplay"), "Previous Value: " + frmMessageResourceLocaleReferenceIdBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmMessageResourceLocaleReferenceId");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmMessageResourceMessage").value != frmMessageResourceMessageBuffer){
			document.getElementById("frmMessageResourceMessageFormGroup").className += " has-error";
			replaceText(document.getElementById("frmMessageResourceMessageJavascriptErrorDisplay"), "Previous Value: " + frmMessageResourceMessageBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmMessageResourceMessage");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmMessageResourceSaveButton").value != frmMessageResourceSaveButtonBuffer){
			document.getElementById("frmMessageResourceSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmMessageResourceSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmMessageResourceSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmMessageResourceSaveButton");
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
                		document.getElementById("frmMessageResource").method = "get";
                    	document.getElementById("frmMessageResource").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmMessageResource").method = "get";
			document.getElementById("frmMessageResource").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

