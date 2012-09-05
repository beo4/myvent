<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.social.foursquare.api.GeoCode" %>
<%@ page import="org.springframework.social.foursquare.api.VenueSearchResponse" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.city.label', default: label)}</label>
	<div class="controls">
		<joda:dateTimePicker/>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>