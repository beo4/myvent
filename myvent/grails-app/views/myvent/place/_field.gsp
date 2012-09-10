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
			jQuery('#locateMe').tooltip();
		});
		
		
		function populateList(data,textStatus) {
			
			//remove old features
			markerLayer.features([]);
			markerLayer.named(jQuery('#searchLocation').val());
			
  			//remove options in select
  			jQuery('#venueList').find('tr').remove()
  			
			jQuery.each(data.venues,addMapmarker);
			addTableEntries(data);
			m.setExtent(markerLayer.extent());
		}
		
		function addMapmarker(indexInArray, valueOfElement) {
			//add a marker for every result
			var feature = {
				  'venue': valueOfElement,
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
       }
       
       function addTableEntries(data) {       
              
              //add row to table
			  //var option = new Option(valueOfElement.name,valueOfElement.id);
			  //jQuery('#venueList').append(option);
              //jQuery(option).data('original', feature);
              
              var r = new Array(), j = -1;
              
              r[++j] = '<ul class="resultList">';
              
			 for (var key=0, size=data.venues.length; key < size; key++){
			     r[++j] ='<li id='+data.venues[key].id+' class="result"><div>';
			     r[++j] = data.venues[key].name;
			     r[++j] = '</div><ul>';
			     jQuery.each(data.venues[key].categories, function(index,value){
			     r[++j] = '<li>'+value.name+'</li>';
			     })
			     r[++j] = '</ul><div>';
			     r[++j] = getAddressFromLocation(data.venues[key].location);
			     r[++j] = '</div></li>';
			 }
			 r[++j] = '</ul>'
			 var table = jQuery(r.join('')).attr("id","venueList"); 
			 
			 jQuery('#flexContent').html(table);
              
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
		
		function getAddressFromLocation(location){
			var result = new Array(), j = -1;
			if (location.adress)
				result[j++] = '<span>'+location.adress+'</span>'
			if (location.city)
				result[j++] = '<span>'+location.city+'</span>'
			if (location.state)
				result[j++] = '<span>'+location.state+'</span>'	
			if (location.country)
				result[j++] = '<span>'+location.country+'</span>'		
			return result;
		}
		
		function markerFactoryOriginal(featureObject) {
		
		        // Create a marker using the simplestyle factory
		        var elem = mapbox.markers.simplestyle_factory(featureObject);
		        
		        var selectedFeature = jQuery.extend(true, {}, featureObject);
					selectedFeature.properties['marker-size']='medium';
					selectedFeature.properties['marker-color']='f08c0f';
		        
		        // Add function that highlights list entry
		        MM.addEvent(elem, 'click', function(e) {
		        	jQuery('li.highlighted').toggleClass('highlighted',false);
		            jQuery('li#'+featureObject.venue.id).toggleClass('highlighted',true);
		            selected=featureObject;
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
		
		function searchPlace(query,success) {
			
		}
		
	</g:javascript>
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.searchLocation.label', default: label)}</label>
	<div class="controls">
		<div class="input-append">
			<input type="text" name="searchLocation" value="" id="searchLocation"
			onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
				jQuery.ajax({type:'POST',data:getDataString(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);" 
				action="locationsNear" controller="foursquare" placeholder="${message(code: 'myvent.search.location.placeholder', default: 'search location or use current map excerpt')}"
				class="input">
			<button id="locateMe" type="button" class="btn" data-title="${message(code: 'myvent.search.current.location.label', default: 'locate me')}"><i class="icon-screenshot"></i></button>
			
		</div>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
	<label class="control-label" for="${property}">${message(code: 'myvent.'+property+'.place.label', default: 'Location')}</label>
	<div class="controls">
		<input type="text" name="searchQuery" value="" id="searchQuery"
		onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:getDataString(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);" 
			action="locationsNear" controller="foursquare" data-provide="typeahead">
		
		<g:select name="venueId" from="" id="venueList" />
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
	<div class="controls">
		<input type="text" data-provide="typeahead" data-source="searchPlace">
	
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>