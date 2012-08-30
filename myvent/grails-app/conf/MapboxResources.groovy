modules = {
	mapbox {
		
		dependsOn 'mapbox-js'
	}
	
	'mapbox-js' {
		dependsOn 'mapbox-css'
		
		resource url: 'js/wax/mapbox.js'
	}
	'mapbox-css' {
		resource url: 'css/wax/mapbox.css'
	}
	
}