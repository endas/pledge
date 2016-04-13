<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${applicationUserDetailsFormModel['currentMode'] == 'ADD'}">
		<spring:message code="applicationuserdetails.form.header" var="headerText"/>
	</c:when>
	<c:when test="${applicationUserDetailsFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="applicationuserdetails.form.header" var="headerText"/>
	</c:when>
	<c:when test="${applicationUserDetailsFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="applicationuserdetails.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="applicationuserdetails.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="applicationuserdetails.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="applicationUserDetails" />
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
	
	<spring:message code="frmApplicationUserDetailsRepresentOrganisationPlaceHolder" var="unselectedRepresentOrganisation"/>
    
	<spring:message code="frmApplicationUserDetailsCountryPlaceHolder" var="unselectedCountry"/>
    
	<spring:url value="/applicationuserdetails/translate" var="applicationUserDetailsActionUrl" />
	  
	<form:form id="frmApplicationUserDetails" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="applicationUserDetailsTranslationFormModel" action="${applicationUserDetailsActionUrl}">

		<form:hidden id="frmApplicationUserDetailsApplicationUserDetailsId" path="id" />
		
		<form:hidden id="frmApplicationUserDetailsApplicationUserDetailsViewId" path="viewId" />
		
		<form:hidden id="frmApplicationUserDetailsMode" path="currentMode" />
		
		<input type="hidden" id="frmApplicationUserDetailsLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmApplicationUserDetailsLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="applicationuserdetails.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="applicationuserdetails.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="applicationuserdetails.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="applicationuserdetails.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="applicationuserdetails.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="applicationuserdetails.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="applicationuserdetails.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="applicationuserdetails.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="applicationuserdetails.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
    <section id="applicationUserDetailsFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="applicationuserdetails.table.pageheader.applicationuserdetailsformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="applicationUserDetailsFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="applicationuserdetails.form.panel.applicationuserdetailsinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		  <div id="frmApplicationUserDetailsContactInformationInstructionsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsContactInformationInstructionsPlaceHolder" var="frmApplicationUserDetailsContactInformationInstructionsPlaceHolder"/>    
    
				<p id="frmApplicationUserDetailsContactInformationInstructionsMessage" class="form-control-static"><spring:message code="frmApplicationUserDetailsContactInformationInstructionsMessage"/></p>
    
				<span id="frmApplicationUserDetailsContactInformationInstructionsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsContactInformationInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsContactInformationInstructionsAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsContactInformationInstructionsHelpBlock" path="contactInformationInstructions" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsContactInformationInstructionsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsContactInformationInstructionsHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsContactInformationInstructionsMessageTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsContactInformationInstructionsMessageLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsContactInformationInstructionsMessageTranslateToLabel" for="frmApplicationUserDetailsContactInformationInstructionsMessageLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="contactInformationInstructionsMessage" class="form-control" id="frmApplicationUserDetailsContactInformationInstructionsMessageLocalizer"  rows="5" maxlength="2000" placeholder=""/>
				<span id="frmApplicationUserDetailsContactInformationInstructionsMessageLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
	      
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsContactNameFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsContactNameLabel" for="frmApplicationUserDetailsContactName" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsContactNameLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsContactNamePlaceHolder" var="frmApplicationUserDetailsContactNamePlaceHolder"/>    
    
				<form:input path="contactName" type="text" data-display-name="Contact Name" data-minlength="2" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsContactName" placeholder="${frmApplicationUserDetailsContactNamePlaceHolder}" aria-describedby="frmApplicationUserDetailsContactNameHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsContactNameFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsContactNameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsContactNameAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsContactNameHelpBlock" path="contactName" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsContactNameHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsContactNameHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsContactNameLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsContactNameLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsContactNameLabelTranslateToLabel" for="frmApplicationUserDetailsContactNameLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="contactNameLabel" type="text" class="form-control" id="frmApplicationUserDetailsContactNameLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsContactNameLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsContactNamePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsContactNamePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsContactNamePlaceHolderTranslateToLabel" for="frmApplicationUserDetailsContactNamePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="contactNamePlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsContactNamePlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsContactNamePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsContactNameHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsContactNameHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsContactNameHelpBlockTranslateToLabel" for="frmApplicationUserDetailsContactNameHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="contactNameHelpText" type="text" class="form-control" id="frmApplicationUserDetailsContactNameHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsContactNameHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsRepresentOrganisationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsRepresentOrganisationLabel" for="frmApplicationUserDetailsRepresentOrganisation" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsRepresentOrganisationLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmApplicationUserDetailsRepresentOrganisationPlaceHolder" var="unselectedRepresentOrganisation"/>
    	
				<form:select path="representOrganisation" data-display-name="Are you pledging on behalf of an organisation?" data-reference-type="Yes_No" data-select-type="standalone" data-required="true" class="form-control" id="frmApplicationUserDetailsRepresentOrganisation" aria-describedby="frmApplicationUserDetailsRepresentOrganisationHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmApplicationUserDetails'), frmApplicationUserDetailsBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedRepresentOrganisation}" />
					
					<form:options items="${representOrganisationMap}" />
					
				</form:select>
	  
				<span id="frmApplicationUserDetailsRepresentOrganisationFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsRepresentOrganisationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsRepresentOrganisationAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsRepresentOrganisationHelpBlock" path="representOrganisation" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsRepresentOrganisationHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsRepresentOrganisationHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsRepresentOrganisationLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsRepresentOrganisationLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsRepresentOrganisationLabelTranslateToLabel" for="frmApplicationUserDetailsRepresentOrganisationLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="representOrganisationLabel" type="text" class="form-control" id="frmApplicationUserDetailsRepresentOrganisationLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsRepresentOrganisationLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsRepresentOrganisationPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsRepresentOrganisationPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsRepresentOrganisationPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsRepresentOrganisationPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="representOrganisationPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsRepresentOrganisationPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsRepresentOrganisationPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsRepresentOrganisationHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsRepresentOrganisationHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsRepresentOrganisationHelpBlockTranslateToLabel" for="frmApplicationUserDetailsRepresentOrganisationHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="representOrganisationHelpText" type="text" class="form-control" id="frmApplicationUserDetailsRepresentOrganisationHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsRepresentOrganisationHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsTelephoneNumberFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsTelephoneNumberLabel" for="frmApplicationUserDetailsTelephoneNumber" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsTelephoneNumberLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsTelephoneNumberPlaceHolder" var="frmApplicationUserDetailsTelephoneNumberPlaceHolder"/>    
    
				<form:input path="telephoneNumber" type="tel" data-display-name="Phone Number" data-minlength="7" data-required="false" maxlength="20" class="form-control" id="frmApplicationUserDetailsTelephoneNumber" placeholder="${frmApplicationUserDetailsTelephoneNumberPlaceHolder}" aria-describedby="frmApplicationUserDetailsTelephoneNumberHelpBlock" data-data-type="long" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsTelephoneNumberFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsTelephoneNumberAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsTelephoneNumberAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsTelephoneNumberHelpBlock" path="telephoneNumber" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsTelephoneNumberHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsTelephoneNumberHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsTelephoneNumberLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsTelephoneNumberLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsTelephoneNumberLabelTranslateToLabel" for="frmApplicationUserDetailsTelephoneNumberLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="telephoneNumberLabel" type="text" class="form-control" id="frmApplicationUserDetailsTelephoneNumberLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsTelephoneNumberLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsTelephoneNumberPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsTelephoneNumberPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsTelephoneNumberPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsTelephoneNumberPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="telephoneNumberPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsTelephoneNumberPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsTelephoneNumberPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsTelephoneNumberHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsTelephoneNumberHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsTelephoneNumberHelpBlockTranslateToLabel" for="frmApplicationUserDetailsTelephoneNumberHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="telephoneNumberHelpText" type="text" class="form-control" id="frmApplicationUserDetailsTelephoneNumberHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsTelephoneNumberHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsAddressOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsAddressOneLabel" for="frmApplicationUserDetailsAddressOne" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsAddressOneLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsAddressOnePlaceHolder" var="frmApplicationUserDetailsAddressOnePlaceHolder"/>    
    
				<form:input path="addressOne" type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsAddressOne" placeholder="${frmApplicationUserDetailsAddressOnePlaceHolder}" aria-describedby="frmApplicationUserDetailsAddressOneHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsAddressOneFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsAddressOneAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsAddressOneHelpBlock" path="addressOne" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsAddressOneHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsAddressOneHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsAddressOneLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsAddressOneLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsAddressOneLabelTranslateToLabel" for="frmApplicationUserDetailsAddressOneLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOneLabel" type="text" class="form-control" id="frmApplicationUserDetailsAddressOneLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsAddressOneLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsAddressOnePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsAddressOnePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsAddressOnePlaceHolderTranslateToLabel" for="frmApplicationUserDetailsAddressOnePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOnePlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsAddressOnePlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsAddressOnePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsAddressOneHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsAddressOneHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsAddressOneHelpBlockTranslateToLabel" for="frmApplicationUserDetailsAddressOneHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOneHelpText" type="text" class="form-control" id="frmApplicationUserDetailsAddressOneHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsAddressOneHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsAddressTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsAddressTwoLabel" for="frmApplicationUserDetailsAddressTwo" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsAddressTwoLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsAddressTwoPlaceHolder" var="frmApplicationUserDetailsAddressTwoPlaceHolder"/>    
    
				<form:input path="addressTwo" type="text" data-display-name="Address Line 2" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsAddressTwo" placeholder="${frmApplicationUserDetailsAddressTwoPlaceHolder}" aria-describedby="frmApplicationUserDetailsAddressTwoHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsAddressTwoFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsAddressTwoAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsAddressTwoHelpBlock" path="addressTwo" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsAddressTwoHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsAddressTwoHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsAddressTwoLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsAddressTwoLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsAddressTwoLabelTranslateToLabel" for="frmApplicationUserDetailsAddressTwoLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoLabel" type="text" class="form-control" id="frmApplicationUserDetailsAddressTwoLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsAddressTwoLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsAddressTwoPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsAddressTwoPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsAddressTwoPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsAddressTwoPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsAddressTwoPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsAddressTwoPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsAddressTwoHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsAddressTwoHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsAddressTwoHelpBlockTranslateToLabel" for="frmApplicationUserDetailsAddressTwoHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoHelpText" type="text" class="form-control" id="frmApplicationUserDetailsAddressTwoHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsAddressTwoHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsCityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsCityLabel" for="frmApplicationUserDetailsCity" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsCityLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsCityPlaceHolder" var="frmApplicationUserDetailsCityPlaceHolder"/>    
    
				<form:input path="city" type="text" data-display-name="Townland/Town/City" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsCity" placeholder="${frmApplicationUserDetailsCityPlaceHolder}" aria-describedby="frmApplicationUserDetailsCityHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsCityFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsCityAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsCityHelpBlock" path="city" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsCityHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsCityHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsCityLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsCityLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsCityLabelTranslateToLabel" for="frmApplicationUserDetailsCityLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityLabel" type="text" class="form-control" id="frmApplicationUserDetailsCityLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsCityLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsCityPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsCityPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsCityPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsCityPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsCityPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsCityPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsCityHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsCityHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsCityHelpBlockTranslateToLabel" for="frmApplicationUserDetailsCityHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityHelpText" type="text" class="form-control" id="frmApplicationUserDetailsCityHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsCityHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsStateProvinceRegionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsStateProvinceRegionLabel" for="frmApplicationUserDetailsStateProvinceRegion" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsStateProvinceRegionLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsStateProvinceRegionPlaceHolder" var="frmApplicationUserDetailsStateProvinceRegionPlaceHolder"/>    
    
				<form:input path="stateProvinceRegion" type="text" data-display-name="State/Province/Region" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsStateProvinceRegion" placeholder="${frmApplicationUserDetailsStateProvinceRegionPlaceHolder}" aria-describedby="frmApplicationUserDetailsStateProvinceRegionHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsStateProvinceRegionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsStateProvinceRegionAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsStateProvinceRegionHelpBlock" path="stateProvinceRegion" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsStateProvinceRegionHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsStateProvinceRegionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsStateProvinceRegionLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsStateProvinceRegionLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsStateProvinceRegionLabelTranslateToLabel" for="frmApplicationUserDetailsStateProvinceRegionLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionLabel" type="text" class="form-control" id="frmApplicationUserDetailsStateProvinceRegionLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsStateProvinceRegionLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsStateProvinceRegionPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsStateProvinceRegionPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsStateProvinceRegionPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsStateProvinceRegionPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsStateProvinceRegionPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsStateProvinceRegionPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsStateProvinceRegionHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsStateProvinceRegionHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsStateProvinceRegionHelpBlockTranslateToLabel" for="frmApplicationUserDetailsStateProvinceRegionHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionHelpText" type="text" class="form-control" id="frmApplicationUserDetailsStateProvinceRegionHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsStateProvinceRegionHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsPostCodeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsPostCodeLabel" for="frmApplicationUserDetailsPostCode" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsPostCodeLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsPostCodePlaceHolder" var="frmApplicationUserDetailsPostCodePlaceHolder"/>    
    
				<form:input path="postCode" type="text" data-display-name="Post Code" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmApplicationUserDetailsPostCode" placeholder="${frmApplicationUserDetailsPostCodePlaceHolder}" aria-describedby="frmApplicationUserDetailsPostCodeHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsPostCodeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsPostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsPostCodeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsPostCodeHelpBlock" path="postCode" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsPostCodeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsPostCodeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsPostCodeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsPostCodeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsPostCodeLabelTranslateToLabel" for="frmApplicationUserDetailsPostCodeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodeLabel" type="text" class="form-control" id="frmApplicationUserDetailsPostCodeLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsPostCodeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsPostCodePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsPostCodePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsPostCodePlaceHolderTranslateToLabel" for="frmApplicationUserDetailsPostCodePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodePlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsPostCodePlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsPostCodePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsPostCodeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsPostCodeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsPostCodeHelpBlockTranslateToLabel" for="frmApplicationUserDetailsPostCodeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodeHelpText" type="text" class="form-control" id="frmApplicationUserDetailsPostCodeHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsPostCodeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsCountryFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsCountryLabel" for="frmApplicationUserDetailsCountry" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsCountryLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmApplicationUserDetailsCountryPlaceHolder" var="unselectedCountry"/>
    	
				<form:select path="country" data-display-name="Country" data-reference-type="EuropeCountry" data-select-type="standalone" data-required="true" class="form-control" id="frmApplicationUserDetailsCountry" aria-describedby="frmApplicationUserDetailsCountryHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmApplicationUserDetails'), frmApplicationUserDetailsBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedCountry}" />
					
					<form:options items="${countryMap}" />
					
				</form:select>
	  
				<span id="frmApplicationUserDetailsCountryFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsCountryAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsCountryHelpBlock" path="country" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsCountryHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsCountryHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsCountryLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsCountryLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsCountryLabelTranslateToLabel" for="frmApplicationUserDetailsCountryLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryLabel" type="text" class="form-control" id="frmApplicationUserDetailsCountryLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsCountryLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsCountryPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsCountryPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsCountryPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsCountryPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsCountryPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsCountryPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsCountryHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsCountryHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsCountryHelpBlockTranslateToLabel" for="frmApplicationUserDetailsCountryHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryHelpText" type="text" class="form-control" id="frmApplicationUserDetailsCountryHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsCountryHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserDetailsEmailAddressFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserDetailsEmailAddressLabel" for="frmApplicationUserDetailsEmailAddress" class="col-sm-2 control-label"><spring:message code="frmApplicationUserDetailsEmailAddressLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserDetailsEmailAddressPlaceHolder" var="frmApplicationUserDetailsEmailAddressPlaceHolder"/>    
    
				<form:input path="emailAddress" type="email" data-display-name="Email Address" data-minlength="5" data-required="true" maxlength="256" class="form-control" id="frmApplicationUserDetailsEmailAddress" placeholder="${frmApplicationUserDetailsEmailAddressPlaceHolder}" aria-describedby="frmApplicationUserDetailsEmailAddressHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserDetailsEmailAddressFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserDetailsEmailAddressAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserDetailsEmailAddressAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserDetailsEmailAddressHelpBlock" path="emailAddress" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserDetailsEmailAddressHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsEmailAddressHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsEmailAddressLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsEmailAddressLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsEmailAddressLabelTranslateToLabel" for="frmApplicationUserDetailsEmailAddressLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="emailAddressLabel" type="text" class="form-control" id="frmApplicationUserDetailsEmailAddressLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsEmailAddressLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsEmailAddressPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsEmailAddressPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsEmailAddressPlaceHolderTranslateToLabel" for="frmApplicationUserDetailsEmailAddressPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="emailAddressPlaceHolder" type="text" class="form-control" id="frmApplicationUserDetailsEmailAddressPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsEmailAddressPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserDetailsEmailAddressHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserDetailsEmailAddressHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserDetailsEmailAddressHelpBlockTranslateToLabel" for="frmApplicationUserDetailsEmailAddressHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="emailAddressHelpText" type="text" class="form-control" id="frmApplicationUserDetailsEmailAddressHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserDetailsEmailAddressHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmApplicationUserDetailsSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/applicationUserDetailsJs.js" var="applicationUserDetailsJs" />
  
<script src="${applicationUserDetailsJs}"></script>

</body>
</html>

