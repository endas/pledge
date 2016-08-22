<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${servicePledgeFormModel['currentMode'] == 'ADD'}">
		<spring:message code="servicepledge.form.header" var="headerText"/>
	</c:when>
	<c:when test="${servicePledgeFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="servicepledge.form.header" var="headerText"/>
	</c:when>
	<c:when test="${servicePledgeFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="servicepledge.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="servicepledge.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="servicepledge.form.title" var="title"/>	
<jsp:include page="../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="servicePledge" />
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
	
	<spring:message code="frmServicePledgePledgeServiceLevelOnePlaceHolder" var="unselectedPledgeServiceLevelOne"/>
    
	<spring:message code="frmServicePledgePledgeServiceLevelTwoPlaceHolder" var="unselectedPledgeServiceLevelTwo"/>
    
	<spring:message code="frmServicePledgePledgeServiceLevelThreePlaceHolder" var="unselectedPledgeServiceLevelThree"/>
    
	<spring:message code="frmServicePledgePledgeServiceHoursPerWeekPlaceHolder" var="unselectedPledgeServiceHoursPerWeek"/>
    
	<spring:url value="/servicepledge/translate" var="servicePledgeActionUrl" />
	  
	<form:form id="frmServicePledge" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="servicePledgeTranslationFormModel" action="${servicePledgeActionUrl}">

		<form:hidden id="frmServicePledgeServicePledgeId" path="id" />
		
		<form:hidden id="frmServicePledgeServicePledgeViewId" path="viewId" />
		
		<form:hidden id="frmServicePledgeMode" path="currentMode" />
		
		<input type="hidden" id="frmServicePledgeLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmServicePledgeLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="servicepledge.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="servicepledge.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="servicepledge.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="servicepledge.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="servicepledge.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="servicepledge.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="servicepledge.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="servicepledge.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="servicepledge.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
    <section id="servicePledgeFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="servicepledge.form.pageheader.servicepledgeformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="servicePledgeFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="servicepledge.form.panel.servicepledgeinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		  <div id="frmServicePledgePledgeServiceLevelOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgePledgeServiceLevelOneLabel" for="frmServicePledgePledgeServiceLevelOne" class="col-sm-2 control-label"><spring:message code="frmServicePledgePledgeServiceLevelOneLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmServicePledgePledgeServiceLevelOnePlaceHolder" var="unselectedPledgeServiceLevelOne"/>
    	
				<form:select path="pledgeServiceLevelOne" data-display-name="Your Service" data-reference-type="PledgeServiceLevelOne" data-select-type="standalone" data-required="false" class="form-control" id="frmServicePledgePledgeServiceLevelOne" aria-describedby="frmServicePledgePledgeServiceLevelOneHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledgePledgeServiceLevelTwo'), frmServicePledgePledgeServiceLevelTwoBuffer, 'PledgeServiceLevelTwo', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedPledgeServiceLevelOne}" />
					
					<form:options items="${pledgeServiceLevelOneMap}" />
					
				</form:select>
	  
				<span id="frmServicePledgePledgeServiceLevelOneFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgePledgeServiceLevelOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgePledgeServiceLevelOneAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgePledgeServiceLevelOneHelpBlock" path="pledgeServiceLevelOne" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgePledgeServiceLevelOneHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmServicePledgePledgeServiceLevelOneHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelOneLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelOneLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelOneLabelTranslateToLabel" for="frmServicePledgePledgeServiceLevelOneLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelOneLabel" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelOneLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelOneLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelOnePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelOnePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelOnePlaceHolderTranslateToLabel" for="frmServicePledgePledgeServiceLevelOnePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelOnePlaceHolder" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelOnePlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelOnePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelOneHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelOneHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelOneHelpBlockTranslateToLabel" for="frmServicePledgePledgeServiceLevelOneHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelOneHelpText" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelOneHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelOneHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmServicePledgePledgeServiceLevelTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgePledgeServiceLevelTwoLabel" for="frmServicePledgePledgeServiceLevelTwo" class="col-sm-2 control-label"><spring:message code="frmServicePledgePledgeServiceLevelTwoLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmServicePledgePledgeServiceLevelTwoPlaceHolder" var="unselectedPledgeServiceLevelTwo"/>
    	
				<form:select path="pledgeServiceLevelTwo" data-display-name="" data-reference-type="PledgeServiceLevelTwo" data-select-type="standalone" data-required="false" class="form-control" id="frmServicePledgePledgeServiceLevelTwo" aria-describedby="frmServicePledgePledgeServiceLevelTwoHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledgePledgeServiceLevelThree'), frmServicePledgePledgeServiceLevelThreeBuffer, 'PledgeServiceLevelThree', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedPledgeServiceLevelTwo}" />
					
					<form:options items="${pledgeServiceLevelTwoMap}" />
					
				</form:select>
	  
				<span id="frmServicePledgePledgeServiceLevelTwoFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgePledgeServiceLevelTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgePledgeServiceLevelTwoAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgePledgeServiceLevelTwoHelpBlock" path="pledgeServiceLevelTwo" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgePledgeServiceLevelTwoHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmServicePledgePledgeServiceLevelTwoHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelTwoLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelTwoLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelTwoLabelTranslateToLabel" for="frmServicePledgePledgeServiceLevelTwoLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelTwoLabel" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelTwoLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelTwoLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelTwoPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelTwoPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelTwoPlaceHolderTranslateToLabel" for="frmServicePledgePledgeServiceLevelTwoPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelTwoPlaceHolder" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelTwoPlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelTwoPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelTwoHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelTwoHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelTwoHelpBlockTranslateToLabel" for="frmServicePledgePledgeServiceLevelTwoHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelTwoHelpText" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelTwoHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelTwoHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmServicePledgePledgeServiceLevelThreeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgePledgeServiceLevelThreeLabel" for="frmServicePledgePledgeServiceLevelThree" class="col-sm-2 control-label"><spring:message code="frmServicePledgePledgeServiceLevelThreeLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmServicePledgePledgeServiceLevelThreePlaceHolder" var="unselectedPledgeServiceLevelThree"/>
    	
				<form:select path="pledgeServiceLevelThree" data-display-name="" data-reference-type="PledgeServiceLevelThree" data-select-type="standalone" data-required="false" class="form-control" id="frmServicePledgePledgeServiceLevelThree" aria-describedby="frmServicePledgePledgeServiceLevelThreeHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledge'), frmServicePledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedPledgeServiceLevelThree}" />
					
					<form:options items="${pledgeServiceLevelThreeMap}" />
					
				</form:select>
	  
				<span id="frmServicePledgePledgeServiceLevelThreeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgePledgeServiceLevelThreeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgePledgeServiceLevelThreeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgePledgeServiceLevelThreeHelpBlock" path="pledgeServiceLevelThree" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgePledgeServiceLevelThreeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmServicePledgePledgeServiceLevelThreeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelThreeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelThreeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelThreeLabelTranslateToLabel" for="frmServicePledgePledgeServiceLevelThreeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelThreeLabel" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelThreeLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelThreeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelThreePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelThreePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelThreePlaceHolderTranslateToLabel" for="frmServicePledgePledgeServiceLevelThreePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelThreePlaceHolder" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelThreePlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelThreePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceLevelThreeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceLevelThreeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceLevelThreeHelpBlockTranslateToLabel" for="frmServicePledgePledgeServiceLevelThreeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceLevelThreeHelpText" type="text" class="form-control" id="frmServicePledgePledgeServiceLevelThreeHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceLevelThreeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmServicePledgeAdditionalInformationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgeAdditionalInformationLabel" for="frmServicePledgeAdditionalInformation" class="col-sm-2 control-label"><spring:message code="frmServicePledgeAdditionalInformationLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmServicePledgeAdditionalInformationPlaceHolder" var="frmServicePledgeAdditionalInformationPlaceHolder"/>    
    
				<form:textarea path="additionalInformation" data-display-name="Additional Information" data-minlength="0" data-required="false" rows="5" maxlength="500" class="form-control" id="frmServicePledgeAdditionalInformation" placeholder="${frmServicePledgeAdditionalInformationPlaceHolder}" aria-describedby="frmServicePledgeAdditionalInformationHelpBlock" data-validate-key-press="true" />
    
				<span id="frmServicePledgeAdditionalInformationFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgeAdditionalInformationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgeAdditionalInformationAlertBlockText"></span>
				</div>
			</div>
				<span id="frmServicePledgeAdditionalInformationCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgeAdditionalInformationHelpBlock" path="additionalInformation" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgeAdditionalInformationHelpBlock" class="help-block col-sm-9"><spring:message code="frmServicePledgeAdditionalInformationHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgeAdditionalInformationLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgeAdditionalInformationLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgeAdditionalInformationLabelTranslateToLabel" for="frmServicePledgeAdditionalInformationLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationLabel" type="text" class="form-control" id="frmServicePledgeAdditionalInformationLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgeAdditionalInformationLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgeAdditionalInformationPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgeAdditionalInformationPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgeAdditionalInformationPlaceHolderTranslateToLabel" for="frmServicePledgeAdditionalInformationPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationPlaceHolder" type="text" class="form-control" id="frmServicePledgeAdditionalInformationPlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgeAdditionalInformationPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgeAdditionalInformationHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgeAdditionalInformationHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgeAdditionalInformationHelpBlockTranslateToLabel" for="frmServicePledgeAdditionalInformationHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationHelpText" type="text" class="form-control" id="frmServicePledgeAdditionalInformationHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgeAdditionalInformationHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmServicePledgePledgeServiceQualificationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgePledgeServiceQualificationLabel" for="frmServicePledgePledgeServiceQualification" class="col-sm-2 control-label"><spring:message code="frmServicePledgePledgeServiceQualificationLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmServicePledgePledgeServiceQualificationPlaceHolder" var="frmServicePledgePledgeServiceQualificationPlaceHolder"/>    
    
				<form:textarea path="pledgeServiceQualification" data-display-name="Qualification to provide Service" data-minlength="0" data-required="false" rows="5" maxlength="500" class="form-control" id="frmServicePledgePledgeServiceQualification" placeholder="${frmServicePledgePledgeServiceQualificationPlaceHolder}" aria-describedby="frmServicePledgePledgeServiceQualificationHelpBlock" data-validate-key-press="true" />
    
				<span id="frmServicePledgePledgeServiceQualificationFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgePledgeServiceQualificationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgePledgeServiceQualificationAlertBlockText"></span>
				</div>
			</div>
				<span id="frmServicePledgePledgeServiceQualificationCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgePledgeServiceQualificationHelpBlock" path="pledgeServiceQualification" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgePledgeServiceQualificationHelpBlock" class="help-block col-sm-9"><spring:message code="frmServicePledgePledgeServiceQualificationHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceQualificationLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceQualificationLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceQualificationLabelTranslateToLabel" for="frmServicePledgePledgeServiceQualificationLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceQualificationLabel" type="text" class="form-control" id="frmServicePledgePledgeServiceQualificationLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceQualificationLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceQualificationPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceQualificationPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceQualificationPlaceHolderTranslateToLabel" for="frmServicePledgePledgeServiceQualificationPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceQualificationPlaceHolder" type="text" class="form-control" id="frmServicePledgePledgeServiceQualificationPlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceQualificationPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceQualificationHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceQualificationHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceQualificationHelpBlockTranslateToLabel" for="frmServicePledgePledgeServiceQualificationHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceQualificationHelpText" type="text" class="form-control" id="frmServicePledgePledgeServiceQualificationHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceQualificationHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmServicePledgePledgeServiceDateAvailableFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgePledgeServiceDateAvailableLabel" for="frmServicePledgePledgeServiceDateAvailable" class="col-sm-2 control-label"><spring:message code="frmServicePledgePledgeServiceDateAvailableLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmServicePledgePledgeServiceDateAvailablePlaceHolder" var="frmServicePledgePledgeServiceDateAvailablePlaceHolder"/>    
    
				<form:input path="pledgeServiceDateAvailable" type="text" data-display-name="Date Available for Use" data-minlength="10" data-required="false" maxlength="10" class="form-control datepicker" id="frmServicePledgePledgeServiceDateAvailable" placeholder="${frmServicePledgePledgeServiceDateAvailablePlaceHolder}" aria-describedby="frmServicePledgePledgeServiceDateAvailableHelpBlock" data-data-type="date" data-validate-key-press="true" />
    
				<span id="frmServicePledgePledgeServiceDateAvailableFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgePledgeServiceDateAvailableAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgePledgeServiceDateAvailableAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgePledgeServiceDateAvailableHelpBlock" path="pledgeServiceDateAvailable" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgePledgeServiceDateAvailableHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmServicePledgePledgeServiceDateAvailableHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceDateAvailableLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceDateAvailableLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceDateAvailableLabelTranslateToLabel" for="frmServicePledgePledgeServiceDateAvailableLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceDateAvailableLabel" type="text" class="form-control" id="frmServicePledgePledgeServiceDateAvailableLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceDateAvailableLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceDateAvailablePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceDateAvailablePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceDateAvailablePlaceHolderTranslateToLabel" for="frmServicePledgePledgeServiceDateAvailablePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceDateAvailablePlaceHolder" type="text" class="form-control" id="frmServicePledgePledgeServiceDateAvailablePlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceDateAvailablePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceDateAvailableHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceDateAvailableHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceDateAvailableHelpBlockTranslateToLabel" for="frmServicePledgePledgeServiceDateAvailableHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceDateAvailableHelpText" type="text" class="form-control" id="frmServicePledgePledgeServiceDateAvailableHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceDateAvailableHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmServicePledgePledgeServiceHoursPerWeekFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmServicePledgePledgeServiceHoursPerWeekLabel" for="frmServicePledgePledgeServiceHoursPerWeek" class="col-sm-2 control-label"><spring:message code="frmServicePledgePledgeServiceHoursPerWeekLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmServicePledgePledgeServiceHoursPerWeekPlaceHolder" var="unselectedPledgeServiceHoursPerWeek"/>
    	
				<form:select path="pledgeServiceHoursPerWeek" data-display-name="Hours per week" data-reference-type="IntegerCount1to40" data-select-type="standalone" data-required="false" class="form-control" id="frmServicePledgePledgeServiceHoursPerWeek" aria-describedby="frmServicePledgePledgeServiceHoursPerWeekHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledge'), frmServicePledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedPledgeServiceHoursPerWeek}" />
					
					<form:options items="${pledgeServiceHoursPerWeekMap}" />
					
				</form:select>
	  
				<span id="frmServicePledgePledgeServiceHoursPerWeekFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmServicePledgePledgeServiceHoursPerWeekAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmServicePledgePledgeServiceHoursPerWeekAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmServicePledgePledgeServiceHoursPerWeekHelpBlock" path="pledgeServiceHoursPerWeek" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmServicePledgePledgeServiceHoursPerWeekHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmServicePledgePledgeServiceHoursPerWeekHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceHoursPerWeekLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceHoursPerWeekLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceHoursPerWeekLabelTranslateToLabel" for="frmServicePledgePledgeServiceHoursPerWeekLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceHoursPerWeekLabel" type="text" class="form-control" id="frmServicePledgePledgeServiceHoursPerWeekLabelLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceHoursPerWeekLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceHoursPerWeekPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceHoursPerWeekPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceHoursPerWeekPlaceHolderTranslateToLabel" for="frmServicePledgePledgeServiceHoursPerWeekPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceHoursPerWeekPlaceHolder" type="text" class="form-control" id="frmServicePledgePledgeServiceHoursPerWeekPlaceHolderLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceHoursPerWeekPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmServicePledgePledgeServiceHoursPerWeekHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmServicePledgePledgeServiceHoursPerWeekHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmServicePledgePledgeServiceHoursPerWeekHelpBlockTranslateToLabel" for="frmServicePledgePledgeServiceHoursPerWeekHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgeServiceHoursPerWeekHelpText" type="text" class="form-control" id="frmServicePledgePledgeServiceHoursPerWeekHelpBlockLocalizer" placeholder=""/>
				<span id="frmServicePledgePledgeServiceHoursPerWeekHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmServicePledgeSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../includes/redcrossfooter.jsp" />

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/servicePledgeJs.js" var="servicePledgeJs" />
  
<script src="${servicePledgeJs}"></script>

</body>
</html>

