<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.social.foursquare.api.GeoCode" %>
<%@ page import="org.springframework.social.foursquare.api.VenueSearchResponse" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<g:javascript>
		var timer;
		var selected;
		var markerLayerHover;
		var markerLayerSelected;
			
		jQuery().ready(function(){
			//create myvent-create events on click
			markerLayer.factory(markerFactory);
			markerLayer.key(function(f) { return f.venue.id; });
			markerLayer.named('original');
			markerLayerHover = mapbox.markers.layer();
			markerLayerHover.key(function(f) { return f.venue.id; });
			markerLayerHover.named('hover');
			markerLayerSelected = mapbox.markers.layer();
			markerLayerSelected.key(function(f) { return f.venue.id; });
			markerLayerSelected.named('selected');
			
			markerLayerHover.filter(
			function(f) {
			 return false;
			 });
			 
			markerLayerSelected.filter(
			function(f) {
			 return false;
			 });
			 
			 m.addLayer(markerLayerSelected);
			 m.addLayer(markerLayerHover);
			 
			
			jQuery('#venueList option').hover(
				function(eventObject) {
					var hoverObject = jQuery(this);
				  	markerHover(hoverObject.val(),markerLayerHover);
				},
				function(eventObject) {
					var hoverObject = jQuery(this);
				  	markerHover(hoverObject.val(),markerLayerHover);
				})
				
				jQuery('#venueList').change(
				function(eventObject) {
					selected = jQuery(this).find(':selected');
				  	markerHover(selected.val(),markerLayerSelected);
				}
			);
		});
		
		
		function populateList(data,textStatus) {
			
			//remove old features
			markerLayer.features([]);
			markerLayerHover.features([]);
			markerLayerSelected.features([]);
			markerLayer.named(jQuery('#searchLocation').val());
			
  			//remove options in select
  			jQuery('#venueList').find('option').remove()
  			
			jQuery.each(data.venues,computeResults);
			m.setExtent(markerLayer.extent());
		}
		function computeResults(indexInArray, valueOfElement) {
			//add a marker for every result
			//add options to select
			var option = new Option(valueOfElement.name,valueOfElement.id);
			jQuery('#venueList').append(option);
			
			var feature = {
				  'venue': valueOfElement,
				  'option': option,
                  geometry: {
                      coordinates: [
                          valueOfElement.location.longitude,
                          valueOfElement.location.latitude]
                  },
                  properties: {
                      'marker-color': '#000',
                      'marker-symbol': 'star-stroked',
                      title: valueOfElement.name,
                      'marker-size': 'small',
                  }
              };
              
              var selectedFeature = jQuery.extend(true, {}, feature);
		      selectedFeature.properties['marker-size']='medium';
		      selectedFeature.properties['marker-color']='7cfc00';
		      selectedFeature.properties['hide']=true;
		      
		      var hoverFeature = jQuery.extend(true, {}, selectedFeature);
		      hoverFeature.properties['marker-size']='large';
		      hoverFeature.properties['marker-color']='ff8c00';
		      hoverFeature.properties['hide']=true;
              
              markerLayer.add_feature(feature);
              markerLayerHover.add_feature(hoverFeature);
              markerLayerSelected.add_feature(selectedFeature);
              
              jQuery(option).data('original', feature);
		      jQuery(option).data('hover', hoverFeature);
		      jQuery(option).data('selected', selectedFeature);
              
              
		}
		function removeMarker(marker) {
			marker.remove();
		}
		function markerHover(idHover,layer){
			layer.filter(
			function(f) {
			 return (idHover==f.venue.id)
			 });
			 markerLayer.filter(
			function(f) {
			 return !(idHover==f.venue.id)
			 });
		} 
		
		function getDataString(){
		    var result
			if (!jQuery('#searchLocation').val()) {
				result = 'lat='+m.center().lat+'&'+'lon='+m.center().lon;
			} else {
				result = 'searchLocation='+jQuery('#searchLocation').val();
			}
				
			if (jQuery('#searchQuery').val()) {
				result+='&searchQuery='+jQuery('#searchQuery').val();
			}
			return result;
		}
		function markerFactory(featureObject) {
		
		        // Create a marker using the simplestyle factory
		        var elem = mapbox.markers.simplestyle_factory(featureObject);
		        
		        // Add function that centers marker on click
		        MM.addEvent(elem, 'click', function(e) {
		            jQuery('#venueList').val(featureObject.venue.id);
		            markerHover(featureObject.venue.id,markerLayerSelected);
		        });
		        
		        jQuery(elem).mouseenter(
		        	function(){markerHover(featureObject.venue.id,markerLayerHover)}
		        );
		        
		        return elem;
		    }
		function markerFactoryHover(featureObject) {
		
		        // Create a marker using the simplestyle factory
		        var elem = mapbox.markers.simplestyle_factory(featureObject);
		        
		        // Add function that centers marker on click
		        MM.addEvent(elem, 'click', function(e) {
		            jQuery('#venueList').val(featureObject.venue.id);
		            markerHover(featureObject.venue.id,markerLayerSelected);
		        });
		        
		        jQuery(elem).mouseleave(
		        	function(){
		        	markerLayerHover.filter(function(f){return false});
		        	if (selected) {
		        		
		        	}
		        	}
		        );
		        
		        return elem;
		    }
		    
	</g:javascript>
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.city.label', default: label)}</label>
	<div class="controls">
		<input type="text" name="searchLocation" value="" id="searchLocation"
		onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:getDataString(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);" 
			action="locationsNear" controller="foursquare">
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.location.label', default: 'Location')}</label>
	<div class="controls">
		<input type="text" name="searchQuery" value="" id="searchQuery"
		onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:getDataString(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);" 
			action="locationsNear" controller="foursquare">
		
		<g:select name="venueId" from="" id="venueList" />
	
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>