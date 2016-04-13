<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${landingFormModel['currentMode'] == 'ADD'}">
		<spring:message code="landing.form.header" var="headerText"/>
	</c:when>
	<c:when test="${landingFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="landing.form.header" var="headerText"/>
	</c:when>
	<c:when test="${landingFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="landing.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="landing.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="landing.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="landing" />
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
	
	<spring:url value="/landing/post" var="landingActionUrl" />
	  
	<form:form id="frmLanding" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="landingFormModel" action="${landingActionUrl}">

		<form:hidden id="frmLandingLandingId" path="id" />
		
		<form:hidden id="frmLandingMode" path="currentMode" />
		
		<input type="hidden" id="frmLandingLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmLandingLoadedFeedbackCss" value="${css}" />
    
    
    <section id="landingBannerOneSection" class="">
		<div class="">
      	
			<spring:url value="/resources/images/redcross-banner.jpg" var="landingBannerOneImage"/>
	  	
			<div class="jumbotron" style="background-image: url(${landingBannerOneImage});">
				<div class="container">
		    	
			</div> <!-- class="jumbotron" -->
		</div> <!-- class="" -->
	</section> <!-- section id="landingBannerOneSection" -->
    
	<section id="landingMessagesOneSection" class="">
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
    </section> <!-- id="landingMessagesOneSection -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/landingJs.js" var="landingJs" />
  
<script src="${landingJs}"></script>

</body>
</html>

