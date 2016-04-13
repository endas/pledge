<%@ page session="false"%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html>
<html lang="en">
<c:choose>
	<c:when test="${viewFormModel['currentMode'] == 'ADD'}">
		<spring:message code="view.form.header" var="headerText"/>
	</c:when>
	<c:when test="${viewFormModel['currentMode'] == 'UPDATE'}">
		<spring:message code="view.form.header" var="headerText"/>
	</c:when>
	<c:when test="${viewFormModel['currentMode'] == 'LOCALIZE'}">
		<spring:message code="view.form.header" var="headerText"/>
	</c:when>
	<c:otherwise>
		<spring:message code="view.form.header" var="headerText"/>	
	</c:otherwise>
</c:choose>
<spring:message code="view.form.title" var="title"/>	
<jsp:include page="../jsp/includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="view" />
</jsp:include>
<body>

<jsp:include page="../jsp/messageresource_create_update_dialog.jsp"/>

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
	
	<spring:url value="/view/post" var="viewActionUrl" />
	  
	<form:form id="frmView" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="viewFormModel" action="${viewActionUrl}">

		<form:hidden id="frmViewViewId" path="id" />
		
		<form:hidden id="frmViewMode" path="currentMode" />
		
		<input type="hidden" id="frmViewLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmViewLoadedFeedbackCss" value="${css}" />
    
    
    <section id="viewFormHeaderSection" class="">  
		<div class="container">
			<div class="page-header">
				<h1><spring:message code="view.form.pageheader.viewformheader.headertext"/></h1>
			</div>
		</div>
	</section> <!-- id="viewFormHeaderSection --> 
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="view.form.panel.viewinputspanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
		<spring:bind path="viewName">
      
		  <div id="frmViewViewNameFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		  
			<label id="frmViewViewNameLabel" for="frmViewViewName" class="col-sm-2 control-label"><spring:message code="frmViewViewNameLabel"/></label>
		  
			<div class="col-sm-10">
				
				<spring:message code="frmViewViewNamePlaceHolder" var="frmViewViewNamePlaceHolder"/>    
    
				<form:input path="viewName" type="text" data-display-name="View Name" data-minlength="5" data-required="true" maxlength="50" class="form-control" id="frmViewViewName" placeholder="${frmViewViewNamePlaceHolder}" aria-describedby="frmViewViewNameHelpBlock" data-validate-key-press="true"/>
    
				<span id="frmViewViewNameFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<div id="frmViewViewNameAlertBlock" class="alert alert-dismissible hidden" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<span id="frmViewViewNameAlertBlockText"></span>
				</div>
			</div>
				
				<c:choose>
				  <c:when test="${status.error}">
				<form:errors id="frmViewViewNameHelpBlock" path="viewName" class="help-block col-sm-offset-2 col-sm-10" />
				  </c:when>
				  <c:otherwise>
				<span id="frmViewViewNameHelpBlock" class="help-block col-sm-offset-2 col-sm-10"><spring:message code="frmViewViewNameHelpBlock"/></span>				  
				  </c:otherwise>
				</c:choose>
		  </div>
      
		</spring:bind>
      
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
	    	<div class="panel-heading"><h2><spring:message code="view.form.panel.viewmessagespanel.headertext"/></h2></div>
	    
			<div class="panel-body">
		    
				<div class="form-group">
				  <div class="col-sm-12">
					
        		<button type="button" id="frmViewMessageResourceAddNewButton" class="btn btn-primary pull-left btn-primary-custom" data-toggle="modal" data-backdrop="static" data-target="#messageResourceCreateUpdateModal" data-association-type="one-to-many" data-callback-display-type="table" data-id=null data-invalid-parent-id-message="You must save the Page Administration before you can add Message" data-modal-title="Add Message" data-callback-table-body-id="messageResourceTableBody" data-property-url="messageresource" >Add Message</button>
      
				  </div>
				</div>        
        
				<div class="table-responsive">
					<table id="messageResourceTable" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							<th>Action</th>
							
					<th><spring:message code="frmMessageResourceMessageKeyLabel"/></th>

					<th><spring:message code="frmMessageResourceLocaleLabel"/></th>

					<th><spring:message code="frmMessageResourceMessageLabel"/></th>

							</tr>
						</thead>	
						<tbody id="messageResourceTableBody">
						</tbody>				   
					</table>
		        </div> <!-- class="table-responsive" -->
          
			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
	<div class="container">
		<div class="panel panel-default">
	    
			<div class="panel-body">
		    
	    <button type="submit" class="btn-lg btn-primary"><spring:message code="frmViewSaveButtonLabel"/></button>

			</div> <!-- class="panel-body" -->
		</div> <!-- class="panel panel-default" -->
	</div> <!-- class="container" -->
    
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form:form>
<jsp:include page="../jsp/includes/redcrossfooter.jsp" />	

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/viewJs.js" var="viewJs" />
  
<script src="${viewJs}"></script>

</body>
</html>

