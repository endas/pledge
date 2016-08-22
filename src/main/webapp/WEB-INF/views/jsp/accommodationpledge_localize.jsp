<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${accommodationPledgeFormModel['currentMode'] == 'ADD'}">
		<spring:message code="accommodationpledge.form.header" var="headerText"/>
	</c:when>
	<c:when test="${accommodationPledgeFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="accommodationpledge.form.header" var="headerText"/>
	</c:when>
	<c:when test="${accommodationPledgeFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="accommodationpledge.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="accommodationpledge.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="accommodationpledge.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="accommodationPledge" />
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
	
	<spring:message code="frmAccommodationPledgeCountryPlaceHolder" var="unselectedCountry"/>
    
	<spring:message code="frmAccommodationPledgeOwnerOccupierPlaceHolder" var="unselectedOwnerOccupier"/>
    
	<spring:message code="frmAccommodationPledgeAccommodationTypePlaceHolder" var="unselectedAccommodationType"/>
    
	<spring:message code="frmAccommodationPledgeAccommodationConditionPlaceHolder" var="unselectedAccommodationCondition"/>
    
	<spring:message code="frmAccommodationPledgeNumberOfBedsPlaceHolder" var="unselectedNumberOfBeds"/>
    
	<spring:message code="frmAccommodationPledgeVacantOrSharedPlaceHolder" var="unselectedVacantOrShared"/>
    
	<spring:message code="frmAccommodationPledgeCanYouAccommodatePlaceHolder" var="unselectedCanYouAccommodate"/>
    
	<spring:url value="/accommodationpledge/translate" var="accommodationPledgeActionUrl" />
	  
	<form:form id="frmAccommodationPledge" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="accommodationPledgeTranslationFormModel" action="${accommodationPledgeActionUrl}">

		<form:hidden id="frmAccommodationPledgeAccommodationPledgeId" path="id" />
		
		<form:hidden id="frmAccommodationPledgeAccommodationPledgeViewId" path="viewId" />
		
		<form:hidden id="frmAccommodationPledgeMode" path="currentMode" />
		
		<input type="hidden" id="frmAccommodationPledgeLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmAccommodationPledgeLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="accommodationpledge.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="accommodationpledge.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="accommodationpledge.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="accommodationpledge.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="accommodationpledge.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="accommodationpledge.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="accommodationpledge.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="accommodationpledge.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="accommodationpledge.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
    <section id="accommodationPledgeFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="accommodationpledge.form.pageheader.accommodationpledgeformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="accommodationPledgeFormHeaderSection --> 
    
    <section id="accommodationPledgeTableViewHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="accommodationpledge.table.pageheader.accommodationpledgetableviewheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="accommodationPledgeTableViewHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="accommodationpledge.form.panel.accommodationpledgeinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		  <div id="frmAccommodationPledgeAddressOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAddressOneLabel" for="frmAccommodationPledgeAddressOne" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAddressOneLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeAddressOnePlaceHolder" var="frmAccommodationPledgeAddressOnePlaceHolder"/>    
    
				<form:input path="addressOne" type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAccommodationPledgeAddressOne" placeholder="${frmAccommodationPledgeAddressOnePlaceHolder}" aria-describedby="frmAccommodationPledgeAddressOneHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAccommodationPledgeAddressOneFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAddressOneAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAddressOneHelpBlock" path="addressOne" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAddressOneHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeAddressOneHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAddressOneLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAddressOneLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAddressOneLabelTranslateToLabel" for="frmAccommodationPledgeAddressOneLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOneLabel" type="text" class="form-control" id="frmAccommodationPledgeAddressOneLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAddressOneLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAddressOnePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAddressOnePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAddressOnePlaceHolderTranslateToLabel" for="frmAccommodationPledgeAddressOnePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOnePlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAddressOnePlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAddressOnePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAddressOneHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAddressOneHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAddressOneHelpBlockTranslateToLabel" for="frmAccommodationPledgeAddressOneHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressOneHelpText" type="text" class="form-control" id="frmAccommodationPledgeAddressOneHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAddressOneHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeAddressTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAddressTwoLabel" for="frmAccommodationPledgeAddressTwo" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAddressTwoLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeAddressTwoPlaceHolder" var="frmAccommodationPledgeAddressTwoPlaceHolder"/>    
    
				<form:input path="addressTwo" type="text" data-display-name="Address Line 2" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAccommodationPledgeAddressTwo" placeholder="${frmAccommodationPledgeAddressTwoPlaceHolder}" aria-describedby="frmAccommodationPledgeAddressTwoHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAccommodationPledgeAddressTwoFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAddressTwoAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAddressTwoHelpBlock" path="addressTwo" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAddressTwoHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeAddressTwoHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAddressTwoLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAddressTwoLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAddressTwoLabelTranslateToLabel" for="frmAccommodationPledgeAddressTwoLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoLabel" type="text" class="form-control" id="frmAccommodationPledgeAddressTwoLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAddressTwoLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAddressTwoPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAddressTwoPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAddressTwoPlaceHolderTranslateToLabel" for="frmAccommodationPledgeAddressTwoPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAddressTwoPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAddressTwoPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAddressTwoHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAddressTwoHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAddressTwoHelpBlockTranslateToLabel" for="frmAccommodationPledgeAddressTwoHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="addressTwoHelpText" type="text" class="form-control" id="frmAccommodationPledgeAddressTwoHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAddressTwoHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeCityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeCityLabel" for="frmAccommodationPledgeCity" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeCityLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeCityPlaceHolder" var="frmAccommodationPledgeCityPlaceHolder"/>    
    
				<form:input path="city" type="text" data-display-name="Townland/Town/City" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmAccommodationPledgeCity" placeholder="${frmAccommodationPledgeCityPlaceHolder}" aria-describedby="frmAccommodationPledgeCityHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAccommodationPledgeCityFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeCityAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeCityHelpBlock" path="city" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeCityHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeCityHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCityLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCityLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCityLabelTranslateToLabel" for="frmAccommodationPledgeCityLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityLabel" type="text" class="form-control" id="frmAccommodationPledgeCityLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCityLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCityPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCityPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCityPlaceHolderTranslateToLabel" for="frmAccommodationPledgeCityPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeCityPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCityPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCityHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCityHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCityHelpBlockTranslateToLabel" for="frmAccommodationPledgeCityHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="cityHelpText" type="text" class="form-control" id="frmAccommodationPledgeCityHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCityHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeStateProvinceRegionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeStateProvinceRegionLabel" for="frmAccommodationPledgeStateProvinceRegion" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeStateProvinceRegionLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeStateProvinceRegionPlaceHolder" var="frmAccommodationPledgeStateProvinceRegionPlaceHolder"/>    
    
				<form:input path="stateProvinceRegion" type="text" data-display-name="State/Province/Region" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmAccommodationPledgeStateProvinceRegion" placeholder="${frmAccommodationPledgeStateProvinceRegionPlaceHolder}" aria-describedby="frmAccommodationPledgeStateProvinceRegionHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAccommodationPledgeStateProvinceRegionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeStateProvinceRegionAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeStateProvinceRegionHelpBlock" path="stateProvinceRegion" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeStateProvinceRegionHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeStateProvinceRegionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeStateProvinceRegionLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeStateProvinceRegionLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeStateProvinceRegionLabelTranslateToLabel" for="frmAccommodationPledgeStateProvinceRegionLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionLabel" type="text" class="form-control" id="frmAccommodationPledgeStateProvinceRegionLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeStateProvinceRegionLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeStateProvinceRegionPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeStateProvinceRegionPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeStateProvinceRegionPlaceHolderTranslateToLabel" for="frmAccommodationPledgeStateProvinceRegionPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeStateProvinceRegionPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeStateProvinceRegionPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeStateProvinceRegionHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeStateProvinceRegionHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeStateProvinceRegionHelpBlockTranslateToLabel" for="frmAccommodationPledgeStateProvinceRegionHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="stateProvinceRegionHelpText" type="text" class="form-control" id="frmAccommodationPledgeStateProvinceRegionHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeStateProvinceRegionHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgePostCodeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgePostCodeLabel" for="frmAccommodationPledgePostCode" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgePostCodeLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgePostCodePlaceHolder" var="frmAccommodationPledgePostCodePlaceHolder"/>    
    
				<form:input path="postCode" type="text" data-display-name="Eircode" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmAccommodationPledgePostCode" placeholder="${frmAccommodationPledgePostCodePlaceHolder}" aria-describedby="frmAccommodationPledgePostCodeHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmAccommodationPledgePostCodeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgePostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgePostCodeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgePostCodeHelpBlock" path="postCode" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgePostCodeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgePostCodeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgePostCodeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgePostCodeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgePostCodeLabelTranslateToLabel" for="frmAccommodationPledgePostCodeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodeLabel" type="text" class="form-control" id="frmAccommodationPledgePostCodeLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgePostCodeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgePostCodePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgePostCodePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgePostCodePlaceHolderTranslateToLabel" for="frmAccommodationPledgePostCodePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodePlaceHolder" type="text" class="form-control" id="frmAccommodationPledgePostCodePlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgePostCodePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgePostCodeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgePostCodeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgePostCodeHelpBlockTranslateToLabel" for="frmAccommodationPledgePostCodeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="postCodeHelpText" type="text" class="form-control" id="frmAccommodationPledgePostCodeHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgePostCodeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeCountryFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeCountryLabel" for="frmAccommodationPledgeCountry" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeCountryLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeCountryPlaceHolder" var="unselectedCountry"/>
    	
				<form:select path="country" data-display-name="Country" data-reference-type="EuropeCountry" data-select-type="standalone" data-required="true" class="form-control" id="frmAccommodationPledgeCountry" aria-describedby="frmAccommodationPledgeCountryHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedCountry}" />
					
					<form:options items="${countryMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeCountryFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeCountryAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeCountryHelpBlock" path="country" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeCountryHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeCountryHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCountryLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCountryLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCountryLabelTranslateToLabel" for="frmAccommodationPledgeCountryLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryLabel" type="text" class="form-control" id="frmAccommodationPledgeCountryLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCountryLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCountryPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCountryPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCountryPlaceHolderTranslateToLabel" for="frmAccommodationPledgeCountryPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeCountryPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCountryPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCountryHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCountryHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCountryHelpBlockTranslateToLabel" for="frmAccommodationPledgeCountryHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="countryHelpText" type="text" class="form-control" id="frmAccommodationPledgeCountryHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCountryHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeOwnerOccupierFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeOwnerOccupierLabel" for="frmAccommodationPledgeOwnerOccupier" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeOwnerOccupierLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeOwnerOccupierPlaceHolder" var="unselectedOwnerOccupier"/>
    	
				<form:select path="ownerOccupier" data-display-name="Who owns the accommodation?" data-reference-type="OwnerOccupierType" data-select-type="standalone" data-required="false" class="form-control" id="frmAccommodationPledgeOwnerOccupier" aria-describedby="frmAccommodationPledgeOwnerOccupierHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedOwnerOccupier}" />
					
					<form:options items="${ownerOccupierMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeOwnerOccupierFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeOwnerOccupierAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeOwnerOccupierAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeOwnerOccupierHelpBlock" path="ownerOccupier" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeOwnerOccupierHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeOwnerOccupierHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeOwnerOccupierLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeOwnerOccupierLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeOwnerOccupierLabelTranslateToLabel" for="frmAccommodationPledgeOwnerOccupierLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="ownerOccupierLabel" type="text" class="form-control" id="frmAccommodationPledgeOwnerOccupierLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeOwnerOccupierLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeOwnerOccupierPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeOwnerOccupierPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeOwnerOccupierPlaceHolderTranslateToLabel" for="frmAccommodationPledgeOwnerOccupierPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="ownerOccupierPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeOwnerOccupierPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeOwnerOccupierPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeOwnerOccupierHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeOwnerOccupierHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeOwnerOccupierHelpBlockTranslateToLabel" for="frmAccommodationPledgeOwnerOccupierHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="ownerOccupierHelpText" type="text" class="form-control" id="frmAccommodationPledgeOwnerOccupierHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeOwnerOccupierHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeAccommodationDateFromFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAccommodationDateFromLabel" for="frmAccommodationPledgeAccommodationDateFrom" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAccommodationDateFromLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeAccommodationDateFromPlaceHolder" var="frmAccommodationPledgeAccommodationDateFromPlaceHolder"/>    
    
				<form:input path="accommodationDateFrom" type="text" data-display-name="When is the accommodation available from?" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmAccommodationPledgeAccommodationDateFrom" placeholder="${frmAccommodationPledgeAccommodationDateFromPlaceHolder}" aria-describedby="frmAccommodationPledgeAccommodationDateFromHelpBlock" data-data-type="date" data-validate-key-press="true" />
    
				<span id="frmAccommodationPledgeAccommodationDateFromFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAccommodationDateFromAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAccommodationDateFromAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAccommodationDateFromHelpBlock" path="accommodationDateFrom" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAccommodationDateFromHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeAccommodationDateFromHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationDateFromLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationDateFromLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationDateFromLabelTranslateToLabel" for="frmAccommodationPledgeAccommodationDateFromLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationDateFromLabel" type="text" class="form-control" id="frmAccommodationPledgeAccommodationDateFromLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationDateFromLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationDateFromPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationDateFromPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationDateFromPlaceHolderTranslateToLabel" for="frmAccommodationPledgeAccommodationDateFromPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationDateFromPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAccommodationDateFromPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationDateFromPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationDateFromHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationDateFromHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationDateFromHelpBlockTranslateToLabel" for="frmAccommodationPledgeAccommodationDateFromHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationDateFromHelpText" type="text" class="form-control" id="frmAccommodationPledgeAccommodationDateFromHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationDateFromHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeAccommodationDateToFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAccommodationDateToLabel" for="frmAccommodationPledgeAccommodationDateTo" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAccommodationDateToLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeAccommodationDateToPlaceHolder" var="frmAccommodationPledgeAccommodationDateToPlaceHolder"/>    
    
				<form:input path="accommodationDateTo" type="text" data-display-name="When is the accommodation available until?" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmAccommodationPledgeAccommodationDateTo" placeholder="${frmAccommodationPledgeAccommodationDateToPlaceHolder}" aria-describedby="frmAccommodationPledgeAccommodationDateToHelpBlock" data-data-type="date" data-validate-key-press="true" />
    
				<span id="frmAccommodationPledgeAccommodationDateToFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAccommodationDateToAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAccommodationDateToAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAccommodationDateToHelpBlock" path="accommodationDateTo" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAccommodationDateToHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeAccommodationDateToHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationDateToLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationDateToLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationDateToLabelTranslateToLabel" for="frmAccommodationPledgeAccommodationDateToLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationDateToLabel" type="text" class="form-control" id="frmAccommodationPledgeAccommodationDateToLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationDateToLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationDateToPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationDateToPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationDateToPlaceHolderTranslateToLabel" for="frmAccommodationPledgeAccommodationDateToPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationDateToPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAccommodationDateToPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationDateToPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationDateToHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationDateToHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationDateToHelpBlockTranslateToLabel" for="frmAccommodationPledgeAccommodationDateToHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationDateToHelpText" type="text" class="form-control" id="frmAccommodationPledgeAccommodationDateToHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationDateToHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeAccommodationTypeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAccommodationTypeLabel" for="frmAccommodationPledgeAccommodationType" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAccommodationTypeLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeAccommodationTypePlaceHolder" var="unselectedAccommodationType"/>
    	
				<form:select path="accommodationType" data-display-name="What kind of accommodation are you pledging?" data-reference-type="AccommodationType" data-select-type="standalone" data-required="false" class="form-control" id="frmAccommodationPledgeAccommodationType" aria-describedby="frmAccommodationPledgeAccommodationTypeHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedAccommodationType}" />
					
					<form:options items="${accommodationTypeMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeAccommodationTypeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAccommodationTypeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAccommodationTypeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAccommodationTypeHelpBlock" path="accommodationType" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAccommodationTypeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeAccommodationTypeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationTypeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationTypeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationTypeLabelTranslateToLabel" for="frmAccommodationPledgeAccommodationTypeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationTypeLabel" type="text" class="form-control" id="frmAccommodationPledgeAccommodationTypeLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationTypeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationTypePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationTypePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationTypePlaceHolderTranslateToLabel" for="frmAccommodationPledgeAccommodationTypePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationTypePlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAccommodationTypePlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationTypePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationTypeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationTypeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationTypeHelpBlockTranslateToLabel" for="frmAccommodationPledgeAccommodationTypeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationTypeHelpText" type="text" class="form-control" id="frmAccommodationPledgeAccommodationTypeHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationTypeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeAccommodationConditionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAccommodationConditionLabel" for="frmAccommodationPledgeAccommodationCondition" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAccommodationConditionLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeAccommodationConditionPlaceHolder" var="unselectedAccommodationCondition"/>
    	
				<form:select path="accommodationCondition" data-display-name="Condition" data-reference-type="AccommodationCondition" data-select-type="standalone" data-required="false" class="form-control" id="frmAccommodationPledgeAccommodationCondition" aria-describedby="frmAccommodationPledgeAccommodationConditionHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedAccommodationCondition}" />
					
					<form:options items="${accommodationConditionMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeAccommodationConditionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAccommodationConditionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAccommodationConditionAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAccommodationConditionHelpBlock" path="accommodationCondition" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAccommodationConditionHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeAccommodationConditionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationConditionLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationConditionLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationConditionLabelTranslateToLabel" for="frmAccommodationPledgeAccommodationConditionLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationConditionLabel" type="text" class="form-control" id="frmAccommodationPledgeAccommodationConditionLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationConditionLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationConditionPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationConditionPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationConditionPlaceHolderTranslateToLabel" for="frmAccommodationPledgeAccommodationConditionPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationConditionPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAccommodationConditionPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationConditionPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAccommodationConditionHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAccommodationConditionHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAccommodationConditionHelpBlockTranslateToLabel" for="frmAccommodationPledgeAccommodationConditionHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="accommodationConditionHelpText" type="text" class="form-control" id="frmAccommodationPledgeAccommodationConditionHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAccommodationConditionHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeNumberOfBedsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeNumberOfBedsLabel" for="frmAccommodationPledgeNumberOfBeds" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeNumberOfBedsLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeNumberOfBedsPlaceHolder" var="unselectedNumberOfBeds"/>
    	
				<form:select path="numberOfBeds" data-display-name="Number of beds" data-reference-type="NumberOfBeds" data-select-type="standalone" data-required="false" class="form-control" id="frmAccommodationPledgeNumberOfBeds" aria-describedby="frmAccommodationPledgeNumberOfBedsHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedNumberOfBeds}" />
					
					<form:options items="${numberOfBedsMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeNumberOfBedsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeNumberOfBedsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeNumberOfBedsAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeNumberOfBedsHelpBlock" path="numberOfBeds" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeNumberOfBedsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeNumberOfBedsHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeNumberOfBedsLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeNumberOfBedsLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeNumberOfBedsLabelTranslateToLabel" for="frmAccommodationPledgeNumberOfBedsLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="numberOfBedsLabel" type="text" class="form-control" id="frmAccommodationPledgeNumberOfBedsLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeNumberOfBedsLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeNumberOfBedsPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeNumberOfBedsPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeNumberOfBedsPlaceHolderTranslateToLabel" for="frmAccommodationPledgeNumberOfBedsPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="numberOfBedsPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeNumberOfBedsPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeNumberOfBedsPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeNumberOfBedsHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeNumberOfBedsHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeNumberOfBedsHelpBlockTranslateToLabel" for="frmAccommodationPledgeNumberOfBedsHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="numberOfBedsHelpText" type="text" class="form-control" id="frmAccommodationPledgeNumberOfBedsHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeNumberOfBedsHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeVacantOrSharedFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeVacantOrSharedLabel" for="frmAccommodationPledgeVacantOrShared" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeVacantOrSharedLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeVacantOrSharedPlaceHolder" var="unselectedVacantOrShared"/>
    	
				<form:select path="vacantOrShared" data-display-name="Vacant or Shared" data-reference-type="VacantOrShared" data-select-type="standalone" data-required="false" class="form-control" id="frmAccommodationPledgeVacantOrShared" aria-describedby="frmAccommodationPledgeVacantOrSharedHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedVacantOrShared}" />
					
					<form:options items="${vacantOrSharedMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeVacantOrSharedFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeVacantOrSharedAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeVacantOrSharedAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeVacantOrSharedHelpBlock" path="vacantOrShared" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeVacantOrSharedHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeVacantOrSharedHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeVacantOrSharedLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeVacantOrSharedLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeVacantOrSharedLabelTranslateToLabel" for="frmAccommodationPledgeVacantOrSharedLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="vacantOrSharedLabel" type="text" class="form-control" id="frmAccommodationPledgeVacantOrSharedLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeVacantOrSharedLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeVacantOrSharedPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeVacantOrSharedPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeVacantOrSharedPlaceHolderTranslateToLabel" for="frmAccommodationPledgeVacantOrSharedPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="vacantOrSharedPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeVacantOrSharedPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeVacantOrSharedPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeVacantOrSharedHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeVacantOrSharedHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeVacantOrSharedHelpBlockTranslateToLabel" for="frmAccommodationPledgeVacantOrSharedHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="vacantOrSharedHelpText" type="text" class="form-control" id="frmAccommodationPledgeVacantOrSharedHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeVacantOrSharedHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeOtherAmenitiesFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeOtherAmenitiesLabel" for="frmAccommodationPledgeOtherAmenities" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeOtherAmenitiesLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeOtherAmenitiesPlaceHolder" var="frmAccommodationPledgeOtherAmenitiesPlaceHolder"/>    
    
				<form:textarea path="otherAmenities" data-display-name="Description of other Amenities" data-minlength="0" data-required="false" rows="5" maxlength="500" class="form-control" id="frmAccommodationPledgeOtherAmenities" placeholder="${frmAccommodationPledgeOtherAmenitiesPlaceHolder}" aria-describedby="frmAccommodationPledgeOtherAmenitiesHelpBlock" data-validate-key-press="true" />
    
				<span id="frmAccommodationPledgeOtherAmenitiesFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeOtherAmenitiesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeOtherAmenitiesAlertBlockText"></span>
				</div>
			</div>
				<span id="frmAccommodationPledgeOtherAmenitiesCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeOtherAmenitiesHelpBlock" path="otherAmenities" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeOtherAmenitiesHelpBlock" class="help-block col-sm-9"><spring:message code="frmAccommodationPledgeOtherAmenitiesHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeOtherAmenitiesLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeOtherAmenitiesLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeOtherAmenitiesLabelTranslateToLabel" for="frmAccommodationPledgeOtherAmenitiesLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="otherAmenitiesLabel" type="text" class="form-control" id="frmAccommodationPledgeOtherAmenitiesLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeOtherAmenitiesLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeOtherAmenitiesPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeOtherAmenitiesPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeOtherAmenitiesPlaceHolderTranslateToLabel" for="frmAccommodationPledgeOtherAmenitiesPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="otherAmenitiesPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeOtherAmenitiesPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeOtherAmenitiesPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeOtherAmenitiesHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeOtherAmenitiesHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeOtherAmenitiesHelpBlockTranslateToLabel" for="frmAccommodationPledgeOtherAmenitiesHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="otherAmenitiesHelpText" type="text" class="form-control" id="frmAccommodationPledgeOtherAmenitiesHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeOtherAmenitiesHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeCanYouAccommodateFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeCanYouAccommodateLabel" for="frmAccommodationPledgeCanYouAccommodate" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeCanYouAccommodateLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmAccommodationPledgeCanYouAccommodatePlaceHolder" var="unselectedCanYouAccommodate"/>
    	
				<form:select path="canYouAccommodate" data-display-name="Who can you accommodate?" data-reference-type="YouCanAccommodate" data-select-type="standalone" data-required="false" class="form-control" id="frmAccommodationPledgeCanYouAccommodate" aria-describedby="frmAccommodationPledgeCanYouAccommodateHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAccommodationPledge'), frmAccommodationPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedCanYouAccommodate}" />
					
					<form:options items="${canYouAccommodateMap}" />
					
				</form:select>
	  
				<span id="frmAccommodationPledgeCanYouAccommodateFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeCanYouAccommodateAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeCanYouAccommodateAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeCanYouAccommodateHelpBlock" path="canYouAccommodate" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeCanYouAccommodateHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAccommodationPledgeCanYouAccommodateHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCanYouAccommodateLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCanYouAccommodateLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCanYouAccommodateLabelTranslateToLabel" for="frmAccommodationPledgeCanYouAccommodateLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="canYouAccommodateLabel" type="text" class="form-control" id="frmAccommodationPledgeCanYouAccommodateLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCanYouAccommodateLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCanYouAccommodatePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCanYouAccommodatePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCanYouAccommodatePlaceHolderTranslateToLabel" for="frmAccommodationPledgeCanYouAccommodatePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="canYouAccommodatePlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeCanYouAccommodatePlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCanYouAccommodatePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeCanYouAccommodateHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeCanYouAccommodateHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeCanYouAccommodateHelpBlockTranslateToLabel" for="frmAccommodationPledgeCanYouAccommodateHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="canYouAccommodateHelpText" type="text" class="form-control" id="frmAccommodationPledgeCanYouAccommodateHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeCanYouAccommodateHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmAccommodationPledgeAdditionalInformationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmAccommodationPledgeAdditionalInformationLabel" for="frmAccommodationPledgeAdditionalInformation" class="col-sm-2 control-label"><spring:message code="frmAccommodationPledgeAdditionalInformationLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmAccommodationPledgeAdditionalInformationPlaceHolder" var="frmAccommodationPledgeAdditionalInformationPlaceHolder"/>    
    
				<form:textarea path="additionalInformation" data-display-name="Is there anything else that you would like to say about the accommodation?" data-minlength="0" data-required="false" rows="5" maxlength="500" class="form-control" id="frmAccommodationPledgeAdditionalInformation" placeholder="${frmAccommodationPledgeAdditionalInformationPlaceHolder}" aria-describedby="frmAccommodationPledgeAdditionalInformationHelpBlock" data-validate-key-press="true" />
    
				<span id="frmAccommodationPledgeAdditionalInformationFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmAccommodationPledgeAdditionalInformationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmAccommodationPledgeAdditionalInformationAlertBlockText"></span>
				</div>
			</div>
				<span id="frmAccommodationPledgeAdditionalInformationCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmAccommodationPledgeAdditionalInformationHelpBlock" path="additionalInformation" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmAccommodationPledgeAdditionalInformationHelpBlock" class="help-block col-sm-9"><spring:message code="frmAccommodationPledgeAdditionalInformationHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAdditionalInformationLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAdditionalInformationLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAdditionalInformationLabelTranslateToLabel" for="frmAccommodationPledgeAdditionalInformationLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationLabel" type="text" class="form-control" id="frmAccommodationPledgeAdditionalInformationLabelLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAdditionalInformationLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAdditionalInformationPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAdditionalInformationPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAdditionalInformationPlaceHolderTranslateToLabel" for="frmAccommodationPledgeAdditionalInformationPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationPlaceHolder" type="text" class="form-control" id="frmAccommodationPledgeAdditionalInformationPlaceHolderLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAdditionalInformationPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmAccommodationPledgeAdditionalInformationHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmAccommodationPledgeAdditionalInformationHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmAccommodationPledgeAdditionalInformationHelpBlockTranslateToLabel" for="frmAccommodationPledgeAdditionalInformationHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationHelpText" type="text" class="form-control" id="frmAccommodationPledgeAdditionalInformationHelpBlockLocalizer" placeholder=""/>
				<span id="frmAccommodationPledgeAdditionalInformationHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmAccommodationPledgeSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/accommodationPledgeJs.js" var="accommodationPledgeJs" />
  
<script src="${accommodationPledgeJs}"></script>

</body>
</html>

