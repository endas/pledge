<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="en">
<spring:message code="global.project.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="" />
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
		<div class="page-header">
		<h1>${title}</h1>
		</div> <!-- class="page-header" -->
	</div> <!-- class="container" -->
	<div class="container">
		<div class="well">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Bean</th>
					<th>Action</th>
				</tr>
			</thead>
			
				<tr>
					<td><spring:message code="address.form.title"/></td>
					<td>
						<spring:url value="/address/all" var="allAddressUrl" />
						<spring:url value="/address/localize" var="addresssLocalizeUrl" />
						<spring:url value="/address/add" var="addAddressUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allAddressUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${addresssLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addAddressUrl}'">Add</button>
					</td>
				</tr>
	  
				<tr>
					<td><spring:message code="registerofpledges.form.title"/></td>
					<td>
						<spring:url value="/registerofpledges/all" var="allRegisterOfPledgesUrl" />
						<spring:url value="/registerofpledges/localize" var="registerofpledgessLocalizeUrl" />
						<spring:url value="/registerofpledges/add" var="addRegisterOfPledgesUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allRegisterOfPledgesUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${registerofpledgessLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addRegisterOfPledgesUrl}'">Add</button>
					</td>
				</tr>
	  
				<tr>
					<td><spring:message code="accommodationpledge.form.title"/></td>
					<td>
						<spring:url value="/accommodationpledge/all" var="allAccommodationPledgeUrl" />
						<spring:url value="/accommodationpledge/localize" var="accommodationpledgesLocalizeUrl" />
						<spring:url value="/accommodationpledge/add" var="addAccommodationPledgeUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allAccommodationPledgeUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${accommodationpledgesLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addAccommodationPledgeUrl}'">Add</button>
					</td>
				</tr>
	  
				<tr>
					<td><spring:message code="servicepledge.form.title"/></td>
					<td>
						<spring:url value="/servicepledge/all" var="allServicePledgeUrl" />
						<spring:url value="/servicepledge/localize" var="servicepledgesLocalizeUrl" />
						<spring:url value="/servicepledge/add" var="addServicePledgeUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allServicePledgeUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${servicepledgesLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addServicePledgeUrl}'">Add</button>
					</td>
				</tr>
	  
				<tr>
					<td><spring:message code="goodspledge.form.title"/></td>
					<td>
						<spring:url value="/goodspledge/all" var="allGoodsPledgeUrl" />
						<spring:url value="/goodspledge/localize" var="goodspledgesLocalizeUrl" />
						<spring:url value="/goodspledge/add" var="addGoodsPledgeUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allGoodsPledgeUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${goodspledgesLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addGoodsPledgeUrl}'">Add</button>
					</td>
				</tr>
	  
	  			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_LOCALIZE_ADMIN')">
	  
				<tr>
					<td><spring:message code="referencecategory.form.title"/></td>
					<td>
						<spring:url value="/referencecategory/all" var="allReferenceCategoryUrl" />
						<spring:url value="/referencecategory/localize" var="referencecategorysLocalizeUrl" />
						<spring:url value="/referencecategory/add" var="addReferenceCategoryUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allReferenceCategoryUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${referencecategorysLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addReferenceCategoryUrl}'">Add</button>
					</td>
				</tr>
	  
				</sec:authorize>
	  
	  			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_LOCALIZE_ADMIN')">
	  
				<tr>
					<td><spring:message code="reference.form.title"/></td>
					<td>
						<spring:url value="/reference/all" var="allReferenceUrl" />
						<spring:url value="/reference/localize" var="referencesLocalizeUrl" />
						<spring:url value="/reference/add" var="addReferenceUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allReferenceUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${referencesLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addReferenceUrl}'">Add</button>
					</td>
				</tr>
	  
				</sec:authorize>
	  
	  			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_LOCALIZE_ADMIN')">
	  
				<tr>
					<td><spring:message code="landing.form.title"/></td>
					<td>
						<spring:url value="/landing/all" var="allLandingUrl" />
						<spring:url value="/landing/localize" var="landingsLocalizeUrl" />
						<spring:url value="/landing/add" var="addLandingUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allLandingUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${landingsLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addLandingUrl}'">Add</button>
					</td>
				</tr>
	  
				</sec:authorize>
	  
	  			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_LOCALIZE_ADMIN')">
	  
				<tr>
					<td><spring:message code="view.form.title"/></td>
					<td>
						<spring:url value="/view/all" var="allViewUrl" />
						<spring:url value="/view/localize" var="viewsLocalizeUrl" />
						<spring:url value="/view/add" var="addViewUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allViewUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${viewsLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addViewUrl}'">Add</button>
					</td>
				</tr>
	  
				</sec:authorize>
	  
	  			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_LOCALIZE_ADMIN')">
	  
				<tr>
					<td><spring:message code="messageresource.form.title"/></td>
					<td>
						<spring:url value="/messageresource/all" var="allMessageResourceUrl" />
						<spring:url value="/messageresource/localize" var="messageresourcesLocalizeUrl" />
						<spring:url value="/messageresource/add" var="addMessageResourceUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allMessageResourceUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${messageresourcesLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addMessageResourceUrl}'">Add</button>
					</td>
				</tr>
	  
				</sec:authorize>
	  
	  			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_LOCALIZE_ADMIN')">
	  
				<tr>
					<td><spring:message code="applicationuser.form.title"/></td>
					<td>
						<spring:url value="/applicationuser/all" var="allApplicationUserUrl" />
						<spring:url value="/applicationuser/localize" var="applicationusersLocalizeUrl" />
						<spring:url value="/applicationuser/add" var="addApplicationUserUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allApplicationUserUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${applicationusersLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addApplicationUserUrl}'">Add</button>
					</td>
				</tr>
	  
				</sec:authorize>
	  
				<tr>
					<td><spring:message code="applicationuserdetails.form.title"/></td>
					<td>
						<spring:url value="/applicationuserdetails/all" var="allApplicationUserDetailsUrl" />
						<spring:url value="/applicationuserdetails/localize" var="applicationuserdetailssLocalizeUrl" />
						<spring:url value="/applicationuserdetails/add" var="addApplicationUserDetailsUrl" />
						<button class="btn btn-info btn-sm" onclick="location.href='${allApplicationUserDetailsUrl}'">View All</button>
						<sec:authorize access="hasRole('ROLE_LOCALIZE_ADMIN')">
						<button class="btn btn-primary btn-sm" onclick="location.href='${applicationuserdetailssLocalizeUrl}'">Localize</button>
						</sec:authorize>
						<button class="btn btn-info btn-sm" onclick="location.href='${addApplicationUserDetailsUrl}'">Add</button>
					</td>
				</tr>
	  
		</table>
		</div>
	</div> <!-- class="container" -->
	<jsp:include page="../jsp/includes/redcrossfooter.jsp" />
</body>
</html>

