package de.myvent.foursquare

import org.springframework.social.foursquare.api.VenueSearchParams
import org.springframework.social.foursquare.connect.FoursquareServiceProvider;

class FoursquareService {
	def grailsApplication
	FoursquareServiceProvider foursquareServiceProvider
	
	def FoursquareServiceProvider getFoursquareServiceProvider() {
		if (!foursquareServiceProvider)
			foursquareServiceProvider = new FoursquareServiceProvider( grailsApplication.config.plugins.springsocial.foursquare.clientId, grailsApplication.config.plugins.springsocial.foursquare.clientSecret)
		return foursquareServiceProvider
	}

	def getVenuesAt(lat,lng){
		getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams().location(lat,lng))
	}

	def getVenuesNear(near){

		getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams(near))

	}
}
