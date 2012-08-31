package de.myvent

import grails.converters.JSON

class FoursquareController {
	def foursquareService
	

	def index() {
		
	}
	
	def locationsNear() { 
		def venues
		if (!params.searchLocation) {
			def position = session['position']
		
			venues = foursquareService.getVenuesAt(position.coords.latitude,position.coords.longitude)
		} else {
			venues = foursquareService.getVenuesNear(params.searchLocation)
		}
		
		
		render venues as JSON
	}
	
	
}
