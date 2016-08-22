

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${applicationUserDetailsFormModel['new']}">
		<spring:message code="applicationuserdetails.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="applicationuserdetails.update.title" var="title"/>
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
	

	<spring:url value="/applicationuserdetailss" var="applicationUserDetailsActionUrl" />
	
	<spring:message code="applicationuserdetails.representorganisation.select.unselected" var="unselectedRepresentOrganisation"/>
    
	<spring:message code="applicationuserdetails.country.select.unselected" var="unselectedCountry"/>
    
	<div class="well">
	<form:form id="frmApplicationUserDetails" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="applicationUserDetailsFormModel" action="${applicationUserDetailsActionUrl}">

		<form:hidden id="frmApplicationUserDetailsApplicationUserDetailsId" path="id" />
		
		<spring:bind path="contactInformationInstructions">
		  <div id="frmApplicationUserDetailsContactInformationInstructionsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-10">
				
				<span id="frmApplicationUserDetailsContactInformationInstructionsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="contactInformationInstructions" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="contactName">
		  <div id="frmApplicationUserDetailsContactNameFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Contact Name</label>
			<div class="col-sm-10">
				
				<form:input path="contactName" type="text" maxlength="50" class="form-control" id="frmApplicationUserDetailsContactName" placeholder="Contact Name"  />
    
				<span id="frmApplicationUserDetailsContactNameJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="contactName" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="representOrganisation">
		  <div id="frmApplicationUserDetailsRepresentOrganisationFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Are you pledging on behalf of an organisation?</label>
			<div class="col-sm-5">
					
				<form:select path="representOrganisation" class="form-control" id="frmApplicationUserDetailsRepresentOrganisation">
					<form:option value="-1" label="${unselectedRepresentOrganisation}" />
					<form:options items="${representOrganisationMap}" />
				</form:select>
    
				<span id="frmApplicationUserDetailsRepresentOrganisationJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="representOrganisation" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="telephoneNumber">
		  <div id="frmApplicationUserDetailsTelephoneNumberFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Phone Number</label>
			<div class="col-sm-10">
				
				<form:input path="telephoneNumber" type="tel" maxlength="20" class="form-control" id="frmApplicationUserDetailsTelephoneNumber" placeholder="Phone Number"  onkeypress="return checkIntegerKeyPressAndRenderErrorMessage(event, this, document.getElementById('frmApplicationUserDetailsTelephoneNumberJavascriptErrorDisplay'), document.getElementById('frmApplicationUserDetailsTelephoneNumberFormGroup'), 'The Phone Number can only accept an optional + character followed by the digits 0-9', 'has-error', 'Valid', true)"  />
    
				<span id="frmApplicationUserDetailsTelephoneNumberJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="telephoneNumber" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="addressOne">
		  <div id="frmApplicationUserDetailsAddressOneFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address Line 1</label>
			<div class="col-sm-10">
				
				<form:input path="addressOne" type="text" maxlength="50" class="form-control" id="frmApplicationUserDetailsAddressOne" placeholder="Address Line 1"  />
    
				<span id="frmApplicationUserDetailsAddressOneJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="addressOne" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="addressTwo">
		  <div id="frmApplicationUserDetailsAddressTwoFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address Line 2</label>
			<div class="col-sm-10">
				
				<form:input path="addressTwo" type="text" maxlength="50" class="form-control" id="frmApplicationUserDetailsAddressTwo" placeholder="Address Line 2"  />
    
				<span id="frmApplicationUserDetailsAddressTwoJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="addressTwo" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="city">
		  <div id="frmApplicationUserDetailsCityFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Townland/Town/City</label>
			<div class="col-sm-10">
				
				<form:input path="city" type="text" maxlength="50" class="form-control" id="frmApplicationUserDetailsCity" placeholder="Townland/Town/City"  />
    
				<span id="frmApplicationUserDetailsCityJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="city" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="stateProvinceRegion">
		  <div id="frmApplicationUserDetailsStateProvinceRegionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">State/Province/Region</label>
			<div class="col-sm-10">
				
				<form:input path="stateProvinceRegion" type="text" maxlength="50" class="form-control" id="frmApplicationUserDetailsStateProvinceRegion" placeholder="State/Province/Region"  />
    
				<span id="frmApplicationUserDetailsStateProvinceRegionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="stateProvinceRegion" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="postCode">
		  <div id="frmApplicationUserDetailsPostCodeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Eircode</label>
			<div class="col-sm-10">
				
				<form:input path="postCode" type="text" maxlength="10" class="form-control" id="frmApplicationUserDetailsPostCode" placeholder="Eircode"  />
    
				<span id="frmApplicationUserDetailsPostCodeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="postCode" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="country">
		  <div id="frmApplicationUserDetailsCountryFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Country</label>
			<div class="col-sm-5">
					
				<form:select path="country" class="form-control" id="frmApplicationUserDetailsCountry">
					<form:option value="-1" label="${unselectedCountry}" />
					<form:options items="${countryMap}" />
				</form:select>
    
				<span id="frmApplicationUserDetailsCountryJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="country" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="emailAddress">
		  <div id="frmApplicationUserDetailsEmailAddressFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Email Address</label>
			<div class="col-sm-10">
				
				<form:input path="emailAddress" type="email" class="form-control" id="frmApplicationUserDetailsEmailAddress" placeholder="Email Address"  />
    
				<span id="frmApplicationUserDetailsEmailAddressJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="emailAddress" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmApplicationUserDetailsSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmApplicationUserDetailsSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmApplicationUserDetailsExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${applicationUserDetailsFormModel['new']}">
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
	checkFocus(document.getElementById("frmApplicationUserDetails"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

});


      var frmApplicationUserDetailsContactInformationInstructionsBuffer = document.getElementById("frmApplicationUserDetailsContactInformationInstructions").value;
      
      var frmApplicationUserDetailsContactNameBuffer = document.getElementById("frmApplicationUserDetailsContactName").value;
      
      var frmApplicationUserDetailsRepresentOrganisationBuffer = document.getElementById("frmApplicationUserDetailsRepresentOrganisation").value;
      
      var frmApplicationUserDetailsRepresentOrganisationTextBuffer = getSelectedText(document.getElementById("frmApplicationUserDetailsRepresentOrganisation"));      
      
      var frmApplicationUserDetailsTelephoneNumberBuffer = document.getElementById("frmApplicationUserDetailsTelephoneNumber").value;
      
      var frmApplicationUserDetailsAddressOneBuffer = document.getElementById("frmApplicationUserDetailsAddressOne").value;
      
      var frmApplicationUserDetailsAddressTwoBuffer = document.getElementById("frmApplicationUserDetailsAddressTwo").value;
      
      var frmApplicationUserDetailsCityBuffer = document.getElementById("frmApplicationUserDetailsCity").value;
      
      var frmApplicationUserDetailsStateProvinceRegionBuffer = document.getElementById("frmApplicationUserDetailsStateProvinceRegion").value;
      
      var frmApplicationUserDetailsPostCodeBuffer = document.getElementById("frmApplicationUserDetailsPostCode").value;
      
      var frmApplicationUserDetailsCountryBuffer = document.getElementById("frmApplicationUserDetailsCountry").value;
      
      var frmApplicationUserDetailsCountryTextBuffer = getSelectedText(document.getElementById("frmApplicationUserDetailsCountry"));      
      
      var frmApplicationUserDetailsEmailAddressBuffer = document.getElementById("frmApplicationUserDetailsEmailAddress").value;
      
      var frmApplicationUserDetailsSaveButtonBuffer = document.getElementById("frmApplicationUserDetailsSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmApplicationUserDetailsExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmApplicationUserDetailsContactInformationInstructions").value != frmApplicationUserDetailsContactInformationInstructionsBuffer){
			document.getElementById("frmApplicationUserDetailsContactInformationInstructionsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsContactInformationInstructionsJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsContactInformationInstructionsBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsContactInformationInstructions");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsContactName").value != frmApplicationUserDetailsContactNameBuffer){
			document.getElementById("frmApplicationUserDetailsContactNameFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsContactNameJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsContactNameBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsContactName");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsRepresentOrganisation").value != frmApplicationUserDetailsRepresentOrganisationBuffer){
			document.getElementById("frmApplicationUserDetailsRepresentOrganisationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsRepresentOrganisationJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsRepresentOrganisationTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsRepresentOrganisation");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsTelephoneNumber").value != frmApplicationUserDetailsTelephoneNumberBuffer){
			document.getElementById("frmApplicationUserDetailsTelephoneNumberFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsTelephoneNumberJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsTelephoneNumberBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsTelephoneNumber");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsAddressOne").value != frmApplicationUserDetailsAddressOneBuffer){
			document.getElementById("frmApplicationUserDetailsAddressOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsAddressOneJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsAddressOneBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsAddressOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsAddressTwo").value != frmApplicationUserDetailsAddressTwoBuffer){
			document.getElementById("frmApplicationUserDetailsAddressTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsAddressTwoJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsAddressTwoBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsAddressTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsCity").value != frmApplicationUserDetailsCityBuffer){
			document.getElementById("frmApplicationUserDetailsCityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsCityJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsCityBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsCity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsStateProvinceRegion").value != frmApplicationUserDetailsStateProvinceRegionBuffer){
			document.getElementById("frmApplicationUserDetailsStateProvinceRegionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsStateProvinceRegionJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsStateProvinceRegionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsStateProvinceRegion");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsPostCode").value != frmApplicationUserDetailsPostCodeBuffer){
			document.getElementById("frmApplicationUserDetailsPostCodeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsPostCodeJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsPostCodeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsPostCode");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsCountry").value != frmApplicationUserDetailsCountryBuffer){
			document.getElementById("frmApplicationUserDetailsCountryFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsCountryJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsCountryTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsCountry");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsEmailAddress").value != frmApplicationUserDetailsEmailAddressBuffer){
			document.getElementById("frmApplicationUserDetailsEmailAddressFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsEmailAddressJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsEmailAddressBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsEmailAddress");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsSaveButton").value != frmApplicationUserDetailsSaveButtonBuffer){
			document.getElementById("frmApplicationUserDetailsSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmApplicationUserDetailsSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsSaveButton");
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
                		document.getElementById("frmApplicationUserDetails").method = "get";
                    	document.getElementById("frmApplicationUserDetails").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmApplicationUserDetails").method = "get";
			document.getElementById("frmApplicationUserDetails").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

