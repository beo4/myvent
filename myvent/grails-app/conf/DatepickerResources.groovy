modules = {
	datepicker {
		
		dependsOn 'datepicker-js'
	}
	
	'datepicker-js' {
		dependsOn 'datepicker-css'
		
		resource url: 'js/datepicker/bootstrap-datepicker.js'
	}
	'datepicker-css' {
		resource url: 'css/datepicker/datepicker.css'
	}
	
}