package de.myvent

import grails.converters.JSON

class FoursquareController {
	def foursquareService
	

	def index() {
		
	}
	
	def locationsNear() {
		def position = session['position']
		
		def venues = foursquareService.getVenuesAt(position.coords.latitude,position.coords.longitude)
		render venues as JSON
	}
	
	
}
