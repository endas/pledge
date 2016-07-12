

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${accommodationPledgeFormModel['new']}">
		<spring:message code="accommodationpledge.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="accommodationpledge.update.title" var="title"/>
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
	

	<spring:url value="/accommodationpledges" var="accommodationPledgeActionUrl" />
	
	<spring:message code="accommodationpledge.country.select.unselected" var="unselectedCountry"/>
    
	<spring:message code="accommodationpledge.owneroccupier.select.unselected" var="unselectedOwnerOccupier"/>
    
	<spring:message code="accommodationpledge.accommodationtype.select.unselected" var="unselectedAccommodationType"/>
    
	<spring:message code="accommodationpledge.accommodationcondition.select.unselected" var="unselectedAccommodationCondition"/>
    
	<spring:message code="accommodationpledge.numberofbeds.select.unselected" var="unselectedNumberOfBeds"/>
    
	<spring:message code="accommodationpledge.vacantorshared.select.unselected" var="unselectedVacantOrShared"/>
    
	<spring:message code="accommodationpledge.canyouaccommodate.select.unselected" var="unselectedCanYouAccommodate"/>
    
	<div class="well">
	<form:form id="frmAccommodationPledge" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="accommodationPledgeFormModel" action="${accommodationPledgeActionUrl}">

		<form:hidden id="frmAccommodationPledgeAccommodationPledgeId" path="id" />
		
		<spring:bind path="addressOne">
		  <div id="frmAccommodationPledgeAddressOneFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address Line 1</label>
			<div class="col-sm-10">
				
				<form:input path="addressOne" type="text" maxlength="50" class="form-control" id="frmAccommodationPledgeAddressOne" placeholder="Address Line 1"  />
    
				<span id="frmAccommodationPledgeAddressOneJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="addressOne" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="addressTwo">
		  <div id="frmAccommodationPledgeAddressTwoFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address Line 2</label>
			<div class="col-sm-10">
				
				<form:input path="addressTwo" type="text" maxlength="50" class="form-control" id="frmAccommodationPledgeAddressTwo" placeholder="Address Line 2"  />
    
				<span id="frmAccommodationPledgeAddressTwoJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="addressTwo" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="city">
		  <div id="frmAccommodationPledgeCityFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Townland/Town/City</label>
			<div class="col-sm-10">
				
				<form:input path="city" type="text" maxlength="50" class="form-control" id="frmAccommodationPledgeCity" placeholder="Townland/Town/City"  />
    
				<span id="frmAccommodationPledgeCityJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="city" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="stateProvinceRegion">
		  <div id="frmAccommodationPledgeStateProvinceRegionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">State/Province/Region</label>
			<div class="col-sm-10">
				
				<form:input path="stateProvinceRegion" type="text" maxlength="50" class="form-control" id="frmAccommodationPledgeStateProvinceRegion" placeholder="State/Province/Region"  />
    
				<span id="frmAccommodationPledgeStateProvinceRegionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="stateProvinceRegion" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="postCode">
		  <div id="frmAccommodationPledgePostCodeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Post Code</label>
			<div class="col-sm-10">
				
				<form:input path="postCode" type="text" maxlength="10" class="form-control" id="frmAccommodationPledgePostCode" placeholder="Post Code"  />
    
				<span id="frmAccommodationPledgePostCodeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="postCode" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="country">
		  <div id="frmAccommodationPledgeCountryFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Country</label>
			<div class="col-sm-5">
					
				<form:select path="country" class="form-control" id="frmAccommodationPledgeCountry">
					<form:option value="-1" label="${unselectedCountry}" />
					<form:options items="${countryMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeCountryJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="country" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="ownerOccupier">
		  <div id="frmAccommodationPledgeOwnerOccupierFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Who owns the accommodation?</label>
			<div class="col-sm-5">
					
				<form:select path="ownerOccupier" class="form-control" id="frmAccommodationPledgeOwnerOccupier">
					<form:option value="-1" label="${unselectedOwnerOccupier}" />
					<form:options items="${ownerOccupierMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeOwnerOccupierJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="ownerOccupier" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="accommodationDateFrom">
		  <div id="frmAccommodationPledgeAccommodationDateFromFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">When is the accommodation available from?</label>
			<div class="col-sm-10">
				
				<form:input path="accommodationDateFrom" type="text" class="form-control datepicker" id="frmAccommodationPledgeAccommodationDateFrom" placeholder="DD/MM/YYYY"  />
    
				<span id="frmAccommodationPledgeAccommodationDateFromJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="accommodationDateFrom" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="accommodationDateTo">
		  <div id="frmAccommodationPledgeAccommodationDateToFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">When is the accommodation available until?</label>
			<div class="col-sm-10">
				
				<form:input path="accommodationDateTo" type="text" class="form-control datepicker" id="frmAccommodationPledgeAccommodationDateTo" placeholder="DD/MM/YYYY"  />
    
				<span id="frmAccommodationPledgeAccommodationDateToJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="accommodationDateTo" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="accommodationType">
		  <div id="frmAccommodationPledgeAccommodationTypeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">What kind of accommodation are you pledging?</label>
			<div class="col-sm-5">
					
				<form:select path="accommodationType" class="form-control" id="frmAccommodationPledgeAccommodationType">
					<form:option value="-1" label="${unselectedAccommodationType}" />
					<form:options items="${accommodationTypeMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeAccommodationTypeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="accommodationType" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="accommodationCondition">
		  <div id="frmAccommodationPledgeAccommodationConditionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Condition</label>
			<div class="col-sm-5">
					
				<form:select path="accommodationCondition" class="form-control" id="frmAccommodationPledgeAccommodationCondition">
					<form:option value="-1" label="${unselectedAccommodationCondition}" />
					<form:options items="${accommodationConditionMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeAccommodationConditionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="accommodationCondition" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="numberOfBeds">
		  <div id="frmAccommodationPledgeNumberOfBedsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Number of beds</label>
			<div class="col-sm-5">
					
				<form:select path="numberOfBeds" class="form-control" id="frmAccommodationPledgeNumberOfBeds">
					<form:option value="-1" label="${unselectedNumberOfBeds}" />
					<form:options items="${numberOfBedsMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeNumberOfBedsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="numberOfBeds" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="vacantOrShared">
		  <div id="frmAccommodationPledgeVacantOrSharedFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Vacant or Shared</label>
			<div class="col-sm-5">
					
				<form:select path="vacantOrShared" class="form-control" id="frmAccommodationPledgeVacantOrShared">
					<form:option value="-1" label="${unselectedVacantOrShared}" />
					<form:options items="${vacantOrSharedMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeVacantOrSharedJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="vacantOrShared" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="otherAmenities">
		  <div id="frmAccommodationPledgeOtherAmenitiesFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Description of other Amenities</label>
			<div class="col-sm-10">
				
				<form:textarea path="otherAmenities" rows="5" class="form-control" id="frmAccommodationPledgeOtherAmenities" placeholder="Description of other Amenities" oninput="check_textarea_length(500, this, document.getElementById('frmAccommodationPledgeOtherAmenitiesJavascriptErrorDisplay'))"  />
    
				<span id="frmAccommodationPledgeOtherAmenitiesJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="otherAmenities" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="canYouAccommodate">
		  <div id="frmAccommodationPledgeCanYouAccommodateFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Who can you accommodate?</label>
			<div class="col-sm-5">
					
				<form:select path="canYouAccommodate" class="form-control" id="frmAccommodationPledgeCanYouAccommodate">
					<form:option value="-1" label="${unselectedCanYouAccommodate}" />
					<form:options items="${canYouAccommodateMap}" />
				</form:select>
    
				<span id="frmAccommodationPledgeCanYouAccommodateJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="canYouAccommodate" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="additionalInformation">
		  <div id="frmAccommodationPledgeAdditionalInformationFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Is there anything else that you would like to say about the accommodation?</label>
			<div class="col-sm-10">
				
				<form:textarea path="additionalInformation" rows="5" class="form-control" id="frmAccommodationPledgeAdditionalInformation" placeholder="Is there anything else that you would like to say about the accommodation?" oninput="check_textarea_length(500, this, document.getElementById('frmAccommodationPledgeAdditionalInformationJavascriptErrorDisplay'))"  />
    
				<span id="frmAccommodationPledgeAdditionalInformationJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="additionalInformation" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmAccommodationPledgeSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmAccommodationPledgeSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmAccommodationPledgeExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${accommodationPledgeFormModel['new']}">
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
	checkFocus(document.getElementById("frmAccommodationPledge"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	// Display a count of the characters in the Description of other Amenities textarea input
	check_textarea_length(500, document.getElementById("frmAccommodationPledgeOtherAmenities"), document.getElementById('frmAccommodationPledgeOtherAmenitiesJavascriptErrorDisplay'));
  
	// Display a count of the characters in the Is there anything else that you would like to say about the accommodation? textarea input
	check_textarea_length(500, document.getElementById("frmAccommodationPledgeAdditionalInformation"), document.getElementById('frmAccommodationPledgeAdditionalInformationJavascriptErrorDisplay'));
  
});


      var frmAccommodationPledgeAddressOneBuffer = document.getElementById("frmAccommodationPledgeAddressOne").value;
      
      var frmAccommodationPledgeAddressTwoBuffer = document.getElementById("frmAccommodationPledgeAddressTwo").value;
      
      var frmAccommodationPledgeCityBuffer = document.getElementById("frmAccommodationPledgeCity").value;
      
      var frmAccommodationPledgeStateProvinceRegionBuffer = document.getElementById("frmAccommodationPledgeStateProvinceRegion").value;
      
      var frmAccommodationPledgePostCodeBuffer = document.getElementById("frmAccommodationPledgePostCode").value;
      
      var frmAccommodationPledgeCountryBuffer = document.getElementById("frmAccommodationPledgeCountry").value;
      
      var frmAccommodationPledgeCountryTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeCountry"));      
      
      var frmAccommodationPledgeOwnerOccupierBuffer = document.getElementById("frmAccommodationPledgeOwnerOccupier").value;
      
      var frmAccommodationPledgeOwnerOccupierTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeOwnerOccupier"));      
      
      var frmAccommodationPledgeAccommodationDateFromBuffer = document.getElementById("frmAccommodationPledgeAccommodationDateFrom").value;
      
      var frmAccommodationPledgeAccommodationDateToBuffer = document.getElementById("frmAccommodationPledgeAccommodationDateTo").value;
      
      var frmAccommodationPledgeAccommodationTypeBuffer = document.getElementById("frmAccommodationPledgeAccommodationType").value;
      
      var frmAccommodationPledgeAccommodationTypeTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeAccommodationType"));      
      
      var frmAccommodationPledgeAccommodationConditionBuffer = document.getElementById("frmAccommodationPledgeAccommodationCondition").value;
      
      var frmAccommodationPledgeAccommodationConditionTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeAccommodationCondition"));      
      
      var frmAccommodationPledgeNumberOfBedsBuffer = document.getElementById("frmAccommodationPledgeNumberOfBeds").value;
      
      var frmAccommodationPledgeNumberOfBedsTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeNumberOfBeds"));      
      
      var frmAccommodationPledgeVacantOrSharedBuffer = document.getElementById("frmAccommodationPledgeVacantOrShared").value;
      
      var frmAccommodationPledgeVacantOrSharedTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeVacantOrShared"));      
      
      var frmAccommodationPledgeOtherAmenitiesBuffer = document.getElementById("frmAccommodationPledgeOtherAmenities").value;
      
      var frmAccommodationPledgeCanYouAccommodateBuffer = document.getElementById("frmAccommodationPledgeCanYouAccommodate").value;
      
      var frmAccommodationPledgeCanYouAccommodateTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeCanYouAccommodate"));      
      
      var frmAccommodationPledgeAdditionalInformationBuffer = document.getElementById("frmAccommodationPledgeAdditionalInformation").value;
      
      var frmAccommodationPledgeSaveButtonBuffer = document.getElementById("frmAccommodationPledgeSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmAccommodationPledgeExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmAccommodationPledgeAddressOne").value != frmAccommodationPledgeAddressOneBuffer){
			document.getElementById("frmAccommodationPledgeAddressOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAddressOneJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAddressOneBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAddressOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAddressTwo").value != frmAccommodationPledgeAddressTwoBuffer){
			document.getElementById("frmAccommodationPledgeAddressTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAddressTwoJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAddressTwoBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAddressTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeCity").value != frmAccommodationPledgeCityBuffer){
			document.getElementById("frmAccommodationPledgeCityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeCityJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeCityBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeCity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeStateProvinceRegion").value != frmAccommodationPledgeStateProvinceRegionBuffer){
			document.getElementById("frmAccommodationPledgeStateProvinceRegionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeStateProvinceRegionJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeStateProvinceRegionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeStateProvinceRegion");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgePostCode").value != frmAccommodationPledgePostCodeBuffer){
			document.getElementById("frmAccommodationPledgePostCodeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgePostCodeJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgePostCodeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgePostCode");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeCountry").value != frmAccommodationPledgeCountryBuffer){
			document.getElementById("frmAccommodationPledgeCountryFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeCountryJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeCountryTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeCountry");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeOwnerOccupier").value != frmAccommodationPledgeOwnerOccupierBuffer){
			document.getElementById("frmAccommodationPledgeOwnerOccupierFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeOwnerOccupierJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeOwnerOccupierTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeOwnerOccupier");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationDateFrom").value != frmAccommodationPledgeAccommodationDateFromBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationDateFromFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationDateFromJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAccommodationDateFromBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationDateFrom");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationDateTo").value != frmAccommodationPledgeAccommodationDateToBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationDateToFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationDateToJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAccommodationDateToBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationDateTo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationType").value != frmAccommodationPledgeAccommodationTypeBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationTypeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationTypeJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAccommodationTypeTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationType");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationCondition").value != frmAccommodationPledgeAccommodationConditionBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationConditionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationConditionJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAccommodationConditionTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationCondition");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeNumberOfBeds").value != frmAccommodationPledgeNumberOfBedsBuffer){
			document.getElementById("frmAccommodationPledgeNumberOfBedsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeNumberOfBedsJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeNumberOfBedsTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeNumberOfBeds");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeVacantOrShared").value != frmAccommodationPledgeVacantOrSharedBuffer){
			document.getElementById("frmAccommodationPledgeVacantOrSharedFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeVacantOrSharedJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeVacantOrSharedTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeVacantOrShared");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeOtherAmenities").value != frmAccommodationPledgeOtherAmenitiesBuffer){
			document.getElementById("frmAccommodationPledgeOtherAmenitiesFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeOtherAmenitiesJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeOtherAmenitiesBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeOtherAmenities");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeCanYouAccommodate").value != frmAccommodationPledgeCanYouAccommodateBuffer){
			document.getElementById("frmAccommodationPledgeCanYouAccommodateFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeCanYouAccommodateJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeCanYouAccommodateTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeCanYouAccommodate");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAdditionalInformation").value != frmAccommodationPledgeAdditionalInformationBuffer){
			document.getElementById("frmAccommodationPledgeAdditionalInformationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAdditionalInformationJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeAdditionalInformationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAdditionalInformation");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeSaveButton").value != frmAccommodationPledgeSaveButtonBuffer){
			document.getElementById("frmAccommodationPledgeSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmAccommodationPledgeSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeSaveButton");
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
                		document.getElementById("frmAccommodationPledge").method = "get";
                    	document.getElementById("frmAccommodationPledge").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmAccommodationPledge").method = "get";
			document.getElementById("frmAccommodationPledge").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

