<%@ page defaultCodec="html" %>
<r:require modules="uploadr"/>

<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<uploadr:add name="imageUploadr" path="tmp" maxVisible="1" controller="image" action="upload">
 
		</uploadr:add>
		<ul>
    	<li>
    	<img class="image" src="${createLink(controller:'image', action:'viewImage', id:"property.id")}" /></li>
		</ul>
		
		
		<%= widget %>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>