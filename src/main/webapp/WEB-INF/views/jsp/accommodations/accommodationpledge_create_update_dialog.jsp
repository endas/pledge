<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="modal fade" id="accommodationPledgeCreateUpdateModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">AccommodationPledge</h4>
      </div>
      <div class="modal-body">

        <form id="frmAccommodationPledgeCreateUpdate" role="form" action="restful/accommodationpledge" method="post">
          <input id="frmAccommodationPledgeCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmAccommodationPledgeCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmAccommodationPledgeCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmAccommodationPledgeCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmAccommodationPledgeCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmAccommodationPledgeCreateUpdateTitle" type="hidden"/>
          
       
		  <div id="frmAccommodationPledgeCreateUpdateOwnerOccupierFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.owneroccupier.label" for="frmAccommodationPledgeCreateUpdateOwnerOccupier" class="control-label"><spring:message code="frmAccommodationPledgeOwnerOccupierLabel"/></label>	
			<select class="form-control" data-display-name="Who owns the accommodation?" data-select-type="standalone" data-required="false" id="frmAccommodationPledgeCreateUpdateOwnerOccupier" aria-describedby="frmAccommodationPledgeCreateUpdateOwnerOccupierHelpBlock">
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateOwnerOccupierHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeOwnerOccupierHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateOwnerOccupierAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateOwnerOccupierAlertBlockText"></span>
			</div>
				  
		  </div>
  
  			<div id="frmAccommodationPledgeCreateUpdateAccommodationTypeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodationtype.label" for="frmAccommodationPledgeCreateUpdateAccommodationType" class="control-label"><spring:message code="frmAccommodationPledgeAccommodationTypeLabel"/></label>	
			<select class="form-control" data-display-name="What kind of accommodation are you pledging?" data-select-type="standalone" data-required="false" id="frmAccommodationPledgeCreateUpdateAccommodationType" aria-describedby="frmAccommodationPledgeCreateUpdateAccommodationTypeHelpBlock">
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateAccommodationTypeHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAccommodationTypeHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAccommodationTypeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAccommodationTypeAlertBlockText"></span>
			</div>
				  
		  </div>
		  
		   <div id="frmAccommodationPledgeCreateUpdateVacantOrSharedFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.vacantorshared.label" for="frmAccommodationPledgeCreateUpdateVacantOrShared" class="control-label"><spring:message code="frmAccommodationPledgeVacantOrSharedLabel"/></label>	
			<select class="form-control" data-display-name="Vacant or Shared" data-select-type="standalone" data-required="false" id="frmAccommodationPledgeCreateUpdateVacantOrShared" aria-describedby="frmAccommodationPledgeCreateUpdateVacantOrSharedHelpBlock">
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateVacantOrSharedHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeVacantOrSharedHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateVacantOrSharedAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateVacantOrSharedAlertBlockText"></span>
			</div>
				  
		  </div>
  
  			<div id="frmAccommodationPledgeCreateUpdateAccommodationConditionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodationcondition.label" for="frmAccommodationPledgeCreateUpdateAccommodationCondition" class="control-label"><spring:message code="frmAccommodationPledgeAccommodationConditionLabel"/></label>	
			<select class="form-control" data-display-name="Condition" data-select-type="standalone" data-required="false" id="frmAccommodationPledgeCreateUpdateAccommodationCondition" aria-describedby="frmAccommodationPledgeCreateUpdateAccommodationConditionHelpBlock">
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateAccommodationConditionHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAccommodationConditionHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAccommodationConditionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAccommodationConditionAlertBlockText"></span>
			</div>
				  
		  </div>
  			
  			<div id="frmAccommodationPledgeCreateUpdateNumberOfBedroomsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.numberofbedrooms.label" for="frmAccommodationPledgeCreateUpdateNumberOfBedrooms" class="control-label"><spring:message code="frmAccommodationPledgeNumberOfBedroomsLabel"/></label>	
			<select class="form-control" data-display-name="Number of bedrooms" data-select-type="standalone" data-required="false" id="frmAccommodationPledgeCreateUpdateNumberOfBedrooms" aria-describedby="frmAccommodationPledgeCreateUpdateNumberOfBedroomsHelpBlock">
			<option value="-1">Select number of bedrooms</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option>
			<option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
			<option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option>
			<option value="19">19</option><option value="20">20</option>
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateNumberOfBedroomsHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeNumberOfBedroomsHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateNumberOfBedroomsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateNumberOfBedroomsAlertBlockText"></span>
			</div>
				  
		  </div>
  			
  		<div id="frmAccommodationPledgeCreateUpdateNumberOfBedsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.numberofbeds.label" for="frmAccommodationPledgeCreateUpdateNumberOfBeds" class="control-label"><spring:message code="frmAccommodationPledgeNumberOfBedsLabel"/></label>	
			<select class="form-control" data-display-name="Number of beds" data-select-type="standalone" data-required="false" id="frmAccommodationPledgeCreateUpdateNumberOfBeds" aria-describedby="frmAccommodationPledgeCreateUpdateNumberOfBedsHelpBlock">
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateNumberOfBedsHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeNumberOfBedsHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateNumberOfBedsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateNumberOfBedsAlertBlockText"></span>
			</div>
				  
		  </div>
		  
		  <div id="frmAccommodationPledgeCreateUpdateAccommodateWhoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodatewho.label" for="frmAccommodationPledgeCreateUpdateAccommodateWhoSelect" class="control-label"><spring:message code="frmAccommodationPledgeAccommodateWhoLabel"/></label>
			<select id="frmApplicationUserDetailsCreateUpdateAccommodateWhoSelect" name="accommodatewho" class="chosen" multiple style="width: 500px;" data-placeholder="<spring:message code="frmAccommodationPledgeAccommodateWhoPlaceHolder"/>" >
      			  
   			 </select>
			<span id="frmAccommodationPledgeCreateUpdateAccommodateWhoCountBlock" class="help-block"></span>
			<span id="frmAccommodationPledgeAccommodateWhoHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAccommodateWhoHelpBlock"/></span>
			
			<div id="frmAccommodationPledgeCreateUpdateAccommodateWhoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAccommodateWhoAlertBlockText"></span>
			</div>	  
		  </div>
  				
  			 <div id="frmAccommodationPledgeCreateUpdateFacilitiesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.amenities.label" for="frmAccommodationPledgeCreateUpdateFacilities" class="control-label"><spring:message code="frmAccommodationPledgeFacilitiesLabel"/></label>
			<select id="frmApplicationUserDetailsCreateUpdateFacilitiesSelect" name="amenities" class="chosen" multiple style="width: 500px;" data-placeholder="<spring:message code="frmAccommodationPledgeFacilitiesPlaceHolder"/>" >
      			  
   			 </select>
			<span id="frmAccommodationPledgeCreateUpdateFacilitiesCountBlock" class="help-block"></span>
			<div id="frmAccommodationPledgeCreateUpdateFacilitiesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateFacilitiesAlertBlockText"></span>
			</div>	  
		  </div>
  
  		
		  <div id="frmAccommodationPledgeCreateUpdateAmenitiesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.amenities.label" for="frmAccommodationPledgeCreateUpdateAmenities" class="control-label"><spring:message code="frmAccommodationPledgeAmenitiesLabel"/></label>
			<select id="frmApplicationUserDetailsCreateUpdateAmenitiesSelect" name="amenities" class="chosen" multiple style="width: 500px;" data-placeholder="<spring:message code="frmAccommodationPledgeAmenitiesPlaceHolder"/>" >
      			  
   			 </select>
			<span id="frmAccommodationPledgeCreateUpdateAmenitiesCountBlock" class="help-block"></span>
			<div id="frmAccommodationPledgeCreateUpdateAmenitiesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAmenitiesAlertBlockText"></span>
			</div>	  
		  </div>
  		
  			
  				
		  <div id="frmAccommodationPledgeCreateUpdateAccommodationDateFromFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodationdatefrom.label" for="frmAccommodationPledgeCreateUpdateAccommodationDateFrom" class="control-label"><spring:message code="frmAccommodationPledgeAccommodationDateFromLabel"/></label>
			<input type="text" data-display-name="When is the accommodation available from?" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmAccommodationPledgeCreateUpdateAccommodationDateFrom" placeholder="<spring:message code="frmAccommodationPledgeAccommodationDateFromPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateAccommodationDateFromHelpBlock"  data-toggle="popover"/>
    
			<span id="frmAccommodationPledgeCreateUpdateAccommodationDateFromHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAccommodationDateFromHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAccommodationDateFromAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAccommodationDateFromAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAccommodationPledgeCreateUpdateAccommodationDateToFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodationdateto.label" for="frmAccommodationPledgeCreateUpdateAccommodationDateTo" class="control-label"><spring:message code="frmAccommodationPledgeAccommodationDateToLabel"/></label>
			<input type="text" data-display-name="When is the accommodation available until?" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmAccommodationPledgeCreateUpdateAccommodationDateTo" placeholder="<spring:message code="frmAccommodationPledgeAccommodationDateToPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateAccommodationDateToHelpBlock"  data-toggle="popover"/>

			<span id="frmAccommodationPledgeCreateUpdateAccommodationDateToHelpBlock" class="help-block">
			<spring:message code="frmAccommodationPledgeAccommodationDateToHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAccommodationDateToAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAccommodationDateToAlertBlockText"></span>
			</div>	  
		  </div>
  
		  
		  
  
		  
  
  		
  
		 
  
		  <div id="frmAccommodationPledgeCreateUpdateOtherAmenitiesFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.otheramenities.label" for="frmAccommodationPledgeCreateUpdateOtherAmenities" class="control-label"><spring:message code="frmAccommodationPledgeOtherAmenitiesLabel"/></label>
			<textarea rows="5" data-display-name="Description of other Amenities" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmAccommodationPledgeCreateUpdateOtherAmenities" placeholder="<spring:message code="frmAccommodationPledgeOtherAmenitiesPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateOtherAmenitiesHelpBlock" oninput="check_textarea_length(500, this, document.getElementById('frmAccommodationPledgeCreateUpdateOtherAmenitiesCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmAccommodationPledgeCreateUpdateOtherAmenitiesCountBlock" class="help-block"></span>
			<span id="frmAccommodationPledgeCreateUpdateOtherAmenitiesHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeOtherAmenitiesHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateOtherAmenitiesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateOtherAmenitiesAlertBlockText"></span>
			</div>
				  
		  </div>

  		
  
  
		  <div id="frmAccommodationPledgeCreateUpdateAdditionalInformationFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.additionalinformation.label" for="frmAccommodationPledgeCreateUpdateAdditionalInformation" class="control-label"><spring:message code="frmAccommodationPledgeAdditionalInformationLabel"/></label>
			<textarea rows="5" data-display-name="Is there anything else that you would like to say about the accommodation?" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmAccommodationPledgeCreateUpdateAdditionalInformation" placeholder="<spring:message code="frmAccommodationPledgeAdditionalInformationPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateAdditionalInformationHelpBlock" oninput="check_textarea_length(500, this, document.getElementById('frmAccommodationPledgeCreateUpdateAdditionalInformationCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmAccommodationPledgeCreateUpdateAdditionalInformationCountBlock" class="help-block"></span>
			<span id="frmAccommodationPledgeCreateUpdateAdditionalInformationHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAdditionalInformationHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAdditionalInformationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAdditionalInformationAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <%-- <div id="frmAccommodationPledgeCreateUpdateSaveButtonFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.savebutton.label" for="frmAccommodationPledgeCreateUpdateSaveButton" class="control-label"><spring:message code="frmAccommodationPledgeSaveButtonLabel"/></label>
			<span id="frmAccommodationPledgeCreateUpdateSaveButtonHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeSaveButtonHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateSaveButtonAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateSaveButtonAlertBlockText"></span>
			</div>
				  
		  </div> --%>
		   
			<div id="frmAccommodationPledgeCreateUpdatePledgeStatusFormGroup" 
				<sec:authorize access="hasRole('ROLE_ADMIN')">class="form-group has-feedback  ${status.error ? 'has-error' : ''}"</sec:authorize>
				<sec:authorize access="!hasRole('ROLE_ADMIN')">class="hidden"</sec:authorize>>
				<label id="accommodationpledge.travel.label" for="frmAccommodationPledgeCreateUpdatePledgeStatus" class="control-label"><spring:message code="frmPledgeStatusLabel"/></label>
				<select class="form-control js-status-select" id="frmAccommodationPledgeStatusSelect" name="servicePledgeStatus" data-select-type="standalone" data-required="true" style="width: 500px;" 
				data-placeholder="<spring:message code="frmPledgeStatusPlaceHolder"/>" >
				</select>
	   			 
				<span id="frmAccommodationPledgeCreateUpdatePledgeStatusCountBlock" class="help-block"></span>
				<div id="frmAccommodationPledgeCreateUpdatePledgeStatusAlertBlock" class="alert alert-dismissible hidden" role="alert">
	  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  				<span id="frmAccommodationPledgeCreateUpdatePledgeStatusAlertBlockText"></span>
				</div>	  
		  	</div>
		  <div class="form-group">
            <input type="checkbox" data-display-name="Same Address as Profile"
              data-required="false" id="pledgeSameAsProfileAddress" class="js-address-same-as-profile"
              /> <label id="pledge.sameAsProfileAddress.label" for="pledgeSameAsProfileAddress" class="control-label"><spring:message code="frmAccomodationSameAsProfileAddress"/></label> 
        </div>
		  	<jsp:include page="../includes/address_modal_fields.jsp"></jsp:include>
      	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmAccommodationPledgeCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmAccommodationPledgeCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save Pledge</span></button>
      </div>
    </div>
  </div>
</div>

