<%@ page defaultCodec="html"%>
<%@ page import="org.springframework.social.foursquare.api.GeoCode"%>
<%@ page
	import="org.springframework.social.foursquare.api.VenueSearchResponse"%>
<div class="control-group ${invalid ? 'error' : ''}">
	<g:javascript>
		var timer, selected, markerFeatures,
		    markerColor= '#000',
	        markerSymbol= 'star-stroked',
	        markerSize= 'small';

		jQuery().ready(function(){
			//create myvent-create events on click
			markerLayer.factory(markerFactory);
			markerLayer.key(function(f) { return f.venue.id;});
			markerLayer.filter(function(f) { 
				return true;
			})
			//interaction.formatter(tooltip);
			jQuery('#locateMe').tooltip();
		});
		
		
		function populateList(data,textStatus) {
			addMapmarkers(data);
			addTableEntries(data);
			m.setExtent(markerLayer.extent());
		}
		
		function addMapmarkers(data) {
			markerFeatures = new Array();
		
			//add a marker for every result
			jQuery.each(data.venues, function (index,valueOfElement){
				markerFeatures[index] = {
					  'venue': valueOfElement,
					  show: true,
	                  geometry: {
	                      coordinates: [
	                          valueOfElement.location.longitude,
	                          valueOfElement.location.latitude]
	                  },
	                  properties: {
	                      'marker-color': markerColor,
	                      'marker-symbol': markerSymbol,
	                      title: valueOfElement.name,
	                      'marker-size': markerSize,
	                  }
	              };
	             }
              );
              markerLayer.features(markerFeatures);
       }
       
       function addTableEntries(data) {       
              
              var r = new Array(), j = -1;
              //create hole list
              r[++j] = '<ul class="resultList" id="venueList">'; 
             for (var key=0, size=data.venues.length; key < size; key++){
				r[++j] ='<li id='+data.venues[key].id+' class="result"><div>';
				r[++j] = data.venues[key].name; r[++j] = '</div> <ul>'; 
				jQuery.each(data.venues[key].categories, function(index,value){
					r[++j] = '<li>'+value.name+'</li>'; 
				});
				r[++j] = '</ul><div>'; 
				r[++j] = getAddressFromLocation(data.venues[key].location);
				 r[++j] = '</div></li>';
			}
			r[++j] = '</ul>';
			 
			 var table = jQuery(r.join('')).attr("id","venueList"); 
			 
			 //on click
			 table.children('li').click(function() {
			 		var elem = jQuery(this);
			 		jQuery('li.highlighted').toggleClass('highlighted',false);
		            elem.toggleClass('highlighted',true)
				    var clickedId = elem.attr('id');
				    
				    //map markers
				    var result = jQuery.grep(markerLayer.features(), function(f){ return f.venue.id == clickedId; });
				    (selected) ? selected['show']=true : null;
		            selected=result[0];
				    result[0]['show']=false;
				    
				    animateSelected(selected.marker);
				    
				    
				}).hover(
				function(){
					var elem = jQuery(this);
					var clickedId = elem.attr('id');
					var hoverFeature = jQuery.grep(markerLayer.features(), function(f){ return f.venue.id == clickedId; });
					jQuery(hoverFeature[0].marker).tooltip('show');
				},
				function(){
					var elem = jQuery(this);
					var clickedId = elem.attr('id');
					var hoverFeature = jQuery.grep(markerLayer.features(), function(f){ return f.venue.id == clickedId; });
					jQuery(hoverFeature[0].marker).tooltip('hide');
				}
				);
			 
			 //replace old content in one step
			 jQuery('#flexContent').html(table);
              
		}
		
		function markerHover(elem, properties){
			elem.attr('src',markerRenderer(properties));
			return elem;
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
		
		function markerFactory(featureObject) {
		
				// Create a marker using the simplestyle factory
		        var elem = mapbox.markers.simplestyle_factory(featureObject);
		        
		        // Add function that highlights list entry
		        MM.addEvent(elem, 'click', function(e) {
		       		
		        	jQuery('li.highlighted').toggleClass('highlighted',false);
		            jQuery('li#'+featureObject.venue.id).toggleClass('highlighted',true).ScrollTo({
						    onlyIfOutside: true
						});
					
					(selected) ? selected['show']=true : null;
		            selected=featureObject;
		            featureObject['show'] = false;
		            
		            animateSelected(elem);
		        });
		        
		        jQuery(elem).tooltip({html: tooltip(featureObject), title: featureObject.properties.title})
		        
		        featureObject['marker'] = elem;
		        return elem;
		    }
		
		function searchPlace(query,success) {
			
		}
		
		function animateSelected(elem){
			jQuery(elem).animate({top: '-=10px'},100)
		            			.animate({top: '+=10px'},100);
		}
		
		function tooltip(feature) {
		    var o = '', props = feature.properties;
		    if (props.title) {
		        o += '<h3 class="popover-title">' + props.title + '</h3>';
		    }
		    if (props.description) {
		        o += '<div class="popover-content"><p>' +
					props.description + '</p></div>';
		    }
		    if (typeof html_sanitize !== undefined) {
		        o = html_sanitize(o,
		            function(url) {
		                if (/^(https?:\/\/|data:image)/.test(url)) return url;
		            },
		            function(x) { return x; });
		    }
		    return o;
		}
		
	</g:javascript>
	<label class="control-label" for="${property}">
		${message(code: 'myvent.'+property+'.searchLocation.label', default: label)}
	</label>
	<div class="controls">
		<div class="input-append">
			<input type="text" name="searchLocation" value="" id="searchLocation"
				onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
				jQuery.ajax({type:'POST',data:getDataString(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);"
				action="locationsNear" controller="foursquare"
				placeholder="${message(code: 'myvent.search.location.placeholder', default: 'search location or use current map excerpt')}"
				class="input">
			<button id="locateMe" type="button" class="btn"
				data-title="${message(code: 'myvent.search.current.location.label', default: 'locate me')}">
				<i class="icon-screenshot"></i>
			</button>

		</div>
		<g:if test="${invalid}">
			<span class="help-inline">
				${errors.join('<br>')}
			</span>
		</g:if>
	</div>
	<label class="control-label" for="${property}">
		${message(code: 'myvent.'+property+'.place.label', default: 'Location')}
	</label>
	<div class="controls">
		<input type="text" name="searchQuery" value="" id="searchQuery"
			onkeyup="clearTimeout(timer); timer = setTimeout(function ajax_call(){
			jQuery.ajax({type:'POST',data:getDataString(), url:'/myvent/foursquare/locationsNear',success:function(data,textStatus){populateList(data, textStatus);},error:function(XMLHttpRequest,textStatus,errorThrown){}})},1000);"
			action="locationsNear" controller="foursquare"
			data-provide="typeahead">

		<g:select name="venueId" from="" id="venueList" />
		<g:if test="${invalid}">
			<span class="help-inline">
				${errors.join('<br>')}
			</span>
		</g:if>
	</div>
	<div class="controls">
		<input type="text" data-provide="typeahead" data-source="searchPlace">

		<g:if test="${invalid}">
			<span class="help-inline">
				${errors.join('<br>')}
			</span>
		</g:if>
	</div>
</div>