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
	
	<spring:url value="/reference/translate" var="referenceActionUrl" />
	  
	<form:form id="frmReference" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="referenceTranslationFormModel" action="${referenceActionUrl}">

		<form:hidden id="frmReferenceReferenceId" path="id" />
		
		<form:hidden id="frmReferenceReferenceViewId" path="viewId" />
		
		<form:hidden id="frmReferenceMode" path="currentMode" />
		
		<input type="hidden" id="frmReferenceLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmReferenceLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="reference.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="reference.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="reference.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="reference.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="reference.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="reference.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="reference.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="reference.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="reference.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmReferenceRefTypeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefTypeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefTypeLabelTranslateToLabel" for="frmReferenceRefTypeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refTypeLabel" type="text" class="form-control" id="frmReferenceRefTypeLabelLocalizer" placeholder=""/>
				<span id="frmReferenceRefTypeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmReferenceRefTypePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefTypePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefTypePlaceHolderTranslateToLabel" for="frmReferenceRefTypePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refTypePlaceHolder" type="text" class="form-control" id="frmReferenceRefTypePlaceHolderLocalizer" placeholder=""/>
				<span id="frmReferenceRefTypePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmReferenceRefTypeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefTypeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefTypeHelpBlockTranslateToLabel" for="frmReferenceRefTypeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refTypeHelpText" type="text" class="form-control" id="frmReferenceRefTypeHelpBlockLocalizer" placeholder=""/>
				<span id="frmReferenceRefTypeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmReferenceRefDescLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefDescLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefDescLabelTranslateToLabel" for="frmReferenceRefDescLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refDescLabel" type="text" class="form-control" id="frmReferenceRefDescLabelLocalizer" placeholder=""/>
				<span id="frmReferenceRefDescLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmReferenceRefDescPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefDescPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefDescPlaceHolderTranslateToLabel" for="frmReferenceRefDescPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refDescPlaceHolder" type="text" class="form-control" id="frmReferenceRefDescPlaceHolderLocalizer" placeholder=""/>
				<span id="frmReferenceRefDescPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmReferenceRefDescHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefDescHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefDescHelpBlockTranslateToLabel" for="frmReferenceRefDescHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refDescHelpText" type="text" class="form-control" id="frmReferenceRefDescHelpBlockLocalizer" placeholder=""/>
				<span id="frmReferenceRefDescHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmReferenceParentIdLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceParentIdLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceParentIdLabelTranslateToLabel" for="frmReferenceParentIdLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="parentIdLabel" type="text" class="form-control" id="frmReferenceParentIdLabelLocalizer" placeholder=""/>
				<span id="frmReferenceParentIdLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmReferenceParentIdPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceParentIdPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceParentIdPlaceHolderTranslateToLabel" for="frmReferenceParentIdPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="parentIdPlaceHolder" type="text" class="form-control" id="frmReferenceParentIdPlaceHolderLocalizer" placeholder=""/>
				<span id="frmReferenceParentIdPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmReferenceParentIdHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceParentIdHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceParentIdHelpBlockTranslateToLabel" for="frmReferenceParentIdHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="parentIdHelpText" type="text" class="form-control" id="frmReferenceParentIdHelpBlockLocalizer" placeholder=""/>
				<span id="frmReferenceParentIdHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmReferenceRefIndexLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefIndexLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefIndexLabelTranslateToLabel" for="frmReferenceRefIndexLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refIndexLabel" type="text" class="form-control" id="frmReferenceRefIndexLabelLocalizer" placeholder=""/>
				<span id="frmReferenceRefIndexLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmReferenceRefIndexPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefIndexPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefIndexPlaceHolderTranslateToLabel" for="frmReferenceRefIndexPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refIndexPlaceHolder" type="text" class="form-control" id="frmReferenceRefIndexPlaceHolderLocalizer" placeholder=""/>
				<span id="frmReferenceRefIndexPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmReferenceRefIndexHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceRefIndexHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceRefIndexHelpBlockTranslateToLabel" for="frmReferenceRefIndexHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="refIndexHelpText" type="text" class="form-control" id="frmReferenceRefIndexHelpBlockLocalizer" placeholder=""/>
				<span id="frmReferenceRefIndexHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmReferenceDescriptionLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceDescriptionLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceDescriptionLabelTranslateToLabel" for="frmReferenceDescriptionLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="descriptionLabel" type="text" class="form-control" id="frmReferenceDescriptionLabelLocalizer" placeholder=""/>
				<span id="frmReferenceDescriptionLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmReferenceDescriptionPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceDescriptionPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceDescriptionPlaceHolderTranslateToLabel" for="frmReferenceDescriptionPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="descriptionPlaceHolder" type="text" class="form-control" id="frmReferenceDescriptionPlaceHolderLocalizer" placeholder=""/>
				<span id="frmReferenceDescriptionPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmReferenceDescriptionHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmReferenceDescriptionHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmReferenceDescriptionHelpBlockTranslateToLabel" for="frmReferenceDescriptionHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="descriptionHelpText" type="text" class="form-control" id="frmReferenceDescriptionHelpBlockLocalizer" placeholder=""/>
				<span id="frmReferenceDescriptionHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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

