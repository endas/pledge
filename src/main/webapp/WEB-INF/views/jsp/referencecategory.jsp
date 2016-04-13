<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${referenceCategoryFormModel['currentMode'] == 'ADD'}">
		<spring:message code="referencecategory.form.header" var="headerText"/>
	</c:when>
	<c:when test="${referenceCategoryFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="referencecategory.form.header" var="headerText"/>
	</c:when>
	<c:when test="${referenceCategoryFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="referencecategory.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="referencecategory.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="referencecategory.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="referenceCategory" />
</jsp:include>
<body>

<jsp:include page="../jsp/reference_create_update_dialog.jsp"/>

<spring:url value="/landingwebpage" var="urlHome"/>
<spring:url value="/entitylist" var="urlAppHome"/>
<spring:url value="/resources/images/redcross-brand-logo.png" var="headerLogo" />
    <nav class="navbar navbar-fixed-top navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${urlHome}"><img src="${headerLogo}" alt="Irish Red Cross"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${urlAppHome}">App Home</a></li>
            <li><a href="javascript:logoutFormSubmit()">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
	
	<spring:url value="/referencecategory/post" var="referenceCategoryActionUrl" />
	  
	<form:form id="frmReferenceCategory" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="referenceCategoryFormModel" action="${referenceCategoryActionUrl}">

		<form:hidden id="frmReferenceCategoryReferenceCategoryId" path="id" />
		
		<form:hidden id="frmReferenceCategoryMode" path="currentMode" />
		
		<input type="hidden" id="frmReferenceCategoryLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmReferenceCategoryLoadedFeedbackCss" value="${css}" />
    
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="referencecategory.form.panel.referencecategoryinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		<spring:bind path="referenceCategoryDesc">
      
		  <div id="frmReferenceCategoryReferenceCategoryDescFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceCategoryReferenceCategoryDescLabel" for="frmReferenceCategoryReferenceCategoryDesc" class="col-sm-2 control-label"><spring:message code="frmReferenceCategoryReferenceCategoryDescLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceCategoryReferenceCategoryDescPlaceHolder" var="frmReferenceCategoryReferenceCategoryDescPlaceHolder"/>    
    
				<form:input path="referenceCategoryDesc" type="text" data-display-name="Reference Category" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmReferenceCategoryReferenceCategoryDesc" placeholder="${frmReferenceCategoryReferenceCategoryDescPlaceHolder}" aria-describedby="frmReferenceCategoryReferenceCategoryDescHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmReferenceCategoryReferenceCategoryDescFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceCategoryReferenceCategoryDescAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceCategoryReferenceCategoryDescAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceCategoryReferenceCategoryDescHelpBlock" path="referenceCategoryDesc" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceCategoryReferenceCategoryDescHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmReferenceCategoryReferenceCategoryDescHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="parentCategoryId">
      
		  <div id="frmReferenceCategoryParentCategoryIdFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceCategoryParentCategoryIdLabel" for="frmReferenceCategoryParentCategoryId" class="col-sm-2 control-label"><spring:message code="frmReferenceCategoryParentCategoryIdLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceCategoryParentCategoryIdPlaceHolder" var="frmReferenceCategoryParentCategoryIdPlaceHolder"/>    
    
				<form:input path="parentCategoryId" type="text" data-display-name="Parent Category Id" data-minlength="5" data-required="false" maxlength="10" class="form-control" id="frmReferenceCategoryParentCategoryId" placeholder="${frmReferenceCategoryParentCategoryIdPlaceHolder}" aria-describedby="frmReferenceCategoryParentCategoryIdHelpBlock" data-data-type="long" data-validate-key-press="true" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceCategoryParentCategoryIdJavascriptErrorDisplay'), 'The value that you attempted to paste into Parent Category Id can only contain digits 0-9', 'Valid')" />
    
				<span id="frmReferenceCategoryParentCategoryIdFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceCategoryParentCategoryIdAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceCategoryParentCategoryIdAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceCategoryParentCategoryIdHelpBlock" path="parentCategoryId" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceCategoryParentCategoryIdHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmReferenceCategoryParentCategoryIdHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="description">
      
		  <div id="frmReferenceCategoryDescriptionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceCategoryDescriptionLabel" for="frmReferenceCategoryDescription" class="col-sm-2 control-label"><spring:message code="frmReferenceCategoryDescriptionLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceCategoryDescriptionPlaceHolder" var="frmReferenceCategoryDescriptionPlaceHolder"/>    
    
				<form:textarea path="description" data-display-name="Long Description" data-minlength="5" data-required="false" rows="5" maxlength="200" class="form-control" id="frmReferenceCategoryDescription" placeholder="${frmReferenceCategoryDescriptionPlaceHolder}" aria-describedby="frmReferenceCategoryDescriptionHelpBlock" data-validate-key-press="true" />
    
				<span id="frmReferenceCategoryDescriptionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceCategoryDescriptionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceCategoryDescriptionAlertBlockText"></span>
				</div>
			</div>
				<span id="frmReferenceCategoryDescriptionCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceCategoryDescriptionHelpBlock" path="description" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceCategoryDescriptionHelpBlock" class="help-block col-sm-9"><spring:message code="frmReferenceCategoryDescriptionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
				<div class="form-group">
				  <div class="col-sm-12">
					
        		<button type="button" id="frmReferenceCategoryReferencesAddNewButton" class="btn btn-primary pull-left btn-primary-custom" data-toggle="modal" data-backdrop="static" data-target="#referenceCreateUpdateModal" data-association-type="many-to-many" data-callback-display-type="table" data-id=null data-invalid-parent-id-message="You must save the Reference Categories before you can add Reference" data-modal-title="Add Reference" data-callback-table-body-id="referencesTableBody" data-property-url="references" >Add Reference</button>
      
				  </div>
				</div>        
        
				<div class="table-responsive">
					<table id="referencesTable" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							<th>Action</th>
							
					<th><spring:message code="frmReferenceRefTypeLabel"/></th>

					<th><spring:message code="frmReferenceRefDescLabel"/></th>

					<th><spring:message code="frmReferenceDescriptionLabel"/></th>

							</tr>
						</thead>	
						<tbody id="referencesTableBody">
						</tbody>				   
					</table>
		        </div> <!-- class="table-responsive" -->
          
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmReferenceCategorySaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/referenceCategoryJs.js" var="referenceCategoryJs" />
  
<script src="${referenceCategoryJs}"></script>

</body>
</html>

