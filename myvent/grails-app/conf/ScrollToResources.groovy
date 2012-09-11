def dev = grails.util.GrailsUtil.isDevelopmentEnv()

modules = {
	scrollto {
		
		if (!dev) {
			dependsOn 'scrollto-js'
		} else {
			dependsOn 'scrollto-uncompressed-js'
		}
			
	}
	
	'scrollto-js' {
		resource url: 'js/jquery.scrollto.min.js'
	}
	
	'scrollto-uncompressed-js' {
		resource url: 'js/jquery.scrollto.js'
	}
	
}