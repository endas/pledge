<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${addressFormModel['currentMode'] == 'ADD'}">
		<spring:message code="address.form.header" var="headerText"/>
	</c:when>
	<c:when test="${addressFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="address.form.header" var="headerText"/>
	</c:when>
	<c:when test="${addressFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="address.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="address.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="address.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="address" />
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
	
	<spring:message code="frmAddressCountryPlaceHolder" var="unselectedCountry"/>
    
	<spring:url value="/address/translate" var="addressActionUrl" />
	  
	<form:form id="frmAddress" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="addressTranslationFormModel" action="${addressActionUrl}">

		<form:hidden id="frmAddressAddressId" path="id" />
		
		<form:hidden id="frmAddressAddressViewId" path="viewId" />
		
		<form:hidden id="frmAddressMode" path="currentMode" />
		
		<input type="hidden" id="frmAddressLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmAddressLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="address.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="address.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="address.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="address.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="address.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="address.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="address.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="address.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="address.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
    <section id="addressFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="address.form.pageheader.addressformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="addressFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="address.form.panel.addressforminputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		  <div id="frmAddressAddressOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAddressAddressOneLabel" for="frmAddressAddressOne" class="col-sm-2 control-label"><spring:message code="frmAddressAddressOneLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAddressAddressOnePlaceHolder" var="frmAddressAddressOnePlaceHolder"/>    
    
				<form:input path="addressOne" type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAddressAddressOne" placeholder="${frmAddressAddressOnePlaceHolder}" aria-describedby="frmAddressAddressOneHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAddressAddressOneFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAddressAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAddressAddressOneAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAddressAddressOneHelpBlock" path="addressOne" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAddressAddressOneHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressAddressOneHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAddressAddressOneLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressAddressOneLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressAddressOneLabelTranslateToLabel" for="frmAddressAddressOneLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOneLabel" type="text" class="form-control" id="frmAddressAddressOneLabelLocalizer" placeholder=""/>
				<span id="frmAddressAddressOneLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAddressAddressOnePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressAddressOnePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressAddressOnePlaceHolderTranslateToLabel" for="frmAddressAddressOnePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOnePlaceHolder" type="text" class="form-control" id="frmAddressAddressOnePlaceHolderLocalizer" placeholder=""/>
				<span id="frmAddressAddressOnePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAddressAddressOneHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressAddressOneHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressAddressOneHelpBlockTranslateToLabel" for="frmAddressAddressOneHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOneHelpText" type="text" class="form-control" id="frmAddressAddressOneHelpBlockLocalizer" placeholder=""/>
				<span id="frmAddressAddressOneHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAddressAddressTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAddressAddressTwoLabel" for="frmAddressAddressTwo" class="col-sm-2 control-label"><spring:message code="frmAddressAddressTwoLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAddressAddressTwoPlaceHolder" var="frmAddressAddressTwoPlaceHolder"/>    
    
				<form:input path="addressTwo" type="text" data-display-name="Address Line 2" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAddressAddressTwo" placeholder="${frmAddressAddressTwoPlaceHolder}" aria-describedby="frmAddressAddressTwoHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAddressAddressTwoFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAddressAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAddressAddressTwoAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAddressAddressTwoHelpBlock" path="addressTwo" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAddressAddressTwoHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressAddressTwoHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAddressAddressTwoLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressAddressTwoLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressAddressTwoLabelTranslateToLabel" for="frmAddressAddressTwoLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoLabel" type="text" class="form-control" id="frmAddressAddressTwoLabelLocalizer" placeholder=""/>
				<span id="frmAddressAddressTwoLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAddressAddressTwoPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressAddressTwoPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressAddressTwoPlaceHolderTranslateToLabel" for="frmAddressAddressTwoPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoPlaceHolder" type="text" class="form-control" id="frmAddressAddressTwoPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAddressAddressTwoPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAddressAddressTwoHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressAddressTwoHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressAddressTwoHelpBlockTranslateToLabel" for="frmAddressAddressTwoHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoHelpText" type="text" class="form-control" id="frmAddressAddressTwoHelpBlockLocalizer" placeholder=""/>
				<span id="frmAddressAddressTwoHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAddressCityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAddressCityLabel" for="frmAddressCity" class="col-sm-2 control-label"><spring:message code="frmAddressCityLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAddressCityPlaceHolder" var="frmAddressCityPlaceHolder"/>    
    
				<form:input path="city" type="text" data-display-name="Town/Townland/City" data-minlength="0" data-required="false" maxlength="50" class="form-control" id="frmAddressCity" placeholder="${frmAddressCityPlaceHolder}" aria-describedby="frmAddressCityHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAddressCityFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAddressCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAddressCityAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAddressCityHelpBlock" path="city" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAddressCityHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressCityHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAddressCityLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressCityLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressCityLabelTranslateToLabel" for="frmAddressCityLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityLabel" type="text" class="form-control" id="frmAddressCityLabelLocalizer" placeholder=""/>
				<span id="frmAddressCityLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAddressCityPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressCityPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressCityPlaceHolderTranslateToLabel" for="frmAddressCityPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityPlaceHolder" type="text" class="form-control" id="frmAddressCityPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAddressCityPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAddressCityHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressCityHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressCityHelpBlockTranslateToLabel" for="frmAddressCityHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityHelpText" type="text" class="form-control" id="frmAddressCityHelpBlockLocalizer" placeholder=""/>
				<span id="frmAddressCityHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAddressStateProvinceRegionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAddressStateProvinceRegionLabel" for="frmAddressStateProvinceRegion" class="col-sm-2 control-label"><spring:message code="frmAddressStateProvinceRegionLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAddressStateProvinceRegionPlaceHolder" var="frmAddressStateProvinceRegionPlaceHolder"/>    
    
				<form:input path="stateProvinceRegion" type="text" data-display-name="State/Province/Region" data-minlength="0" data-required="false" maxlength="50" class="form-control" id="frmAddressStateProvinceRegion" placeholder="${frmAddressStateProvinceRegionPlaceHolder}" aria-describedby="frmAddressStateProvinceRegionHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAddressStateProvinceRegionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAddressStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAddressStateProvinceRegionAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAddressStateProvinceRegionHelpBlock" path="stateProvinceRegion" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAddressStateProvinceRegionHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressStateProvinceRegionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAddressStateProvinceRegionLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressStateProvinceRegionLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressStateProvinceRegionLabelTranslateToLabel" for="frmAddressStateProvinceRegionLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionLabel" type="text" class="form-control" id="frmAddressStateProvinceRegionLabelLocalizer" placeholder=""/>
				<span id="frmAddressStateProvinceRegionLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAddressStateProvinceRegionPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressStateProvinceRegionPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressStateProvinceRegionPlaceHolderTranslateToLabel" for="frmAddressStateProvinceRegionPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionPlaceHolder" type="text" class="form-control" id="frmAddressStateProvinceRegionPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAddressStateProvinceRegionPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAddressStateProvinceRegionHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressStateProvinceRegionHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressStateProvinceRegionHelpBlockTranslateToLabel" for="frmAddressStateProvinceRegionHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionHelpText" type="text" class="form-control" id="frmAddressStateProvinceRegionHelpBlockLocalizer" placeholder=""/>
				<span id="frmAddressStateProvinceRegionHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAddressPostCodeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAddressPostCodeLabel" for="frmAddressPostCode" class="col-sm-2 control-label"><spring:message code="frmAddressPostCodeLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAddressPostCodePlaceHolder" var="frmAddressPostCodePlaceHolder"/>    
    
				<form:input path="postCode" type="text" data-display-name="Post Code" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmAddressPostCode" placeholder="${frmAddressPostCodePlaceHolder}" aria-describedby="frmAddressPostCodeHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAddressPostCodeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAddressPostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAddressPostCodeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAddressPostCodeHelpBlock" path="postCode" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAddressPostCodeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressPostCodeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAddressPostCodeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressPostCodeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressPostCodeLabelTranslateToLabel" for="frmAddressPostCodeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodeLabel" type="text" class="form-control" id="frmAddressPostCodeLabelLocalizer" placeholder=""/>
				<span id="frmAddressPostCodeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAddressPostCodePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressPostCodePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressPostCodePlaceHolderTranslateToLabel" for="frmAddressPostCodePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodePlaceHolder" type="text" class="form-control" id="frmAddressPostCodePlaceHolderLocalizer" placeholder=""/>
				<span id="frmAddressPostCodePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAddressPostCodeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressPostCodeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressPostCodeHelpBlockTranslateToLabel" for="frmAddressPostCodeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodeHelpText" type="text" class="form-control" id="frmAddressPostCodeHelpBlockLocalizer" placeholder=""/>
				<span id="frmAddressPostCodeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAddressCountryFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAddressCountryLabel" for="frmAddressCountry" class="col-sm-2 control-label"><spring:message code="frmAddressCountryLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAddressCountryPlaceHolder" var="unselectedCountry"/>
    	
				<form:select path="country" data-display-name="Country" data-reference-type="EuropeCountry" data-select-type="standalone" data-required="true" class="form-control" id="frmAddressCountry" aria-describedby="frmAddressCountryHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAddress'), frmAddressBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedCountry}" />
					
					<form:options items="${countryMap}" />
					
				</form:select>
	  
				<span id="frmAddressCountryFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAddressCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAddressCountryAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAddressCountryHelpBlock" path="country" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAddressCountryHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressCountryHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAddressCountryLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressCountryLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressCountryLabelTranslateToLabel" for="frmAddressCountryLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryLabel" type="text" class="form-control" id="frmAddressCountryLabelLocalizer" placeholder=""/>
				<span id="frmAddressCountryLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAddressCountryPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressCountryPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressCountryPlaceHolderTranslateToLabel" for="frmAddressCountryPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryPlaceHolder" type="text" class="form-control" id="frmAddressCountryPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAddressCountryPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAddressCountryHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAddressCountryHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAddressCountryHelpBlockTranslateToLabel" for="frmAddressCountryHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryHelpText" type="text" class="form-control" id="frmAddressCountryHelpBlockLocalizer" placeholder=""/>
				<span id="frmAddressCountryHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmAddressSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/addressJs.js" var="addressJs" />
  
<script src="${addressJs}"></script>

</body>
</html>

