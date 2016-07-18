
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>${param.title}</title>
  
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<spring:url value="/wro/bundledCss.css" var="bundledCss" />
	<spring:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" var="fontAwesomeCss" />
	<spring:url value="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css" var="dataTablesForBootstrapCss" />
	<spring:url value="/resources/css/formstyles.css" var="formStylesCss" />
	
	<link href="${bundledCss}" rel="stylesheet" />
	<link href="${fontAwesomeCss}" rel="stylesheet" />
	<link href="${dataTablesForBootstrapCss}" rel="stylesheet" />
	<link href="${formStylesCss}" rel="stylesheet" />
	<!--<spring:url value="/wro/underscoreJs.js" var="underscoreJs" />		-->
	<spring:url value="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js" var="underscoreJs" />	
	<script src="${underscoreJs}"></script>
</head>
