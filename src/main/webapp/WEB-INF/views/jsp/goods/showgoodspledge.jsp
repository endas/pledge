<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="en">
<spring:message code="goodspledge.form.title" var="title"/>
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

	<h1><spring:message code="goodspledge.form.header"/></h1>
	<br />
	
	

	<div class="row">
		<label class="col-sm-2">Goods Category One</label>
		<div class="col-sm-10">${goodsPledge.goodsCategoryOne}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Goods Category Two</label>
		<div class="col-sm-10">${goodsPledge.goodsCategoryTwo}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Goods Category Three</label>
		<div class="col-sm-10">${goodsPledge.goodsCategoryThree}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Size</label>
		<div class="col-sm-10">${goodsPledge.goodsSize}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">New/Used</label>
		<div class="col-sm-10">${goodsPledge.goodsNewOrUsed}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Goods Condition</label>
		<div class="col-sm-10">${goodsPledge.goodsCondition}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Quantity</label>
		<div class="col-sm-10">${goodsPledge.goodsQuantity}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Additional Information</label>
		<div class="col-sm-10">${goodsPledge.additionalInformation}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Package Size</label>
		<div class="col-sm-10">${goodsPledge.itemSize}</div>
	</div>



	<div class="row">
		<label class="col-sm-2">Save</label>
		<div class="col-sm-10">${goodsPledge.saveButton}</div>
	</div>




</div>
<jsp:include page="../includes/redcrossfooter.jsp" />
<spring:url value="/scripts/js/goodspledge/goodspledge.js" var="goodspledgeJs" />
</body>
</html>
