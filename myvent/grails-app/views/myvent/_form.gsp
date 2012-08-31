<%@ page import="de.myvent.myvent.Myvent" %>



<div class="fieldcontain ${hasErrors(bean: myventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="myvent.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${myventInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myventInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="myvent.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${myventInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myventInstance, field: 'eventPicture', 'error')} required">
	<label for="eventPicture">
		<g:message code="myvent.eventPicture.label" default="Event Picture" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="eventPicture" name="eventPicture.id" from="${de.myvent.util.Image.list()}" optionKey="id" required="" value="${myventInstance?.eventPicture?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myventInstance, field: 'period', 'error')} required">
	<label for="period">
		<g:message code="myvent.period.label" default="Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="period" name="period.id" from="${de.myvent.myvent.Period.list()}" optionKey="id" required="" value="${myventInstance?.period?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myventInstance, field: 'place', 'error')} required">
	<label for="place">
		<g:message code="myvent.place.label" default="Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="place" name="place.id" from="${de.myvent.myvent.Place.list()}" optionKey="id" required="" value="${myventInstance?.place?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myventInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="myvent.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${de.myvent.myvent.Type.list()}" optionKey="id" required="" value="${myventInstance?.type?.id}" class="many-to-one"/>
</div>

