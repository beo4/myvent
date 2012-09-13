package de.myvent

import org.springframework.social.foursquare.api.VenueSearchParams;

import grails.converters.JSON

class FoursquareController {
	def foursquareService
	

	def index() {
		
	}
	
	def locationsNear() {
		
		def searchParameter = new VenueSearchParams(
				sw: params.sw,
				ne: params.ne,
				query: params.query,
				intent: params.intent,
				near: params.near,
				latitude: (params.latitude) ? new Double(params.latitude) : null,
				longitude: (params.longitude) ? new Double(params.longitude) :null,
				limit: params.limit
				  ) 
		
		def venues
		
		if (!((searchParameter.getLatitude()&&searchParameter.getLongitude()) || searchParameter.getNear() || (searchParameter.getNe()&&searchParameter.getSw()) ) ) {
			searchParameter.location(position.coords.latitude,position.coords.longitude)
		}
		
					
			
		venues = foursquareService.findVenues(searchParameter)
		
		session.venueSearchResult = venues
		render venues as JSON
	}
	
	def suggestCompletion() {
		
		def searchParameter = new VenueSearchParams(
				sw: params.sw,
				ne: params.ne,
				query: params.query,
				intent: params.intent,
				near: params.near,
				latitude: (params.latitude) ? new Double(params.latitude) : null,
				longitude: (params.longitude) ? new Double(params.longitude) :null,
				limit: params.limit
				  )
		
		def venues
		
		if (!((searchParameter.getLatitude()&&searchParameter.getLongitude()) || searchParameter.getNear() || (searchParameter.getNe()&&searchParameter.getSw()) ) ) {
			searchParameter.location(position.coords.latitude,position.coords.longitude)
		}
		
					
			
		venues = foursquareService.suggestCompletion(searchParameter)
		
		session.venueSearchResult = venues
		render venues as JSON
	}
	
}
