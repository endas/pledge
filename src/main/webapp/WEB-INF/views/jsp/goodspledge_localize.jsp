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
	
	<spring:message code="frmGoodsPledgeGoodsCategoryOnePlaceHolder" var="unselectedGoodsCategoryOne"/>
    
	<spring:message code="frmGoodsPledgeGoodsCategoryTwoPlaceHolder" var="unselectedGoodsCategoryTwo"/>
    
	<spring:message code="frmGoodsPledgeGoodsCategoryThreePlaceHolder" var="unselectedGoodsCategoryThree"/>
    
	<spring:message code="frmGoodsPledgeGoodsSizePlaceHolder" var="unselectedGoodsSize"/>
    
	<spring:message code="frmGoodsPledgeGoodsNewOrUsedPlaceHolder" var="unselectedGoodsNewOrUsed"/>
    
	<spring:message code="frmGoodsPledgeGoodsConditionPlaceHolder" var="unselectedGoodsCondition"/>
    
	<spring:message code="frmGoodsPledgeGoodsQuantityPlaceHolder" var="unselectedGoodsQuantity"/>
    
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
		    
		  <div id="frmGoodsPledgeGoodsCategoryOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsCategoryOneLabel" for="frmGoodsPledgeGoodsCategoryOne" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsCategoryOneLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsCategoryOnePlaceHolder" var="unselectedGoodsCategoryOne"/>
    	
				<form:select path="goodsCategoryOne" data-display-name="Goods Category One" data-reference-type="GoodsCategoryOne" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCategoryOne" aria-describedby="frmGoodsPledgeGoodsCategoryOneHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeGoodsCategoryTwo'), frmGoodsPledgeGoodsCategoryTwoBuffer, 'GoodsCategoryTwo', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsCategoryOne}" />
					
					<form:options items="${goodsCategoryOneMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsCategoryOneFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsCategoryOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsCategoryOneAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsCategoryOneHelpBlock" path="goodsCategoryOne" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsCategoryOneHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsCategoryOneHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryOneLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryOneLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryOneLabelTranslateToLabel" for="frmGoodsPledgeGoodsCategoryOneLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryOneLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryOneLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryOneLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryOnePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryOnePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryOnePlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsCategoryOnePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryOnePlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryOnePlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryOnePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryOneHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryOneHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryOneHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsCategoryOneHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryOneHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryOneHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryOneHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeGoodsCategoryTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsCategoryTwoLabel" for="frmGoodsPledgeGoodsCategoryTwo" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsCategoryTwoLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsCategoryTwoPlaceHolder" var="unselectedGoodsCategoryTwo"/>
    	
				<form:select path="goodsCategoryTwo" data-display-name="Goods Category Two" data-reference-type="GoodsCategoryTwo" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCategoryTwo" aria-describedby="frmGoodsPledgeGoodsCategoryTwoHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledgeGoodsSize'), frmGoodsPledgeGoodsSizeBuffer, 'GoodsSize', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsCategoryTwo}" />
					
					<form:options items="${goodsCategoryTwoMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsCategoryTwoFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsCategoryTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsCategoryTwoAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsCategoryTwoHelpBlock" path="goodsCategoryTwo" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsCategoryTwoHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsCategoryTwoHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryTwoLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryTwoLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryTwoLabelTranslateToLabel" for="frmGoodsPledgeGoodsCategoryTwoLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryTwoLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryTwoLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryTwoLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryTwoPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryTwoPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryTwoPlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsCategoryTwoPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryTwoPlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryTwoPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryTwoPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryTwoHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryTwoHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryTwoHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsCategoryTwoHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryTwoHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryTwoHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryTwoHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeGoodsCategoryThreeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsCategoryThreeLabel" for="frmGoodsPledgeGoodsCategoryThree" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsCategoryThreeLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsCategoryThreePlaceHolder" var="unselectedGoodsCategoryThree"/>
    	
				<form:select path="goodsCategoryThree" data-display-name="Goods Category Three" data-reference-type="GoodsCategoryThree" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCategoryThree" aria-describedby="frmGoodsPledgeGoodsCategoryThreeHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsCategoryThree}" />
					
					<form:options items="${goodsCategoryThreeMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsCategoryThreeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsCategoryThreeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsCategoryThreeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsCategoryThreeHelpBlock" path="goodsCategoryThree" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsCategoryThreeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsCategoryThreeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryThreeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryThreeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryThreeLabelTranslateToLabel" for="frmGoodsPledgeGoodsCategoryThreeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryThreeLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryThreeLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryThreeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryThreePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryThreePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryThreePlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsCategoryThreePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryThreePlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryThreePlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryThreePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsCategoryThreeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsCategoryThreeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsCategoryThreeHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsCategoryThreeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsCategoryThreeHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsCategoryThreeHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsCategoryThreeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeGoodsSizeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsSizeLabel" for="frmGoodsPledgeGoodsSize" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsSizeLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsSizePlaceHolder" var="unselectedGoodsSize"/>
    	
				<form:select path="goodsSize" data-display-name="Size" data-reference-type="GoodsSize" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsSize" aria-describedby="frmGoodsPledgeGoodsSizeHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsSize}" />
					
					<form:options items="${goodsSizeMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsSizeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsSizeAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsSizeAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsSizeHelpBlock" path="goodsSize" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsSizeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsSizeHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsSizeLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsSizeLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsSizeLabelTranslateToLabel" for="frmGoodsPledgeGoodsSizeLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsSizeLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsSizeLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsSizeLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsSizePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsSizePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsSizePlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsSizePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsSizePlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsSizePlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsSizePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsSizeHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsSizeHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsSizeHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsSizeHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsSizeHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsSizeHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsSizeHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeGoodsNewOrUsedFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsNewOrUsedLabel" for="frmGoodsPledgeGoodsNewOrUsed" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsNewOrUsedLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsNewOrUsedPlaceHolder" var="unselectedGoodsNewOrUsed"/>
    	
				<form:select path="goodsNewOrUsed" data-display-name="New/Used" data-reference-type="NewOrUsed" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsNewOrUsed" aria-describedby="frmGoodsPledgeGoodsNewOrUsedHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsNewOrUsed}" />
					
					<form:options items="${goodsNewOrUsedMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsNewOrUsedFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsNewOrUsedAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsNewOrUsedAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsNewOrUsedHelpBlock" path="goodsNewOrUsed" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsNewOrUsedHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsNewOrUsedHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsNewOrUsedLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsNewOrUsedLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsNewOrUsedLabelTranslateToLabel" for="frmGoodsPledgeGoodsNewOrUsedLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsNewOrUsedLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsNewOrUsedLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsNewOrUsedLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsNewOrUsedPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsNewOrUsedPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsNewOrUsedPlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsNewOrUsedPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsNewOrUsedPlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsNewOrUsedPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsNewOrUsedPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsNewOrUsedHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsNewOrUsedHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsNewOrUsedHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsNewOrUsedHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsNewOrUsedHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsNewOrUsedHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsNewOrUsedHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmGoodsPledgeGoodsConditionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsConditionLabel" for="frmGoodsPledgeGoodsCondition" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsConditionLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsConditionPlaceHolder" var="unselectedGoodsCondition"/>
    	
				<form:select path="goodsCondition" data-display-name="Goods Condition" data-reference-type="GoodsCondition" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCondition" aria-describedby="frmGoodsPledgeGoodsConditionHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
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
      
		  <div id="frmGoodsPledgeGoodsQuantityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsQuantityLabel" for="frmGoodsPledgeGoodsQuantity" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsQuantityLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsQuantityPlaceHolder" var="unselectedGoodsQuantity"/>
    	
				<form:select path="goodsQuantity" data-display-name="Quantity" data-reference-type="GoodsQuantity" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsQuantity" aria-describedby="frmGoodsPledgeGoodsQuantityHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
>
					<form:option value="-1" label="${unselectedGoodsQuantity}" />
					
					<form:options items="${goodsQuantityMap}" />
					
				</form:select>
	  
				<span id="frmGoodsPledgeGoodsQuantityFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmGoodsPledgeGoodsQuantityAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmGoodsPledgeGoodsQuantityAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmGoodsPledgeGoodsQuantityHelpBlock" path="goodsQuantity" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmGoodsPledgeGoodsQuantityHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmGoodsPledgeGoodsQuantityHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsQuantityLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsQuantityLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsQuantityLabelTranslateToLabel" for="frmGoodsPledgeGoodsQuantityLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsQuantityLabel" type="text" class="form-control" id="frmGoodsPledgeGoodsQuantityLabelLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsQuantityLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsQuantityPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsQuantityPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsQuantityPlaceHolderTranslateToLabel" for="frmGoodsPledgeGoodsQuantityPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsQuantityPlaceHolder" type="text" class="form-control" id="frmGoodsPledgeGoodsQuantityPlaceHolderLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsQuantityPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmGoodsPledgeGoodsQuantityHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmGoodsPledgeGoodsQuantityHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmGoodsPledgeGoodsQuantityHelpBlockTranslateToLabel" for="frmGoodsPledgeGoodsQuantityHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="goodsQuantityHelpText" type="text" class="form-control" id="frmGoodsPledgeGoodsQuantityHelpBlockLocalizer" placeholder=""/>
				<span id="frmGoodsPledgeGoodsQuantityHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
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

