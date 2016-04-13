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
		    
		<spring:bind path="pledgedGoods">
      
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
      
		</spring:bind>
      
		<spring:bind path="additionalInformation">
      
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
      
		</spring:bind>
      
		<spring:bind path="itemSize">
      
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
      
		</spring:bind>
      
		<spring:bind path="goodsCondition">
      
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
      
		</spring:bind>
      
		<spring:bind path="numberOfItems">
      
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
      
		</spring:bind>
      
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

