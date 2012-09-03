<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.social.foursquare.api.GeoCode" %>
<%@ page import="org.springframework.social.foursquare.api.VenueSearchResponse" %>
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
  			
  			//remove options in select
  			jQuery('#venueList').find('option').remove()
  			
			jQuery.each(data.venues,computeResults);
			m.ease.location(data.geoCode.feature.geometry.center).zoom(14).optimal()
			//m.ease.optimal()
		}
		function computeResults(indexInArray, valueOfElement) {
			//add a marker for every result
			var feature = markerLayer.add_feature({
				  'valueOfElement': valueOfElement,
                  geometry: {
                      coordinates: [
                          valueOfElement.location.longitude,
                          valueOfElement.location.latitude]
                  },
                  properties: {
                      'marker-color': '#000',
                      'marker-symbol': 'star-stroked',
                      title: valueOfElement.name,
                      'marker-size': 'medium',
                  }
              });
              markerLayer.key(function(f) { return f.valueOfElement.id; });
			//markerLayer.add_feature(feature);
              
              //add options to select
			  jQuery('#venueList').append(
			  	 new Option(valueOfElement.name,valueOfElement.id) ).hover(
			  	 	function(){markerHoverIn(feature)}, 
			  	 	function(){markerHoverOut(feature)});
		}
		function removeMarker(marker) {
			marker.remove();
		}
		function markerHoverIn(feature){
			feature
		}
		function markerHoverOut(feature){
			feature
		}
	</g:javascript>
	<label class="control-label" for="${property}">${label}</label>
	<div class="controls">
		<input type="text" name="searchLocation" value="" id="searchLocation"
		onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:'searchLocation='+jQuery('#searchLocation').val(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);" 
			action="locationsNear" controller="foursquare">
		
		<g:select name="venueId" from="" id="venueList" />
	
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>