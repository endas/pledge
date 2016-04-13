<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${applicationUserFormModel['currentMode'] == 'ADD'}">
		<spring:message code="userActionCreateAccount" var="loginInstruction"/>
		<c:url value="/applicationuser/createuser" var="loginUrl"/>
	</c:when>
	<c:when test="${applicationUserFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="userActionLogin" var="loginInstruction"/>
		<c:url value="/login" var="loginUrl"/>
	</c:when>
	<c:when test="${applicationUserFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="userActionCreateAccount" var="loginInstruction"/>
	</c:when>
	<c:otherwise>
		<spring:message code="userActionCreateAccount" var="loginInstruction"/>	
	</c:otherwise>
</c:choose>

<spring:message code="login.title" var="title"/>
<spring:message code="login.user.identifier" var="userIdentifier"/>
<spring:message code="login.user.password" var="passwordIdentifier"/>
<spring:message code="login.remember.me" var="rememberMe"/>
<spring:message code="login.sign.in" var="signIn"/>
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="landing" />
</jsp:include>
  <body class="grey-background">
    <div id="frmSignInContainer" class="container">
      <form:form id="frmSignIn" class="form-signin" action="${loginUrl}" method="post" accept-charset="utf-8"
                modelAttribute="applicationUserFormModel">
        <c:if test="${not empty msg}">
		  <div class="alert alert-${css} alert-dismissible" role="alert">
			 <button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="true">×</span>
			 </button>
		 	 <strong>${msg}</strong>
		  </div>
        </c:if>
      
        <h4 class="form-signin-heading">${loginInstruction}</h4>
        <spring:bind path="username">
        
        <div id="frmSignInUsernameFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
        <label for="username" class="sr-only">${userIdentifier}</label>
        <form:input type="text" id="username" path="username" class="form-control" placeholder="${userIdentifier}" required="required" autofocus="autofocus"/>
        <form:errors path="username" class="help-block"/>
        </div>
        </spring:bind>
        
        <spring:bind path="password">
        
        <div id="frmSignInPasswordFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
        
        <label for="password" class="sr-only">${passwordIdentifier}</label>
        <form:input type="password" id="password" path="password" class="form-control" placeholder="${passwordIdentifier}" required="required"/>
        <form:errors path="password" class="help-block"/>
        </div>
        </spring:bind>
        <button class="btn btn-lg btn-primary btn-block" type="submit">${signIn}</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
		<form:errors element="div" />  
		<br/>
		<a href="<c:url value="/landingwebpage" />">Return Home</a>  
      </form:form>
          
    </div>
  <script>
	$( document ).ready(function() {
		writeAlertCentred("<p><b>Disclaimer</b></p><p>This is a demonstration system. Please do not enter any personal information nor use your usual email address or password.</p><p>You may use any credentials to 'Create a new pledge profile/account'.</p><p>Please remember the login credentials that you provide, if you wish to login again.</p>", "alert-danger", 50000);
	});
  </script>
  </body>
</html>
