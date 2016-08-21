

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${referenceFormModel['new']}">
		<spring:message code="reference.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="reference.update.title" var="title"/>
	</c:otherwise>
</c:choose>
<br />


<jsp:include page="../includes/header.jsp">
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
	

	<spring:url value="/references" var="referenceActionUrl" />
	
	<div class="well">
	<form:form id="frmReference" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="referenceFormModel" action="${referenceActionUrl}">

		<form:hidden id="frmReferenceReferenceId" path="id" />
		
		<spring:bind path="refType">
		  <div id="frmReferenceRefTypeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Reference Type</label>
			<div class="col-sm-10">
				
				<form:input path="refType" type="text" maxlength="50" class="form-control" id="frmReferenceRefType" placeholder="Reference Type"  />
    
				<span id="frmReferenceRefTypeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="refType" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="refDesc">
		  <div id="frmReferenceRefDescFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Reference Description</label>
			<div class="col-sm-10">
				
				<form:input path="refDesc" type="text" maxlength="50" class="form-control" id="frmReferenceRefDesc" placeholder="Reference Description"  />
    
				<span id="frmReferenceRefDescJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="refDesc" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="parentId">
		  <div id="frmReferenceParentIdFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Parent Id</label>
			<div class="col-sm-10">
				
				<form:input path="parentId" type="text" maxlength="10" class="form-control" id="frmReferenceParentId" placeholder="Parent Id"  onkeypress="return checkIntegerKeyPressAndRenderErrorMessage(event, this, document.getElementById('frmReferenceParentIdJavascriptErrorDisplay'), document.getElementById('frmReferenceParentIdFormGroup'), 'The Parent Id can only accept digits 0-9', 'has-error', 'Valid', false)"  onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceParentIdJavascriptErrorDisplay'), 'The value that you attempted to paste into Parent Id can only contain digits 0-9', 'Valid')"  />
    
				<span id="frmReferenceParentIdJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="parentId" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="refIndex">
		  <div id="frmReferenceRefIndexFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Reference Index</label>
			<div class="col-sm-10">
				
				<form:input path="refIndex" type="text" maxlength="10" class="form-control" id="frmReferenceRefIndex" placeholder="Reference Index"  onkeypress="return checkIntegerKeyPressAndRenderErrorMessage(event, this, document.getElementById('frmReferenceRefIndexJavascriptErrorDisplay'), document.getElementById('frmReferenceRefIndexFormGroup'), 'The Reference Index can only accept digits 0-9', 'has-error', 'Valid', false)"  onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceRefIndexJavascriptErrorDisplay'), 'The value that you attempted to paste into Reference Index can only contain digits 0-9', 'Valid')"  />
    
				<span id="frmReferenceRefIndexJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="refIndex" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="description">
		  <div id="frmReferenceDescriptionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Long Description</label>
			<div class="col-sm-10">
				
				<form:textarea path="description" rows="5" class="form-control" id="frmReferenceDescription" placeholder="Long Description" oninput="check_textarea_length(200, this, document.getElementById('frmReferenceDescriptionJavascriptErrorDisplay'))"  />
    
				<span id="frmReferenceDescriptionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="description" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmReferenceSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmReferenceSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmReferenceExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${referenceFormModel['new']}">
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
<jsp:include page="../includes/redcrossfooter.jsp" />
<script>

var rootContext = "${pageContext.request.contextPath}";

$( document ).ready(function() {
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmReference"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	// Display a count of the characters in the Long Description textarea input
	check_textarea_length(200, document.getElementById("frmReferenceDescription"), document.getElementById('frmReferenceDescriptionJavascriptErrorDisplay'));
  
});


      var frmReferenceRefTypeBuffer = document.getElementById("frmReferenceRefType").value;
      
      var frmReferenceRefDescBuffer = document.getElementById("frmReferenceRefDesc").value;
      
      var frmReferenceParentIdBuffer = document.getElementById("frmReferenceParentId").value;
      
      var frmReferenceRefIndexBuffer = document.getElementById("frmReferenceRefIndex").value;
      
      var frmReferenceDescriptionBuffer = document.getElementById("frmReferenceDescription").value;
      
      var frmReferenceSaveButtonBuffer = document.getElementById("frmReferenceSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmReferenceExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmReferenceRefType").value != frmReferenceRefTypeBuffer){
			document.getElementById("frmReferenceRefTypeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceRefTypeJavascriptErrorDisplay"), "Previous Value: " + frmReferenceRefTypeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceRefType");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceRefDesc").value != frmReferenceRefDescBuffer){
			document.getElementById("frmReferenceRefDescFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceRefDescJavascriptErrorDisplay"), "Previous Value: " + frmReferenceRefDescBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceRefDesc");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceParentId").value != frmReferenceParentIdBuffer){
			document.getElementById("frmReferenceParentIdFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceParentIdJavascriptErrorDisplay"), "Previous Value: " + frmReferenceParentIdBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceParentId");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceRefIndex").value != frmReferenceRefIndexBuffer){
			document.getElementById("frmReferenceRefIndexFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceRefIndexJavascriptErrorDisplay"), "Previous Value: " + frmReferenceRefIndexBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceRefIndex");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceDescription").value != frmReferenceDescriptionBuffer){
			document.getElementById("frmReferenceDescriptionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceDescriptionJavascriptErrorDisplay"), "Previous Value: " + frmReferenceDescriptionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceDescription");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceSaveButton").value != frmReferenceSaveButtonBuffer){
			document.getElementById("frmReferenceSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmReferenceSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceSaveButton");
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
                		document.getElementById("frmReference").method = "get";
                    	document.getElementById("frmReference").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmReference").method = "get";
			document.getElementById("frmReference").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

