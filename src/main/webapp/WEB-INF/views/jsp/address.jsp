<%@ page session="false"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
                <!DOCTYPE html>
                <html lang="en">
                <c:choose>
                    <c:when test="${addressFormModel['currentMode'] == 'ADD'}">
                        <spring:message code="address.form.header" var="headerText" />
                    </c:when>
                    <c:when test="${addressFormModel['currentMode'] == 'UPDATE'}">
                        <spring:message code="address.form.header" var="headerText" />
                    </c:when>
                    <c:when test="${addressFormModel['currentMode'] == 'LOCALIZE'}">
                        <spring:message code="address.form.header" var="headerText" />
                    </c:when>
                    <c:otherwise>
                        <spring:message code="address.form.header" var="headerText" />
                    </c:otherwise>
                </c:choose>
                <spring:message code="address.form.title" var="title" />
                <jsp:include page="../jsp/includes/header.jsp">
                    <jsp:param name="title" value="${title}" />
                    <jsp:param name="beanName" value="address" />
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
                                    <li><a href="${urlAppHome}">App Home</a></li>
                                    <li><a href="javascript:logoutFormSubmit()">Logout</a></li>
                                </ul>
                            </div>
                            <!--/.nav-collapse -->
                        </div>
                    </nav>

                    <spring:message code="frmAddressCountryPlaceHolder" var="unselectedCountry" />

                    <spring:url value="/address/post" var="addressActionUrl" />

                    <form:form id="frmAddress" role="form" class="form-horizontal" method="post" accept-charset="utf-8" modelAttribute="addressFormModel" action="${addressActionUrl}">

                        <form:hidden id="frmAddressAddressId" path="id" />

                        <form:hidden id="frmAddressMode" path="currentMode" />

                        <input type="hidden" id="frmAddressLoadedFeedbackMessage" value="${msg}" />
                        <input type="hidden" id="frmAddressLoadedFeedbackCss" value="${css}" />


                        <section id="addressFormHeaderSection" class="">
                            <div class="container">
                                <div class="page-header">
                                    <h1><spring:message code="address.form.pageheader.addressformheader.headertext"/></h1>
                                </div>
                            </div>
                        </section>
                        <!-- id="addressFormHeaderSection -->

                        <div class="container">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <h2><spring:message code="address.form.panel.addressforminputspanel.headertext"/></h2></div>

                                <div class="panel-body">

                                    <spring:bind path="addressOne">

                                        <div id="frmAddressAddressOneFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmAddressAddressOneLabel" for="frmAddressAddressOne" class="col-sm-2 control-label">
                                                <spring:message code="frmAddressAddressOneLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmAddressAddressOnePlaceHolder" var="frmAddressAddressOnePlaceHolder" />

                                                <form:input path="addressOne" type="text" data-display-name="Address Line 1" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAddressAddressOne" placeholder="${frmAddressAddressOnePlaceHolder}" aria-describedby="frmAddressAddressOneHelpBlock" data-validate-key-press="true" />

                                                <span id="frmAddressAddressOneFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmAddressAddressOneAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmAddressAddressOneAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmAddressAddressOneHelpBlock" path="addressOne" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmAddressAddressOneHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressAddressOneHelpBlock"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>

                                    <spring:bind path="addressTwo">

                                        <div id="frmAddressAddressTwoFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmAddressAddressTwoLabel" for="frmAddressAddressTwo" class="col-sm-2 control-label">
                                                <spring:message code="frmAddressAddressTwoLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmAddressAddressTwoPlaceHolder" var="frmAddressAddressTwoPlaceHolder" />

                                                <form:input path="addressTwo" type="text" data-display-name="Address Line 2" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmAddressAddressTwo" placeholder="${frmAddressAddressTwoPlaceHolder}" aria-describedby="frmAddressAddressTwoHelpBlock" data-validate-key-press="true" />

                                                <span id="frmAddressAddressTwoFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmAddressAddressTwoAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmAddressAddressTwoAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmAddressAddressTwoHelpBlock" path="addressTwo" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmAddressAddressTwoHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressAddressTwoHelpBlock"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>

                                    <spring:bind path="city">

                                        <div id="frmAddressCityFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmAddressCityLabel" for="frmAddressCity" class="col-sm-2 control-label">
                                                <spring:message code="frmAddressCityLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmAddressCityPlaceHolder" var="frmAddressCityPlaceHolder" />

                                                <form:input path="city" type="text" data-display-name="Town/Townland/City" data-minlength="0" data-required="false" maxlength="50" class="form-control" id="frmAddressCity" placeholder="${frmAddressCityPlaceHolder}" aria-describedby="frmAddressCityHelpBlock" data-validate-key-press="true" />

                                                <span id="frmAddressCityFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmAddressCityAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmAddressCityAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmAddressCityHelpBlock" path="city" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmAddressCityHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressCityHelpBlock"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>

                                    <spring:bind path="stateProvinceRegion">

                                        <div id="frmAddressStateProvinceRegionFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmAddressStateProvinceRegionLabel" for="frmAddressStateProvinceRegion" class="col-sm-2 control-label">
                                                <spring:message code="frmAddressStateProvinceRegionLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmAddressStateProvinceRegionPlaceHolder" var="frmAddressStateProvinceRegionPlaceHolder" />

                                                <form:input path="stateProvinceRegion" type="text" data-display-name="State/Province/Region" data-minlength="0" data-required="false" maxlength="50" class="form-control" id="frmAddressStateProvinceRegion" placeholder="${frmAddressStateProvinceRegionPlaceHolder}" aria-describedby="frmAddressStateProvinceRegionHelpBlock" data-validate-key-press="true" />

                                                <span id="frmAddressStateProvinceRegionFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmAddressStateProvinceRegionAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmAddressStateProvinceRegionAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmAddressStateProvinceRegionHelpBlock" path="stateProvinceRegion" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmAddressStateProvinceRegionHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressStateProvinceRegionHelpBlock"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>

                                    <spring:bind path="postCode">

                                        <div id="frmAddressPostCodeFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmAddressPostCodeLabel" for="frmAddressPostCode" class="col-sm-2 control-label">
                                                <spring:message code="frmAddressPostCodeLabel" />
                                            </label>

                                            <div class="col-sm-10">

                                                <spring:message code="frmAddressPostCodePlaceHolder" var="frmAddressPostCodePlaceHolder" />

                                                <form:input path="postCode" type="text" data-display-name="Post Code" data-minlength="0" data-required="false" maxlength="10" class="form-control" id="frmAddressPostCode" placeholder="${frmAddressPostCodePlaceHolder}" aria-describedby="frmAddressPostCodeHelpBlock" data-validate-key-press="true" />

                                                <span id="frmAddressPostCodeFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmAddressPostCodeAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmAddressPostCodeAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmAddressPostCodeHelpBlock" path="postCode" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmAddressPostCodeHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressPostCodeHelpBlock"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </spring:bind>

                                    <spring:bind path="country">

                                        <div id="frmAddressCountryFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">

                                            <label id="frmAddressCountryLabel" for="frmAddressCountry" class="col-sm-2 control-label">
                                                <spring:message code="frmAddressCountryLabel" />
                                            </label>

                                            <div class="col-sm-5 select-container">

                                                <spring:message code="frmAddressCountryPlaceHolder" var="unselectedCountry" />

                                                <form:select path="country" data-display-name="Country" data-reference-type="EuropeCountry" data-select-type="standalone" data-required="true" class="form-control" id="frmAddressCountry" aria-describedby="frmAddressCountryHelpBlock" onchange="loadChildSelectAndSelectValue(this, document.getElementById('frmAddress'), frmAddressBuffer, '', 'Select placeholder')">
                                                    <form:option value="-1" label="${unselectedCountry}" />

                                                    <form:options items="${countryMap}" />

                                                </form:select>

                                                <span id="frmAddressCountryFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div id="frmAddressCountryAlertBlock" class="alert alert-dismissible hidden" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <span id="frmAddressCountryAlertBlockText"></span>
                                                </div>
                                            </div>

                                            <c:choose>
                                                <c:when test="${status.error}">
                                                    <form:errors id="frmAddressCountryHelpBlock" path="country" class="help-block col-sm-offset-2 col-sm-10" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span id="frmAddressCountryHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmAddressCountryHelpBlock"/></span>
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

                                <div class="panel-body">

                                    <button type="submit" class="btn-lg btn-primary">
                                        <spring:message code="frmAddressSaveButtonLabel" />
                                    </button>

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


                    <spring:url value="/wro/addressJs.js" var="addressJs" />

                    <script src="${addressJs}"></script>
                    <style>
                        body {
                            background: url('../aboutuBG.png') no-repeat center center fixed;
                            -webkit-background-size: cover;
                            -moz-background-size: cover;
                            background-size: cover;
                            -o-background-size: cover;
                        }
                        
                        .panel-heading {
                            border-radius: 0px;
                            background-color: #cc0001;
                            padding-left: 40px;
                        }
                        
                        .btn {
                            color: #ffffff;
                            font-size: 1em;
                            background: #f80000;
                            padding: 10px 20px 10px 20px;
                            text-decoration: none;
                            border-radius: 0px;
                            width: 30%;
                            border-color: #f80000;
                        }
                        
                        .btn:hover {
                            text-decoration: none;
                            background: ;
                        }
                        
                        .form-control {
                            border-radius: 0px;
                        }
                        
                        .form-control:focus {
                            border-color: #f80000;
                            box-shadow: none;
                        }
                        
                        .form-control-static {
                            padding: 0px 15px;
                        }
                        
                        .btn {
                            width: 30%;
                            min-width: 250px;
                        }
                        
                        .modal-footer {
                            text-align: center;
                        }

                    </style>
                </body>

                </html>
