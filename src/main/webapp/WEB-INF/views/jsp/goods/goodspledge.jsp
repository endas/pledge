<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<jsp:include page="../includes/header.jsp">
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
    
	<spring:message code="frmGoodsPledgeGoodsConditionPlaceHolder" var="unselectedGoodsCondition"/>
    
	<spring:message code="frmGoodsPledgeGoodsQuantityPlaceHolder" var="unselectedGoodsQuantity"/>
    
	<spring:url value="/goodspledge/post" var="goodsPledgeActionUrl" />
	  
	<form:form id="frmGoodsPledge" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="goodsPledgeFormModel" action="${goodsPledgeActionUrl}">

		<form:hidden id="frmGoodsPledgeGoodsPledgeId" path="id" />
		
		<form:hidden id="frmGoodsPledgeMode" path="currentMode" />
		
		<input type="hidden" id="frmGoodsPledgeLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmGoodsPledgeLoadedFeedbackCss" value="${css}" />
    
    
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
    	
				<form:select path="goodsCategoryOne" data-display-name="Goods Category One" data-reference-type="GoodsCategoryOne" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCategoryOne" aria-describedby="frmGoodsPledgeGoodsCategoryOneHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
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
      
		  <div id="frmGoodsPledgeGoodsCategoryTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmGoodsPledgeGoodsCategoryTwoLabel" for="frmGoodsPledgeGoodsCategoryTwo" class="col-sm-2 control-label"><spring:message code="frmGoodsPledgeGoodsCategoryTwoLabel"/></label>
		  
			<div class="col-sm-5 select-container">
				
	<spring:message code="frmGoodsPledgeGoodsCategoryTwoPlaceHolder" var="unselectedGoodsCategoryTwo"/>
    	
				<form:select path="goodsCategoryTwo" data-display-name="Goods Category Two" data-reference-type="GoodsCategoryTwo" data-select-type="standalone" data-required="false" class="form-control" id="frmGoodsPledgeGoodsCategoryTwo" aria-describedby="frmGoodsPledgeGoodsCategoryTwoHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmGoodsPledge'), frmGoodsPledgeBuffer, '', 'Select placeholder')"
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
      

				<div
						class="form-group has-feedback ${status.error ? 'has-error' : ''}">

					<form:label path="flaggedIssue"
								class="col-sm-2 control-label"><spring:message
							code="serviceplegde.flaggedIssue"/></form:label>

					<div class="col-sm-10">
							<%--todo: add proper translation mechanism--%>
						<form:select path="flaggedIssue" class="form-control">
							<c:forEach items="${flaggedIssues}" var="issue">
								<spring:message code="${issue.name}" var="label"/>
								<form:option value="${issue.code}" label="${label}"/>
							</c:forEach>
						</form:select>


					</div>
					<c:choose>
						<c:when test="${status.error}">
							<form:errors path="flaggedIssue" class="help-block col-sm-9"/>
						</c:when>
					</c:choose>
				</div>
				<div class="form-group has-feedback ${status.error ? 'has-error' : ''}"
					<sec:authorize access="hasRole('ROLE_ADMIN')">class="form-group has-feedback  ${status.error ? 'has-error' : ''}"</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_ADMIN')">class="hidden"</sec:authorize>>

						<form:label path="status" class="col-sm-2 control-label">
							<spring:message code="frmPledgeStatusLabel" />
						</form:label>
						<div class="col-sm-10">
						
						
						<form:select path="status" data-display-name="Status"
								data-reference-type="PledgeStatus"
								data-select-type="standalone" data-required="true"
								class="form-control" id="frmPledgeStatus"
								aria-describedby="frmpledgeStatusHelpBlock"
								onchange="">
								<form:options items="${statusMap}" />
						</form:select>
						</div>
						<c:choose>
							<c:when test="${status.error}">
								<form:errors path="status" class="help-block col-sm-9" />
							</c:when>
						</c:choose>
				
					</div>
      
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
<jsp:include page="../includes/redcrossfooter.jsp" />

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/goodsPledgeJs.js" var="goodsPledgeJs" />
  
<script src="${goodsPledgeJs}"></script>

</body>
</html>

