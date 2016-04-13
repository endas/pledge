

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
	

	<spring:url value="/goodspledges" var="goodsPledgeActionUrl" />
	
	<spring:message code="goodspledge.pledgedgoods.goodscategory.select.unselected" var="unselectedPledgedGoodsGoodsCategory"/>
    
	<spring:message code="goodspledge.pledgedgoods.select.unselected" var="unselectedPledgedGoods"/>
    
	<spring:message code="goodspledge.goodscondition.select.unselected" var="unselectedGoodsCondition"/>
    
	<div class="well">
	<form:form id="frmGoodsPledge" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="goodsPledgeFormModel" action="${goodsPledgeActionUrl}">

		<form:hidden id="frmGoodsPledgeGoodsPledgeId" path="id" />
		
		<spring:bind path="pledgedGoods">
		  <div id="frmGoodsPledgePledgedGoodsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Type of Goods</label>
			<div class="col-sm-5">
				
				<form:select path="pledgedGoodsGoodsCategory" class="form-control" id="frmGoodsPledgePledgedGoodsGoodsCategory">
					<form:option value="-1" label="${unselectedPledgedGoodsGoodsCategory}" />
					<form:options items="${pledgedGoodsGoodsCategoryMap}" />
				</form:select>
      	
				<form:select path="pledgedGoods" class="form-control" id="frmGoodsPledgePledgedGoods">
					<form:option value="-1" label="${unselectedPledgedGoods}" />
					<form:options items="${pledgedGoodsMap}" />
				</form:select>
    
				<span id="frmGoodsPledgePledgedGoodsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="pledgedGoods" class="control-label" />
				  
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
      
		<spring:bind path="goodsCondition">
		  <div id="frmGoodsPledgeGoodsConditionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Condition</label>
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
      
		<spring:bind path="numberOfItems">
		  <div id="frmGoodsPledgeNumberOfItemsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Number of Items of this type</label>
			<div class="col-sm-10">
				
				<form:input path="numberOfItems" type="text" maxlength="10" class="form-control" id="frmGoodsPledgeNumberOfItems" placeholder="Number of Items of this type"  onkeypress="return checkIntegerKeyPressAndRenderErrorMessage(event, this, document.getElementById('frmGoodsPledgeNumberOfItemsJavascriptErrorDisplay'), document.getElementById('frmGoodsPledgeNumberOfItemsFormGroup'), 'The Number of Items of this type can only accept digits 0-9', 'has-error', 'Valid', false)"  onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmGoodsPledgeNumberOfItemsJavascriptErrorDisplay'), 'The value that you attempted to paste into Number of Items of this type can only contain digits 0-9', 'Valid')"  />
    
				<span id="frmGoodsPledgeNumberOfItemsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="numberOfItems" class="control-label" />
				  
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
<jsp:include page="../jsp/includes/footer.jsp" />
<script>

var rootContext = "${pageContext.request.contextPath}";

$( document ).ready(function() {
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmGoodsPledge"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

    <!-- Initalise handling for the frmGoodsPledgePledgedGoods and frmGoodsPledgePledgedGoodsGoodsCategory interactions -->
	$( "#frmGoodsPledgePledgedGoodsGoodsCategory").change(function(){
		document.getElementById("frmGoodsPledgePledgedGoods").options.selectedIndex = 0;
		var parentSelect = document.getElementById("frmGoodsPledgePledgedGoodsGoodsCategory");
		var parentSelectValue = parentSelect.options[parentSelect.selectedIndex].value;		

		$.ajax({
			dataType: "json",
			url: rootContext + "/referenceslist",
			data: {
			parentid: parentSelectValue,
			referencetype: "Goods"
			},
			success: function( data ) {
				$("#frmGoodsPledgePledgedGoods").html('');
				var unselectedOption = document.createElement("option");
				unselectedOption.value = -1;
				unselectedOption.textContent = "Select Type of Goods";
				document.getElementById("frmGoodsPledgePledgedGoods").appendChild(unselectedOption);

				$.each( data, function( key, val ) {
					var el = document.createElement("option");
    				el.textContent = val;
					el.value = key;
					
					if (key == frmGoodsPledgePledgedGoodsBuffer){
						el.selected = true;
					}

    				document.getElementById("frmGoodsPledgePledgedGoods").appendChild(el);
				});
			}
		});
	});
    
	
  
  
	// Display a count of the characters in the Additional Information textarea input
	check_textarea_length(500, document.getElementById("frmGoodsPledgeAdditionalInformation"), document.getElementById('frmGoodsPledgeAdditionalInformationJavascriptErrorDisplay'));
  
});


      var frmGoodsPledgePledgedGoodsBuffer = document.getElementById("frmGoodsPledgePledgedGoods").value;
      
      var frmGoodsPledgePledgedGoodsTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgePledgedGoods"));      
      
      var frmGoodsPledgeAdditionalInformationBuffer = document.getElementById("frmGoodsPledgeAdditionalInformation").value;
      
      var frmGoodsPledgeItemSizeBuffer = document.getElementById("frmGoodsPledgeItemSize").value;
      
      var frmGoodsPledgeGoodsConditionBuffer = document.getElementById("frmGoodsPledgeGoodsCondition").value;
      
      var frmGoodsPledgeGoodsConditionTextBuffer = getSelectedText(document.getElementById("frmGoodsPledgeGoodsCondition"));      
      
      var frmGoodsPledgeNumberOfItemsBuffer = document.getElementById("frmGoodsPledgeNumberOfItems").value;
      
      var frmGoodsPledgeSaveButtonBuffer = document.getElementById("frmGoodsPledgeSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmGoodsPledgeExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmGoodsPledgePledgedGoods").value != frmGoodsPledgePledgedGoodsBuffer){
			document.getElementById("frmGoodsPledgePledgedGoodsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgePledgedGoodsJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgePledgedGoodsTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgePledgedGoods");
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
	
		if (document.getElementById("frmGoodsPledgeGoodsCondition").value != frmGoodsPledgeGoodsConditionBuffer){
			document.getElementById("frmGoodsPledgeGoodsConditionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeGoodsConditionJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeGoodsConditionTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeGoodsCondition");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmGoodsPledgeNumberOfItems").value != frmGoodsPledgeNumberOfItemsBuffer){
			document.getElementById("frmGoodsPledgeNumberOfItemsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmGoodsPledgeNumberOfItemsJavascriptErrorDisplay"), "Previous Value: " + frmGoodsPledgeNumberOfItemsBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmGoodsPledgeNumberOfItems");
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

