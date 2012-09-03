<%@ page defaultCodec="html" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<g:javascript>
		var timer;
		function populateList(data,textStatus) {
			
			//jQuery.each(markerLayer.markers(),removeMarker);
			markerLayer.remove()
			var newMarkerLayer = mapbox.markers.layer();
			newMarkerLayer.named(jQuery('#searchLocation').val());
			markerLayer = newMarkerLayer;
			mapbox.markers.interaction(newMarkerLayer);
  			m.addLayer(newMarkerLayer);
  			
  			
  			
			jQuery.each(data,addMarker);
			//m.zoom(10).center(markerLayer.center);
			//m.ease.optimal()
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
		function removeMarker(marker) {
			marker.remove();
		}
	</g:javascript>
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<input type="text" name="searchLocation" value="" id="searchLocation"
		onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:'searchLocation='+jQuery('#searchLocation').val(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);" 
			action="locationsNear" controller="foursquare">
		
		<g:select name="venueId" from="" id="venueList"/>
	
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>