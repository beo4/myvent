package de.myvent.foursquare

import java.net.Authenticator;
import java.net.PasswordAuthentication;

import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.foursquare.api.Foursquare
import org.springframework.social.foursquare.api.VenueSearchParams
import org.springframework.social.foursquare.connect.FoursquareServiceProvider
import org.springframework.util.Assert;


class FoursquareService {
	def grailsApplication

	def getFoursquareServiceProvider(){
		String consumerKey = grailsApplication.config.grails.plugins.springsocial.foursquare.clientId ?: ""
		String consumerSecret = grailsApplication.config.grails.plugins.springsocial.foursquare.clientSecret ?: ""
		Assert.hasText(consumerKey, "The Foursquare clientId is necessary, please add to the Config.groovy as follows: grails.plugins.springsocial.foursquare.clientId='yourConsumerKey'")
		Assert.hasText(consumerSecret, "The Foursquare clientSecret is necessary, please add to the Config.groovy as follows: grails.plugins.springsocial.foursquare.clientSecret='yourConsumerSecret'")
		return new FoursquareServiceProvider(consumerKey,consumerSecret)
	}
	
	def getVenuesAt(lat,lon,query){

		return getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams().location(lat,lon).query(query))
	}

	def getVenuesNear(near,query){
		
		return getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams().near(near))
	}
	
	
	def suggestVenues(lat, lon, query) {
		return getFoursquareServiceProvider().getApi().venueOperations().suggestCompletion(new VenueSearchParams().location(lat,lon).query(query))
	}
}
