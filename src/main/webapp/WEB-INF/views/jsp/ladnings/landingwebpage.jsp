<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<spring:message code="landing.form.title" var="title"/>
<jsp:include page="../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="landing" />
</jsp:include>
<body>

<spring:url value="/landingwebpage" var="urlHome"/>
<spring:url value="/entitylist" var="urlAppHome"/>
<spring:url value="/logout" var="urlLogout"/>
<spring:url value="/resources/images/redcross-brand-logo.png" var="headerLogo" />

<spring:url value="applicationuser/createuser" var="urlCreateUser" />

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
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="loginMainMenuItem"/><span class="caret"></span></a>
              <ul class="dropdown-menu">
              
                <li><a href="${urlCreateUser}"><spring:message code="userActionCreateAccount"/></a></li>
              
                <li><a href="${urlAppHome}"><spring:message code="userActionLogin"/></a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
        
      </div>
    </nav>
    
    <section id="landingBannerOneSection" class="">
      	
			<spring:url value="/resources/images/redcross-banner.jpg" var="landingBannerOneImage"/>
	  	
			<div class="jumbotron" style="background-image: url(${landingBannerOneImage});">
				<div class="container">
				  <h1><spring:message code="global.project.title"/></h1>
				  <p><spring:message code="global.project.subtitle"/></p>
			    </div> <!-- class="container" -->
			</div> <!-- class="jumbotron" -->
	</section> <!-- section id="landingBannerOneSection" -->
	<section id="landingMainMessagesSection" class="">
		<div class="container">
	    
          <div class="row" id="landingMainMessagesWrapperRow">
	        
        <div class="col-sm-6 text-center">
        
          <div class="panel panel-default white-on-red">
	    	<div class="panel-heading "><h2><spring:message code="frmLandingLandingMainMessages1Label"/></h2></div>
			<div class="panel-body ">
				<p class=""><spring:message code="frmLandingLandingMainMessages1Message"/></p>
			</div> <!-- class="panel-body" -->
          </div> <!-- class="panel" -->
          
        </div>
    
        <div class="col-sm-6 text-center">
        
          <div class="panel panel-default white-on-red">
	    	<div class="panel-heading "><h2><spring:message code="frmLandingLandingMainMessages2Label"/></h2></div>
			<div class="panel-body ">
				<p class=""><spring:message code="frmLandingLandingMainMessages2Message"/></p>
			</div> <!-- class="panel-body" -->
          </div> <!-- class="panel" -->
          
        </div>
    
          </div> <!--  class="row" -->
	    
			</div> <!--  class="container" -->    			
		</section> <!-- id="landingMainMessagesSection" -->
    
	  	<spring:url value="/landings" var="landingActionUrl" />
	
	<form:form id="frmLanding" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="landingFormModel" action="${landingActionUrl}">
		<form:hidden id="frmLandingLandingId" path="id" />
		<input type="hidden" id="frmLandingLandingMode" value="webpage" />
	</form:form>
<jsp:include page="../includes/redcrossfooter.jsp" />


<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/landingJs.js" var="landingJs" />
  
<script src="${landingJs}"></script>

</body>
</html>

