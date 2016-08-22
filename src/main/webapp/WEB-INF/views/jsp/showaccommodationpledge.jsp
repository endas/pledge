<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="en">
<spring:message code="accommodationpledge.form.title" var="title"/>
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

	<h1><spring:message code="accommodationpledge.form.header"/></h1>
	<br />
	
	

	<div class="row">
		<label class="col-sm-2">Address Line 1</label>
		<div class="col-sm-10">${accommodationPledge.addressOne}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Address Line 2</label>
		<div class="col-sm-10">${accommodationPledge.addressTwo}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Townland/Town/City</label>
		<div class="col-sm-10">${accommodationPledge.city}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">State/Province/Region</label>
		<div class="col-sm-10">${accommodationPledge.stateProvinceRegion}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Eircode</label>
		<div class="col-sm-10">${accommodationPledge.postCode}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Country</label>
		<div class="col-sm-10">${accommodationPledge.country}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Who owns the accommodation?</label>
		<div class="col-sm-10">${accommodationPledge.ownerOccupier}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">When is the accommodation available from?</label>
		<div class="col-sm-10">${accommodationPledge.accommodationDateFrom}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">When is the accommodation available until?</label>
		<div class="col-sm-10">${accommodationPledge.accommodationDateTo}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">What kind of accommodation are you pledging?</label>
		<div class="col-sm-10">${accommodationPledge.accommodationType}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Condition</label>
		<div class="col-sm-10">${accommodationPledge.accommodationCondition}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Number of beds</label>
		<div class="col-sm-10">${accommodationPledge.numberOfBeds}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Vacant or Shared</label>
		<div class="col-sm-10">${accommodationPledge.vacantOrShared}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Description of other Amenities</label>
		<div class="col-sm-10">${accommodationPledge.otherAmenities}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Who can you accommodate?</label>
		<div class="col-sm-10">${accommodationPledge.canYouAccommodate}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Is there anything else that you would like to say about the accommodation?</label>
		<div class="col-sm-10">${accommodationPledge.additionalInformation}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Save</label>
		<div class="col-sm-10">${accommodationPledge.saveButton}</div>
	</div>




</div>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />
<spring:url value="/scripts/js/accommodationpledge/accommodationpledge.js" var="accommodationpledgeJs" />
</body>
</html>
