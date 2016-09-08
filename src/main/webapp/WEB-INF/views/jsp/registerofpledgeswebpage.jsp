<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<spring:message code="registerofpledges.form.title" var="title"/>
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="registerOfPledges" />
</jsp:include>
<body>

<jsp:include page="users/applicationuserdetails_create_update_dialog.jsp"/>

<jsp:include page="accommodations/accommodationpledge_create_update_dialog.jsp"/>

<jsp:include page="services/servicepledge_create_update_dialog.jsp"/>

<jsp:include page="goods/goodspledge_create_update_dialog.jsp"/>

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
            
        		<li><a role="button" data-toggle="modal" data-backdrop="static" data-target="#applicationUserDetailsCreateUpdateModal" data-id="${registerOfPledgesFormModel.id}" data-modal-title="Edit your Contact Information" data-association-type="one-to-one" data-callback-display-type="inline" data-callback-table-body-id="applicationUserDetailsTableBody" data-property-url="applicationuserdetails">Edit your Contact Information</a></li>
          
				<li><a role="button" data-toggle="modal" data-backdrop="static" data-target="#accommodationPledgeCreateUpdateModal" data-id=null data-modal-title="Offer Accommodation" data-association-type="one-to-many" data-callback-display-type="table" data-callback-table-body-id="accommodationPledgesTableBody" data-property-url="accommodationpledges">Offer Accommodation</a></li>
      
				<li><a role="button" data-toggle="modal" data-backdrop="static" data-target="#servicePledgeCreateUpdateModal" data-id=null data-modal-title="Offer a Skill/Service" data-association-type="one-to-many" data-callback-display-type="table" data-callback-table-body-id="servicePledgesTableBody" data-property-url="servicepledges">Offer a Skill/Service</a></li>
      
				<li><a role="button" data-toggle="modal" data-backdrop="static" data-target="#goodsPledgeCreateUpdateModal" data-id=null data-modal-title="Offer Goods/items/Medicines" data-association-type="one-to-many" data-callback-display-type="table" data-callback-table-body-id="goodsPledgesTableBody" data-property-url="goodspledges">Offer Goods/items/Medicines</a></li>
      
            <li><a class="page-scroll" href="#aboutSection">About</a></li>
            <li><a class="page-scroll" href="#servicesSection">Services</a></li>
            <li><a class="page-scroll" href="#productsSection">Products</a></li>
            
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

     <div class="container-fluid hero">
     		<spring:url value="/resources/images/redcross-banner.jpg" var="headerBanner" />
			<div class="jumbotron">
			  <h1><spring:message code="registerofpledges.form.header"/></h1>
			  
			  <p><spring:message code="registerofpledges.form.subheader"/></p>
			  <a class="btn btn-primary btn-lg" data-toggle="modal" data-backdrop="static" data-target="#contactInformationCreateUpdateModal" data-id="${landingFormModel.id}" data-modal-title="Contact Us" data-association-type="one-to-one" data-callback-display-type="inline" data-callback-table-body-id="contactInformationTableBody" data-property-url="contactinformation">Contact Us</a>
			  <h2>Built by Netgrains</h2>
			  <p>This system was built using Netgrains Data Harvester software.</p>
			  
			</div>
    </div>
    
	  	<spring:url value="/registerofpledgess" var="registerOfPledgesActionUrl" />
	
	<form:form id="frmRegisterOfPledges" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="registerOfPledgesFormModel" action="${registerOfPledgesActionUrl}">
		<form:hidden id="frmRegisterOfPledgesRegisterOfPledgesId" path="id" />
		<input type="hidden" id="frmRegisterOfPledgesRegisterOfPledgesMode" value="webpage" />
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />


<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/registerOfPledgesJs.js" var="registerOfPledgesJs" />
  
<script src="${registerOfPledgesJs}"></script>

</body>
</html>

