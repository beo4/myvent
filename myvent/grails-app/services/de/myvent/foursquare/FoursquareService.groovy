package de.myvent.foursquare

import grails.plugins.springsocial.config.foursquare.FoursquareConfig;

import org.springframework.social.connect.ConnectionFactoryLocator
import org.springframework.social.connect.support.ConnectionFactoryRegistry
import org.springframework.social.foursquare.api.VenueSearchParams
import org.springframework.social.foursquare.api.impl.FoursquareTemplate
import org.springframework.social.foursquare.connect.FoursquareConnectionFactory
import org.springframework.social.foursquare.connect.FoursquareServiceProvider;


class FoursquareService {
	def grailsApplication
	FoursquareConfig foursquareConfig
	FoursquareTemplate foursquareTemplate
	
	def FoursquareTemplate getFoursquareTemplate() {
		if (!foursquareTemplate)
			foursquareTemplate = new FoursquareTemplate( grailsApplication.config.plugins.springsocial.foursquare.clientId, grailsApplication.config.plugins.springsocial.foursquare.clientSecret)
		return foursquareTemplate
	}
	

	def getVenuesAt(lat,lng){
		//getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams().location(lat,lng))
		
		return getFoursquareTemplate().venueOperations().search(new VenueSearchParams().location(lat,lng))
	}

	def getVenuesNear(near){

		getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams(near))

	}
}
