<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${messageResourceFormModel['currentMode'] == 'ADD'}">
		<spring:message code="messageresource.form.header" var="headerText"/>
	</c:when>
	<c:when test="${messageResourceFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="messageresource.form.header" var="headerText"/>
	</c:when>
	<c:when test="${messageResourceFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="messageresource.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="messageresource.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="messageresource.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="messageResource" />
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
	
	<spring:url value="/messageresource/post" var="messageResourceActionUrl" />
	  
	<form:form id="frmMessageResource" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="messageResourceFormModel" action="${messageResourceActionUrl}">

		<form:hidden id="frmMessageResourceMessageResourceId" path="id" />
		
		<form:hidden id="frmMessageResourceMode" path="currentMode" />
		
		<input type="hidden" id="frmMessageResourceLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmMessageResourceLoadedFeedbackCss" value="${css}" />
    
    
    <section id="messageResourceFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="messageresource.form.pageheader.messageresourceformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="messageResourceFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="messageresource.form.panel.messageresourceinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		<spring:bind path="messageKey">
      
		  <div id="frmMessageResourceMessageKeyFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmMessageResourceMessageKeyLabel" for="frmMessageResourceMessageKey" class="col-sm-2 control-label"><spring:message code="frmMessageResourceMessageKeyLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmMessageResourceMessageKeyPlaceHolder" var="frmMessageResourceMessageKeyPlaceHolder"/>    
    
				<form:input path="messageKey" type="text" data-display-name="Message Key" data-minlength="10" data-required="true" maxlength="200" class="form-control" id="frmMessageResourceMessageKey" placeholder="${frmMessageResourceMessageKeyPlaceHolder}" aria-describedby="frmMessageResourceMessageKeyHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmMessageResourceMessageKeyFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmMessageResourceMessageKeyAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmMessageResourceMessageKeyAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmMessageResourceMessageKeyHelpBlock" path="messageKey" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmMessageResourceMessageKeyHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmMessageResourceMessageKeyHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="locale">
      
		  <div id="frmMessageResourceLocaleFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmMessageResourceLocaleLabel" for="frmMessageResourceLocale" class="col-sm-2 control-label"><spring:message code="frmMessageResourceLocaleLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmMessageResourceLocalePlaceHolder" var="frmMessageResourceLocalePlaceHolder"/>    
    
				<form:input path="locale" type="text" data-display-name="Locale" data-minlength="3" data-required="true" maxlength="10" class="form-control" id="frmMessageResourceLocale" placeholder="${frmMessageResourceLocalePlaceHolder}" aria-describedby="frmMessageResourceLocaleHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmMessageResourceLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmMessageResourceLocaleAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmMessageResourceLocaleAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmMessageResourceLocaleHelpBlock" path="locale" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmMessageResourceLocaleHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmMessageResourceLocaleHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="localeReferenceId">
      
		  <div id="frmMessageResourceLocaleReferenceIdFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmMessageResourceLocaleReferenceIdLabel" for="frmMessageResourceLocaleReferenceId" class="col-sm-2 control-label"><spring:message code="frmMessageResourceLocaleReferenceIdLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmMessageResourceLocaleReferenceIdPlaceHolder" var="frmMessageResourceLocaleReferenceIdPlaceHolder"/>    
    
				<form:input path="localeReferenceId" type="text" data-display-name="Reference Id" data-minlength="0" data-required="true" maxlength="10" class="form-control" id="frmMessageResourceLocaleReferenceId" placeholder="${frmMessageResourceLocaleReferenceIdPlaceHolder}" aria-describedby="frmMessageResourceLocaleReferenceIdHelpBlock" data-data-type="long" data-validate-key-press="true" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmMessageResourceLocaleReferenceIdJavascriptErrorDisplay'), 'The value that you attempted to paste into Reference Id can only contain digits 0-9', 'Valid')" />
    
				<span id="frmMessageResourceLocaleReferenceIdFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmMessageResourceLocaleReferenceIdAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmMessageResourceLocaleReferenceIdAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmMessageResourceLocaleReferenceIdHelpBlock" path="localeReferenceId" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmMessageResourceLocaleReferenceIdHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmMessageResourceLocaleReferenceIdHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
		<spring:bind path="message">
      
		  <div id="frmMessageResourceMessageFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmMessageResourceMessageLabel" for="frmMessageResourceMessage" class="col-sm-2 control-label"><spring:message code="frmMessageResourceMessageLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmMessageResourceMessagePlaceHolder" var="frmMessageResourceMessagePlaceHolder"/>    
    
				<form:input path="message" type="text" data-display-name="Message" data-minlength="0" data-required="true" maxlength="2000" class="form-control" id="frmMessageResourceMessage" placeholder="${frmMessageResourceMessagePlaceHolder}" aria-describedby="frmMessageResourceMessageHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmMessageResourceMessageFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmMessageResourceMessageAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmMessageResourceMessageAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmMessageResourceMessageHelpBlock" path="message" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmMessageResourceMessageHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmMessageResourceMessageHelpBlock"/></span>				  
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
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmMessageResourceSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/messageResourceJs.js" var="messageResourceJs" />
  
<script src="${messageResourceJs}"></script>

</body>
</html>

