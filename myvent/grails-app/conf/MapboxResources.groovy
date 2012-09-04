def dev = grails.util.GrailsUtil.isDevelopmentEnv()

modules = {
	mapbox {
		
		if (!dev) {
			dependsOn 'mapbox-js'
		} else {
			dependsOn 'mapbox-uncompressed-js'
		}
			
	}
	
	'mapbox-js' {
		dependsOn 'mapbox-css'
		
		resource url: 'js/wax/mapbox.js'
	}
	'mapbox-css' {
		resource url: 'css/wax/mapbox.css'
	}
	
	'mapbox-uncompressed-js' {
		dependsOn 'mapbox-css'
		
		resource url: 'js/wax/mapbox.uncompressed.js'
	}
	
}