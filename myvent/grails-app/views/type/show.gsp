
<%@ page import="de.myvent.myvent.Type" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'type.label', default: 'Type')}" />
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
				
					<g:if test="${typeInstance?.color}">
						<dt><g:message code="type.color.label" default="Color" /></dt>
						
							<dd><g:fieldValue bean="${typeInstance}" field="color"/></dd>
						
					</g:if>
				
					<g:if test="${typeInstance?.name}">
						<dt><g:message code="type.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${typeInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${typeInstance?.typePicture}">
						<dt><g:message code="type.typePicture.label" default="Type Picture" /></dt>
						
							<dd><g:link controller="image" action="show" id="${typeInstance?.typePicture?.id}">${typeInstance?.typePicture?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${typeInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${typeInstance?.id}">
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
