<%@ page import="de.myvent.myvent.Myvent" %>
<!doctype html>
<html>
	<head>
		<r:require modules="bootstrap-tab" />
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'myvent.label', default: 'Myvent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li class="active">
							<g:link class="create" action="create">
								<i class="icon-plus icon-white"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">
				<div class="well">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${myventInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${myventInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="create" >
						<ul class=" nav nav-tabs">
							<li class="active"><g:link url="#step1" data-toggle="tab"><g:message code="default.create.step1" default="Step 1 Add Place" /></g:link></li>
							<li><g:link url="#step2" data-toggle="tab"><g:message code="default.create.step2" default="Step 2 Date" /></g:link></li>
							<li><g:link url="#step3" data-toggle="tab"><g:message code="default.create.step3" default="Step 3 Event" /></g:link></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="step1">
								<fieldset>
								<f:field property="place" bean="myventInstance"/>
								</fieldset>
							</div>
							<div class="tab-pane" id="step2">
								<fieldset>
								<f:field property="start" bean="periodInstance"/>
								<f:field property="stop"  bean="periodInstance"/>
								</fieldset>
							</div>
							<div class="tab-pane" id="step3">
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">
										<i class="icon-ok icon-white"></i>
										<g:message code="default.button.create.label" default="Create" />
									</button>
								</div>
							</div>
						</div>
					</g:form>
				</fieldset>
				</div>
			</div>

		</div>
	</body>
</html>
