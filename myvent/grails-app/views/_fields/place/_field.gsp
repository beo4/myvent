<%@ page defaultCodec="html" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<g:javascript>
		var timer;
		function populateList(data,textStatus) {
			
				m.removeLayer(markerLayer);
				// Create an empty markers layer
			  var markerLayer = mapbox.markers.layer();
			
			  // Add interaction to this marker layer. This
			  // binds tooltips to each marker that has title
			  // and description defined.
			  mapbox.markers.interaction(markerLayer);
			  m.addLayer(markerLayer);	
			jQuery.each(data,addMarker);
		}
		function addMarker(indexInArray, valueOfElement) {
			markerLayer.add_feature({
                  geometry: {
                      coordinates: [
                          valueOfElement.location.longitude,
                          valueOfElement.location.latitude]
                  },
                  properties: {
                      'marker-color': '#000',
                      'marker-symbol': 'star-stroked',
                      title: valueOfElement.name,
                  }
              });
		}
	</g:javascript>
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<input type="text" name="searchLocation" value="" id="searchLocation"
		onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:'searchLocation='+jQuery('#searchLocation').val(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},3000);" 
			action="locationsNear" controller="foursquare">
		
		<g:select name="venueId" from="" id="venueList"/>
	
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>