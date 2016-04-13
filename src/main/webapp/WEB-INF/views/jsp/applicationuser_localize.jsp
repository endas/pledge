<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${applicationUserFormModel['currentMode'] == 'ADD'}">
		<spring:message code="applicationuser.form.header" var="headerText"/>
	</c:when>
	<c:when test="${applicationUserFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="applicationuser.form.header" var="headerText"/>
	</c:when>
	<c:when test="${applicationUserFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="applicationuser.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="applicationuser.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="applicationuser.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="applicationUser" />
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
	
	<spring:url value="/applicationuser/translate" var="applicationUserActionUrl" />
	  
	<form:form id="frmApplicationUser" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="applicationUserTranslationFormModel" action="${applicationUserActionUrl}">

		<form:hidden id="frmApplicationUserApplicationUserId" path="id" />
		
		<form:hidden id="frmApplicationUserApplicationUserViewId" path="viewId" />
		
		<form:hidden id="frmApplicationUserMode" path="currentMode" />
		
		<input type="hidden" id="frmApplicationUserLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmApplicationUserLoadedFeedbackCss" value="${css}" />
    
    
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
			<p id="applicationuser.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="applicationuser.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="applicationuser.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="applicationuser.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="applicationuser.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="applicationuser.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="applicationuser.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="applicationuser.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="applicationuser.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
    <section id="applicationUserFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="applicationuser.form.pageheader.applicationuserformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="applicationUserFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="applicationuser.form.panel.applicationuserinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		  <div id="frmApplicationUserUsernameFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserUsernameLabel" for="frmApplicationUserUsername" class="col-sm-2 control-label"><spring:message code="frmApplicationUserUsernameLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserUsernamePlaceHolder" var="frmApplicationUserUsernamePlaceHolder"/>    
    
				<form:input path="username" type="text" data-display-name="Email Address" data-minlength="5" data-required="false" maxlength="45" class="form-control" id="frmApplicationUserUsername" placeholder="${frmApplicationUserUsernamePlaceHolder}" aria-describedby="frmApplicationUserUsernameHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserUsernameFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserUsernameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserUsernameAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserUsernameHelpBlock" path="username" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserUsernameHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserUsernameHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserUsernameLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserUsernameLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserUsernameLabelTranslateToLabel" for="frmApplicationUserUsernameLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="usernameLabel" type="text" class="form-control" id="frmApplicationUserUsernameLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserUsernameLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserUsernamePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserUsernamePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserUsernamePlaceHolderTranslateToLabel" for="frmApplicationUserUsernamePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="usernamePlaceHolder" type="text" class="form-control" id="frmApplicationUserUsernamePlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserUsernamePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserUsernameHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserUsernameHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserUsernameHelpBlockTranslateToLabel" for="frmApplicationUserUsernameHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="usernameHelpText" type="text" class="form-control" id="frmApplicationUserUsernameHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserUsernameHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserPasswordFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserPasswordLabel" for="frmApplicationUserPassword" class="col-sm-2 control-label"><spring:message code="frmApplicationUserPasswordLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserPasswordPlaceHolder" var="frmApplicationUserPasswordPlaceHolder"/>    
    
				<form:input path="password" type="text" data-display-name="Password" data-minlength="5" data-required="true" maxlength="60" class="form-control" id="frmApplicationUserPassword" placeholder="${frmApplicationUserPasswordPlaceHolder}" aria-describedby="frmApplicationUserPasswordHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmApplicationUserPasswordFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserPasswordAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserPasswordAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserPasswordHelpBlock" path="password" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserPasswordHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserPasswordHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmApplicationUserPasswordLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserPasswordLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserPasswordLabelTranslateToLabel" for="frmApplicationUserPasswordLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="passwordLabel" type="text" class="form-control" id="frmApplicationUserPasswordLabelLocalizer" placeholder=""/>
				<span id="frmApplicationUserPasswordLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmApplicationUserPasswordPlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserPasswordPlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserPasswordPlaceHolderTranslateToLabel" for="frmApplicationUserPasswordPlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="passwordPlaceHolder" type="text" class="form-control" id="frmApplicationUserPasswordPlaceHolderLocalizer" placeholder=""/>
				<span id="frmApplicationUserPasswordPlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmApplicationUserPasswordHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmApplicationUserPasswordHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmApplicationUserPasswordHelpBlockTranslateToLabel" for="frmApplicationUserPasswordHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="passwordHelpText" type="text" class="form-control" id="frmApplicationUserPasswordHelpBlockLocalizer" placeholder=""/>
				<span id="frmApplicationUserPasswordHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserEnabledFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserEnabledLabel" for="frmApplicationUserEnabled" class="col-sm-2 control-label"><spring:message code="frmApplicationUserEnabledLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserEnabledPlaceHolder" var="frmApplicationUserEnabledPlaceHolder"/>    
    
    			<div class="checkbox">
					<label>
						<form:checkbox path="enabled" data-display-name="User Enabled" data-required="false" id="frmApplicationUserEnabled" aria-describedby="frmApplicationUserEnabledHelpBlock"/>
					</label>
				</div>
    
				<span id="frmApplicationUserEnabledFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserEnabledAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserEnabledAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserEnabledHelpBlock" path="enabled" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserEnabledHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserEnabledHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		</div> <!-- div class="well" -->
      
		  <div id="frmApplicationUserUserRolesFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmApplicationUserUserRolesLabel" for="frmApplicationUserUserRoles" class="col-sm-2 control-label"><spring:message code="frmApplicationUserUserRolesLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmApplicationUserUserRolesPlaceHolder" var="frmApplicationUserUserRolesPlaceHolder"/>    
    
				<form:checkboxes path="userRoles" items="${userRolesMap}" 
                                 element="label class='checkbox-inline no_indent'" />
    
				<span id="frmApplicationUserUserRolesFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmApplicationUserUserRolesAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmApplicationUserUserRolesAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmApplicationUserUserRolesHelpBlock" path="userRoles" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmApplicationUserUserRolesHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmApplicationUserUserRolesHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		<div class="well">
        
		</div> <!-- div class="well" -->
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmApplicationUserSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/applicationUserJs.js" var="applicationUserJs" />
  
<script src="${applicationUserJs}"></script>

</body>
</html>

