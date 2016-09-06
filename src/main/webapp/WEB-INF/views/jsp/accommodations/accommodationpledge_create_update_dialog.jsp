<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="accommodationPledgeCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
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
          
        <div class="form-group">

						<input type="checkbox" data-display-name="Same Address as Profile"
							data-required="false" id="AccomodationSameAsProfileAddress"
							onclick='sameAsProfileAddressSelected();' /> <label id="accommodationpledge.sameAsProfileAddress.label" for="AccomodationSameAsProfileAddress" class="control-label"><spring:message code="frmAccomodationSameAsProfileAddress"/></label> 
      	</div>
		  
		  <div id="frmAccommodationPledgeCreateUpdateAddressOneFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.addressone.label" for="frmAccommodationPledgeCreateUpdateAddressOne" class="control-label"><spring:message code="frmAccommodationPledgeAddressOneLabel"/></label>
			<input type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAccommodationPledgeCreateUpdateAddressOne" placeholder="<spring:message code="frmAccommodationPledgeAddressOnePlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateAddressOneHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAccommodationPledgeCreateUpdateAddressOneHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAddressOneHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAddressOneAlertBlockText"></span>
			</div>  
		  </div>
  
		  <div id="frmAccommodationPledgeCreateUpdateAddressTwoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.addresstwo.label" for="frmAccommodationPledgeCreateUpdateAddressTwo" class="control-label"><spring:message code="frmAccommodationPledgeAddressTwoLabel"/></label>
			<input type="text" data-display-name="Address Line 2" data-minlength="5" data-required="false" maxlength="50" class="form-control" id="frmAccommodationPledgeCreateUpdateAddressTwo" placeholder="<spring:message code="frmOptionalPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateAddressTwoHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAccommodationPledgeCreateUpdateAddressTwoHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeAddressTwoHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateAddressTwoAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAccommodationPledgeCreateUpdateCityFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.city.label" for="frmAccommodationPledgeCreateUpdateCity" class="control-label"><spring:message code="frmAccommodationPledgeCityLabel"/></label>
			<input type="text" data-display-name="City/Town/Village" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmAccommodationPledgeCreateUpdateCity" placeholder="<spring:message code="frmAccommodationPledgeCityPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateCityHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAccommodationPledgeCreateUpdateCityHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeCityHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateCityAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAccommodationPledgeCreateUpdateStateProvinceRegionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.stateprovinceregion.label" for="frmAccommodationPledgeCreateUpdateStateProvinceRegion" class="control-label"><spring:message code="frmAccommodationPledgeStateProvinceRegionLabel"/></label>
			<input type="text" data-display-name="County" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmAccommodationPledgeCreateUpdateStateProvinceRegion" placeholder="<spring:message code="frmAccommodationPledgeStateProvinceRegionPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdateStateProvinceRegionHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAccommodationPledgeCreateUpdateStateProvinceRegionHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeStateProvinceRegionHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateStateProvinceRegionAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmAccommodationPledgeCreateUpdatePostCodeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.postcode.label" for="frmAccommodationPledgeCreateUpdatePostCode" class="control-label"><spring:message code="frmAccommodationPledgePostCodeLabel"/></label>
			<input type="text" data-display-name="Eircode" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmAccommodationPledgeCreateUpdatePostCode" placeholder="<spring:message code="frmOptionalPlaceHolder"/>" aria-describedby="frmAccommodationPledgeCreateUpdatePostCodeHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmAccommodationPledgeCreateUpdatePostCodeHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgePostCodeHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdatePostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdatePostCodeAlertBlockText"></span>
			</div>
			<p>
				<a class="text-link" style="text-decoration:underline" href="https://finder.eircode.ie/#/" target="_blank">Find your Eircode</a>
			</p>  
		  </div>
  
		  <div id="frmAccommodationPledgeCreateUpdateCountryFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.country.label" for="frmAccommodationPledgeCreateUpdateCountry" class="control-label"><spring:message code="frmAccommodationPledgeCountryLabel"/></label>	
			<select class="form-control" data-display-name="Country" data-select-type="standalone" data-required="true" id="frmAccommodationPledgeCreateUpdateCountry" aria-describedby="frmAccommodationPledgeCreateUpdateCountryHelpBlock">
			</select>
	  
			<span id="frmAccommodationPledgeCreateUpdateCountryHelpBlock" class="help-block"><spring:message code="frmAccommodationPledgeCountryHelpBlock"/></span>
			<div id="frmAccommodationPledgeCreateUpdateCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmAccommodationPledgeCreateUpdateCountryAlertBlockText"></span>
			</div>
				  
		  </div>
  
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

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmAccommodationPledgeCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmAccommodationPledgeCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save Pledge</span></button>
      </div>
    </div>
  </div>
</div>

