

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${viewFormModel['new']}">
		<spring:message code="view.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="view.update.title" var="title"/>
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
	

	<spring:url value="/views" var="viewActionUrl" />
	
	<div class="well">
	<form:form id="frmView" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="viewFormModel" action="${viewActionUrl}">

		<form:hidden id="frmViewViewId" path="id" />
		
		<spring:bind path="viewName">
		  <div id="frmViewViewNameFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">View Name</label>
			<div class="col-sm-10">
				
				<form:input path="viewName" type="text" maxlength="50" class="form-control" id="frmViewViewName" placeholder="View Name"  />
    
				<span id="frmViewViewNameJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="viewName" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<div class="table-responsive">
			<table id="messageResourceTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
					<th>Message Key</th>

					<th>Locale</th>

					<th>Message</th>

					
					
					
					</tr>
				</thead>	
				<tbody id="messageResourceTableBody">
				</tbody>				   
			</table>
        </div>
      
		<spring:bind path="saveButton">
		  <div id="frmViewSaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmViewSaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmViewExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${viewFormModel['new']}">
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
	checkFocus(document.getElementById("frmView"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	var viewId = document.getElementById("frmViewViewId").value;
	var messageResourceTableBody = document.getElementById("messageResourceTableBody");
	
	if (viewId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/messageresource",
			data: {
			viewId: viewId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					
					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.messageKey);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.locale);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.message);
					cell.appendChild(cellText);
					row.appendChild(cell);
messageResourceTableBody.appendChild(row);
				});
			}
		});
	}

});


      var frmViewViewNameBuffer = document.getElementById("frmViewViewName").value;
      
      var frmViewSaveButtonBuffer = document.getElementById("frmViewSaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmViewExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmViewViewName").value != frmViewViewNameBuffer){
			document.getElementById("frmViewViewNameFormGroup").className += " has-error";
			replaceText(document.getElementById("frmViewViewNameJavascriptErrorDisplay"), "Previous Value: " + frmViewViewNameBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmViewViewName");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmViewSaveButton").value != frmViewSaveButtonBuffer){
			document.getElementById("frmViewSaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmViewSaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmViewSaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmViewSaveButton");
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
                		document.getElementById("frmView").method = "get";
                    	document.getElementById("frmView").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmView").method = "get";
			document.getElementById("frmView").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

