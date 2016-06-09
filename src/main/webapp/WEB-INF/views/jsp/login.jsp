<%@ page session="false"%><%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${applicationUserFormModel['currentMode'] == 'ADD'}">
		<spring:message code="userActionCreateAccount" var="loginInstruction" />
		<c:url value="/applicationuser/createuser" var="loginUrl" />
	</c:when>
	<c:when test="${applicationUserFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="userActionLogin" var="loginInstruction" />
		<c:url value="/login" var="loginUrl" />
	</c:when>
	<c:when test="${applicationUserFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="userActionCreateAccount" var="loginInstruction" />
	</c:when>
	<c:otherwise>
		<spring:message code="userActionCreateAccount" var="loginInstruction" />
	</c:otherwise>
</c:choose>

<spring:url value="/resources/images/redx.png" var="loginLogo" />

<spring:message code="login.title" var="title" />
<spring:message code="login.user.identifier" var="userIdentifier" />
<spring:message code="login.user.password" var="passwordIdentifier" />
<spring:message code="login.remember.me" var="rememberMe" />
<spring:message code="login.sign.in" var="signIn" />
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="landing" />
</jsp:include>
<body class="fullbg">

	<div class="row fill">
		<!-- Left Column -->
		<div class="col-sm-6"></div>

		<!-- Right Column -->
		<div class="col-md-6 col-lg-5 fill ">


			<!-- Content Area -->
			<div class="col-lg-10 col-md-10 loginbackground vertical-center">


				<!-- Branding -->
				<div id="branding" class="col-lg-12 text-right">
					<div class="ieonly text-center">
						<span id="redcrosstext">Irish<strong>RedCross</strong></span>
					</div>
					<table id="logotable">
						<tr>
							<td id="left-cell"><img src="${loginLogo}" alt="Irish Red Cross"/></td>
							<td id="right-cell"><span id="redcrosstext">Irish<strong>RedCross</strong></span></td>
						</tr>

					</table>

					<h3 class="text-center">${loginInstruction}</h3>
					
					

					<form:form id="frmSignIn" class="form-signin" action="${loginUrl}"
						method="post" accept-charset="utf-8"
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

						<%-- <h4 class="form-signin-heading">${loginInstruction}</h4> --%>
						<spring:bind path="username">

							<div id="frmSignInUsernameFormGroup"
								class="form-group has-feedback ${status.error ? 'has-error' : ''}">
								<label for="username" class="sr-only">${userIdentifier}</label>
								<form:input type="text" id="username" path="username"
									class="form-control" placeholder="${userIdentifier}"
									required="required" autofocus="autofocus" />
								<form:errors path="username" class="help-block" />
							</div>
						</spring:bind>

						<spring:bind path="password">

							<div id="frmSignInPasswordFormGroup"
								class="form-group has-feedback ${status.error ? 'has-error' : ''}">

								<label for="password" class="sr-only">${passwordIdentifier}</label>
								<form:input type="password" id="password" path="password"
									class="form-control" placeholder="${passwordIdentifier}"
									required="required" />
								<form:errors path="password" class="help-block" />
							</div>
						</spring:bind>
						<button class="btn btn-lg btn-primary btn-block btn-login" type="submit">${signIn}</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<form:errors element="div" />
						<br />
						
					</form:form>
					<c:choose>
					<c:when test="${applicationUserFormModel['currentMode'] == 'ADD'}">
						<div class="text-center">
							<span>Already have an account? <a class="home-login-link" href="<c:url value="/login" />">Click here </a>to log in</span>
						</div>
					</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${applicationUserFormModel['currentMode'] == 'UPDATE'}">
						<div class="text-center">
							<a href="<c:url value="/applicationuser/createuser" />">Return Home</a>
						</div> 
						</c:when>
					</c:choose>
				</div>

				<!-- Empty Space -->


			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							writeAlertCentred(
									"<p><b>Disclaimer</b></p><p>This is a demonstration system. Please do not enter any personal information nor use your usual email address or password.</p><p>You may use any credentials to 'Create a new pledge profile/account'.</p><p>Please remember the login credentials that you provide, if you wish to login again.</p>",
									"alert-danger", 50000);
						});
	</script>
</body>
</html>
