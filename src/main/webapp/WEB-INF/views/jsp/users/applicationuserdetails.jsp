<%@ page session="false"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
                <!DOCTYPE html>
                <html lang="en">
                <c:choose>
                    <c:when test="${applicationUserDetailsFormModel['currentMode'] == 'ADD'}">
                        <spring:message code="applicationuserdetails.form.header" var="headerText" />
                    </c:when>
                    <c:when test="${applicationUserDetailsFormModel['currentMode'] == 'UPDATE'}">
                        <spring:message code="applicationuserdetails.form.header" var="headerText" />
                    </c:when>
                    <c:when test="${applicationUserDetailsFormModel['currentMode'] == 'LOCALIZE'}">
                        <spring:message code="applicationuserdetails.form.header" var="headerText" />
                    </c:when>
                    <c:otherwise>
                        <spring:message code="applicationuserdetails.form.header" var="headerText" />
                    </c:otherwise>
                </c:choose>
                <spring:message code="applicationuserdetails.form.title" var="title" />
                <jsp:include page="../includes/header.jsp">
                    <jsp:param name="title" value="${title}" />
                    <jsp:param name="beanName" value="applicationUserDetails" />
                </jsp:include>

                <body>

                    <spring:url value="/landingwebpage" var="urlHome" />
                    <spring:url value="/entitylist" var="urlAppHome" />
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
                                <a class="navbar-brand" href="${urlHome}"><img src="${headerLogo}" alt="Irish Red Cross" /></a>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="javascript:logoutFormSubmit()">Logout</a></li>
                                </ul>
                            </div>
                            <!--/.nav-collapse -->
                        </div>
                    </nav>

                    <spring:message code="frmApplicationUserDetailsRepresentOrganisationPlaceHolder" var="unselectedRepresentOrganisation" />

                    <spring:message code="frmApplicationUserDetailsCountryPlaceHolder" var="unselectedCountry" />

                    <spring:url value="/applicationuserdetails/post" var="applicationUserDetailsActionUrl" />

                    <form:form id="frmApplicationUserDetails" role="form" class="form-horizontal" method="post" accept-charset="utf-8" modelAttribute="applicationUserDetailsFormModel" action="${applicationUserDetailsActionUrl}">

                        <form:hidden id="frmApplicationUserDetailsApplicationUserDetailsId" path="id" />

                        <form:hidden id="frmApplicationUserDetailsMode" path="currentMode" />

                        <input type="hidden" id="frmApplicationUserDetailsLoadedFeedbackMessage" value="${msg}" />
                        <input type="hidden" id="frmApplicationUserDetailsLoadedFeedbackCss" value="${css}" />


                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <h2><spring:message code="applicationuserdetails.form.panel.applicationuserdetailsinputspanel.headertext"/></h2></div>

                                <div class="panel-body">

                                    <div id="frmApplicationUserDetailsContactInformationInstructionsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                        <div class="col-sm-12">

                                            <spring:message code="frmApplicationUserDetailsContactInformationInstructionsPlaceHolder" var="frmApplicationUserDetailsContactInformationInstructionsPlaceHolder" />

                                            <p id="frmApplicationUserDetailsContactInformationInstructionsMessage" class="form-control-static">
                                                <spring:message code="frmApplicationUserDetailsContactInformationInstructionsMessage" />
                                            </p>

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

                                    <spring:bind path="contactName">

                                        <div id="frmApplicationUserDetailsContactNameFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsContactNameLabel" for="frmApplicationUserDetailsContactName" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsContactNameLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsContactNamePlaceHolder" var="frmApplicationUserDetailsContactNamePlaceHolder" />

                                                <form:input path="contactName" type="text" data-display-name="Contact Name" data-minlength="2" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsContactName" placeholder="${frmApplicationUserDetailsContactNamePlaceHolder}" aria-describedby="frmApplicationUserDetailsContactNameHelpBlock" data-validate-key-press="true" />

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

                                    </spring:bind>



                                    <spring:bind path="telephoneNumber">

                                        <div id="frmApplicationUserDetailsTelephoneNumberFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsTelephoneNumberLabel" for="frmApplicationUserDetailsTelephoneNumber" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsTelephoneNumberLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsTelephoneNumberPlaceHolder" var="frmApplicationUserDetailsTelephoneNumberPlaceHolder" />

                                                <form:input path="telephoneNumber" type="tel" data-display-name="Phone Number" data-minlength="7" data-required="false" maxlength="20" class="form-control" id="frmApplicationUserDetailsTelephoneNumber" placeholder="${frmApplicationUserDetailsTelephoneNumberPlaceHolder}" aria-describedby="frmApplicationUserDetailsTelephoneNumberHelpBlock" data-data-type="long" data-validate-key-press="true" />

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

                                    </spring:bind>

                                    <spring:bind path="addressOne">

                                        <div id="frmApplicationUserDetailsAddressOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsAddressOneLabel" for="frmApplicationUserDetailsAddressOne" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsAddressOneLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsAddressOnePlaceHolder" var="frmApplicationUserDetailsAddressOnePlaceHolder" />

                                                <form:input path="addressOne" type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmApplicationUserDetailsAddressOne" placeholder="${frmApplicationUserDetailsAddressOnePlaceHolder}" aria-describedby="frmApplicationUserDetailsAddressOneHelpBlock" data-validate-key-press="true" />

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

                                    </spring:bind>

                                    <spring:bind path="addressTwo">

                                        <div id="frmApplicationUserDetailsAddressTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsAddressTwoLabel" for="frmApplicationUserDetailsAddressTwo" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsAddressTwoLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmOptionalPlaceHolder" var="frmApplicationUserDetailsAddressTwoPlaceHolder" />

                                                <form:input path="addressTwo" type="text" data-display-name="Address Line 2" data-minlength="5" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsAddressTwo" placeholder="${frmApplicationUserDetailsAddressTwoPlaceHolder}" aria-describedby="frmApplicationUserDetailsAddressTwoHelpBlock" data-validate-key-press="true" />

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

                                    </spring:bind>

                                    <spring:bind path="city">

                                        <div id="frmApplicationUserDetailsCityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsCityLabel" for="frmApplicationUserDetailsCity" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsCityLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsCityPlaceHolder" var="frmApplicationUserDetailsCityPlaceHolder" />

                                                <form:input path="city" type="text" data-display-name="City/Town/Village" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsCity" placeholder="${frmApplicationUserDetailsCityPlaceHolder}" aria-describedby="frmApplicationUserDetailsCityHelpBlock" data-validate-key-press="true" />

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

                                    </spring:bind>

                                    <spring:bind path="stateProvinceRegion">

                                        <div id="frmApplicationUserDetailsStateProvinceRegionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsStateProvinceRegionLabel" for="frmApplicationUserDetailsStateProvinceRegion" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsStateProvinceRegionLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsStateProvinceRegionPlaceHolder" var="frmApplicationUserDetailsStateProvinceRegionPlaceHolder" />

                                                <form:input path="stateProvinceRegion" type="text" data-display-name="County" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsStateProvinceRegion" placeholder="${frmApplicationUserDetailsStateProvinceRegionPlaceHolder}" aria-describedby="frmApplicationUserDetailsStateProvinceRegionHelpBlock" data-validate-key-press="true" />

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

                                    </spring:bind>

                                    <spring:bind path="postCode">

                                        <div id="frmApplicationUserDetailsPostCodeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsPostCodeLabel" for="frmApplicationUserDetailsPostCode" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsPostCodeLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsPostCodePlaceHolder" var="frmApplicationUserDetailsPostCodePlaceHolder" />

                                                <form:input path="postCode" type="text" data-display-name="Eircode" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmApplicationUserDetailsPostCode" placeholder="${frmApplicationUserDetailsPostCodePlaceHolder}" aria-describedby="frmApplicationUserDetailsPostCodeHelpBlock" data-validate-key-press="true" />

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
                                                    <span id="frmApplicationUserDetailsPostCodeHelpBlock" class="help-block col-sm-offset-2 col-sm-10">
                                                    <%-- <spring:message code="frmApplicationUserDetailsPostCodeHelpBlock"/> --%>
                                                     <a class="text-link" style="text-decoration:underline" href="https://finder.eircode.ie/#/" target="_blank">Find your Eircode</a>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>

                                    <spring:bind path="country">

                                        <div id="frmApplicationUserDetailsCountryFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsCountryLabel" for="frmApplicationUserDetailsCountry" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsCountryLabel" />
                                            </label>

                                            <div class="col-sm-5 select-container">

                                                <spring:message code="frmApplicationUserDetailsCountryPlaceHolder" var="unselectedCountry" />

                                                <form:select path="country" data-display-name="Country" data-reference-type="EuropeCountry" data-select-type="standalone" data-required="true" class="form-control" id="frmApplicationUserDetailsCountry" aria-describedby="frmApplicationUserDetailsCountryHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmApplicationUserDetails'), frmApplicationUserDetailsBuffer, '', 'Select placeholder')">
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

                                    </spring:bind>

                                    <spring:bind path="emailAddress">

                                        <div id="frmApplicationUserDetailsEmailAddressFormGroup" class="hidden form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsEmailAddressLabel" for="frmApplicationUserDetailsEmailAddress" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsEmailAddressLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsEmailAddressPlaceHolder" var="frmApplicationUserDetailsEmailAddressPlaceHolder" />

                                                <form:input path="emailAddress" type="email" data-display-name="Email Address" data-minlength="5" data-required="true" maxlength="256" class="form-control" id="frmApplicationUserDetailsEmailAddress" placeholder="${frmApplicationUserDetailsEmailAddressPlaceHolder}" aria-describedby="frmApplicationUserDetailsEmailAddressHelpBlock" data-validate-key-press="true" />

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

                                    </spring:bind>
                                    <spring:bind path="representOrganisation">

                                        <div id="frmApplicationUserDetailsRepresentOrganisationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsRepresentOrganisationLabel" for="frmApplicationUserDetailsRepresentOrganisation" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsRepresentOrganisationLabel" />
                                            </label>

                                            <div class="col-sm-5 select-container">

                                                <spring:message code="frmApplicationUserDetailsRepresentOrganisationPlaceHolder" var="unselectedRepresentOrganisation" />

                                                <form:select path="representOrganisation" data-display-name="Are you pledging on behalf of an organisation?" data-reference-type="Yes_No" data-select-type="standalone" data-required="true" class="form-control" id="frmApplicationUserDetailsRepresentOrganisation" aria-describedby="frmApplicationUserDetailsRepresentOrganisationHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmApplicationUserDetails'), frmApplicationUserDetailsBuffer, '', 'Select placeholder')">
                                                    <form:option value="false" label="${unselectedRepresentOrganisation}" />

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

                                    </spring:bind>

                                    <spring:bind path="organisationName">

                                        <div id="frmApplicationUserDetailsOrganisationNameFormGroup" class="form-group has-feedback hidden ${status.error ? 'has-error' : ''}">

                                            <label id="frmApplicationUserDetailsOrganisationNameLabel" for="frmApplicationUserDetailsOrganisationName" class="col-sm-2 control-label">
                                                <spring:message code="frmApplicationUserDetailsOrganisationNameLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmApplicationUserDetailsOrganisationNamePlaceHolder" var="frmApplicationUserDetailsOrganisationNamePlaceHolder" />

                                                <form:input path="organisationName" type="text" data-display-name="Organisation Name" data-minlength="2" data-required="false" maxlength="50" class="form-control" id="frmApplicationUserDetailsOrganisationName" placeholder="${frmApplicationUserDetailsOrganisationNamePlaceHolder}" aria-describedby="frmApplicationUserDetailsOrganisationNameHelpBlock" data-validate-key-press="true" />

                                                <span id="frmApplicationUserDetailsOrganisationNameFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmApplicationUserDetailsOrganisationNameAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmApplicationUserDetailsOrganisationNameAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmApplicationUserDetailsOrganisationNameHelpBlock" path="organisationName" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmApplicationUserDetailsOrganisationNameHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserDetailsOrganisationNameHelpBlock"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>
                                </div>
                                <!-- class="panel-body" -->
                            </div>
                            <!-- class="panel panel-default" -->
                        </div>
                        <!-- class="container" -->

                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-body text-center">

                                    <button type="submit" class="btn btn-primary">
                                        <spring:message code="frmApplicationUserDetailsSaveButtonLabel" />
                                    </button>

                                </div>
                                <!-- class="panel-body" -->
                            </div>
                            <!-- class="panel panel-default" -->
                        </div>
                        <!-- class="container" -->

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form:form>
                    <jsp:include page="../includes/redcrossfooter.jsp" />

                    <script>
                        var rootContext = "${pageContext.request.contextPath}";

                    </script>


                    <spring:url value="/wro/applicationUserDetailsJs.js" var="applicationUserDetailsJs" />

                    <script src="${applicationUserDetailsJs}"></script>

                </body>

                </html>
