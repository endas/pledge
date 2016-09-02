<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                         class="form-group has-feedback ${status.error ? 'has-error' : ''}">

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

                <div
                     class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                    <form:label path="language"
                           class="col-sm-2 control-label"><spring:message
                            code="serviceplegde.language"/></form:label>

                    <div class="col-sm-10">


                        <form:select path="language" class="form-control bfh-languages"  data-language="${servicePledgeFormModel.language}" />

                    </div>
                    <c:choose>
                        <c:when test="${status.error}">
                            <form:errors path="languge" class="help-block col-sm-9"/>
                        </c:when>
                    </c:choose>
                </div>

                <div
                        class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                    <form:label path="timeLimit"
                                class="col-sm-2 control-label"><spring:message
                            code="serviceplegde.timelimit"/></form:label>

                    <div class="col-sm-10">


                        <form:input path="timeLimit" class="form-control form-control datepicker"   />

                    </div>
                    <c:choose>
                        <c:when test="${status.error}">
                            <form:errors path="timeLimit" class="help-block col-sm-9"/>
                        </c:when>
                    </c:choose>
                </div>

                <div
                        class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                    <form:label path="other"
                                class="col-sm-2 control-label"><spring:message
                            code="serviceplegde.other"/></form:label>

                    <div class="col-sm-10">


                        <form:textarea path="other" class="form-control "   />

                    </div>
                    <c:choose>
                        <c:when test="${status.error}">
                            <form:errors path="other" class="help-block col-sm-9"/>
                        </c:when>
                    </c:choose>
                </div>

                <div
                        class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                    <form:label path="accredited"
                                class="col-sm-2 control-label"><spring:message
                            code="serviceplegde.accredited"/></form:label>

                    <div class="col-sm-10">


                        <form:checkbox path="accredited" class="form-control "   />

                    </div>
                    <c:choose>
                        <c:when test="${status.error}">
                            <form:errors path="other" class="help-block col-sm-9"/>
                        </c:when>
                    </c:choose>
                </div>




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

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-formhelpers/2.3.0/js/bootstrap-formhelpers.js" ></script>


</body>
</html>

