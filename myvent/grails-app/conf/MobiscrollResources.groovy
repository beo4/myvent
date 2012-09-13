modules = {
	mobiscroll {
		
		dependsOn 'mobiscroll-js'
	}
	
	'mobiscroll-js' {
		dependsOn 'mobiscroll-css'
		
		resource url: 'js/mobiscroll-2.0.2.custom.min.js'
	}
	'mobiscroll-css' {
		resource url: 'css/mobiscroll-2.0.2.custom.min.css'
	}
	
}