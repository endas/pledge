<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<spring:message code="global.select.placeholder"
		var="unselectedDefault" />
<spring:bind path="flaggedIssue">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="flaggedIssue" class="col-sm-2 control-label">
			<spring:message code="serviceplegde.flaggedIssue" />
		</form:label>
		<div class="col-sm-5 redcross-field">
			<%--todo: add proper translation mechanism--%>
			<form:select path="flaggedIssue" class="form-control">
				<c:forEach items="${flaggedIssues}" var="issue">
					<spring:message code="${issue.name}" var="label" />
					<form:option value="${issue.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="flaggedIssue"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

<spring:bind path="status">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}"
		<sec:authorize access="hasRole('ROLE_ADMIN')">class="form-group has-feedback  ${status.error ? 'has-error' : ''}"</sec:authorize>
		<sec:authorize access="!hasRole('ROLE_ADMIN')">class="hidden"</sec:authorize>>

		<form:label path="status" class="col-sm-2 control-label">
			<spring:message code="frmPledgeStatusLabel" />
		</form:label>
		<div class="col-sm-5 redcross-field">


			<form:select path="status" data-display-name="Status"
				data-reference-type="PledgeStatus" data-select-type="standalone"
				data-required="true" class="form-control" id="frmPledgeStatus"
				aria-describedby="frmpledgeStatusHelpBlock" onchange="">
				<form:options items="${statusMap}" />
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="status"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>

	</div>
</spring:bind>

<spring:bind path="activeStatus">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="activeStatus" class="col-sm-2 control-label">
			<spring:message code="activeStatus.label" />
		</form:label>
		<div class="col-sm-5 redcross-field">
			<%--todo: add proper translation mechanism--%>
			<form:select path="activeStatus" class="form-control">
				<c:forEach items="${activeStatusValues}" var="status">
					<spring:message code="${status.name}" var="label" />
					<form:option value="${status.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="activeStatus"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

<spring:bind path="pledgeTakenStatus">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="pledgeTakenStatus" class="col-sm-2 control-label">
			<spring:message code="pledgeTakenStatus.label" />
		</form:label>
		<div class="col-sm-5 redcross-field">

			<form:select path="pledgeTakenStatus" class="form-control">
				<c:forEach items="${pledgeTakenStatusValues}" var="status">
					<spring:message code="${status.name}" var="label" />
					<form:option value="${status.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="activeStatus"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>

<spring:bind path="verificationProgress">
	<div class="form-group has-feedback ${status.error ? 'has-error' : ''}">
		<form:label path="verificationProgress" class="col-sm-2 control-label">
			<spring:message code="verificationProgress.label" />
		</form:label>
		<div class="col-sm-5 redcross-field">

			<form:select path="verificationProgress" class="form-control">
				<form:option value="" label="${unselectedDefault}" />
				<c:forEach items="${verificationProgressValues}" var="status">
					<spring:message code="${status.name}" var="label" />
					<form:option value="${status.code}" label="${label}" />
				</c:forEach>
			</form:select>
		</div>
		<div class="clearfix"></div>
		<c:choose>
			<c:when test="${status.error}">
				<form:errors path="activeStatus"
					class="help-block col-sm-offset-2 col-sm-5 redcross-field" />
			</c:when>
		</c:choose>
	</div>
</spring:bind>
