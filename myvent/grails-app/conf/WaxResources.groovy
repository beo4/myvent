modules = {
	wax {
		
		dependsOn 'wax-mm-js'
	}
	
	'wax-mm-js' {
		dependsOn 'modestmaps-js,controls-css'
		
		resource url: 'js/wax/wax.mm.min.js'
	}
	'wax-g-js' {
		resource url: 'js/wax/wax.g.min.js'
	}
	'wax-ol-js' {
		resource url: 'js/wax/wax.ol.min.js'
	}
	'wax-p-js' {
		resource url: 'js/wax/wax.p.min.js'
	}
	'modestmaps-js' {
		resource url: 'js/wax/modestmaps.min.js'
	}
	
	'controls-css' {
		resource url: 'css/wax/controls.css'
	}
	
}