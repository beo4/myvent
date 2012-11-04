<%@ page defaultCodec="html" %>
<r:require modules="uploadr"/>

<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<uploadr:add name="${property}" path="tmp" maxVisible="1" controller="image" action="upload">
		<uploadr:onSuccess>

	
			// set file to non-deletable (we do not get a delete icon)
			file.deletable = false;
			console.log('set file.deletable to false so the delete icon will not be shown');
	
			// override the background to purple (same as initial files)
			$('.progress',domObj).css('background-color', '#f594cc');
			console.log('and overrided the background color to #f594cc');
	
			// and set the rating tooltip text for the rating
			file.fileRatingText = 'you just uploaded this file and in the onSuccess handler the rating tooltip text is added';
	
			// callback when done
			callback();
		</uploadr:onSuccess>
 		<uploadr:onView>
			window.open('<g:createLink controller="image" action="show"/>'+file.fileId);
		</uploadr:onView>
		</uploadr:add>
		
		<g:if test="${bean.id}">
		<ul>
    	<li>
    	<img class="image" src="${createLink(controller:'image', action:'viewImage', id:bean.id)}" /></li>
		</ul>
		</g:if>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>