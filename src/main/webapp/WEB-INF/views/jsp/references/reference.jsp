<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${referenceFormModel['currentMode'] == 'ADD'}">
		<spring:message code="reference.form.header" var="headerText"/>
	</c:when>
	<c:when test="${referenceFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="reference.form.header" var="headerText"/>
	</c:when>
	<c:when test="${referenceFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="reference.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="reference.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="reference.form.title" var="title"/>	
<jsp:include page="../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="reference" />
</jsp:include>
<body>

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
	
	<spring:url value="/reference/post" var="referenceActionUrl" />
	  
	<form:form id="frmReference" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="referenceFormModel" action="${referenceActionUrl}">

		<form:hidden id="frmReferenceReferenceId" path="id" />
		
		<form:hidden id="frmReferenceMode" path="currentMode" />
		
		<input type="hidden" id="frmReferenceLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmReferenceLoadedFeedbackCss" value="${css}" />
    
    
    <section id="referenceFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="reference.form.pageheader.referenceformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="referenceFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="reference.form.panel.referenceinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		<spring:bind path="refType">
      
		  <div id="frmReferenceRefTypeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceRefTypeLabel" for="frmReferenceRefType" class="col-sm-2 control-label"><spring:message code="frmReferenceRefTypeLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceRefTypePlaceHolder" var="frmReferenceRefTypePlaceHolder"/>    
    
				<form:input path="refType" type="text" data-display-name="Reference Type" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmReferenceRefType" placeholder="${frmReferenceRefTypePlaceHolder}" aria-describedby="frmReferenceRefTypeHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmReferenceRefTypeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceRefTypeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceRefTypeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceRefTypeHelpBlock" path="refType" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceRefTypeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmReferenceRefTypeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="refDesc">
      
		  <div id="frmReferenceRefDescFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceRefDescLabel" for="frmReferenceRefDesc" class="col-sm-2 control-label"><spring:message code="frmReferenceRefDescLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceRefDescPlaceHolder" var="frmReferenceRefDescPlaceHolder"/>    
    
				<form:input path="refDesc" type="text" data-display-name="Reference Description" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmReferenceRefDesc" placeholder="${frmReferenceRefDescPlaceHolder}" aria-describedby="frmReferenceRefDescHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmReferenceRefDescFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceRefDescAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceRefDescAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceRefDescHelpBlock" path="refDesc" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceRefDescHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmReferenceRefDescHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="parentId">
      
		  <div id="frmReferenceParentIdFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceParentIdLabel" for="frmReferenceParentId" class="col-sm-2 control-label"><spring:message code="frmReferenceParentIdLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceParentIdPlaceHolder" var="frmReferenceParentIdPlaceHolder"/>    
    
				<form:input path="parentId" type="text" data-display-name="Parent Id" data-minlength="5" data-required="true" maxlength="10" class="form-control" id="frmReferenceParentId" placeholder="${frmReferenceParentIdPlaceHolder}" aria-describedby="frmReferenceParentIdHelpBlock" data-data-type="long" data-validate-key-press="true" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceParentIdJavascriptErrorDisplay'), 'The value that you attempted to paste into Parent Id can only contain digits 0-9', 'Valid')" />
    
				<span id="frmReferenceParentIdFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceParentIdAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceParentIdAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceParentIdHelpBlock" path="parentId" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceParentIdHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmReferenceParentIdHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="refIndex">
      
		  <div id="frmReferenceRefIndexFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceRefIndexLabel" for="frmReferenceRefIndex" class="col-sm-2 control-label"><spring:message code="frmReferenceRefIndexLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceRefIndexPlaceHolder" var="frmReferenceRefIndexPlaceHolder"/>    
    
				<form:input path="refIndex" type="text" data-display-name="Reference Index" data-minlength="5" data-required="true" maxlength="10" class="form-control" id="frmReferenceRefIndex" placeholder="${frmReferenceRefIndexPlaceHolder}" aria-describedby="frmReferenceRefIndexHelpBlock" data-data-type="long" data-validate-key-press="true" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmReferenceRefIndexJavascriptErrorDisplay'), 'The value that you attempted to paste into Reference Index can only contain digits 0-9', 'Valid')" />
    
				<span id="frmReferenceRefIndexFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceRefIndexAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceRefIndexAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceRefIndexHelpBlock" path="refIndex" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceRefIndexHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmReferenceRefIndexHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="description">
      
		  <div id="frmReferenceDescriptionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmReferenceDescriptionLabel" for="frmReferenceDescription" class="col-sm-2 control-label"><spring:message code="frmReferenceDescriptionLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmReferenceDescriptionPlaceHolder" var="frmReferenceDescriptionPlaceHolder"/>    
    
				<form:textarea path="description" data-display-name="Long Description" data-minlength="5" data-required="false" rows="5" maxlength="200" class="form-control" id="frmReferenceDescription" placeholder="${frmReferenceDescriptionPlaceHolder}" aria-describedby="frmReferenceDescriptionHelpBlock" data-validate-key-press="true" />
    
				<span id="frmReferenceDescriptionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmReferenceDescriptionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmReferenceDescriptionAlertBlockText"></span>
				</div>
			</div>
				<span id="frmReferenceDescriptionCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmReferenceDescriptionHelpBlock" path="description" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmReferenceDescriptionHelpBlock" class="help-block col-sm-9"><spring:message code="frmReferenceDescriptionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmReferenceSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../includes/redcrossfooter.jsp" />

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/referenceJs.js" var="referenceJs" />
  
<script src="${referenceJs}"></script>

</body>
</html>

