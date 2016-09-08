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
<jsp:include page="../includes/header.jsp">
	<jsp:param name="title" value="${title}" />
	<jsp:param name="beanName" value="view" />
</jsp:include>
<body>

<jsp:include page="../messages/messageresource_create_update_dialog.jsp"/>

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
	
	<spring:url value="/view/translate" var="viewActionUrl" />
	  
	<form:form id="frmView" role="form" class="form-horizontal" method="post" accept-charset="utf-8"
                modelAttribute="viewTranslationFormModel" action="${viewActionUrl}">

		<form:hidden id="frmViewViewId" path="id" />
		
		<form:hidden id="frmViewViewViewId" path="viewId" />
		
		<form:hidden id="frmViewMode" path="currentMode" />
		
		<input type="hidden" id="frmViewLoadedFeedbackMessage" value="${msg}" />
		<input type="hidden" id="frmViewLoadedFeedbackCss" value="${css}" />
    
    
	<div class="container">
      	    
  		<div class="well">    
		  <div id="existingLocaleFormGroup" class="form-group has-feedback ${status.error ? 'has-error' : ''}">
			<label id="existingLocaleLabel" for="existingLocale" class="col-sm-2 control-label"><spring:message code="existingLocaleLabel"/></label>
			<div class="col-sm-4 select-container">
					
				<form:select path="${model.defaultLocale}" data-display-name="${existingLocaleSelectLabel}" data-select-type="standalone" data-required="false" class="form-control" id="existingLocale" aria-describedby="existingLocaleHelpBlock">
					<form:options items="${localeMap}" />
				</form:select>
    
				<span id="existingLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>

			</div>

			<label id="newLocaleLabel" for="newLocale" class="col-sm-2 control-label"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-4 select-container">
			<spring:bind path="newLocale">		
				<form:select path="newLocale" data-display-name="${newLocaleSelectLabel}" data-select-type="standalone" data-required="false" class="form-control" id="newLocale" aria-describedby="newLocaleHelpBlock">
					<form:options items="${localeMap}" />
				</form:select>
    		</spring:bind>
				<span id="newLocaleFeedbackIcon" class="glyphicon form-control-feedback" aria-hidden="true"></span>

			</div>
		  </div>
		</div> <!-- class="well" -->
		  
		  
		  <div class="form-group">
		  	<label id="pageTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="view.form.title.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageTitleTranslateToLabel" for="view.form.title.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="formTitle" type="text" class="form-control" id="view.form.title.localizer.input" placeholder=""/>
				<span id="pageTitleLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="view.form.header.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageHeaderTitleTranslateToLabel" for="view.form.header.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewTitle" type="text" class="form-control" id="view.form.header.localizer.input" placeholder=""/>
				<span id="pageHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="pageSubHeaderTitleTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="view.form.subheader.localizer.label" class="col-sm-4 form-control-static"></p>
			<label id="pageSubHeaderTitleTranslateToLabel" for="view.form.subheader.localizer.input" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:textarea path="formSubHeader" rows="5" maxlength="2000" class="form-control" id="view.form.subheader.localizer.input" placeholder=""/>
				<span id="pageSubHeaderTextLocalizerHelpBlock" class="help-block"><spring:message code="pageHeaderTitleLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  


	</div> <!-- class="container" -->
      
	    
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
      
		<div class="well">
        
		  <div class="form-group">
		  	<label id="frmViewViewNameLabelTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmViewViewNameLabelLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmViewViewNameLabelTranslateToLabel" for="frmViewViewNameLabelLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewNameLabel" type="text" class="form-control" id="frmViewViewNameLabelLocalizer" placeholder=""/>
				<span id="frmViewViewNameLabelLocalizerHelpBlock" class="help-block"><spring:message code="labelLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		  <div class="form-group">
		  	<label id="frmViewViewNamePlaceHolderTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmViewViewNamePlaceHolderLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmViewViewNamePlaceHolderTranslateToLabel" for="frmViewViewNamePlaceHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewNamePlaceHolder" type="text" class="form-control" id="frmViewViewNamePlaceHolderLocalizer" placeholder=""/>
				<span id="frmViewViewNamePlaceHolderLocalizerHelpBlock" class="help-block"><spring:message code="placeHolderLocalizerHelpBlockText"/></span>
			</div>
		  </div>	
		  <div class="form-group">
		  	<label id="frmViewViewNameHelpBlockTranslateFromLabel" class="col-sm-1 control-label left-align"><spring:message code="existingLocaleLabel"/></label>
			<p id="frmViewViewNameHelpBlockLocalizerLabel" class="col-sm-4 form-control-static"></p>
			<label id="frmViewViewNameHelpBlockTranslateToLabel" for="frmViewViewNameHelpBlockHolderLocalizer" class="col-sm-1 control-label left-align"><spring:message code="newLocaleLabel"/></label>
			<div class="col-sm-6">
				<form:input path="viewNameHelpText" type="text" class="form-control" id="frmViewViewNameHelpBlockLocalizer" placeholder=""/>
				<span id="frmViewViewNameHelpBlockLocalizerHelpBlock" class="help-block"><spring:message code="helpBlockLocalizerHelpBlockText"/></span>
			</div>
		  </div>
		  
		</div> <!-- div class="well" -->
      
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
<jsp:include page="../includes/redcrossfooter.jsp" />

<script>  
var rootContext = "${pageContext.request.contextPath}";
</script>

  
<spring:url value="/wro/viewJs.js" var="viewJs" />
  
<script src="${viewJs}"></script>

</body>
</html>

