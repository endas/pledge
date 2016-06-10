<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><div class="modal fade" id="goodsPledgeCreateUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
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
		  
		  <div id="frmGoodsPledgeCreateUpdatePledgedGoodsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.pledgedgoods.label" for="frmGoodsPledgeCreateUpdatePledgedGoods" class="control-label"><spring:message code="frmGoodsPledgePledgedGoodsLabel"/></label>
      <div class="well">
			<select class="form-control parent-select" data-display-name="Type of Goods" data-select-type="parent" data-required="false" id="frmGoodsPledgeCreateUpdatePledgedGoodsGoodsCategory" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeCreateUpdatePledgedGoods'), frmGoodsPledgeCreateUpdatePledgedGoodsValueBuffer, 'Goods', '<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder"/>')">
			</select>
      	
			<select class="form-control" data-display-name="Type of Goods" data-select-type="child" data-required="false" id="frmGoodsPledgeCreateUpdatePledgedGoods" aria-describedby="frmGoodsPledgeCreateUpdatePledgedGoodsHelpBlock">
			</select>
	  
	  </div> <!-- class="well" -->	  
	  
			<span id="frmGoodsPledgeCreateUpdatePledgedGoodsHelpBlock" class="help-block"><spring:message code="frmGoodsPledgePledgedGoodsHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdatePledgedGoodsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdatePledgedGoodsAlertBlockText"></span>
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
  
		  <div id="frmGoodsPledgeCreateUpdateGoodsConditionFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.goodscondition.label" for="frmGoodsPledgeCreateUpdateGoodsCondition" class="control-label"><spring:message code="frmGoodsPledgeGoodsConditionLabel"/></label>	
			<select class="form-control" data-display-name="Condition" data-select-type="standalone" data-required="false" id="frmGoodsPledgeCreateUpdateGoodsCondition" aria-describedby="frmGoodsPledgeCreateUpdateGoodsConditionHelpBlock">
			</select>
	  
			<span id="frmGoodsPledgeCreateUpdateGoodsConditionHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeGoodsConditionHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateGoodsConditionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateGoodsConditionAlertBlockText"></span>
			</div>
			
			
			
			
			
			
				  
		  </div>
  
		  <div id="frmGoodsPledgeCreateUpdateNumberOfItemsFormGroup" class="form-group has-feedback  ${status.error ? 'has-error' : ''}">
			<label id="goodspledge.numberofitems.label" for="frmGoodsPledgeCreateUpdateNumberOfItems" class="control-label"><spring:message code="frmGoodsPledgeNumberOfItemsLabel"/></label>
			<input type="text" data-display-name="Number of Items of this type" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmGoodsPledgeCreateUpdateNumberOfItems" placeholder="<spring:message code="frmGoodsPledgeNumberOfItemsPlaceHolder"/>" aria-describedby="frmGoodsPledgeCreateUpdateNumberOfItemsHelpBlock" data-data-type="long" data-validate-key-press="true" data-toggle="popover" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmGoodsPledgeCreateUpdateNumberOfItemsHelpBlock'), 'The value that you attempted to paste into Number of Items of this type can only contain digits 0-9', 'Valid')" />
    
			<span id="frmGoodsPledgeCreateUpdateNumberOfItemsHelpBlock" class="help-block"><spring:message code="frmGoodsPledgeNumberOfItemsHelpBlock"/></span>
			<div id="frmGoodsPledgeCreateUpdateNumberOfItemsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  				<span id="frmGoodsPledgeCreateUpdateNumberOfItemsAlertBlockText"></span>
			</div>
				  
		  </div>
  
		

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="frmGoodsPledgeCreateUpdateCloseButton" class="btn btn-default">Close</button>
        <button type="button" id="frmGoodsPledgeCreateUpdateSubmitButton" class="btn btn-primary ladda-button" data-style="expand-left" data-spinner-size="35"><span class="ladda-label">Save Pledge</span></button>
      </div>
    </div>
  </div>
</div>
	
