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
<jsp:include page="../includes/header.jsp">
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
	
	<spring:url value="/applicationuser/post" var="applicationUserActionUrl" />
	  
	<form:form id="frmApplicationUser" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="applicationUserFormModel" action="${applicationUserActionUrl}">

		<form:hidden id="frmApplicationUserApplicationUserId" path="id" />
		
		<form:hidden id="frmApplicationUserMode" path="currentMode" />
		
		<input type="hidden" id="frmApplicationUserLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmApplicationUserLoadedFeedbackCss" value="${css}" />
    
    
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
		    
		<spring:bind path="username">
      
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
      
		</spring:bind>
      
		<spring:bind path="password">
      
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
      
		</spring:bind>
      
		<spring:bind path="enabled">
      
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
      
		</spring:bind>
      
		<spring:bind path="userRoles">
      
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
      
		</spring:bind>
      
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
<jsp:include page="../includes/redcrossfooter.jsp" />

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/applicationUserJs.js" var="applicationUserJs" />
  
<script src="${applicationUserJs}"></script>

</body>
</html>

