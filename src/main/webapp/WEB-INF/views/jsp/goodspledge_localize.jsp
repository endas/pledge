<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${goodsPledgeFormModel['currentMode'] == 'ADD'}">
		<spring:message code="goodspledge.form.header" var="headerText"/>
	</c:when>
	<c:when test="${goodsPledgeFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="goodspledge.form.header" var="headerText"/>
	</c:when>
	<c:when test="${goodsPledgeFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="goodspledge.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="goodspledge.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="goodspledge.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="goodsPledge" />
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
	
	<spring:message code="frmGoodsPledgePledgedGoodsGoodsCategoryPlaceHolder" var="unselectedPledgedGoodsGoodsCategory"/>
    
	<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder" var="unselectedPledgedGoods"/>
    
	<spring:message code="frmGoodsPledgeGoodsConditionPlaceHolder" var="unselectedGoodsCondition"/>
    
	<spring:url value="/goodspledge/translate" var="goodsPledgeActionUrl" />
	  
	<form:form id="frmGoodsPledge" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="goodsPledgeTranslationFormModel" action="${goodsPledgeActionUrl}">

		<form:hidden id="frmGoodsPledgeGoodsPledgeId" path="id" />
		
		<form:hidden id="frmGoodsPledgeGoodsPledgeViewId" path="viewId" />
		
		<form:hidden id="frmGoodsPledgeMode" path="currentMode" />
		
		<input type="hidden" id="frmGoodsPledgeLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmGoodsPledgeLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="goodspledge.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="goodspledge.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="goodspledge.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="goodspledge.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="goodspledge.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="goodspledge.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="goodspledge.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="goodspledge.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="goodspledge.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
    <section id="goodsPledgeFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="goodspledge.form.pageheader.goodspledgeformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="goodsPledgeFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="goodspledge.form.panel.goodspledgeinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		  <div id="frmGoodsPledgePledgedGoodsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgePledgedGoodsLabel" for="frmGoodsPledgePledgedGoods" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgePledgedGoodsLabel"/></label>
		  
			<div class="col-sm-5 parent-select-container">
				
	<spring:message code="frmfrmGoodsPledgePledgedGoodsGoodsCategoryPlaceHolder" var="unselectedPledgedGoodsGoodsCategory"/>
    
	<spring:message code="frmGoodsPledgePledgedGoodsPlaceHolder" var="unselectedPledgedGoods"/>
    
      <div class="well">
				<form:select path="pledgedGoodsGoodsCategory" data-display-name="Type of Goods" data-reference-type="GoodsCategory" data-select-type="parent" data-required="false" class="form-control parent-select" id="frmGoodsPledgePledgedGoodsGoodsCategory" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgePledgedGoods'), frmGoodsPledgePledgedGoodsBuffer, 'Goods', 'Select Type of Goods')">
					<form:option value="-1" label="${unselectedPledgedGoodsGoodsCategory}" />
					
					<form:options items="${pledgedGoodsGoodsCategoryMap}" />
					
				</form:select>
      	
				<form:select path="pledgedGoods" data-display-name="Type of Goods" data-reference-type="Goods" data-select-type="child" data-required="false" class="form-control" id="frmGoodsPledgePledgedGoods" aria-describedby="frmGoodsPledgePledgedGoodsHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedPledgedGoods}" />
					
					<form:options items="${pledgedGoodsMap}" />
					
				</form:select>
	  
	  </div> <!-- class="well" -->
	  
				<span id="frmGoodsPledgePledgedGoodsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgePledgedGoodsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgePledgedGoodsAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgePledgedGoodsHelpBlock" path="pledgedGoods" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgePledgedGoodsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgePledgedGoodsHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgePledgedGoodsLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgePledgedGoodsLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgePledgedGoodsLabelTranslateToLabel" for="frmGoodsPledgePledgedGoodsLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgedGoodsLabel" type="text" class="form-control" id="frmGoodsPledgePledgedGoodsLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgePledgedGoodsLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgePledgedGoodsPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgePledgedGoodsPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgePledgedGoodsPlaceHolderTranslateToLabel" for="frmGoodsPledgePledgedGoodsPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgedGoodsPlaceHolder" type="text" class="form-control" id="frmGoodsPledgePledgedGoodsPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgePledgedGoodsPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgePledgedGoodsHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgePledgedGoodsHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgePledgedGoodsHelpBlockTranslateToLabel" for="frmGoodsPledgePledgedGoodsHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="pledgedGoodsHelpText" type="text" class="form-control" id="frmGoodsPledgePledgedGoodsHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgePledgedGoodsHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeAdditionalInformationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeAdditionalInformationLabel" for="frmGoodsPledgeAdditionalInformation" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeAdditionalInformationLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmGoodsPledgeAdditionalInformationPlaceHolder" var="frmGoodsPledgeAdditionalInformationPlaceHolder"/>    
    
				<form:textarea path="additionalInformation" data-display-name="Additional Information" data-minlength="0" data-required="false" rows="5" maxlength="500" class="form-control" id="frmGoodsPledgeAdditionalInformation" placeholder="${frmGoodsPledgeAdditionalInformationPlaceHolder}" aria-describedby="frmGoodsPledgeAdditionalInformationHelpBlock" data-validate-key-press="true" />
    
				<span id="frmGoodsPledgeAdditionalInformationFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeAdditionalInformationAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeAdditionalInformationAlertBlockText"></span>
				</div>
			</div>
				<span id="frmGoodsPledgeAdditionalInformationCountBlock" class="help-block col-sm-offset-2 col-sm-1"></span>
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeAdditionalInformationHelpBlock" path="additionalInformation" class="help-block col-sm-9" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeAdditionalInformationHelpBlock" class="help-block col-sm-9"><spring:message code="frmGoodsPledgeAdditionalInformationHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeAdditionalInformationLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeAdditionalInformationLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeAdditionalInformationLabelTranslateToLabel" for="frmGoodsPledgeAdditionalInformationLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationLabel" type="text" class="form-control" id="frmGoodsPledgeAdditionalInformationLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeAdditionalInformationLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeAdditionalInformationPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeAdditionalInformationPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeAdditionalInformationPlaceHolderTranslateToLabel" for="frmGoodsPledgeAdditionalInformationPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationPlaceHolder" type="text" class="form-control" id="frmGoodsPledgeAdditionalInformationPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeAdditionalInformationPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeAdditionalInformationHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeAdditionalInformationHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeAdditionalInformationHelpBlockTranslateToLabel" for="frmGoodsPledgeAdditionalInformationHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="additionalInformationHelpText" type="text" class="form-control" id="frmGoodsPledgeAdditionalInformationHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeAdditionalInformationHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeItemSizeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeItemSizeLabel" for="frmGoodsPledgeItemSize" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeItemSizeLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmGoodsPledgeItemSizePlaceHolder" var="frmGoodsPledgeItemSizePlaceHolder"/>    
    
				<form:input path="itemSize" type="text" data-display-name="Package Size" data-minlength="0" data-required="false" maxlength="500" class="form-control" id="frmGoodsPledgeItemSize" placeholder="${frmGoodsPledgeItemSizePlaceHolder}" aria-describedby="frmGoodsPledgeItemSizeHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmGoodsPledgeItemSizeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeItemSizeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeItemSizeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeItemSizeHelpBlock" path="itemSize" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeItemSizeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeItemSizeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeItemSizeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeItemSizeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeItemSizeLabelTranslateToLabel" for="frmGoodsPledgeItemSizeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="itemSizeLabel" type="text" class="form-control" id="frmGoodsPledgeItemSizeLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeItemSizeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeItemSizePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeItemSizePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeItemSizePlaceHolderTranslateToLabel" for="frmGoodsPledgeItemSizePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="itemSizePlaceHolder" type="text" class="form-control" id="frmGoodsPledgeItemSizePlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeItemSizePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeItemSizeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeItemSizeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeItemSizeHelpBlockTranslateToLabel" for="frmGoodsPledgeItemSizeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="itemSizeHelpText" type="text" class="form-control" id="frmGoodsPledgeItemSizeHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeItemSizeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeGoodsConditionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsConditionLabel" for="frmGoodsPledgeGoodsCondition" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsConditionLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsConditionPlaceHolder" var="unselectedGoodsCondition"/>
    	
				<form:select path="goodsCondition" data-display-name="Condition" data-reference-type="GoodsCondition" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCondition" aria-describedby="frmGoodsPledgeGoodsConditionHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsCondition}" />
					
					<form:options items="${goodsConditionMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsConditionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsConditionAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsConditionAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsConditionHelpBlock" path="goodsCondition" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsConditionHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsConditionHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsConditionLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsConditionLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsConditionLabelTranslateToLabel" for="frmGoodsPledgeGoodsConditionLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsConditionLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsConditionLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsConditionLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsConditionPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsConditionPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsConditionPlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsConditionPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsConditionPlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsConditionPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsConditionPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsConditionHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsConditionHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsConditionHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsConditionHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsConditionHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsConditionHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsConditionHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeNumberOfItemsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeNumberOfItemsLabel" for="frmGoodsPledgeNumberOfItems" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeNumberOfItemsLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmGoodsPledgeNumberOfItemsPlaceHolder" var="frmGoodsPledgeNumberOfItemsPlaceHolder"/>    
    
				<form:input path="numberOfItems" type="text" data-display-name="Number of Items of this type" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmGoodsPledgeNumberOfItems" placeholder="${frmGoodsPledgeNumberOfItemsPlaceHolder}" aria-describedby="frmGoodsPledgeNumberOfItemsHelpBlock" data-data-type="long" data-validate-key-press="true" onpaste="return checkPastedDataIsNumberValidAndRenderErrorMessage(event, this, document.getElementById('frmGoodsPledgeNumberOfItemsJavascriptErrorDisplay'), 'The value that you attempted to paste into Number of Items of this type can only contain digits 0-9', 'Valid')" />
    
				<span id="frmGoodsPledgeNumberOfItemsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeNumberOfItemsAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeNumberOfItemsAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeNumberOfItemsHelpBlock" path="numberOfItems" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeNumberOfItemsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeNumberOfItemsHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeNumberOfItemsLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeNumberOfItemsLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeNumberOfItemsLabelTranslateToLabel" for="frmGoodsPledgeNumberOfItemsLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="numberOfItemsLabel" type="text" class="form-control" id="frmGoodsPledgeNumberOfItemsLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeNumberOfItemsLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeNumberOfItemsPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeNumberOfItemsPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeNumberOfItemsPlaceHolderTranslateToLabel" for="frmGoodsPledgeNumberOfItemsPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="numberOfItemsPlaceHolder" type="text" class="form-control" id="frmGoodsPledgeNumberOfItemsPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeNumberOfItemsPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeNumberOfItemsHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeNumberOfItemsHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeNumberOfItemsHelpBlockTranslateToLabel" for="frmGoodsPledgeNumberOfItemsHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="numberOfItemsHelpText" type="text" class="form-control" id="frmGoodsPledgeNumberOfItemsHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeNumberOfItemsHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmGoodsPledgeSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/goodsPledgeJs.js" var="goodsPledgeJs" />
  
<script src="${goodsPledgeJs}"></script>

</body>
</html>

