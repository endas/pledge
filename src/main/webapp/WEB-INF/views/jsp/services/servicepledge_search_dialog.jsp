

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${servicePledgeFormModel['new']}">
		<spring:message code="servicepledge.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="servicepledge.update.title" var="title"/>
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
	

	<spring:url value="/servicepledges" var="servicePledgeActionUrl" />
	
	<spring:message code="servicepledge.pledgeservicelevelone.select.unselected" var="unselectedPledgeServiceLevelOne"/>
    
	<spring:message code="servicepledge.pledgeserviceleveltwo.select.unselected" var="unselectedPledgeServiceLevelTwo"/>
    
	<spring:message code="servicepledge.pledgeservicelevelthree.select.unselected" var="unselectedPledgeServiceLevelThree"/>
    
	<spring:message code="servicepledge.pledgeservicehoursperweek.select.unselected" var="unselectedPledgeServiceHoursPerWeek"/>
    
	<div class="well">
	<form:form id="frmServicePledge" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="servicePledgeFormModel" action="${servicePledgeActionUrl}">

		<form:hidden id="frmServicePledgeServicePledgeId" path="id" />
		
		<spring:bind path="pledgeServiceLevelOne">
		  <div id="frmServicePledgePledgeServiceLevelOneFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Your Service</label>
			<div class="col-sm-5">
					
				<form:select path="pledgeServiceLevelOne" class="form-control" id="frmServicePledgePledgeServiceLevelOne">
					<form:option value="-1" label="${unselectedPledgeServiceLevelOne}" />
					<form:options items="${pledgeServiceLevelOneMap}" />
				</form:select>
    
				<span id="frmServicePledgePledgeServiceLevelOneJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgeServiceLevelOne" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="pledgeServiceLevelTwo">
		  <div id="frmServicePledgePledgeServiceLevelTwoFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-5">
					
				<form:select path="pledgeServiceLevelTwo" class="form-control" id="frmServicePledgePledgeServiceLevelTwo">
					<form:option value="-1" label="${unselectedPledgeServiceLevelTwo}" />
					<form:options items="${pledgeServiceLevelTwoMap}" />
				</form:select>
    
				<span id="frmServicePledgePledgeServiceLevelTwoJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgeServiceLevelTwo" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="pledgeServiceLevelThree">
		  <div id="frmServicePledgePledgeServiceLevelThreeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-5">
					
				<form:select path="pledgeServiceLevelThree" class="form-control" id="frmServicePledgePledgeServiceLevelThree">
					<form:option value="-1" label="${unselectedPledgeServiceLevelThree}" />
					<form:options items="${pledgeServiceLevelThreeMap}" />
				</form:select>
    
				<span id="frmServicePledgePledgeServiceLevelThreeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgeServiceLevelThree" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="additionalInformation">
		  <div id="frmServicePledgeAdditionalInformationFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Additional Information</label>
			<div class="col-sm-10">
				
				<form:textarea path="additionalInformation" rows="5" class="form-control" id="frmServicePledgeAdditionalInformation" placeholder="Additional Information" oninput="check_textarea_length(500, this, document.getElementById('frmServicePledgeAdditionalInformationJavascriptErrorDisplay'))"  />
    
				<span id="frmServicePledgeAdditionalInformationJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="additionalInformation" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="pledgeServiceQualification">
		  <div id="frmServicePledgePledgeServiceQualificationFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Qualification to provide Service</label>
			<div class="col-sm-10">
				
				<form:textarea path="pledgeServiceQualification" rows="5" class="form-control" id="frmServicePledgePledgeServiceQualification" placeholder="Qualification to provide Service" oninput="check_textarea_length(500, this, document.getElementById('frmServicePledgePledgeServiceQualificationJavascriptErrorDisplay'))"  />
    
				<span id="frmServicePledgePledgeServiceQualificationJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgeServiceQualification" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="pledgeServiceDateAvailable">
		  <div id="frmServicePledgePledgeServiceDateAvailableFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Date Available for Use</label>
			<div class="col-sm-10">
				
				<form:input path="pledgeServiceDateAvailable" type="text" class="form-control datepicker" id="frmServicePledgePledgeServiceDateAvailable" placeholder="DD/MM/YYYY"  />
    
				<span id="frmServicePledgePledgeServiceDateAvailableJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgeServiceDateAvailable" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="pledgeServiceHoursPerWeek">
		  <div id="frmServicePledgePledgeServiceHoursPerWeekFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Hours per week</label>
			<div class="col-sm-5">
					
				<form:select path="pledgeServiceHoursPerWeek" class="form-control" id="frmServicePledgePledgeServiceHoursPerWeek">
					<form:option value="-1" label="${unselectedPledgeServiceHoursPerWeek}" />
					<form:options items="${pledgeServiceHoursPerWeekMap}" />
				</form:select>
    
				<span id="frmServicePledgePledgeServiceHoursPerWeekJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgeServiceHoursPerWeek" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmServicePledgeSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmServicePledgeSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmServicePledgeExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${servicePledgeFormModel['new']}">
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
	checkFocus(document.getElementById("frmServicePledge"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	// Display a count of the characters in the Additional Information textarea input
	check_textarea_length(500, document.getElementById("frmServicePledgeAdditionalInformation"), document.getElementById('frmServicePledgeAdditionalInformationJavascriptErrorDisplay'));
  
	// Display a count of the characters in the Qualification to provide Service textarea input
	check_textarea_length(500, document.getElementById("frmServicePledgePledgeServiceQualification"), document.getElementById('frmServicePledgePledgeServiceQualificationJavascriptErrorDisplay'));
  
});


      var frmServicePledgePledgeServiceLevelOneBuffer = document.getElementById("frmServicePledgePledgeServiceLevelOne").value;
      
      var frmServicePledgePledgeServiceLevelOneTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceLevelOne"));      
      
      var frmServicePledgePledgeServiceLevelTwoBuffer = document.getElementById("frmServicePledgePledgeServiceLevelTwo").value;
      
      var frmServicePledgePledgeServiceLevelTwoTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceLevelTwo"));      
      
      var frmServicePledgePledgeServiceLevelThreeBuffer = document.getElementById("frmServicePledgePledgeServiceLevelThree").value;
      
      var frmServicePledgePledgeServiceLevelThreeTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceLevelThree"));      
      
      var frmServicePledgeAdditionalInformationBuffer = document.getElementById("frmServicePledgeAdditionalInformation").value;
      
      var frmServicePledgePledgeServiceQualificationBuffer = document.getElementById("frmServicePledgePledgeServiceQualification").value;
      
      var frmServicePledgePledgeServiceDateAvailableBuffer = document.getElementById("frmServicePledgePledgeServiceDateAvailable").value;
      
      var frmServicePledgePledgeServiceHoursPerWeekBuffer = document.getElementById("frmServicePledgePledgeServiceHoursPerWeek").value;
      
      var frmServicePledgePledgeServiceHoursPerWeekTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceHoursPerWeek"));      
      
      var frmServicePledgeSaveButtonBuffer = document.getElementById("frmServicePledgeSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmServicePledgeExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmServicePledgePledgeServiceLevelOne").value != frmServicePledgePledgeServiceLevelOneBuffer){
			document.getElementById("frmServicePledgePledgeServiceLevelOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceLevelOneJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgePledgeServiceLevelOneTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceLevelOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceLevelTwo").value != frmServicePledgePledgeServiceLevelTwoBuffer){
			document.getElementById("frmServicePledgePledgeServiceLevelTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceLevelTwoJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgePledgeServiceLevelTwoTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceLevelTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceLevelThree").value != frmServicePledgePledgeServiceLevelThreeBuffer){
			document.getElementById("frmServicePledgePledgeServiceLevelThreeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceLevelThreeJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgePledgeServiceLevelThreeTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceLevelThree");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgeAdditionalInformation").value != frmServicePledgeAdditionalInformationBuffer){
			document.getElementById("frmServicePledgeAdditionalInformationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgeAdditionalInformationJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgeAdditionalInformationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgeAdditionalInformation");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceQualification").value != frmServicePledgePledgeServiceQualificationBuffer){
			document.getElementById("frmServicePledgePledgeServiceQualificationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceQualificationJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgePledgeServiceQualificationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceQualification");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceDateAvailable").value != frmServicePledgePledgeServiceDateAvailableBuffer){
			document.getElementById("frmServicePledgePledgeServiceDateAvailableFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceDateAvailableJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgePledgeServiceDateAvailableBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceDateAvailable");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceHoursPerWeek").value != frmServicePledgePledgeServiceHoursPerWeekBuffer){
			document.getElementById("frmServicePledgePledgeServiceHoursPerWeekFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceHoursPerWeekJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgePledgeServiceHoursPerWeekTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceHoursPerWeek");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgeSaveButton").value != frmServicePledgeSaveButtonBuffer){
			document.getElementById("frmServicePledgeSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgeSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmServicePledgeSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgeSaveButton");
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
                		document.getElementById("frmServicePledge").method = "get";
                    	document.getElementById("frmServicePledge").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmServicePledge").method = "get";
			document.getElementById("frmServicePledge").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

