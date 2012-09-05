<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.social.foursquare.api.GeoCode" %>
<%@ page import="org.springframework.social.foursquare.api.VenueSearchResponse" %>
<div class="control-group ${invalid ? 'error' : ''}">
	<g:javascript>
		var timer;
		var selected;
			
		jQuery().ready(function(){
			//create myvent-create events on click
			markerLayer.factory(markerFactoryOriginal);
			markerLayer.named('original');
			markerLayerHover = mapbox.markers.layer();
			
			//add hover and select actions to the place select box
			jQuery('#venueList option').hover(
				function(eventObject) {
				  	//markerHover(hoverId,markerLayerHover);
				},
				function(eventObject) {
				  	//markerHover(hoverObject.val(),markerLayerHover);
				})
				
			jQuery('#venueList').change(
				function(eventObject) {
				if (selected) {
					originalFeature = jQuery(selected.option).data('original');
					markerHover(selected,originalFeature.properties)
					}
					selected = jQuery(this).find(':selected').data('original')
					var hoverFeature = jQuery.extend(true, {}, selected);
						hoverFeature.properties['marker-size']='large';
						hoverFeature.properties['marker-color']='ff8c00';
					markerHover(jQuery(selected).data('elem'),hoverFeature.properties)
				}
			);
		});
		
		
		function populateList(data,textStatus) {
			
			//remove old features
			markerLayer.features([]);
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
              
              markerLayer.add_feature(feature);
              
              jQuery(option).data('original', feature);
              
              
		}
		function markerHover(elem, properties){
			jQuery(elem).attr('src',markerRenderer(properties));
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
		
		function markerFactoryOriginal(featureObject) {
		
		        // Create a marker using the simplestyle factory
		        var elem = mapbox.markers.simplestyle_factory(featureObject);
		        
		        var selectedFeature = jQuery.extend(true, {}, featureObject);
					selectedFeature.properties['marker-size']='medium';
					selectedFeature.properties['marker-color']='f08c0f';
		        
		        // Add function that centers marker on click
		        MM.addEvent(elem, 'click', function(e) {
		            jQuery('#venueList').val(featureObject.venue.id);
		            selected=featureObject;
		            markerHover(elem,selectedFeature.properties);
		        });
		        
		        var hoverFeature = jQuery.extend(true, {}, featureObject);
					hoverFeature.properties['marker-size']='large';
					hoverFeature.properties['marker-color']='ff8c00';
		        
		        jQuery(elem).hover(
		        function(){
		        	markerHover(elem,hoverFeature.properties);
		        	},
		        function(){
		        	markerHover(elem,featureObject.properties);
		        	}
		        )
		        
		       jQuery(featureObject.option).data('element',elem);
		        
		        return elem;
		    }

		function markerRenderer(fp) {
			var size = fp['marker-size'] || 'medium';
		    var symbol = (fp['marker-symbol']) ? '-' + fp['marker-symbol'] : '';
		    var color = fp['marker-color'] || '7e7e7e';
		    color = color.replace('#', '');
	
			var src = (mapbox.markers.marker_baseurl || 'http://a.tiles.mapbox.com/v3/marker/') +
		      'pin-' +
		      // Internet Explorer does not support the `size[0]` syntax.
		      size.charAt(0) + symbol + '+' + color +
		      ((window.devicePixelRatio === 2) ? '@2x' : '') +
		      '.png';
		    return src;
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