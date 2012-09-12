<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.social.foursquare.api.GeoCode" %>
<%@ page import="org.springframework.social.foursquare.api.VenueSearchResponse" %>
<r:require modules="datepicker" />
<div class="control-group ${invalid ? 'error' : ''}">
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.city.label', default: label)}</label>
	<div class="controls">
		
		<div class="input-append date" id="${property}dp" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
			  <input  size="16" type="text" value="12-02-2012" name="${property}">
			  <span class="add-on"><i class="icon-th"></i></span>
		</div>
		<g:javascript>
			jQuery('#${property}dp').datepicker({
			    format: 'dd.mm.yyyy '
			});
		</g:javascript>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>