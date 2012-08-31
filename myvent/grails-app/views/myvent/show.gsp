
<%@ page import="de.myvent.myvent.Myvent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'myvent.label', default: 'Myvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${myventInstance?.description}">
						<dt><g:message code="myvent.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${myventInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${myventInstance?.name}">
						<dt><g:message code="myvent.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${myventInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${myventInstance?.eventPicture}">
						<dt><g:message code="myvent.eventPicture.label" default="Event Picture" /></dt>
						
							<dd><g:link controller="image" action="show" id="${myventInstance?.eventPicture?.id}">${myventInstance?.eventPicture?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${myventInstance?.period}">
						<dt><g:message code="myvent.period.label" default="Period" /></dt>
						
							<dd><g:link controller="period" action="show" id="${myventInstance?.period?.id}">${myventInstance?.period?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${myventInstance?.place}">
						<dt><g:message code="myvent.place.label" default="Place" /></dt>
						
							<dd><g:link controller="place" action="show" id="${myventInstance?.place?.id}">${myventInstance?.place?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${myventInstance?.type}">
						<dt><g:message code="myvent.type.label" default="Type" /></dt>
						
							<dd><g:link controller="type" action="show" id="${myventInstance?.type?.id}">${myventInstance?.type?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${myventInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${myventInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
