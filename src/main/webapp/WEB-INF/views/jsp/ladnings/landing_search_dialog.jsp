

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${landingFormModel['new']}">
		<spring:message code="landing.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="landing.update.title" var="title"/>
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
	

	<spring:url value="/landings" var="landingActionUrl" />
	
	<div class="well">
	<form:form id="frmLanding" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="landingFormModel" action="${landingActionUrl}">

		<form:hidden id="frmLandingLandingId" path="id" />
		
		<spring:bind path="landingMainMessages">
		  <div id="frmLandingLandingMainMessagesFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-10">
				
				<span id="frmLandingLandingMainMessagesJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="landingMainMessages" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmLandingExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${landingFormModel['new']}">
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
	checkFocus(document.getElementById("frmLanding"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

});


      var frmLandingLandingMainMessagesBuffer = document.getElementById("frmLandingLandingMainMessages").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmLandingExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmLandingLandingMainMessages").value != frmLandingLandingMainMessagesBuffer){
			document.getElementById("frmLandingLandingMainMessagesFormGroup").className += " has-error";
			replaceText(document.getElementById("frmLandingLandingMainMessagesJavascriptErrorDisplay"), "Previous Value: " + frmLandingLandingMainMessagesBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmLandingLandingMainMessages");
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
                		document.getElementById("frmLanding").method = "get";
                    	document.getElementById("frmLanding").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmLanding").method = "get";
			document.getElementById("frmLanding").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

