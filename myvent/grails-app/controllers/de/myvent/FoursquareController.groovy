package de.myvent

import grails.converters.JSON

class FoursquareController {
	def foursquareService
	

	def index() {
		
	}
	
	def locationsNear() { 
		def venues
		if (((params.lat&&params.lon)||session['position'])&&!params.searchLocation) {
			def position = session['position']
			if (params.lat&&params.lon) {
				venues = foursquareService.getVenuesAt(Double.valueOf(params.lat),Double.valueOf(params.lon),params.searchQuery)
			} else if (position) {
				venues = foursquareService.getVenuesAt(position.coords.latitude,position.coords.longitude,params.searchQuery)
			}
			
			
		} else {
			venues = foursquareService.getVenuesNear(params.searchLocation,params.searchQuery)
		}
		
		session.venueSearchResult = venues
		render venues as JSON
	}
	
	def suggestLocation() {
			def venues = foursquareService
	}
	
	
}
