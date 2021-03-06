<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<html lang="en">
<spring:message code="address.form.title" var="title"/>
<jsp:include page="../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="address" />
</jsp:include>
<body>
<spring:url value="/landingwebpage" var="urlHome"/>
<spring:url value="/entitylist" var="urlAppHome"/>
<spring:url value="/resources/images/redcross-brand-logo.png" var="headerLogo" />
    <!-- Fixed navbar -->
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
			<h1><spring:message code="address.form.header"/></h1>
		</div>
	</div>
	<div id="frmLoadedFeedBack" class="alert alert-${css} alert-dismissible <c:if test="${empty msg}">invisible</c:if>" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>${msg}</strong>
	</div>
	
	<spring:message code="global.date.dateformat" var="dateFormat"/>
		
	<spring:url value="/address/add" var="addAddressUrl" />
	<div class="container">
		<div class="well">
		
		<div class="table-responsive">
		<table id="addressTable" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th></th> <!-- Actions buttons -->
					 
					<th><spring:message code="frmAddressAddressOneLabel"/></th>      
       
					<th><spring:message code="frmAddressAddressTwoLabel"/></th>      
      
				</tr>
			</thead>
			<tbody>
		
			</tbody>
		</table>
		</div>
		</div> <!-- class="well" -->
	</div> <!-- class="container" -->
		<jsp:include page="../includes/redcrossfooter.jsp" />
	
<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>
<spring:url value="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js" var="dataTablesJs" />
<script src="${dataTablesJs}"></script>

<spring:url value="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js" var="dataTablesForBootstrapJs" />
<script src="${dataTablesForBootstrapJs}"></script>

  
<spring:url value="/wro/addressTableJs.js" var="addressTableJs" />
  
<script src="${addressTableJs}"></script>


</body>
</html>
    

