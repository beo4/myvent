package de.myvent.foursquare

import grails.plugins.springsocial.config.foursquare.FoursquareConfig;

import org.springframework.social.connect.ConnectionFactoryLocator
import org.springframework.social.connect.support.ConnectionFactoryRegistry
import org.springframework.social.foursquare.api.Foursquare
import org.springframework.social.foursquare.api.VenueSearchParams
import org.springframework.social.foursquare.api.impl.FoursquareTemplate
import org.springframework.social.foursquare.connect.FoursquareConnectionFactory
import org.springframework.social.foursquare.connect.FoursquareServiceProvider;


class FoursquareService {
	Foursquare foursquare
	FoursquareConfig foursquareConfig
	
	def Foursquare getFoursquare() {
		if (!foursquare) {
			foursquare = foursquareConfig.foursquare()
		}
		
		return foursquare
	}

	def getVenuesAt(lat,lng){
		//getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams().location(lat,lng))
		
		return getFoursquare().venueOperations().search(new VenueSearchParams().location(lat,lng))
	}

//	def getVenuesNear(near){
//
//		getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams(near))
//
//	}
}
