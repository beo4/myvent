<%@ page import="de.myvent.myvent.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'color', 'error')} required">
	<label for="color">
		<g:message code="type.color.label" default="Color" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="type.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${typeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'typePicture', 'error')} required">
	<label for="typePicture">
		<g:message code="type.typePicture.label" default="Type Picture" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="typePicture" name="typePicture.id" from="${de.myvent.util.Image.list()}" optionKey="id" required="" value="${typeInstance?.typePicture?.id}" class="many-to-one"/>
</div>

