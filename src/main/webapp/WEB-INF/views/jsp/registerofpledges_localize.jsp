<%@ page session="false"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
                <!DOCTYPE html>
                <html lang="en">
                <c:choose>
                    <c:when test="${registerOfPledgesFormModel['currentMode'] == 'ADD'}">
                        <spring:message code="registerofpledges.form.header" var="headerText" />
                    </c:when>
                    <c:when test="${registerOfPledgesFormModel['currentMode'] == 'UPDATE'}">
                        <spring:message code="registerofpledges.form.header" var="headerText" />
                    </c:when>
                    <c:when test="${registerOfPledgesFormModel['currentMode'] == 'LOCALIZE'}">
                        <spring:message code="registerofpledges.form.header" var="headerText" />
                    </c:when>
                    <c:otherwise>
                        <spring:message code="registerofpledges.form.header" var="headerText" />
                    </c:otherwise>
                </c:choose>
                <spring:message code="registerofpledges.form.title" var="title" />
                <jsp:include page="../jsp/includes/header.jsp">
                    <jsp:param name="title" value="${title}" />
                    <jsp:param name="beanName" value="registerOfPledges" />
                </jsp:include>

                <body>

                    <jsp:include page="../jsp/applicationuserdetails_create_update_dialog.jsp" />

                    <jsp:include page="accommodations/accommodationpledge_create_update_dialog.jsp" />

                    <jsp:include page="services/servicepledge_create_update_dialog.jsp" />

                    <jsp:include page="goods/goodspledge_create_update_dialog.jsp" />

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
                                    <li><a href="${urlAppHome}">App Home</a></li>
                                    <li><a href="javascript:logoutFormSubmit()">Logout</a></li>
                                </ul>
                            </div>
                            <!--/.nav-collapse -->
                        </div>
                    </nav>

                    <spring:url value="/registerofpledges/translate" var="registerOfPledgesActionUrl" />

                    <form:form id="frmRegisterOfPledges" role="form" class="form-horizontal" method="post" accept-charset="utf-8" modelAttribute="registerOfPledgesTranslationFormModel" action="${registerOfPledgesActionUrl}">

                        <form:hidden id="frmRegisterOfPledgesRegisterOfPledgesId" path="id" />

                        <form:hidden id="frmRegisterOfPledgesRegisterOfPledgesViewId" path="viewId" />

                        <form:hidden id="frmRegisterOfPledgesMode" path="currentMode" />

                        <input type="hidden" id="frmRegisterOfPledgesLoadedFeedbackMessage" value="${msg}" />
                        <input type="hidden" id="frmRegisterOfPledgesLoadedFeedbackCss" value="${css}" />


                        <div class="container">

                            <div class="well">
                                <div id="existingLocaleFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                    <label id="existingLocaleLabel" for="existingLocale" class="col-sm-2 control-label">
                                        <spring:message code="existingLocaleLabel" />
                                    </label>
                                    <div class="col-sm-4 select-container">

                                        <form:select path="${model.defaultLocale}" data-display-name="${existingLocaleSelectLabel}" data-select-type="standalone" data-required="false" class="form-control" id="existingLocale" aria-describedby="existingLocaleHelpBlock">
                                            <form:options items="${localeMap}" />
                                        </form:select>

                                        <span id="existingLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>

                                    </div>

                                    <label id="newLocaleLabel" for="newLocale" class="col-sm-2 control-label">
                                        <spring:message code="newLocaleLabel" />
                                    </label>
                                    <div class="col-sm-4 select-container">
                                        <spring:bind path="newLocale">
                                            <form:select path="newLocale" data-display-name="${newLocaleSelectLabel}" data-select-type="standalone" data-required="false" class="form-control" id="newLocale" aria-describedby="newLocaleHelpBlock">
                                                <form:options items="${localeMap}" />
                                            </form:select>
                                        </spring:bind>
                                        <span id="newLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>

                                    </div>
                                </div>
                            </div>
                            <!-- class="well" -->


                            <div class="form-group">
                                <label id="pageTitleTranslateFromLabel" class="col-sm-1 control-label left-align">
                                    <spring:message code="existingLocaleLabel" />
                                </label>
                                <p id="registerofpledges.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
                                <label id="pageTitleTranslateToLabel" for="registerofpledges.form.title.localizer.input" class="col-sm-1 control-label left-align">
                                    <spring:message code="newLocaleLabel" />
                                </label>
                                <div class="col-sm-6">
                                    <form:input path="formTitle" type="text" class="form-control" id="registerofpledges.form.title.localizer.input" placeholder="" />
                                    <span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align">
                                    <spring:message code="existingLocaleLabel" />
                                </label>
                                <p id="registerofpledges.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
                                <label id="pageHeaderTitleTranslateToLabel" for="registerofpledges.form.header.localizer.input" class="col-sm-1 control-label left-align">
                                    <spring:message code="newLocaleLabel" />
                                </label>
                                <div class="col-sm-6">
                                    <form:input path="viewTitle" type="text" class="form-control" id="registerofpledges.form.header.localizer.input" placeholder="" />
                                    <span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align">
                                    <spring:message code="existingLocaleLabel" />
                                </label>
                                <p id="registerofpledges.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
                                <label id="pageSubHeaderTitleTranslateToLabel" for="registerofpledges.form.subheader.localizer.input" class="col-sm-1 control-label left-align">
                                    <spring:message code="newLocaleLabel" />
                                </label>
                                <div class="col-sm-6">
                                    <form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="registerofpledges.form.subheader.localizer.input" placeholder="" />
                                    <span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
                                </div>
                            </div>



                        </div>
                        <!-- class="container" -->


                        <section id="registerOfPledgesFormHeaderSection" class="">
                            <div class="container">
                                <div class="page-header">
                                    <h1><spring:message code="registerofpledges.table.pageheader.registerofpledgesformheader.headertext"/></h1>
                                </div>
                            </div>
                        </section>
                        <!-- id="registerOfPledgesFormHeaderSection -->

                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <h2><spring:message code="registerofpledges.form.panel.aboutyouinputspanel.headertext"/></h2></div>

                                <div class="panel-body">

                                    <div id="frmRegisterOfPledgesContactInformationInstructionsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                        <div class="col-sm-10">

                                            <spring:message code="frmRegisterOfPledgesContactInformationInstructionsPlaceHolder" var="frmRegisterOfPledgesContactInformationInstructionsPlaceHolder" />

                                            <p id="frmRegisterOfPledgesContactInformationInstructionsMessage" class="form-control-static">
                                                <spring:message code="frmRegisterOfPledgesContactInformationInstructionsMessage" />
                                            </p>

                                            <span id="frmRegisterOfPledgesContactInformationInstructionsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                            <div id="frmRegisterOfPledgesContactInformationInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <span id="frmRegisterOfPledgesContactInformationInstructionsAlertBlockText"></span>
                                            </div>
                                        </div>

                                        <c:choose>
                                            <c:when test="${status.error}">
                                                <form:errors id="frmRegisterOfPledgesContactInformationInstructionsHelpBlock" path="contactInformationInstructions" class="help-block col-sm-offset-2 col-sm-10" />
                                            </c:when>
                                            <c:otherwise>
                                                <span id="frmRegisterOfPledgesContactInformationInstructionsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmRegisterOfPledgesContactInformationInstructionsHelpBlock"/></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="well">

                                        <div class="form-group">
                                            <label id="frmRegisterOfPledgesContactInformationInstructionsMessageTranslateFromLabel" class="col-sm-1 control-label left-align">
                                                <spring:message code="existingLocaleLabel" />
                                            </label>
                                            <p id="frmRegisterOfPledgesContactInformationInstructionsMessageLocalizerLabel" class="col-sm-4 form-control-static"></p>
                                            <label id="frmRegisterOfPledgesContactInformationInstructionsMessageTranslateToLabel" for="frmRegisterOfPledgesContactInformationInstructionsMessageLocalizer" class="col-sm-1 control-label left-align">
                                                <spring:message code="newLocaleLabel" />
                                            </label>
                                            <div class="col-sm-6">
                                                <form:textarea path="contactInformationInstructionsMessage" class="form-control" id="frmRegisterOfPledgesContactInformationInstructionsMessageLocalizer" rows="5" maxlength="2000" placeholder="" />
                                                <span id="frmRegisterOfPledgesContactInformationInstructionsMessageLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- div class="well" -->

                                    <form:hidden id="frmRegisterOfPledgesRegisterOfPledgesApplicationUserDetailsId" path="applicationUserDetails.id" />

                                    <div class="form-group">
                                        <div class="col-sm-12">

                                            <button type="button" id="frmRegisterOfPledgesApplicationUserDetailsEditButton" class="btn btn-primary pull-left btn-primary-custom" data-toggle="modal" data-backdrop="static" data-target="#applicationUserDetailsCreateUpdateModal" data-association-type="one-to-one" data-callback-display-type="inline" data-id="${registerOfPledgesFormModel.id}" data-invalid-parent-id-message="You must save the Pledge Profile before you can edit your Contact Information" data-modal-title="Edit your Contact Information" data-callback-table-body-id="applicationUserDetailsTableBody" data-property-url="applicationuserdetails">Edit your Contact Information</button>

                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsContactNameFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsContactNameLabel" for="frmApplicationUserDetailsContactName" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsContactNameLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsContactNameMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.contactName}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsRepresentOrganisationFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsRepresentOrganisationLabel" for="frmApplicationUserDetailsRepresentOrganisation" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsRepresentOrganisationLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsRepresentOrganisationMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.representOrganisationReferenceTranslation}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsEmailAddressFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsEmailAddressLabel" for="frmApplicationUserDetailsEmailAddress" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsEmailAddressLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsEmailAddressMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.emailAddress}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsTelephoneNumberFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsTelephoneNumberLabel" for="frmApplicationUserDetailsTelephoneNumber" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsTelephoneNumberLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsTelephoneNumberMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.telephoneNumber}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsAddressOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsAddressOneLabel" for="frmApplicationUserDetailsAddressOne" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsAddressOneLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsAddressOneMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.addressOne}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsAddressTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsAddressTwoLabel" for="frmApplicationUserDetailsAddressTwo" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsAddressTwoLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsAddressTwoMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.addressTwo}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsCityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsCityLabel" for="frmApplicationUserDetailsCity" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsCityLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsCityMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.city}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsStateProvinceRegionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsStateProvinceRegionLabel" for="frmApplicationUserDetailsStateProvinceRegion" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsStateProvinceRegionLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsStateProvinceRegionMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.stateProvinceRegion}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsPostCodeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsPostCodeLabel" for="frmApplicationUserDetailsPostCode" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsPostCodeLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsPostCodeMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.postCode}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                    <div id="frmApplicationUserDetailsCountryFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
                                        <label id="frmApplicationUserDetailsCountryLabel" for="frmApplicationUserDetailsCountry" class="col-sm-2 control-label">
                                            <spring:message code="frmApplicationUserDetailsCountryLabel" />
                                        </label>
                                        <div class="col-sm-10">
                                            <p id="frmApplicationUserDetailsCountryMessage" class="form-control-static">
                                                <c:out value="${registerOfPledgesFormModel.applicationUserDetails.countryReferenceTranslation}"></c:out>
                                            </p>
                                        </div>
                                    </div>

                                </div>
                                <!-- class="panel-body" -->
                            </div>
                            <!-- class="panel panel-default" -->
                        </div>
                        <!-- class="container" -->

                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <h2><spring:message code="registerofpledges.form.panel.accomodationpledgeinputspanel.headertext"/></h2></div>

                                <div class="panel-body">

                                    <div id="frmRegisterOfPledgesAccommodationPledgeInstructionsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                        <div class="col-sm-10">

                                            <spring:message code="frmRegisterOfPledgesAccommodationPledgeInstructionsPlaceHolder" var="frmRegisterOfPledgesAccommodationPledgeInstructionsPlaceHolder" />

                                            <p id="frmRegisterOfPledgesAccommodationPledgeInstructionsMessage" class="form-control-static">
                                                <spring:message code="frmRegisterOfPledgesAccommodationPledgeInstructionsMessage" />
                                            </p>

                                            <span id="frmRegisterOfPledgesAccommodationPledgeInstructionsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                            <div id="frmRegisterOfPledgesAccommodationPledgeInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <span id="frmRegisterOfPledgesAccommodationPledgeInstructionsAlertBlockText"></span>
                                            </div>
                                        </div>

                                        <c:choose>
                                            <c:when test="${status.error}">
                                                <form:errors id="frmRegisterOfPledgesAccommodationPledgeInstructionsHelpBlock" path="accommodationPledgeInstructions" class="help-block col-sm-offset-2 col-sm-10" />
                                            </c:when>
                                            <c:otherwise>
                                                <span id="frmRegisterOfPledgesAccommodationPledgeInstructionsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmRegisterOfPledgesAccommodationPledgeInstructionsHelpBlock"/></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="well">

                                        <div class="form-group">
                                            <label id="frmRegisterOfPledgesAccommodationPledgeInstructionsMessageTranslateFromLabel" class="col-sm-1 control-label left-align">
                                                <spring:message code="existingLocaleLabel" />
                                            </label>
                                            <p id="frmRegisterOfPledgesAccommodationPledgeInstructionsMessageLocalizerLabel" class="col-sm-4 form-control-static"></p>
                                            <label id="frmRegisterOfPledgesAccommodationPledgeInstructionsMessageTranslateToLabel" for="frmRegisterOfPledgesAccommodationPledgeInstructionsMessageLocalizer" class="col-sm-1 control-label left-align">
                                                <spring:message code="newLocaleLabel" />
                                            </label>
                                            <div class="col-sm-6">
                                                <form:textarea path="accommodationPledgeInstructionsMessage" class="form-control" id="frmRegisterOfPledgesAccommodationPledgeInstructionsMessageLocalizer" rows="5" maxlength="2000" placeholder="" />
                                                <span id="frmRegisterOfPledgesAccommodationPledgeInstructionsMessageLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- div class="well" -->

                                    <div class="form-group">
                                        <div class="col-sm-12">

                                            <button type="button" id="frmRegisterOfPledgesAccommodationPledgesAddNewButton" class="btn btn-primary pull-left btn-primary-custom" data-toggle="modal" data-backdrop="static" data-target="#accommodationPledgeCreateUpdateModal" data-association-type="one-to-many" data-callback-display-type="table" data-id=null data-invalid-parent-id-message="You must save the Pledge Profile before you can offer Accommodation" data-modal-title="Offer Accommodation" data-callback-table-body-id="accommodationPledgesTableBody" data-property-url="accommodationpledges">Offer Accommodation</button>

                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="accommodationPledgesTable" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Action</th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeAccommodationTypeLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeAccommodationConditionLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeNumberOfBedsLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeVacantOrSharedLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeCanYouAccommodateLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeAccommodationDateFromLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmAccommodationPledgeAccommodationDateToLabel" />
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody id="accommodationPledgesTableBody">
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- class="table-responsive" -->

                                </div>
                                <!-- class="panel-body" -->
                            </div>
                            <!-- class="panel panel-default" -->
                        </div>
                        <!-- class="container" -->

                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <h2><spring:message code="registerofpledges.form.panel.servicepledgeinputspanel.headertext"/></h2></div>

                                <div class="panel-body">

                                    <div id="frmRegisterOfPledgesServicePledgeInstructionsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                        <div class="col-sm-10">

                                            <spring:message code="frmRegisterOfPledgesServicePledgeInstructionsPlaceHolder" var="frmRegisterOfPledgesServicePledgeInstructionsPlaceHolder" />

                                            <p id="frmRegisterOfPledgesServicePledgeInstructionsMessage" class="form-control-static">
                                                <spring:message code="frmRegisterOfPledgesServicePledgeInstructionsMessage" />
                                            </p>

                                            <span id="frmRegisterOfPledgesServicePledgeInstructionsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                            <div id="frmRegisterOfPledgesServicePledgeInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <span id="frmRegisterOfPledgesServicePledgeInstructionsAlertBlockText"></span>
                                            </div>
                                        </div>

                                        <c:choose>
                                            <c:when test="${status.error}">
                                                <form:errors id="frmRegisterOfPledgesServicePledgeInstructionsHelpBlock" path="servicePledgeInstructions" class="help-block col-sm-offset-2 col-sm-10" />
                                            </c:when>
                                            <c:otherwise>
                                                <span id="frmRegisterOfPledgesServicePledgeInstructionsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmRegisterOfPledgesServicePledgeInstructionsHelpBlock"/></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="well">

                                        <div class="form-group">
                                            <label id="frmRegisterOfPledgesServicePledgeInstructionsMessageTranslateFromLabel" class="col-sm-1 control-label left-align">
                                                <spring:message code="existingLocaleLabel" />
                                            </label>
                                            <p id="frmRegisterOfPledgesServicePledgeInstructionsMessageLocalizerLabel" class="col-sm-4 form-control-static"></p>
                                            <label id="frmRegisterOfPledgesServicePledgeInstructionsMessageTranslateToLabel" for="frmRegisterOfPledgesServicePledgeInstructionsMessageLocalizer" class="col-sm-1 control-label left-align">
                                                <spring:message code="newLocaleLabel" />
                                            </label>
                                            <div class="col-sm-6">
                                                <form:textarea path="servicePledgeInstructionsMessage" class="form-control" id="frmRegisterOfPledgesServicePledgeInstructionsMessageLocalizer" rows="5" maxlength="2000" placeholder="" />
                                                <span id="frmRegisterOfPledgesServicePledgeInstructionsMessageLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- div class="well" -->

                                    <div class="form-group">
                                        <div class="col-sm-12">

                                            <button type="button" id="frmRegisterOfPledgesServicePledgesAddNewButton" class="btn btn-primary pull-left btn-primary-custom" data-toggle="modal" data-backdrop="static" data-target="#servicePledgeCreateUpdateModal" data-association-type="one-to-many" data-callback-display-type="table" data-id=null data-invalid-parent-id-message="You must save the Pledge Profile before you can offer a Skill/Service" data-modal-title="Offer a Skill/Service" data-callback-table-body-id="servicePledgesTableBody" data-property-url="servicepledges">Offer a Skill/Service</button>

                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="servicePledgesTable" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Action</th>

                                                    <th>
                                                        <spring:message code="frmServicePledgePledgeServiceDateAvailableLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmServicePledgePledgeServiceLevelOneLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmServicePledgePledgeServiceLevelTwoLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmServicePledgePledgeServiceLevelThreeLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmServicePledgePledgeServiceQualificationLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmServicePledgeAdditionalInformationLabel" />
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody id="servicePledgesTableBody">
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- class="table-responsive" -->

                                </div>
                                <!-- class="panel-body" -->
                            </div>
                            <!-- class="panel panel-default" -->
                        </div>
                        <!-- class="container" -->

                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <h2><spring:message code="registerofpledges.form.panel.goodspledgeinputspanel.headertext"/></h2></div>

                                <div class="panel-body">

                                    <div id="frmRegisterOfPledgesGoodsPledgeInstructionsFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                        <div class="col-sm-10">

                                            <spring:message code="frmRegisterOfPledgesGoodsPledgeInstructionsPlaceHolder" var="frmRegisterOfPledgesGoodsPledgeInstructionsPlaceHolder" />

                                            <p id="frmRegisterOfPledgesGoodsPledgeInstructionsMessage" class="form-control-static">
                                                <spring:message code="frmRegisterOfPledgesGoodsPledgeInstructionsMessage" />
                                            </p>

                                            <span id="frmRegisterOfPledgesGoodsPledgeInstructionsFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                            <div id="frmRegisterOfPledgesGoodsPledgeInstructionsAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <span id="frmRegisterOfPledgesGoodsPledgeInstructionsAlertBlockText"></span>
                                            </div>
                                        </div>

                                        <c:choose>
                                            <c:when test="${status.error}">
                                                <form:errors id="frmRegisterOfPledgesGoodsPledgeInstructionsHelpBlock" path="goodsPledgeInstructions" class="help-block col-sm-offset-2 col-sm-10" />
                                            </c:when>
                                            <c:otherwise>
                                                <span id="frmRegisterOfPledgesGoodsPledgeInstructionsHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmRegisterOfPledgesGoodsPledgeInstructionsHelpBlock"/></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="well">

                                        <div class="form-group">
                                            <label id="frmRegisterOfPledgesGoodsPledgeInstructionsMessageTranslateFromLabel" class="col-sm-1 control-label left-align">
                                                <spring:message code="existingLocaleLabel" />
                                            </label>
                                            <p id="frmRegisterOfPledgesGoodsPledgeInstructionsMessageLocalizerLabel" class="col-sm-4 form-control-static"></p>
                                            <label id="frmRegisterOfPledgesGoodsPledgeInstructionsMessageTranslateToLabel" for="frmRegisterOfPledgesGoodsPledgeInstructionsMessageLocalizer" class="col-sm-1 control-label left-align">
                                                <spring:message code="newLocaleLabel" />
                                            </label>
                                            <div class="col-sm-6">
                                                <form:textarea path="goodsPledgeInstructionsMessage" class="form-control" id="frmRegisterOfPledgesGoodsPledgeInstructionsMessageLocalizer" rows="5" maxlength="2000" placeholder="" />
                                                <span id="frmRegisterOfPledgesGoodsPledgeInstructionsMessageLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- div class="well" -->

                                    <div class="form-group">
                                        <div class="col-sm-12">

                                            <button type="button" id="frmRegisterOfPledgesGoodsPledgesAddNewButton" class="btn btn-primary pull-left btn-primary-custom" data-toggle="modal" data-backdrop="static" data-target="#goodsPledgeCreateUpdateModal" data-association-type="one-to-many" data-callback-display-type="table" data-id=null data-invalid-parent-id-message="You must save the Pledge Profile before you can offer Goods/items/Medicines" data-modal-title="Offer Goods/items/Medicines" data-callback-table-body-id="goodsPledgesTableBody" data-property-url="goodspledges">Offer Goods/items/Medicines</button>

                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="goodsPledgesTable" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Action</th>

                                                    <th>
                                                        <spring:message code="frmGoodsPledgeGoodsCategoryOneLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmGoodsPledgeGoodsCategoryTwoLabel" />
                                                    </th>

                                                    <th>
                                                        <spring:message code="frmGoodsPledgeGoodsCategoryThreeLabel" />
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody id="goodsPledgesTableBody">
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- class="table-responsive" -->

                                </div>
                                <!-- class="panel-body" -->
                            </div>
                            <!-- class="panel panel-default" -->
                        </div>
                        <!-- class="container" -->

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form:form>
                    <jsp:include page="../jsp/includes/redcrossfooter.jsp" />

                    <script>
                        var rootContext = "${pageContext.request.contextPath}";

                    </script>


                    <spring:url value="/wro/registerOfPledgesJs.js" var="registerOfPledgesJs" />

                    <script src="${registerOfPledgesJs}"></script>

                </body>

                </html>
