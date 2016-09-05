<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="en">
<spring:message code="servicepledge.form.title" var="title"/>
<jsp:include page="../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
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
<div class="container">
	<c:if test="${not empty msg}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<strong>${msg}</strong>
		</div>
	</c:if>

	<h1><spring:message code="servicepledge.form.header"/></h1>
	<br />
	
	

	<div class="row">
		<label class="col-sm-2">Your Service</label>
		<div class="col-sm-10">${servicePledge.pledgeServiceLevelOne}</div>
	</div>



	<div class="row">
		<label class="col-sm-2"></label>
		<div class="col-sm-10">${servicePledge.pledgeServiceLevelTwo}</div>
	</div>



	<div class="row">
		<label class="col-sm-2"></label>
		<div class="col-sm-10">${servicePledge.pledgeServiceLevelThree}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Additional Information</label>
		<div class="col-sm-10">${servicePledge.additionalInformation}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Qualification to provide Service</label>
		<div class="col-sm-10">${servicePledge.pledgeServiceQualification}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Date Available for Use</label>
		<div class="col-sm-10">${servicePledge.pledgeServiceDateAvailable}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Hours per week</label>
		<div class="col-sm-10">${servicePledge.pledgeServiceHoursPerWeek}</div>
	</div>

	<div class="row">
		<label class="col-sm-2"><spring:message code="serviceplegde.flaggedIssues"/> </label>
		<div class="col-sm-10">${servicePledge.flaggedIssues}</div>
	</div>





</div>
<jsp:include page="../includes/redcrossfooter.jsp" />
<spring:url value="/scripts/js/servicepledge/servicepledge.js" var="servicepledgeJs" />
</body>
</html>
