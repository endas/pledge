<%@ page session="false"%><%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<spring:message code="userActionCreateAccount" var="createAccountInstruction" />
<spring:message code="userActionLogin" var="loginInstruction" />
<c:url value="/applicationuser/createuser" var="createUserUrl" />
<c:url value="/login" var="loginUrl" />

<c:choose>
	<c:when test="${applicationUserFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="userActionCreateAccount" var="loginInstruction" />
	</c:when>
</c:choose>

<spring:url value="/resources/images/redx.png" var="loginLogo" />
<spring:url value="/resources/images/background-littlegirl.jpg" var="bgLarge" />
<spring:url value="/resources/images/background-littlegirl-992.jpg" var="bgMed" />
<spring:url value="/resources/images/background-littlegirl-768.jpg" var="bgSmall" />

<spring:message code="login.title" var="title" />
<spring:message code="login.user.identifier" var="userIdentifier" />
<spring:message code="login.user.identifier.required" var="userIdentifierRequired" />
<spring:message code="login.user.password" var="passwordIdentifier" />
<spring:message code="login.user.password.required" var="passwordRequired" />
<spring:message code="login.remember.me" var="rememberMe" />
<spring:message code="login.sign.in" var="signIn" />
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="landing" />
</jsp:include>
<body class="fullbg">

<div class="container-fluid">
  <div class="row">
     <div class="col-xs-12"></div>
   	 <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-6">
   	 	<form:form id='frmSignIn'  class="navbar-form redcross-login "  action="${loginUrl}" method="post" accept-charset="utf-8" modelAttribute="applicationUserFormModel">
						 
						 <spring:bind path="username">
						 <div class="form-group">
	                        <form:input type="text" class="form-control" name="username" placeholder="Username" path="username"/>
	                    </div>
	                    </spring:bind>
	                    <spring:bind path="password">
	                     <div class="form-group">
	                        <form:input  type="password" id="sign-in-password" path="password" class="form-control" placeholder="${passwordIdentifier}"
										required="required" oninvalid="this.setCustomValidity('${passwordRequired}')" oninput="setCustomValidity('')" ></form:input> 
									<form:errors path="password" class="help-block" />
	                    </div> 
	                    </spring:bind>
	                    <div class="form-group">
	                    <button type="submit" class="btn btn-lg btn-primary btn-block btn-login">Sign In</button>
	                   </div>
	                    <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> 
						<form:errors element="div" />
						<c:if test="${not empty msg2}">
                        
						<div class="form-group alert alert-danger alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                               	<strong>${msg2}</strong>
                            </div>
   
                    	</c:if>
	                </form:form> 

   	 </div>
  </div>
</div>


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

					<h3 class="text-center">${createAccountInstruction}</h3>
					
					

					<form:form id="frmSignUp" class="form-signin" action="${createUserUrl}"
						method="post" accept-charset="utf-8"
						modelAttribute="applicationUserFormModel">
						<c:if test="${not empty msg}">
							<div class="alert alert-${css} alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<!-- <span aria-hidden="true">�</span> -->
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
									required="required" autofocus="autofocus" oninvalid="this.setCustomValidity('${userIdentifierRequired}')" oninput="setCustomValidity('')" />
								<form:errors path="username" class="help-block" />
							</div>
						</spring:bind>

						<spring:bind path="password">

							<div id="frmSignInPasswordFormGroup"
								class="form-group has-feedback ${status.error ? 'has-error' : ''}">

								<label for="password" class="sr-only">${passwordIdentifier}</label>
								<form:input type="password" id="password" path="password"
									class="form-control" placeholder="${passwordIdentifier}"
									required="required" oninvalid="this.setCustomValidity('${passwordRequired}')" oninput="setCustomValidity('')"/>
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
	 <style>
	/* CUSTOM STYLES */

	body {
	    /* overflow-x: hidden; */
	     overflow-y: hidden; 
	    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	    color: #112223;
	}
	a {
	    color: #222223;
	    font-size: 0.78em;
	    text-decoration: underline;
	}
	table {
	    margin: 0 auto;
	    width: 100%;
	}
	h3 {
	    color: #112223;
	    padding: 20px 0px;
	    font-size: 1.4em;
	    font-weight: 600;
	}
	.ieonly {
	    display: none;
	}
	.loginbackground {
	    background-color: rgba(255, 255, 255, 0.7);
	    height: 100%;
	    min-height: 100%;
	    display: block;
	}
	.fullbg {
	    background: url('${bgLarge}') no-repeat center center fixed;
	    -webkit-background-size: cover;
	    -moz-background-size: cover;
	    background-size: cover;
	    -o-background-size: cover;
		padding : 0;
	}
	html,
	body {
	    height: 100%;
	}
	.fill {
	    min-height: 100%;
	    height: 100%;
	}
	.vertical-center {
	    display: flex;
	    align-items: center;
	}
	#branding {
	    margin: auto;
	    width: 400px;
	}
	#branding img {
	    width: 100%;
	    padding: 0px
	}
	#redcrosstext {
	    font-size: 2.5em;
	    padding: 20px 5px 20px;
	}
	#left-cell {
	    width: 25%;
	    min-width: 30%;
	}
	#right-cell {
	    text-align: left;
	}
	input {
	    border-radius: 1px;
	    padding: 15px 10px;
	    width: 100%
	}
	input[type="text"] {
	    font-size: 0.9em;
	    font-weight: 400
	}
	input[type="text"] {
	    font-size: 0.9em;
	    font-weight: 400
	}
	input[type="password"] {
	    font-size: 0.9em;
	    font-weight: 400
	}
	.btn {
	    color: #ffffff;
	    font-size: 1em;
	    background: #f80000;
	    padding: 10px 20px 10px 20px;
	    text-decoration: none;
	    border-radius: 0px;
	}
	.btn:hover {
	    text-decoration: none;
	    background: #f80000;
	}
/* 	.redcross-login{
		background-color: rgba(255, 255, 255, 0.7);
	} */
	.redcross-login .form-group{
		/* display:inline-block; */
		padding:5px;
	}
	.redcross-login .btn-login{
  		padding-bottom: 5px;
	}
	.login-form-btn{
		font-size:0.8em;
		margin-top: 1px;
		min-width:10em;
	}
	.navbar-form{
		text-align:right;
	}
	#frmSignIn input,
	#frmSignIn button{
		max-width: 300px;
		margin: 0 auto;
	}
	/* Media Queries */


	/* Large & Above */

	@media only screen and (min-width: 1200px) {
	    table {
	        width: 350px;
	    }
	    #redcrosstext {
	        font-size: 2.2em;
	        padding: 5% 5%;
	    }
	}

	/* Large */

	@media only screen and (max-width: 1200px) {
	    table {
	        width: 300px
	    }
	    #redcrosstext {
	        font-size: 2em;
	        padding: 5% 5%;
	    }
	}

	/* Medium */

	@media only screen and (max-width: 992px) {
	    #redcrosstext {
	        font-size: 2em;
	        padding: 5% 5%;
	    }
	    #branding {
	        margin: auto;
	        width: 350px;
	    }
	    a {
	        font-size: 0.78em;
	        text-decoration: underline;
	    }
	    table {
	        width: 400px;
	    }
	    .fullbg {
	        background: url('${bgMed}') no-repeat center center fixed;
	        -webkit-background-size: cover;
	        -moz-background-size: cover;
	        background-size: cover;
	        -o-background-size: cover;
	    }
	}

	/* Small */

	@media only screen and (max-width: 768px) {
	    #redcrosstext {
	        font-size: 2.2em;
	        padding: 5% 5%;
	    }
	    #branding {
	        border-radius: 1px;
	        padding: 15px 10px;
	        width: 80%;
	        margin: 0 auto;
	    }
	    a {
	        font-size: 0.78em;
	        text-decoration: underline;
	    }
	    .fullbg {
	        background: url('${bgSmall}') no-repeat center center fixed;
	        -webkit-background-size: cover;
	        -moz-background-size: cover;
	        background-size: cover;
	        -o-background-size: cover;
	    }
	}

	/* Extra-Small */

	@media only screen and (max-width: 480px) {
	    #branding {
	        border-radius: 1px;
	        padding: 15px 10px;
	        width: 100%;
	        margin: 0 auto;
	        font-size: 0.9em;
	    }
	    #redcrosstext {
	        font-size: 2.2em;
	        padding: 5% 5%;
	    }
	    a {
	        font-size: 0.78em;
	        text-decoration: underline;
	    }
	    table {
	        width: 300px;
	    }
	}

	/* Super-Small */

	@media only screen and (max-width: 320px) {
	    #branding {
	        border-radius: 1px;
	        width: 100%;
	        margin: 0 auto;
	        font-size: 0.8em;
	    }
	    input {
	        border-radius: 1px;
	        padding: 15px 10px;
	        width: 100%;
	    }
	    a {
	        font-size: 0.75em;
	        text-decoration: underline;
	    }
	    table {
	        width: 300px;
	    }
	}

	</style> 
</body>
</html>
