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
<jsp:include page="../includes/header.jsp">
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
	
	<spring:url value="/messageresource/translate" var="messageResourceActionUrl" />
	  
	<form:form id="frmMessageResource" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="messageResourceTranslationFormModel" action="${messageResourceActionUrl}">

		<form:hidden id="frmMessageResourceMessageResourceId" path="id" />
		
		<form:hidden id="frmMessageResourceMessageResourceViewId" path="viewId" />
		
		<form:hidden id="frmMessageResourceMode" path="currentMode" />
		
		<input type="hidden" id="frmMessageResourceLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmMessageResourceLoadedFeedbackCss" value="${css}" />
    
    
	<div class="container">
      	    
  		<div class="well">    
		  <div id="existingLocaleFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
			<label id="existingLocaleLabel" for="existingLocale" class="col-sm-2 control-label"><spring:message code="existingLocaleLabel"/></label>
			<div class="col-sm-4 select-container">
					
				<form:select path="${model.defaultLocale}" data-display-name="${existingLocaleSelectLabel}" data-select-type="standalone" data-required="false" class="form-control" id="existingLocale" aria-describedby="existingLocaleHelpBlock">
					<form:options items="${localeMap}" />
				</form:select>
    
				<span id="existingLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>

			</div>

			<label id="newLocaleLabel" for="newLocale" class="col-sm-2 control-label"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-4 select-container">
			<spring:bind path="newLocale">		
				<form:select path="newLocale" data-display-name="${newLocaleSelectLabel}" data-select-type="standalone" data-required="false" class="form-control" id="newLocale" aria-describedby="newLocaleHelpBlock">
					<form:options items="${localeMap}" />
				</form:select>
    		</spring:bind>
				<span id="newLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>

			</div>
		  </div>
		</div> <!-- class="well" -->
		  
		  
		  <div class="form-group">
		  	<label id="pageTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="messageresource.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="messageresource.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="messageresource.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="messageresource.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="messageresource.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="messageresource.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="messageresource.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="messageresource.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="messageresource.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmMessageResourceMessageKeyLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceMessageKeyLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceMessageKeyLabelTranslateToLabel" for="frmMessageResourceMessageKeyLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="messageKeyLabel" type="text" class="form-control" id="frmMessageResourceMessageKeyLabelLocalizer" placeholder=""/>
				<span id="frmMessageResourceMessageKeyLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmMessageResourceMessageKeyPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceMessageKeyPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceMessageKeyPlaceHolderTranslateToLabel" for="frmMessageResourceMessageKeyPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="messageKeyPlaceHolder" type="text" class="form-control" id="frmMessageResourceMessageKeyPlaceHolderLocalizer" placeholder=""/>
				<span id="frmMessageResourceMessageKeyPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmMessageResourceMessageKeyHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceMessageKeyHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceMessageKeyHelpBlockTranslateToLabel" for="frmMessageResourceMessageKeyHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="messageKeyHelpText" type="text" class="form-control" id="frmMessageResourceMessageKeyHelpBlockLocalizer" placeholder=""/>
				<span id="frmMessageResourceMessageKeyHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmMessageResourceLocaleLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceLocaleLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceLocaleLabelTranslateToLabel" for="frmMessageResourceLocaleLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="localeLabel" type="text" class="form-control" id="frmMessageResourceLocaleLabelLocalizer" placeholder=""/>
				<span id="frmMessageResourceLocaleLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmMessageResourceLocalePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceLocalePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceLocalePlaceHolderTranslateToLabel" for="frmMessageResourceLocalePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="localePlaceHolder" type="text" class="form-control" id="frmMessageResourceLocalePlaceHolderLocalizer" placeholder=""/>
				<span id="frmMessageResourceLocalePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmMessageResourceLocaleHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceLocaleHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceLocaleHelpBlockTranslateToLabel" for="frmMessageResourceLocaleHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="localeHelpText" type="text" class="form-control" id="frmMessageResourceLocaleHelpBlockLocalizer" placeholder=""/>
				<span id="frmMessageResourceLocaleHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmMessageResourceLocaleReferenceIdLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceLocaleReferenceIdLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceLocaleReferenceIdLabelTranslateToLabel" for="frmMessageResourceLocaleReferenceIdLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="localeReferenceIdLabel" type="text" class="form-control" id="frmMessageResourceLocaleReferenceIdLabelLocalizer" placeholder=""/>
				<span id="frmMessageResourceLocaleReferenceIdLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmMessageResourceLocaleReferenceIdPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceLocaleReferenceIdPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceLocaleReferenceIdPlaceHolderTranslateToLabel" for="frmMessageResourceLocaleReferenceIdPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="localeReferenceIdPlaceHolder" type="text" class="form-control" id="frmMessageResourceLocaleReferenceIdPlaceHolderLocalizer" placeholder=""/>
				<span id="frmMessageResourceLocaleReferenceIdPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmMessageResourceLocaleReferenceIdHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceLocaleReferenceIdHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceLocaleReferenceIdHelpBlockTranslateToLabel" for="frmMessageResourceLocaleReferenceIdHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="localeReferenceIdHelpText" type="text" class="form-control" id="frmMessageResourceLocaleReferenceIdHelpBlockLocalizer" placeholder=""/>
				<span id="frmMessageResourceLocaleReferenceIdHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmMessageResourceMessageLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceMessageLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceMessageLabelTranslateToLabel" for="frmMessageResourceMessageLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="messageLabel" type="text" class="form-control" id="frmMessageResourceMessageLabelLocalizer" placeholder=""/>
				<span id="frmMessageResourceMessageLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmMessageResourceMessagePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceMessagePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceMessagePlaceHolderTranslateToLabel" for="frmMessageResourceMessagePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="messagePlaceHolder" type="text" class="form-control" id="frmMessageResourceMessagePlaceHolderLocalizer" placeholder=""/>
				<span id="frmMessageResourceMessagePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmMessageResourceMessageHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmMessageResourceMessageHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmMessageResourceMessageHelpBlockTranslateToLabel" for="frmMessageResourceMessageHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="messageHelpText" type="text" class="form-control" id="frmMessageResourceMessageHelpBlockLocalizer" placeholder=""/>
				<span id="frmMessageResourceMessageHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
<jsp:include page="../includes/redcrossfooter.jsp" />

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/messageResourceJs.js" var="messageResourceJs" />
  
<script src="${messageResourceJs}"></script>

</body>
</html>

