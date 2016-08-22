

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${registerOfPledgesFormModel['new']}">
		<spring:message code="registerofpledges.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="registerofpledges.update.title" var="title"/>
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
	

	<spring:url value="/registerofpledgess" var="registerOfPledgesActionUrl" />
	
	<div class="well">
	<form:form id="frmRegisterOfPledges" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="registerOfPledgesFormModel" action="${registerOfPledgesActionUrl}">

		<form:hidden id="frmRegisterOfPledgesRegisterOfPledgesId" path="id" />
		
		<spring:bind path="contactInformationInstructions">
		  <div id="frmRegisterOfPledgesContactInformationInstructionsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-10">
				
				<span id="frmRegisterOfPledgesContactInformationInstructionsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="contactInformationInstructions" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="applicationUserDetails">
		  <div id="frmRegisterOfPledgesApplicationUserDetailsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">ABOUT YOU</label>
			<div class="col-sm-10">
				
				<span id="frmRegisterOfPledgesApplicationUserDetailsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="applicationUserDetails" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="accommodationPledgeInstructions">
		  <div id="frmRegisterOfPledgesAccommodationPledgeInstructionsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-10">
				
				<span id="frmRegisterOfPledgesAccommodationPledgeInstructionsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="accommodationPledgeInstructions" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<div class="table-responsive">
			<table id="accommodationPledgesTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
					<th>What kind of accommodation are you pledging?</th>

					<th>Condition</th>

					<th>Number of beds</th>

					<th>Vacant or Shared</th>

					<th>Who can you accommodate?</th>

					<th>When is the accommodation available from?</th>

					<th>When is the accommodation available until?</th>

					
					
					
					</tr>
				</thead>	
				<tbody id="accommodationPledgesTableBody">
				</tbody>				   
			</table>
        </div>
      
		<spring:bind path="servicePledgeInstructions">
		  <div id="frmRegisterOfPledgesServicePledgeInstructionsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">About Netgrain Systems</label>
			<div class="col-sm-10">
				
				<span id="frmRegisterOfPledgesServicePledgeInstructionsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="servicePledgeInstructions" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<div class="table-responsive">
			<table id="servicePledgesTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
					<th>Date Available for Use</th>

					<th>Your Service</th>

					<th></th>

					<th></th>

					<th>Qualification to provide Service</th>

					<th>Additional Information</th>

					
					
					
					</tr>
				</thead>	
				<tbody id="servicePledgesTableBody">
				</tbody>				   
			</table>
        </div>
      
		<spring:bind path="goodsPledgeInstructions">
		  <div id="frmRegisterOfPledgesGoodsPledgeInstructionsFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">About Netgrain Systems</label>
			<div class="col-sm-10">
				
				<span id="frmRegisterOfPledgesGoodsPledgeInstructionsJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="goodsPledgeInstructions" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<div class="table-responsive">
			<table id="goodsPledgesTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
					<th>Additional Information</th>

					<th>Package Size</th>

					<th>Number of Items of this type</th>

					
					
					
					</tr>
				</thead>	
				<tbody id="goodsPledgesTableBody">
				</tbody>				   
			</table>
        </div>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmRegisterOfPledgesExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${registerOfPledgesFormModel['new']}">
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
	checkFocus(document.getElementById("frmRegisterOfPledges"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	var registerOfPledgesId = document.getElementById("frmRegisterOfPledgesRegisterOfPledgesId").value;
	var accommodationPledgesTableBody = document.getElementById("accommodationPledgesTableBody");
	
	if (registerOfPledgesId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/accommodationpledge",
			data: {
			registerOfPledgesId: registerOfPledgesId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					
					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.accommodationType);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.accommodationCondition);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.numberOfBeds);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.vacantOrShared);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.canYouAccommodate);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.accommodationDateFrom);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.accommodationDateTo);
					cell.appendChild(cellText);
					row.appendChild(cell);
accommodationPledgesTableBody.appendChild(row);
				});
			}
		});
	}

	var registerOfPledgesId = document.getElementById("frmRegisterOfPledgesRegisterOfPledgesId").value;
	var servicePledgesTableBody = document.getElementById("servicePledgesTableBody");
	
	if (registerOfPledgesId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/servicepledge",
			data: {
			registerOfPledgesId: registerOfPledgesId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					
					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.pledgeServiceDateAvailable);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.pledgeServiceLevelOne);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.pledgeServiceLevelTwo);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.pledgeServiceLevelThree);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.pledgeServiceQualification);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.additionalInformation);
					cell.appendChild(cellText);
					row.appendChild(cell);
servicePledgesTableBody.appendChild(row);
				});
			}
		});
	}

	var registerOfPledgesId = document.getElementById("frmRegisterOfPledgesRegisterOfPledgesId").value;
	var goodsPledgesTableBody = document.getElementById("goodsPledgesTableBody");
	
	if (registerOfPledgesId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/goodspledge",
			data: {
			registerOfPledgesId: registerOfPledgesId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					
					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.additionalInformation);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.itemSize);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.numberOfItems);
					cell.appendChild(cellText);
					row.appendChild(cell);
goodsPledgesTableBody.appendChild(row);
				});
			}
		});
	}

});


      var frmRegisterOfPledgesContactInformationInstructionsBuffer = document.getElementById("frmRegisterOfPledgesContactInformationInstructions").value;
      
      var frmRegisterOfPledgesAccommodationPledgeInstructionsBuffer = document.getElementById("frmRegisterOfPledgesAccommodationPledgeInstructions").value;
      
      var frmRegisterOfPledgesServicePledgeInstructionsBuffer = document.getElementById("frmRegisterOfPledgesServicePledgeInstructions").value;
      
      var frmRegisterOfPledgesGoodsPledgeInstructionsBuffer = document.getElementById("frmRegisterOfPledgesGoodsPledgeInstructions").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmRegisterOfPledgesExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmRegisterOfPledgesContactInformationInstructions").value != frmRegisterOfPledgesContactInformationInstructionsBuffer){
			document.getElementById("frmRegisterOfPledgesContactInformationInstructionsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmRegisterOfPledgesContactInformationInstructionsJavascriptErrorDisplay"), "Previous Value: " + frmRegisterOfPledgesContactInformationInstructionsBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmRegisterOfPledgesContactInformationInstructions");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmRegisterOfPledgesAccommodationPledgeInstructions").value != frmRegisterOfPledgesAccommodationPledgeInstructionsBuffer){
			document.getElementById("frmRegisterOfPledgesAccommodationPledgeInstructionsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmRegisterOfPledgesAccommodationPledgeInstructionsJavascriptErrorDisplay"), "Previous Value: " + frmRegisterOfPledgesAccommodationPledgeInstructionsBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmRegisterOfPledgesAccommodationPledgeInstructions");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmRegisterOfPledgesServicePledgeInstructions").value != frmRegisterOfPledgesServicePledgeInstructionsBuffer){
			document.getElementById("frmRegisterOfPledgesServicePledgeInstructionsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmRegisterOfPledgesServicePledgeInstructionsJavascriptErrorDisplay"), "Previous Value: " + frmRegisterOfPledgesServicePledgeInstructionsBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmRegisterOfPledgesServicePledgeInstructions");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmRegisterOfPledgesGoodsPledgeInstructions").value != frmRegisterOfPledgesGoodsPledgeInstructionsBuffer){
			document.getElementById("frmRegisterOfPledgesGoodsPledgeInstructionsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmRegisterOfPledgesGoodsPledgeInstructionsJavascriptErrorDisplay"), "Previous Value: " + frmRegisterOfPledgesGoodsPledgeInstructionsBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmRegisterOfPledgesGoodsPledgeInstructions");
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
                		document.getElementById("frmRegisterOfPledges").method = "get";
                    	document.getElementById("frmRegisterOfPledges").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmRegisterOfPledges").method = "get";
			document.getElementById("frmRegisterOfPledges").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

