

<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<c:choose>
	<c:when test="${referenceCategoryFormModel['new']}">
		<spring:message code="referencecategory.add.title" var="title"/>
	</c:when>
	<c:otherwise>
		<spring:message code="referencecategory.update.title" var="title"/>
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
	

	<spring:url value="/referencecategorys" var="referenceCategoryActionUrl" />
	
	<div class="well">
	<form:form id="frmReferenceCategory" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="referenceCategoryFormModel" action="${referenceCategoryActionUrl}">

		<form:hidden id="frmReferenceCategoryReferenceCategoryId" path="id" />
		
		<spring:bind path="referenceCategoryDesc">
		  <div id="frmReferenceCategoryReferenceCategoryDescFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Reference Category</label>
			<div class="col-sm-10">
				
				<form:input path="referenceCategoryDesc" type="text" maxlength="50" class="form-control" id="frmReferenceCategoryReferenceCategoryDesc" placeholder="Reference Category"  />
    
				<span id="frmReferenceCategoryReferenceCategoryDescJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="referenceCategoryDesc" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="parentCategoryId">
		  <div id="frmReferenceCategoryParentCategoryIdFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Parent Category Id</label>
			<div class="col-sm-10">
				
				<form:input path="parentCategoryId" type="text" maxlength="10" class="form-control" id="frmReferenceCategoryParentCategoryId" placeholder="Parent Category Id"  onkeypress="return checkIntegerKeyPressAndRenderErrorMessage(event, this, document.getElementById('frmReferenceCategoryParentCategoryIdJavascriptErrorDisplay'), document.getElementById('frmReferenceCategoryParentCategoryIdFormGroup'), 'The Parent Category Id can only accept digits 0-9', 'has-error', 'Valid', false)"  onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceCategoryParentCategoryIdJavascriptErrorDisplay'), 'The value that you attempted to paste into Parent Category Id can only contain digits 0-9', 'Valid')"  />
    
				<span id="frmReferenceCategoryParentCategoryIdJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="parentCategoryId" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<spring:bind path="description">
		  <div id="frmReferenceCategoryDescriptionFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Long Description</label>
			<div class="col-sm-10">
				
				<form:textarea path="description" rows="5" class="form-control" id="frmReferenceCategoryDescription" placeholder="Long Description" oninput="check_textarea_length(200, this, document.getElementById('frmReferenceCategoryDescriptionJavascriptErrorDisplay'))"  />
    
				<span id="frmReferenceCategoryDescriptionJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="description" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		<div class="table-responsive">
			<table id="referencesTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
					<th>Reference Type</th>

					<th>Reference Description</th>

					<th>Long Description</th>

					
					
					
					</tr>
				</thead>	
				<tbody id="referencesTableBody">
				</tbody>				   
			</table>
        </div>
      
		<spring:bind path="saveButton">
		  <div id="frmReferenceCategorySaveButtonFormGroup" class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Save</label>
			<div class="col-sm-10">
				
				<span id="frmReferenceCategorySaveButtonJavascriptErrorDisplay" class="control-label"> </span>				  
				<form:errors path="saveButton" class="control-label" />
				  
			</div>
		  </div>
		</spring:bind>
      
		
		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			     <button type="submit" formmethod="get" onclick="return frmReferenceCategoryExitButtonClicked();" class="btn-lg btn-primary pull-right">Cancel</button>		  
			<c:choose>
			  <c:when test="${referenceCategoryFormModel['new']}">
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
	checkFocus(document.getElementById("frmReferenceCategory"));
	

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker()

	// Display a count of the characters in the Long Description textarea input
	check_textarea_length(200, document.getElementById("frmReferenceCategoryDescription"), document.getElementById('frmReferenceCategoryDescriptionJavascriptErrorDisplay'));
  
	var referenceCategoryId = document.getElementById("frmReferenceCategoryReferenceCategoryId").value;
	var referencesTableBody = document.getElementById("referencesTableBody");
	
	if (referenceCategoryId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/reference",
			data: {
			referenceCategoryId: referenceCategoryId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					
					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.refType);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.refDesc);
					cell.appendChild(cellText);
					row.appendChild(cell);

					var cell = document.createElement("td");
					var cellText = document.createTextNode(obj.description);
					cell.appendChild(cellText);
					row.appendChild(cell);
referencesTableBody.appendChild(row);
				});
			}
		});
	}

});


      var frmReferenceCategoryReferenceCategoryDescBuffer = document.getElementById("frmReferenceCategoryReferenceCategoryDesc").value;
      
      var frmReferenceCategoryParentCategoryIdBuffer = document.getElementById("frmReferenceCategoryParentCategoryId").value;
      
      var frmReferenceCategoryDescriptionBuffer = document.getElementById("frmReferenceCategoryDescription").value;
      
      var frmReferenceCategorySaveButtonBuffer = document.getElementById("frmReferenceCategorySaveButton").value;
      
	/**
	 * Called when the exitButton is clicked
	 */
	function frmReferenceCategoryExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmReferenceCategoryReferenceCategoryDesc").value != frmReferenceCategoryReferenceCategoryDescBuffer){
			document.getElementById("frmReferenceCategoryReferenceCategoryDescFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategoryReferenceCategoryDescJavascriptErrorDisplay"), "Previous Value: " + frmReferenceCategoryReferenceCategoryDescBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategoryReferenceCategoryDesc");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceCategoryParentCategoryId").value != frmReferenceCategoryParentCategoryIdBuffer){
			document.getElementById("frmReferenceCategoryParentCategoryIdFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategoryParentCategoryIdJavascriptErrorDisplay"), "Previous Value: " + frmReferenceCategoryParentCategoryIdBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategoryParentCategoryId");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceCategoryDescription").value != frmReferenceCategoryDescriptionBuffer){
			document.getElementById("frmReferenceCategoryDescriptionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategoryDescriptionJavascriptErrorDisplay"), "Previous Value: " + frmReferenceCategoryDescriptionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategoryDescription");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceCategorySaveButton").value != frmReferenceCategorySaveButtonBuffer){
			document.getElementById("frmReferenceCategorySaveButtonFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategorySaveButtonJavascriptErrorDisplay"), "Previous Value: " + frmReferenceCategorySaveButtonBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategorySaveButton");
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
                		document.getElementById("frmReferenceCategory").method = "get";
                    	document.getElementById("frmReferenceCategory").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmReferenceCategory").method = "get";
			document.getElementById("frmReferenceCategory").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}



</script>
</body>
</html>

