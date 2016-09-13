<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="modal fade" id="goodsPledgeCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">GoodsPledge</h4>
      </div>
      <div class="modal-body">

        <form id="frmGoodsPledgeCreateUpdate" role="form" action="restful/goodspledge" method="post">
          <input id="frmGoodsPledgeCreateUpdateParentObjectId" type="hidden"/> 
          <input id="frmGoodsPledgeCreateUpdateLoadedObjectId" type="hidden"/>
          <input id="frmGoodsPledgeCreateUpdateCallBackDisplayType" type="hidden"/>
          <input id="frmGoodsPledgeCreateUpdateCallBackTableBodyId" type="hidden"/>
          <input id="frmGoodsPledgeCreateUpdatePropertyUrl" type="hidden"/>
          <input id="frmGoodsPledgeCreateUpdateTitle" type="hidden"/>
		  
		  <div id="frmGoodsPledgeCreateUpdateGoodsCategoryOneFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.goodscategoryone.label" for="frmGoodsPledgeCreateUpdateGoodsCategoryOne" class="control-label"><spring:message code="frmGoodsPledgeGoodsCategoryOneLabel"/></label>	
			<select class="form-control" data-display-name="Goods Category One" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsCategoryOne" aria-describedby="frmGoodsPledgeCreateUpdateGoodsCategoryOneHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsCategoryTwo'), 'theValueToSet', 'GoodsCategoryTwo', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>');loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsCondition'), 'theValueToSet', 'GoodsCondition', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>');loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsQuantity'), 'theValueToSet', 'GoodsQuantity', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>');loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsSize'), 'theValueToSet', 'GoodsSize', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>');loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsCategoryThree'), 'theValueToSet', 'GoodsCategoryThree', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>')">
			</select>
			<span id="frmGoodsPledgeCreateUpdateGoodsCategoryOneHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsCategoryOneHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsCategoryOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsCategoryOneAlertBlockText"></span>
			</div>	  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsCategoryTwoFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="goodspledge.goodscategorytwo.label" for="frmGoodsPledgeCreateUpdateGoodsCategoryTwo" class="control-label"><spring:message code="frmGoodsPledgeGoodsCategoryTwoLabel"/></label>	
			<select class="form-control" data-display-name="Goods Category Two" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsCategoryTwo" aria-describedby="frmGoodsPledgeCreateUpdateGoodsCategoryTwoHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsCategoryThree'), 'theValueToSet', 'GoodsCategoryThree', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>');loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdateGoodsSize'), 'theValueToSet', 'GoodsSize', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>')">
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsCategoryTwoHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsCategoryTwoHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsCategoryTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsCategoryTwoAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsCategoryThreeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="goodspledge.goodscategorythree.label" for="frmGoodsPledgeCreateUpdateGoodsCategoryThree" class="control-label"><spring:message code="frmGoodsPledgeGoodsCategoryThreeLabel"/></label>	
			<select class="form-control" data-display-name="Goods Category Three" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsCategoryThree" aria-describedby="frmGoodsPledgeCreateUpdateGoodsCategoryThreeHelpBlock" onchange="">
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsCategoryThreeHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsCategoryThreeHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsCategoryThreeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsCategoryThreeAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsSizeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="goodspledge.goodssize.label" for="frmGoodsPledgeCreateUpdateGoodsSize" class="control-label"><spring:message code="frmGoodsPledgeGoodsSizeLabel"/></label>	
			<select class="form-control" data-display-name="Size" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsSize" aria-describedby="frmGoodsPledgeCreateUpdateGoodsSizeHelpBlock" >
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsSizeHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsSizeHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsSizeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsSizeAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsNewOrUsedFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.goodsneworused.label" for="frmGoodsPledgeCreateUpdateGoodsNewOrUsed" class="control-label"><spring:message code="frmGoodsPledgeGoodsNewOrUsedLabel"/></label>	
			<select class="form-control" data-display-name="New/Used" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsNewOrUsed" aria-describedby="frmGoodsPledgeCreateUpdateGoodsNewOrUsedHelpBlock" >
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsNewOrUsedHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsNewOrUsedHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsNewOrUsedAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsNewOrUsedAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsConditionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="goodspledge.goodscondition.label" for="frmGoodsPledgeCreateUpdateGoodsCondition" class="control-label"><spring:message code="frmGoodsPledgeGoodsConditionLabel"/></label>	
			<select class="form-control" data-display-name="Goods Condition" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsCondition" aria-describedby="frmGoodsPledgeCreateUpdateGoodsConditionHelpBlock" >
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsConditionHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsConditionHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsConditionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsConditionAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsQuantityFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''} collapse">
			<label id="goodspledge.goodsquantity.label" for="frmGoodsPledgeCreateUpdateGoodsQuantity" class="control-label"><spring:message code="frmGoodsPledgeGoodsQuantityLabel"/></label>	
			<select class="form-control" data-display-name="Quantity" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsQuantity" aria-describedby="frmGoodsPledgeCreateUpdateGoodsQuantityHelpBlock" >
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsQuantityHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsQuantityHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsQuantityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsQuantityAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateAdditionalInformationFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.additionalinformation.label" for="frmGoodsPledgeCreateUpdateAdditionalInformation" class="control-label"><spring:message code="frmGoodsPledgeAdditionalInformationLabel"/></label>
			<textarea rows="5" data-display-name="Additional Information" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmGoodsPledgeCreateUpdateAdditionalInformation" placeholder="<spring:message code="frmGoodsPledgeAdditionalInformationPlaceHolder"/>" aria-describedby="frmGoodsPledgeCreateUpdateAdditionalInformationHelpBlock" oninput="check_textarea_length(500, this, document.getElementById('frmGoodsPledgeCreateUpdateAdditionalInformationCountBlock'))" data-validate-key-press="true" data-toggle="popover"></textarea>
    <span id="frmGoodsPledgeCreateUpdateAdditionalInformationCountBlock" class="help-block"></span>
			<span id="frmGoodsPledgeCreateUpdateAdditionalInformationHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeAdditionalInformationHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateAdditionalInformationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateAdditionalInformationAlertBlockText"></span>
			</div>
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateItemSizeFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.itemsize.label" for="frmGoodsPledgeCreateUpdateItemSize" class="control-label"><spring:message code="frmGoodsPledgeItemSizeLabel"/></label>
			<input type="text" data-display-name="Package Size" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmGoodsPledgeCreateUpdateItemSize" placeholder="<spring:message code="frmGoodsPledgeItemSizePlaceHolder"/>" aria-describedby="frmGoodsPledgeCreateUpdateItemSizeHelpBlock" data-validate-key-press="true" data-toggle="popover"/>
    
			<span id="frmGoodsPledgeCreateUpdateItemSizeHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeItemSizeHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateItemSizeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateItemSizeAlertBlockText"></span>
			</div>
				  
		  </div>
		  
		
		<div id="frmGoodsPledgeCreateUpdateGoodsDateFromFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodationdatefrom.label" for="frmGoodsPledgeCreateUpdateGoodsDateFrom" class="control-label"><spring:message code="frmGoodsPledgeGoodsDateFromLabel"/></label>
			<input type="text" data-display-name="When are the goods available from?" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmGoodsPledgeCreateUpdateGoodsDateFrom" 
			placeholder="<spring:message code="frmAccommodationPledgeAccommodationDateFromPlaceHolder"/>" 
			aria-describedby="frmGoodsPledgeCreateUpdateGoodsDateFromHelpBlock"  data-toggle="popover"/>
    
			<%-- <span id="frmGoodsPledgeCreateUpdateGoodsDateFromHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsDateFromHelpBlock"/></span> --%>
			<div id="frmGoodsPledgeCreateUpdateGoodsDateFromAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsDateFromAlertBlockText"></span>
			</div>		  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsDateToFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="accommodationpledge.accommodationdateto.label" for="frmGoodsPledgeCreateUpdateGoodsDateTo" class="control-label"><spring:message code="frmGoodsPledgeGoodsDateToLabel"/></label>
			<input type="text" data-display-name="When are the goods available until?" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmGoodsPledgeCreateUpdateGoodsDateTo" 
			placeholder="<spring:message code="frmAccommodationPledgeAccommodationDateFromPlaceHolder"/>"  
			aria-describedby="frmGoodsPledgeCreateUpdateGoodsDateToHelpBlock"  data-toggle="popover"/>

			<%-- <span id="frmGoodsPledgeCreateUpdateGoodsDateToHelpBlock" class="help-block">
			<spring:message code="frmGoodsPledgeGoodsDateToHelpBlock"/></span> --%>
			<div id="frmGoodsPledgeCreateUpdateGoodsDateToAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsDateToAlertBlockText"></span>
			</div>	  
		  </div>
			
			<div id="frmGoodsPledgeCreateUpdatePledgeStatusFormGroup"
						<sec:authorize access="hasRole('ROLE_ADMIN')">class="form-group has-feedback  ${status.error ? 'has-error' : ''}"</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_ADMIN')">class="hidden"</sec:authorize>
						>
						<label id="goodspledge.status.label"
							for="frmGoodsPledgeCreateUpdatePledgeStatus"
							class="control-label"><spring:message
								code="frmPledgeStatusLabel" /></label> 
								<select class="form-control js-status-select"
							id="frmGoodsPledgeStatusSelect" name="goodsPledgeStatus"
							data-select-type="standalone" data-required="true"
							style="width: 500px;"
							data-placeholder="<spring:message code="frmPledgeStatusPlaceHolder"/>">
					
						</select> <span id="frmGoodsPledgeCreateUpdatePledgeStatusCountBlock"
							class="help-block"></span>
						<div id="frmGoodsPledgeCreateUpdatePledgeStatusAlertBlock"
							class="alert alert-dismissible hidden" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<span id="frmGoodsPledgeCreateUpdatePledgeStatusAlertBlockText"></span>
						</div>
					</div>
		  
		  
		  
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmGoodsPledgeCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmGoodsPledgeCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label"><spring:message code="frmGoodsPledgeSaveButtonLabel"/></span></button>
      </div>
    </div>
  </div>
</div>
	
