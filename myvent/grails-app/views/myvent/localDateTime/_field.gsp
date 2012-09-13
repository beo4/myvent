<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.social.foursquare.api.GeoCode" %>
<%@ page import="org.springframework.social.foursquare.api.VenueSearchResponse" %>
<r:require modules="datepicker" />
<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.city.label', default: label)}</label>
	<div class="controls">
		<div class="input-append date" id="${property}dp" data-date="<joda:format style="M-" />" data-date-format="dd-mm-yyyy">
			  <input  size="16" type="text" value="<joda:format style="M-" />" name="${property}-date">
			  <span class="add-on"><i class="icon-th"></i></span>
		</div>
		
		<div class="input-append time" id="${property}tp" data-date="<joda:format style="-M" />" data-date-format="dd-mm-yyyy">
			   <joda:timePicker /> 
			   
			  <span class="add-on"><i class="icon-time"></i></span>
		</div>
		
		<g:javascript>
			jQuery('#${property}dp').datepicker({
			    format: 'dd.mm.yyyy '
			});
		</g:javascript>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>