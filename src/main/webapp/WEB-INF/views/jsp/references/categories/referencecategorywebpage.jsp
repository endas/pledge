<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<spring:message code="referencecategory.form.title" var="title"/>
<jsp:include page="../../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="referenceCategory" />
</jsp:include>
<body>

<jsp:include page="../reference_create_update_dialog.jsp"/>

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
            
				<li><a role="button" data-toggle="modal" data-backdrop="static" data-target="#referenceCreateUpdateModal" data-id=null data-modal-title="Add Reference" data-association-type="many-to-many" data-callback-display-type="table" data-callback-table-body-id="referencesTableBody" data-property-url="references">Add Reference</a></li>
      
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
			  <h1><spring:message code="referencecategory.form.header"/></h1>
			  
			  <p><spring:message code="referencecategory.form.subheader"/></p>
			  <a class="btn btn-primary btn-lg" data-toggle="modal" data-backdrop="static" data-target="#contactInformationCreateUpdateModal" data-id="${landingFormModel.id}" data-modal-title="Contact Us" data-association-type="one-to-one" data-callback-display-type="inline" data-callback-table-body-id="contactInformationTableBody" data-property-url="contactinformation">Contact Us</a>
			  <h2>Built by Netgrains</h2>
			  <p>This system was built using Netgrains Data Harvester software.</p>
			  
			</div>
    </div>
    
	  	<spring:url value="/referencecategorys" var="referenceCategoryActionUrl" />
	
	<form:form id="frmReferenceCategory" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="referenceCategoryFormModel" action="${referenceCategoryActionUrl}">
		<form:hidden id="frmReferenceCategoryReferenceCategoryId" path="id" />
		<input type="hidden" id="frmReferenceCategoryReferenceCategoryMode" value="webpage" />
	</form:form>
<jsp:include page="../../includes/redcrossfooter.jsp" />


<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/referenceCategoryJs.js" var="referenceCategoryJs" />
  
<script src="${referenceCategoryJs}"></script>

</body>
</html>

