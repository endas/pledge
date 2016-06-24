<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<spring:message code="goodspledge.form.title" var="title"/>
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="goodsPledge" />
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
			  <h1><spring:message code="goodspledge.form.header"/></h1>
			  
			  <p><spring:message code="goodspledge.form.subheader"/></p>
			  <a class="btn btn-primary btn-lg" data-toggle="modal" data-backdrop="static" data-target="#contactInformationCreateUpdateModal" data-id="${landingFormModel.id}" data-modal-title="Contact Us" data-association-type="one-to-one" data-callback-display-type="inline" data-callback-table-body-id="contactInformationTableBody" data-property-url="contactinformation">Contact Us</a>
			  <h2>Built by Netgrains</h2>
			  <p>This system was built using Netgrains Data Harvester software.</p>
			  
			</div>
    </div>
    
	  	<spring:url value="/goodspledges" var="goodsPledgeActionUrl" />
	
	<spring:message code="frmGoodsPledgeGoodsCategoryOnePlaceHolder" var="unselectedGoodsCategoryOne"/>
    
	<spring:message code="frmGoodsPledgeGoodsCategoryTwoPlaceHolder" var="unselectedGoodsCategoryTwo"/>
    
	<spring:message code="frmGoodsPledgeGoodsCategoryThreePlaceHolder" var="unselectedGoodsCategoryThree"/>
    
	<spring:message code="frmGoodsPledgeGoodsSizePlaceHolder" var="unselectedGoodsSize"/>
    
	<spring:message code="frmGoodsPledgeGoodsNewOrUsedPlaceHolder" var="unselectedGoodsNewOrUsed"/>
    
	<spring:message code="frmGoodsPledgeGoodsConditionPlaceHolder" var="unselectedGoodsCondition"/>
    
	<spring:message code="frmGoodsPledgeGoodsQuantityPlaceHolder" var="unselectedGoodsQuantity"/>
    
	<form:form id="frmGoodsPledge" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="goodsPledgeFormModel" action="${goodsPledgeActionUrl}">
		<form:hidden id="frmGoodsPledgeGoodsPledgeId" path="id" />
		<input type="hidden" id="frmGoodsPledgeGoodsPledgeMode" value="webpage" />
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />


<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/goodsPledgeJs.js" var="goodsPledgeJs" />
  
<script src="${goodsPledgeJs}"></script>

</body>
</html>

