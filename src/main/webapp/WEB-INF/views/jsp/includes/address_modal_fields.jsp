<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	

      <section class="js-address-section">
      <div id="frmPledgeCreateUpdateAddressOneFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
	      <label id="pledge.addressone.label" for="frmPledgeCreateUpdateAddressOne" class="control-label"><spring:message code="frmAddressAddressOneLabel"/></label>
	      <input type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmPledgeCreateUpdateAddressOne" placeholder="<spring:message code="frmAddressAddressOnePlaceHolder"/>" aria-describedby="frmPledgeCreateUpdateAddressOneHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
	    
	      <%-- <span id="frmPledgeCreateUpdateAddressOneHelpBlock" class="help-block"><spring:message code="frmAddressAddressOneHelpBlock"/></span> --%>
	      <div id="frmPledgeCreateUpdateAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
	          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <span id="frmPledgeCreateUpdateAddressOneAlertBlockText"></span>
	      </div>  
      </div>
  
      <div id="frmPledgeCreateUpdateAddressTwoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
      <label id="pledge.addresstwo.label" for="frmPledgeCreateUpdateAddressTwo" class="control-label"><spring:message code="frmAddressAddressTwoLabel"/></label>
      <input type="text" data-display-name="Address Line 2" data-minlength="5" data-required="false" maxlength="50" class="form-control" id="frmPledgeCreateUpdateAddressTwo" placeholder="<spring:message code="frmOptionalPlaceHolder"/>" aria-describedby="frmPledgeCreateUpdateAddressTwoHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
     <%--  <span id="frmPledgeCreateUpdateAddressTwoHelpBlock" class="help-block"><spring:message code="frmAddressAddressTwoHelpBlock"/></span> --%>
      <div id="frmPledgeCreateUpdateAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <span id="frmPledgeCreateUpdateAddressTwoAlertBlockText"></span>
      </div>
          
      </div>
  
      <div id="frmPledgeCreateUpdateCityFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
      <label id="pledge.city.label" for="frmPledgeCreateUpdateCity" class="control-label"><spring:message code="frmAddressCityLabel"/></label>
      <input type="text" data-display-name="City/Town/Village" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmPledgeCreateUpdateCity" placeholder="<spring:message code="frmAddressCityPlaceHolder"/>" aria-describedby="frmPledgeCreateUpdateCityHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
     <%--  <span id="frmPledgeCreateUpdateCityHelpBlock" class="help-block"><spring:message code="frmAddressCityHelpBlock"/></span> --%>
      <div id="frmPledgeCreateUpdateCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <span id="frmPledgeCreateUpdateCityAlertBlockText"></span>
      </div>
          
      </div>
  
      <div id="frmPledgeCreateUpdateStateProvinceRegionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
      <label id="pledge.stateprovinceregion.label" for="frmPledgeCreateUpdateStateProvinceRegion" class="control-label"><spring:message code="frmAddressStateProvinceRegionLabel"/></label>
      <input type="text" data-display-name="County" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmPledgeCreateUpdateStateProvinceRegion" placeholder="<spring:message code="frmAddressStateProvinceRegionPlaceHolder"/>" aria-describedby="frmPledgeCreateUpdateStateProvinceRegionHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
      <%-- <span id="frmPledgeCreateUpdateStateProvinceRegionHelpBlock" class="help-block"><spring:message code="frmAddressStateProvinceRegionHelpBlock"/></span> --%>
      <div id="frmPledgeCreateUpdateStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <span id="frmPledgeCreateUpdateStateProvinceRegionAlertBlockText"></span>
      </div>
          
      </div>
  
      <div id="frmPledgeCreateUpdatePostCodeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
      <label id="pledge.postcode.label" for="frmPledgeCreateUpdatePostCode" class="control-label"><spring:message code="frmAddressPostCodeLabel"/></label>
      <input type="text" data-display-name="Eircode" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmPledgeCreateUpdatePostCode" placeholder="<spring:message code="frmOptionalPlaceHolder"/>" aria-describedby="frmPledgeCreateUpdatePostCodeHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
      <%-- <span id="frmPledgeCreateUpdatePostCodeHelpBlock" class="help-block"><spring:message code="frmAddressPostCodeHelpBlock"/></span> --%>
      <div id="frmPledgeCreateUpdatePostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <span id="frmPledgeCreateUpdatePostCodeAlertBlockText"></span>
      </div>
      <p>
        <a class="text-link" style="text-decoration:underline" href="https://finder.eircode.ie/#/" target="_blank">Find your Eircode</a>
      </p>  
      </div>
  
       <div id="frmPledgeCreateUpdateCountryFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
      <label id="pledge.country.label" for="frmPledgeCreateUpdateCountry" class="control-label"><spring:message code="frmAddressCountryLabel"/></label> 
      <select class="form-control js-country-select" data-display-name="Country" data-select-type="standalone" data-required="true" id="frmPledgeCreateUpdateCountry" aria-describedby="frmPledgeCreateUpdateCountryHelpBlock">
      </select>
    
      <span id="frmPledgeCreateUpdateCountryHelpBlock" class="help-block"><spring:message code="frmAddressCountryHelpBlock"/></span>
      <div id="frmPledgeCreateUpdateCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <span id="frmPledgeCreateUpdateCountryAlertBlockText"></span>
      </div>
          
      </div> 
      </section>