

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${addressFormModel['new']}">
		<spring:message code="address.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="address.update.title" var="title"/>
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
	

	<spring:url value="/addresss" var="addressActionUrl" />
	
	<spring:message code="address.country.select.unselected" var="unselectedCountry"/>
    
	<div class="well">
	<form:form id="frmAddress" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="addressFormModel" action="${addressActionUrl}">

		<form:hidden id="frmAddressAddressId" path="id" />
		
		<spring:bind path="addressOne">
		  <div id="frmAddressAddressOneFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address Line 1</label>
			<div class="col-sm-10">
				
				<form:input path="addressOne" type="text" maxlength="50" class="form-control" id="frmAddressAddressOne" placeholder="Address Line 1"  />
    
				<span id="frmAddressAddressOneJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="addressOne" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="addressTwo">
		  <div id="frmAddressAddressTwoFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Address Line 2</label>
			<div class="col-sm-10">
				
				<form:input path="addressTwo" type="text" maxlength="50" class="form-control" id="frmAddressAddressTwo" placeholder="Address Line 2"  />
    
				<span id="frmAddressAddressTwoJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="addressTwo" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="city">
		  <div id="frmAddressCityFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Town/Townland/City</label>
			<div class="col-sm-10">
				
				<form:input path="city" type="text" maxlength="50" class="form-control" id="frmAddressCity" placeholder="Town/Townland/City"  />
    
				<span id="frmAddressCityJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="city" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="stateProvinceRegion">
		  <div id="frmAddressStateProvinceRegionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">State/Province/Region</label>
			<div class="col-sm-10">
				
				<form:input path="stateProvinceRegion" type="text" maxlength="50" class="form-control" id="frmAddressStateProvinceRegion" placeholder="State/Province/Region"  />
    
				<span id="frmAddressStateProvinceRegionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="stateProvinceRegion" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="postCode">
		  <div id="frmAddressPostCodeFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Post Code</label>
			<div class="col-sm-10">
				
				<form:input path="postCode" type="text" maxlength="10" class="form-control" id="frmAddressPostCode" placeholder="Post Code"  />
    
				<span id="frmAddressPostCodeJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="postCode" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="country">
		  <div id="frmAddressCountryFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Country</label>
			<div class="col-sm-5">
					
				<form:select path="country" class="form-control" id="frmAddressCountry">
					<form:option value="-1" label="${unselectedCountry}" />
					<form:options items="${countryMap}" />
				</form:select>
    
				<span id="frmAddressCountryJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="country" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="saveButton">
		  <div id="frmAddressSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmAddressSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmAddressExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${addressFormModel['new']}">
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
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />
<script>

var rootContext = "${pageContext.request.contextPath}";

$( document ).ready(function() {
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmAddress"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

});


      var frmAddressAddressOneBuffer = document.getElementById("frmAddressAddressOne").value;
      
      var frmAddressAddressTwoBuffer = document.getElementById("frmAddressAddressTwo").value;
      
      var frmAddressCityBuffer = document.getElementById("frmAddressCity").value;
      
      var frmAddressStateProvinceRegionBuffer = document.getElementById("frmAddressStateProvinceRegion").value;
      
      var frmAddressPostCodeBuffer = document.getElementById("frmAddressPostCode").value;
      
      var frmAddressCountryBuffer = document.getElementById("frmAddressCountry").value;
      
      var frmAddressCountryTextBuffer = getSelectedText(document.getElementById("frmAddressCountry"));      
      
      var frmAddressSaveButtonBuffer = document.getElementById("frmAddressSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmAddressExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmAddressAddressOne").value != frmAddressAddressOneBuffer){
			document.getElementById("frmAddressAddressOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressAddressOneJavascriptErrorDisplay"), "Previous Value: " + frmAddressAddressOneBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressAddressOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressAddressTwo").value != frmAddressAddressTwoBuffer){
			document.getElementById("frmAddressAddressTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressAddressTwoJavascriptErrorDisplay"), "Previous Value: " + frmAddressAddressTwoBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressAddressTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressCity").value != frmAddressCityBuffer){
			document.getElementById("frmAddressCityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressCityJavascriptErrorDisplay"), "Previous Value: " + frmAddressCityBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressCity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressStateProvinceRegion").value != frmAddressStateProvinceRegionBuffer){
			document.getElementById("frmAddressStateProvinceRegionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressStateProvinceRegionJavascriptErrorDisplay"), "Previous Value: " + frmAddressStateProvinceRegionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressStateProvinceRegion");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressPostCode").value != frmAddressPostCodeBuffer){
			document.getElementById("frmAddressPostCodeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressPostCodeJavascriptErrorDisplay"), "Previous Value: " + frmAddressPostCodeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressPostCode");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressCountry").value != frmAddressCountryBuffer){
			document.getElementById("frmAddressCountryFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressCountryJavascriptErrorDisplay"), "Previous Value: " + frmAddressCountryTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressCountry");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressSaveButton").value != frmAddressSaveButtonBuffer){
			document.getElementById("frmAddressSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmAddressSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressSaveButton");
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
                		document.getElementById("frmAddress").method = "get";
                    	document.getElementById("frmAddress").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmAddress").method = "get";
			document.getElementById("frmAddress").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

