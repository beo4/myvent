<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Grails Twitter Bootstrap Scaffolding</title>
	</head>

	<body>
			<g:javascript>
			var url='http://api.tiles.mapbox.com/v3/${grailsApplication.config.grails.plugins.mapbox.mapId}.jsonp';
			
			wax.tilejson(url, function(tilejson) {
			    var map = new MM.Map('map', new wax.mm.connector(tilejson));
			
			    wax.mm.interaction()
			      .map(map)
			      .tilejson(tilejson)
			      .on(wax.tooltip().animate(true).parent(map.parent).events());
			
			    map.setCenterZoom({ lat:0, lon: 0 }, 15);
			  }
			);
			</g:javascript>
		<div class="row-fluid">

			<aside id="application-status" class="span3">
				<div class="well sidebar-nav">
					
					<h5>Application Status</h5>
					<ul>
						<li>App version: <g:meta name="app.version"/></li>
						<li>Grails version: <g:meta name="app.grails.version"/></li>
						<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
						<li>JVM version: ${System.getProperty('java.version')}</li>
						<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
						<li>Domains: ${grailsApplication.domainClasses.size()}</li>
						<li>Services: ${grailsApplication.serviceClasses.size()}</li>
						<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
					</ul>
					<h5>Installed Plugins</h5>
					<ul>
						<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
							<li>${plugin.name} - ${plugin.version}</li>
						</g:each>
					</ul>
				</div>
			</aside>

			<section id="main" class="span9">

				<div class="hero-unit">
					<h1>YourVent, MyVent</h1>
				</div>
					
				<div class="row-fluid">
					
				</div>
			</section>
		</div>
	</body>
</html>
