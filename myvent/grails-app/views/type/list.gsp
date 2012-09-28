
<%@ page import="de.myvent.myvent.Type" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'type.label', default: 'Type')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="color" title="${message(code: 'type.color.label', default: 'Color')}" />
						
							<g:sortableColumn property="name" title="${message(code: 'type.name.label', default: 'Name')}" />
						
							<th class="header"><g:message code="type.typePicture.label" default="Type Picture" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${typeInstanceList}" var="typeInstance">
						<tr>
						
							<td>${fieldValue(bean: typeInstance, field: "color")}</td>
						
							<td>${fieldValue(bean: typeInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: typeInstance, field: "typePicture")}</td>
						
							<td class="link">
								<g:link action="show" id="${typeInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${typeInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
