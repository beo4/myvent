<%@ page
	import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<title><g:layoutTitle default="${meta(name: 'app.name')}" /></title>
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport" content="initial-scale = 1.0">

<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<r:require modules="scaffolding" />
<r:require modules="mapbox" />

<!-- Le fav and touch icons -->
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="72x72"
	href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">
<geolocation:resources />
<g:layoutHead />
<r:layoutResources />
</head>

<body>
	<nav class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="${createLink(uri: '/')}">Grails Twitter
					Bootstrap</a>

				<div class="nav-collapse">
					<ul class="nav">
						<li
							<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a
							href="${createLink(uri: '/')}">Home</a></li>
						<g:each var="c"
							in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li
								<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link
									controller="${c.logicalPropertyName}">
									${c.naturalName}
								</g:link></li>
						</g:each>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<div class="container-fluid overlay">
		<g:layoutBody />
				<hr>

				<footer>
					<p>&copy; myVent 2012</p>
				</footer>
	</div>
	<div class="map-container">
		<div id="map">
			
		</div>
		
	</div>
	<g:javascript>
			jQuery('#map').css({'height':((jQuery(window).height()))+'px'});
		
		    jQuery(window).resize(function(){
		    	jQuery('#map').css({'height':((jQuery(window).height()))+'px'});
		    });
	
			// Create map
		    var m = mapbox.map('map');
		    var markerLayer;
		    m.addLayer(mapbox.layer().id('${grailsApplication.config.grails.plugins.mapbox.mapId}'));
			
			  // Create an empty markers layer
			  markerLayer = mapbox.markers.layer();
			
			  // Add interaction to this marker layer. This
			  // binds tooltips to each marker that has title
			  // and description defined.
			  mapbox.markers.interaction(markerLayer);
			  m.addLayer(markerLayer);
			
			</g:javascript>
			<geolocation:locateMe2/>
			<g:javascript>
				function geolocFail() {
					if (m)
						{m.zoom(5).center({ lat:47.857127, lon: 12.175302 });
							
						}
				}
				function geolocSuccess(position) {
					if (m)
						{m.zoom(13).center({ lat:position.coords.latitude, lon: position.coords.longitude});}
				}
				
				
			</g:javascript>
	<r:layoutResources />
</body>
</html>