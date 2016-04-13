<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="en">
<spring:message code="applicationuserdetails.form.title" var="title"/>
<jsp:include page="../jsp/includes/header.jsp">
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

	<h1><spring:message code="applicationuserdetails.form.header"/></h1>
	<br />
	
	

	<div class="row">
		<label class="col-sm-2"></label>
		<div class="col-sm-10">${applicationUserDetails.contactInformationInstructions}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Contact Name</label>
		<div class="col-sm-10">${applicationUserDetails.contactName}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Are you pledging on behalf of an organisation?</label>
		<div class="col-sm-10">${applicationUserDetails.representOrganisation}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Phone Number</label>
		<div class="col-sm-10">${applicationUserDetails.telephoneNumber}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Address Line 1</label>
		<div class="col-sm-10">${applicationUserDetails.addressOne}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Address Line 2</label>
		<div class="col-sm-10">${applicationUserDetails.addressTwo}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Townland/Town/City</label>
		<div class="col-sm-10">${applicationUserDetails.city}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">State/Province/Region</label>
		<div class="col-sm-10">${applicationUserDetails.stateProvinceRegion}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Post Code</label>
		<div class="col-sm-10">${applicationUserDetails.postCode}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Country</label>
		<div class="col-sm-10">${applicationUserDetails.country}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Email Address</label>
		<div class="col-sm-10">${applicationUserDetails.emailAddress}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Save</label>
		<div class="col-sm-10">${applicationUserDetails.saveButton}</div>
	</div>




</div>
<jsp:include page="../jsp/includes/footer.jsp" />
<spring:url value="/scripts/js/applicationuserdetails/applicationuserdetails.js" var="applicationuserdetailsJs" />
</body>
</html>
