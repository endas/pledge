<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<spring:message code="servicepledge.form.header" var="headerText"/>
<spring:message code="servicepledge.form.title" var="title"/>
<jsp:include page="../includes/header.jsp">
    <jsp:param name="title" value="${title}"/>
    <jsp:param name="beanName" value="servicePledge"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-formhelpers/2.3.0/css/bootstrap-formhelpers.css">
<body>

<spring:url value="/landingwebpage" var="urlHome"/>
<spring:url value="/entitylist" var="urlAppHome"/>
<spring:url value="/resources/images/redcross-brand-logo.png" var="headerLogo"/>
<nav class="navbar navbar-fixed-top navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
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

<spring:url value="/servicepledge/post" var="servicePledgeActionUrl"/>

<form:form id="frmServicePledge" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
           modelAttribute="servicePledgeFormModel" action="${servicePledgeActionUrl}">

    <form:hidden id="frmServicePledgeServicePledgeId" path="id"/>

    <form:hidden id="frmServicePledgeMode" path="currentMode"/>

    <input type="hidden" id="frmServicePledgeLoadedFeedbackMessage" value="${msg}"/>
    <input type="hidden" id="frmServicePledgeLoadedFeedbackCss" value="${css}"/>


    <section id="servicePledgeFormHeaderSection" class="">
        <div class="container">
            <div class="page-header">
                <h1><spring:message code="servicepledge.form.pageheader.servicepledgeformheader.headertext"/></h1>
            </div>
        </div>
    </section>
    <!-- id="servicePledgeFormHeaderSection -->

    <div class="container">
        <div class="panel panel-default">

            <div class="panel-heading"><h2><spring:message
                    code="servicepledge.form.panel.servicepledgeinputspanel.headertext"/></h2></div>

            <div class="panel-body">


                    <div id="frmServicePledgePledgeServiceLevelOneFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                        <form:label path="pledgeServiceLevelOne" class="col-sm-2 control-label" >
                        <spring:message
                                code="frmServicePledgePledgeServiceLevelOneLabel"/></form:label>

                        <div class="col-sm-5 select-container">

                            <spring:message code="frmServicePledgePledgeServiceLevelOnePlaceHolder"
                                            var="unselectedPledgeServiceLevelOne"/>

                            <form:select path="pledgeServiceLevelOne" data-display-name="Your Service"
                                         data-reference-type="PledgeServiceLevelOne" data-select-type="standalone"
                                         data-required="false" class="form-control"
                                         id="frmServicePledgePledgeServiceLevelOne"
                                         aria-describedby="frmServicePledgePledgeServiceLevelOneHelpBlock"
                                         onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledgePledgeServiceLevelTwo'), frmServicePledgePledgeServiceLevelTwoBuffer, 'PledgeServiceLevelTwo', 'Select placeholder')"
                            >
                                <form:option value="-1" label="${unselectedPledgeServiceLevelOne}"/>

                                <form:options items="${pledgeServiceLevelOneMap}"/>

                            </form:select>

                            <span id="frmServicePledgePledgeServiceLevelOneFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceLevelOneAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceLevelOneAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceLevelOneHelpBlock"
                                             path="pledgeServiceLevelOne" class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceLevelOneHelpBlock"
                                      class="help-block col-sm-offset-2 col-sm-10"><spring:message
                                        code="frmServicePledgePledgeServiceLevelOneHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>



                    <div id="frmServicePledgePledgeServiceLevelTwoFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgePledgeServiceLevelTwoLabel"
                               for="frmServicePledgePledgeServiceLevelTwo"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgePledgeServiceLevelTwoLabel"/></label>

                        <div class="col-sm-5 select-container">

                            <spring:message code="frmServicePledgePledgeServiceLevelTwoPlaceHolder"
                                            var="unselectedPledgeServiceLevelTwo"/>

                            <form:select path="pledgeServiceLevelTwo" data-display-name=""
                                         data-reference-type="PledgeServiceLevelTwo" data-select-type="standalone"
                                         data-required="false" class="form-control"
                                         id="frmServicePledgePledgeServiceLevelTwo"
                                         aria-describedby="frmServicePledgePledgeServiceLevelTwoHelpBlock"
                                         onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledgePledgeServiceLevelThree'), frmServicePledgePledgeServiceLevelThreeBuffer, 'PledgeServiceLevelThree', 'Select placeholder')"
                            >
                                <form:option value="-1" label="${unselectedPledgeServiceLevelTwo}"/>

                                <form:options items="${pledgeServiceLevelTwoMap}"/>

                            </form:select>

                            <span id="frmServicePledgePledgeServiceLevelTwoFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceLevelTwoAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceLevelTwoAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceLevelTwoHelpBlock"
                                             path="pledgeServiceLevelTwo" class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceLevelTwoHelpBlock"
                                      class="help-block col-sm-offset-2 col-sm-10"><spring:message
                                        code="frmServicePledgePledgeServiceLevelTwoHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>



                    <div id="frmServicePledgePledgeServiceLevelThreeFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''} collapse">

                        <label id="frmServicePledgePledgeServiceLevelThreeLabel"
                               for="frmServicePledgePledgeServiceLevelThree"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgePledgeServiceLevelThreeLabel"/></label>

                        <div class="col-sm-5 select-container">

                            <spring:message code="frmServicePledgePledgeServiceLevelThreePlaceHolder"
                                            var="unselectedPledgeServiceLevelThree"/>

                            <form:select path="pledgeServiceLevelThree" data-display-name=""
                                         data-reference-type="PledgeServiceLevelThree" data-select-type="standalone"
                                         data-required="false" class="form-control"
                                         id="frmServicePledgePledgeServiceLevelThree"
                                         aria-describedby="frmServicePledgePledgeServiceLevelThreeHelpBlock"
                                         onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledge'), frmServicePledgeBuffer, '', 'Select placeholder')"
                            >
                                <form:option value="-1" label="${unselectedPledgeServiceLevelThree}"/>

                                <form:options items="${pledgeServiceLevelThreeMap}"/>

                            </form:select>

                            <span id="frmServicePledgePledgeServiceLevelThreeFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceLevelThreeAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceLevelThreeAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceLevelThreeHelpBlock"
                                             path="pledgeServiceLevelThree"
                                             class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceLevelThreeHelpBlock"
                                      class="help-block col-sm-offset-2 col-sm-10"><spring:message
                                        code="frmServicePledgePledgeServiceLevelThreeHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>



                    <div id="frmServicePledgeAdditionalInformationFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgeAdditionalInformationLabel"
                               for="frmServicePledgeAdditionalInformation"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgeAdditionalInformationLabel"/></label>

                        <div class="col-sm-10">

                            <spring:message code="frmServicePledgeAdditionalInformationPlaceHolder"
                                            var="frmServicePledgeAdditionalInformationPlaceHolder"/>

                            <form:textarea path="additionalInformation" data-display-name="Additional Information"
                                           data-minlength="0" data-required="false" rows="5" maxlength="500"
                                           class="form-control" id="frmServicePledgeAdditionalInformation"
                                           placeholder="${frmServicePledgeAdditionalInformationPlaceHolder}"
                                           aria-describedby="frmServicePledgeAdditionalInformationHelpBlock"
                                           data-validate-key-press="true"/>

                            <span id="frmServicePledgeAdditionalInformationFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgeAdditionalInformationAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgeAdditionalInformationAlertBlockText"></span>
                            </div>
                        </div>
                        <span id="frmServicePledgeAdditionalInformationCountBlock"
                              class="help-block col-sm-offset-2 col-sm-1"></span>
                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgeAdditionalInformationHelpBlock"
                                             path="additionalInformation" class="help-block col-sm-9"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgeAdditionalInformationHelpBlock"
                                      class="help-block col-sm-9"><spring:message
                                        code="frmServicePledgeAdditionalInformationHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>


                    <div id="frmServicePledgePledgeServiceQualificationFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgePledgeServiceQualificationLabel"
                               for="frmServicePledgePledgeServiceQualification"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgePledgeServiceQualificationLabel"/></label>

                        <div class="col-sm-10">

                            <spring:message code="frmServicePledgePledgeServiceQualificationPlaceHolder"
                                            var="frmServicePledgePledgeServiceQualificationPlaceHolder"/>

                            <form:textarea path="pledgeServiceQualification"
                                           data-display-name="Qualification to provide Service" data-minlength="0"
                                           data-required="false" rows="5" maxlength="500" class="form-control"
                                           id="frmServicePledgePledgeServiceQualification"
                                           placeholder="${frmServicePledgePledgeServiceQualificationPlaceHolder}"
                                           aria-describedby="frmServicePledgePledgeServiceQualificationHelpBlock"
                                           data-validate-key-press="true"/>

                            <span id="frmServicePledgePledgeServiceQualificationFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceQualificationAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceQualificationAlertBlockText"></span>
                            </div>
                        </div>
                        <span id="frmServicePledgePledgeServiceQualificationCountBlock"
                              class="help-block col-sm-offset-2 col-sm-1"></span>
                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceQualificationHelpBlock"
                                             path="pledgeServiceQualification" class="help-block col-sm-9"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceQualificationHelpBlock"
                                      class="help-block col-sm-9"><spring:message
                                        code="frmServicePledgePledgeServiceQualificationHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>


                    <div id="frmServicePledgePledgeServiceDateAvailableFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgePledgeServiceDateAvailableLabel"
                               for="frmServicePledgePledgeServiceDateAvailable"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgePledgeServiceDateAvailableLabel"/></label>

                        <div class="col-sm-10">

                            <spring:message code="frmServicePledgePledgeServiceDateAvailablePlaceHolder"
                                            var="frmServicePledgePledgeServiceDateAvailablePlaceHolder"/>

                            <form:input path="pledgeServiceDateAvailable" type="text"
                                        data-display-name="Date Available for Use" data-minlength="10"
                                        data-required="false" maxlength="10" class="form-control datepicker"
                                        id="frmServicePledgePledgeServiceDateAvailable"
                                        placeholder="${frmServicePledgePledgeServiceDateAvailablePlaceHolder}"
                                        aria-describedby="frmServicePledgePledgeServiceDateAvailableHelpBlock"
                                        data-data-type="date" data-validate-key-press="true"/>

                            <span id="frmServicePledgePledgeServiceDateAvailableFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceDateAvailableAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceDateAvailableAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceDateAvailableHelpBlock"
                                             path="pledgeServiceDateAvailable"
                                             class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceDateAvailableHelpBlock"
                                      class="help-block col-sm-offset-2 col-sm-10"><spring:message
                                        code="frmServicePledgePledgeServiceDateAvailableHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>
				
				 <div id="frmServicePledgePledgeServiceDateAvailableToFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgePledgeServiceDateAvailableToLabel"
                               for="frmServicePledgePledgeServiceDateAvailableTo"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgePledgeServiceDateAvailableToLabel"/></label>
				
					<div class="col-sm-10">

                            <spring:message code="frmServicePledgePledgeServiceDateAvailableToPlaceHolder"
                                            var="frmServicePledgePledgeServiceDateAvailableToPlaceHolder"/>

                            <form:input path="pledgeServiceDateAvailableTo" type="text"
                                        data-display-name="Date Available for Use Until" data-minlength="10"
                                        data-required="false" maxlength="10" class="form-control datepicker"
                                        id="frmServicePledgePledgeServiceDateAvailableTo"
                                        placeholder="${frmServicePledgePledgeServiceDateAvailableToPlaceHolder}"
                                        aria-describedby="frmServicePledgePledgeServiceDateAvailableToHelpBlock"
                                        data-data-type="date" data-validate-key-press="true"/>

                            <span id="frmServicePledgePledgeServiceDateAvailableToFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceDateAvailableToAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceDateAvailableToAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceDateAvailableToHelpBlock"
                                             path="pledgeServiceDateAvailableTo"
                                             class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceDateAvailableToHelpBlock"
                                      class="help-block col-sm-offset-2 col-sm-10"><spring:message
                                        code="frmServicePledgePledgeServiceDateAvailableToHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                        
                      </div>  
				
	
                    <div id="frmServicePledgePledgeServiceHoursPerWeekFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgePledgeServiceHoursPerWeekLabel"
                               for="frmServicePledgePledgeServiceHoursPerWeek"
                               class="col-sm-2 control-label"><spring:message
                                code="frmServicePledgePledgeServiceHoursPerWeekLabel"/></label>

                        <div class="col-sm-5 select-container">

                            <spring:message code="frmServicePledgePledgeServiceHoursPerWeekPlaceHolder"
                                            var="unselectedPledgeServiceHoursPerWeek"/>

                            <form:select path="pledgeServiceHoursPerWeek" data-display-name="Hours per week"
                                         data-reference-type="IntegerCount1to40" data-select-type="standalone"
                                         data-required="false" class="form-control"
                                         id="frmServicePledgePledgeServiceHoursPerWeek"
                                         aria-describedby="frmServicePledgePledgeServiceHoursPerWeekHelpBlock"
                                         onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmServicePledge'), frmServicePledgeBuffer, '', 'Select placeholder')"
                            >
                                <form:option value="-1" label="${unselectedPledgeServiceHoursPerWeek}"/>

                                <form:options items="${pledgeServiceHoursPerWeekMap}"/>

                            </form:select>

                            <span id="frmServicePledgePledgeServiceHoursPerWeekFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceHoursPerWeekAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceHoursPerWeekAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceHoursPerWeekHelpBlock"
                                             path="pledgeServiceHoursPerWeek"
                                             class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                            <c:otherwise>
                                <span id="frmServicePledgePledgeServiceHoursPerWeekHelpBlock"
                                      class="help-block col-sm-offset-2 col-sm-10"><spring:message
                                        code="frmServicePledgePledgeServiceHoursPerWeekHelpBlock"/></span>
                            </c:otherwise>
                        </c:choose>
                    </div>
				<div id="frmServicePledgePledgeServiceTravelAbilitiesFormGroup"
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                        <label id="frmServicePledgeTravelLabel" for="frmServiceTravelAbilities" class="col-sm-2 control-label">
                        <spring:message code="frmServicePledgeTravelLabel"/></label>

                        <div class="col-sm-5 select-container">

                            <spring:message code="frmServicePledgeTravelAbilitiesPlaceHolder" var="unselectedPledgeServiceTravelAbilities"/>

                            <form:select path="pledgeServiceTravelAbilities" 
                                         data-reference-type="TravelAbilities"  data-placeholder="${unselectedPledgeServiceTravelAbilities}"
                                         data-required="false" class="form-control chosen" 
                                         id="frmServiceTravelAbilities"
                                         aria-describedby="frmServicePledgePledgeServiceTravelAbilitiesHelpBlock">

                                <form:options items="${pledgeServiceTravelAbilitiesMap}"/>

                            </form:select>

                            <span id="frmServicePledgePledgeServiceTravelAbilitiesFeedbackIcon"
                                  class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div id="frmServicePledgePledgeServiceTravelAbilitiesAlertBlock"
                                 class="alert alert-dismissible hidden" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <span id="frmServicePledgePledgeServiceTravelAbilitiesAlertBlockText"></span>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${status.error}">
                                <form:errors id="frmServicePledgePledgeServiceTravelAbilitiesHelpBlock"
                                             path="pledgeServiceTravelAbilities"
                                             class="help-block col-sm-offset-2 col-sm-10"/>
                            </c:when>
                           
                        </c:choose>
                    </div>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
               	 <spring:message code="global.select.placeholder"
		var="unselectedDefault" />
<spring:bind path="flaggedIssue">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="flaggedIssue" class="col-sm-2 control-label">
			<spring:message code="serviceplegde.flaggedIssue" />
		</form:label>
		<div class="col-sm-5 redcross-field">
			<%--todo: add proper translation mechanism--%>
			<form:select path="flaggedIssue" class="form-control">
				<c:forEach items="${flaggedIssues}" var="issue">
					<spring:message code="${issue.name}" var="label" />
					<form:option value="${issue.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="flaggedIssue"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

<spring:bind path="status">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}"
		<sec:authorize access="hasRole('ROLE_ADMIN')">class="form-group has-feedback  ${status.error ? 'has-error' : ''}"</sec:authorize>
		<sec:authorize access="!hasRole('ROLE_ADMIN')">class="hidden"</sec:authorize>>

		<form:label path="status" class="col-sm-2 control-label">
			<spring:message code="frmPledgeStatusLabel" />
		</form:label>
		<div class="col-sm-5 redcross-field">


			<form:select path="status" data-display-name="Status"
				data-reference-type="PledgeStatus" data-select-type="standalone"
				data-required="true" class="form-control" id="frmPledgeStatus"
				aria-describedby="frmpledgeStatusHelpBlock" onchange="">
				<form:options items="${statusMap}" />
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="status"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>

	</div>
</spring:bind>

<spring:bind path="activeStatus">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="activeStatus" class="col-sm-2 control-label">
			<spring:message code="activeStatus.label" />
		</form:label>
		<div class="col-sm-5 redcross-field">
			<%--todo: add proper translation mechanism--%>
			<form:select path="activeStatus" class="form-control">
				<c:forEach items="${activeStatusValues}" var="status">
					<spring:message code="${status.name}" var="label" />
					<form:option value="${status.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="activeStatus"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

<spring:bind path="pledgeTakenStatus">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="pledgeTakenStatus" class="col-sm-2 control-label">
			<spring:message code="pledgeTakenStatus.label" />
		</form:label>
		<div class="col-sm-5 redcross-field">

			<form:select path="pledgeTakenStatus" class="form-control">
				<c:forEach items="${pledgeTakenStatusValues}" var="status">
					<spring:message code="${status.name}" var="label" />
					<form:option value="${status.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="activeStatus"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

<spring:bind path="verificationProgress">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="verificationProgress" class="col-sm-2 control-label">
			<spring:message code="verificationProgress.label" />
		</form:label>
		<div class="col-sm-5 redcross-field">

			<form:select path="verificationProgress" class="form-control">
				<form:option value="" label="${unselectedDefault}" />
				<c:forEach items="${verificationProgressValues}" var="status">
					<spring:message code="${status.name}" var="label" />
					<form:option value="${status.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="activeStatus"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

				</sec:authorize>
				
      
	
            </div> <!-- class="panel-body" -->
        </div> <!-- class="panel panel-default" -->
    </div>
    <!-- class="container" -->

    <div class="container">
        <div class="panel panel-default">

            <div class="panel-body">

                <button type="submit" class="btn-lg btn-primary"><spring:message
                        code="frmServicePledgeSaveButtonLabel"/></button>

            </div> <!-- class="panel-body" -->
        </div> <!-- class="panel panel-default" -->
    </div>
    <!-- class="container" -->

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>
<jsp:include page="../includes/redcrossfooter.jsp"/>

<script>
    var rootContext = "${pageContext.request.contextPath}";
</script>
<%--bootstrap-formhelpers-languages.js--%>

<spring:url value="/wro/servicePledgeJs.js" var="servicePledgeJs"/>


<script src="${servicePledgeJs}"></script>

<spring:url value="/wro/bundledJs.js" var="bundledJs"/>


<script src="${bundledJs}"></script>


</body>
</html>

