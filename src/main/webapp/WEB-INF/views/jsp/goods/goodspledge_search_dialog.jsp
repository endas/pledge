

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${goodsPledgeFormModel['new']}">
		<spring:message code="goodspledge.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="goodspledge.update.title" var="title"/>
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
	

	<spring:url value="/goodspledges" var="goodsPledgeActionUrl" />
	
	<spring:message code="goodspledge.goodscategoryone.select.unselected" var="unselectedGoodsCategoryOne"/>
    
	<spring:message code="goodspledge.goodscategorytwo.select.unselected" var="unselectedGoodsCategoryTwo"/>
    
	<spring:message code="goodspledge.goodscategorythree.select.unselected" var="unselectedGoodsCategoryThree"/>
    
	<spring:message code="goodspledge.goodssize.select.unselected" var="unselectedGoodsSize"/>
    
	<spring:message code="goodspledge.goodscondition.select.unselected" var="unselectedGoodsCondition"/>
    
	<spring:message code="goodspledge.goodsquantity.select.unselected" var="unselectedGoodsQuantity"/>
    
	<div class="well">
	<form:form id="frmGoodsPledge" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="goodsPledgeFormModel" action="${goodsPledgeActionUrl}">

		<form:hidden id="frmGoodsPledgeGoodsPledgeId" path="id" />
		
		<spring:bind path="goodsCategoryOne">
		  <div id="frmGoodsPledgeGoodsCategoryOneFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Goods Category One</label>
			<div class="col-sm-5">
					
				<form:select path="goodsCategoryOne" class="form-control" id="frmGoodsPledgeGoodsCategoryOne">
					<form:option value="-1" label="${unselectedGoodsCategoryOne}" />
					<form:options items="${goodsCategoryOneMap}" />
				</form:select>
    
				<span id="frmGoodsPledgeGoodsCategoryOneJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsCategoryOne" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="goodsCategoryTwo">
		  <div id="frmGoodsPledgeGoodsCategoryTwoFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Goods Category Two</label>
			<div class="col-sm-5">
					
				<form:select path="goodsCategoryTwo" class="form-control" id="frmGoodsPledgeGoodsCategoryTwo">
					<form:option value="-1" label="${unselectedGoodsCategoryTwo}" />
					<form:options items="${goodsCategoryTwoMap}" />
				</form:select>
    
				<span id="frmGoodsPledgeGoodsCategoryTwoJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsCategoryTwo" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="goodsCategoryThree">
		  <div id="frmGoodsPledgeGoodsCategoryThreeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Goods Category Three</label>
			<div class="col-sm-5">
					
				<form:select path="goodsCategoryThree" class="form-control" id="frmGoodsPledgeGoodsCategoryThree">
					<form:option value="-1" label="${unselectedGoodsCategoryThree}" />
					<form:options items="${goodsCategoryThreeMap}" />
				</form:select>
    
				<span id="frmGoodsPledgeGoodsCategoryThreeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsCategoryThree" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="goodsSize">
		  <div id="frmGoodsPledgeGoodsSizeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Size</label>
			<div class="col-sm-5">
					
				<form:select path="goodsSize" class="form-control" id="frmGoodsPledgeGoodsSize">
					<form:option value="-1" label="${unselectedGoodsSize}" />
					<form:options items="${goodsSizeMap}" />
				</form:select>
    
				<span id="frmGoodsPledgeGoodsSizeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsSize" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="goodsCondition">
		  <div id="frmGoodsPledgeGoodsConditionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Goods Condition</label>
			<div class="col-sm-5">
					
				<form:select path="goodsCondition" class="form-control" id="frmGoodsPledgeGoodsCondition">
					<form:option value="-1" label="${unselectedGoodsCondition}" />
					<form:options items="${goodsConditionMap}" />
				</form:select>
    
				<span id="frmGoodsPledgeGoodsConditionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsCondition" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="goodsQuantity">
		  <div id="frmGoodsPledgeGoodsQuantityFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Quantity</label>
			<div class="col-sm-5">
					
				<form:select path="goodsQuantity" class="form-control" id="frmGoodsPledgeGoodsQuantity">
					<form:option value="-1" label="${unselectedGoodsQuantity}" />
					<form:options items="${goodsQuantityMap}" />
				</form:select>
    
				<span id="frmGoodsPledgeGoodsQuantityJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsQuantity" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="additionalInformation">
		  <div id="frmGoodsPledgeAdditionalInformationFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Additional Information</label>
			<div class="col-sm-10">
				
				<form:textarea path="additionalInformation" rows="5" class="form-control" id="frmGoodsPledgeAdditionalInformation" placeholder="Additional Information" oninput="check_textarea_length(500, this, document.getElementById('frmGoodsPledgeAdditionalInformationJavascriptErrorDisplay'))"  />
    
				<span id="frmGoodsPledgeAdditionalInformationJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="additionalInformation" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="itemSize">
		  <div id="frmGoodsPledgeItemSizeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Package Size</label>
			<div class="col-sm-10">
				
				<form:input path="itemSize" type="text" maxlength="500" class="form-control" id="frmGoodsPledgeItemSize" placeholder="Package Size"  />
    
				<span id="frmGoodsPledgeItemSizeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="itemSize" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmGoodsPledgeSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmGoodsPledgeSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmGoodsPledgeExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${goodsPledgeFormModel['new']}">
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
	checkFocus(document.getElementById("frmGoodsPledge"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	// Display a count of the characters in the Additional Information textarea input
	check_textarea_length(500, document.getElementById("frmGoodsPledgeAdditionalInformation"), document.getElementById('frmGoodsPledgeAdditionalInformationJavascriptErrorDisplay'));
  
});


      var frmGoodsPledgeGoodsCategoryOneBuffer = document.getElementById("frmGoodsPledgeGoodsCategoryOne").value;
      
      var frmGoodsPledgeGoodsCategoryOneTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsCategoryOne"));      
      
      var frmGoodsPledgeGoodsCategoryTwoBuffer = document.getElementById("frmGoodsPledgeGoodsCategoryTwo").value;
      
      var frmGoodsPledgeGoodsCategoryTwoTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsCategoryTwo"));      
      
      var frmGoodsPledgeGoodsCategoryThreeBuffer = document.getElementById("frmGoodsPledgeGoodsCategoryThree").value;
      
      var frmGoodsPledgeGoodsCategoryThreeTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsCategoryThree"));      
      
      var frmGoodsPledgeGoodsSizeBuffer = document.getElementById("frmGoodsPledgeGoodsSize").value;
      
      var frmGoodsPledgeGoodsSizeTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsSize"));      
      
      var frmGoodsPledgeGoodsConditionBuffer = document.getElementById("frmGoodsPledgeGoodsCondition").value;
      
      var frmGoodsPledgeGoodsConditionTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsCondition"));      
      
      var frmGoodsPledgeGoodsQuantityBuffer = document.getElementById("frmGoodsPledgeGoodsQuantity").value;
      
      var frmGoodsPledgeGoodsQuantityTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsQuantity"));      
      
      var frmGoodsPledgeAdditionalInformationBuffer = document.getElementById("frmGoodsPledgeAdditionalInformation").value;
      
      var frmGoodsPledgeItemSizeBuffer = document.getElementById("frmGoodsPledgeItemSize").value;
      
      var frmGoodsPledgeSaveButtonBuffer = document.getElementById("frmGoodsPledgeSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmGoodsPledgeExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmGoodsPledgeGoodsCategoryOne").value != frmGoodsPledgeGoodsCategoryOneBuffer){
			document.getElementById("frmGoodsPledgeGoodsCategoryOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsCategoryOneJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsCategoryOneTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsCategoryOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeGoodsCategoryTwo").value != frmGoodsPledgeGoodsCategoryTwoBuffer){
			document.getElementById("frmGoodsPledgeGoodsCategoryTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsCategoryTwoJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsCategoryTwoTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsCategoryTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeGoodsCategoryThree").value != frmGoodsPledgeGoodsCategoryThreeBuffer){
			document.getElementById("frmGoodsPledgeGoodsCategoryThreeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsCategoryThreeJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsCategoryThreeTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsCategoryThree");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeGoodsSize").value != frmGoodsPledgeGoodsSizeBuffer){
			document.getElementById("frmGoodsPledgeGoodsSizeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsSizeJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsSizeTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsSize");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeGoodsCondition").value != frmGoodsPledgeGoodsConditionBuffer){
			document.getElementById("frmGoodsPledgeGoodsConditionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsConditionJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsConditionTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsCondition");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeGoodsQuantity").value != frmGoodsPledgeGoodsQuantityBuffer){
			document.getElementById("frmGoodsPledgeGoodsQuantityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsQuantityJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsQuantityTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsQuantity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeAdditionalInformation").value != frmGoodsPledgeAdditionalInformationBuffer){
			document.getElementById("frmGoodsPledgeAdditionalInformationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeAdditionalInformationJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeAdditionalInformationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeAdditionalInformation");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeItemSize").value != frmGoodsPledgeItemSizeBuffer){
			document.getElementById("frmGoodsPledgeItemSizeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeItemSizeJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeItemSizeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeItemSize");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeSaveButton").value != frmGoodsPledgeSaveButtonBuffer){
			document.getElementById("frmGoodsPledgeSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeSaveButton");
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
                		document.getElementById("frmGoodsPledge").method = "get";
                    	document.getElementById("frmGoodsPledge").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmGoodsPledge").method = "get";
			document.getElementById("frmGoodsPledge").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

