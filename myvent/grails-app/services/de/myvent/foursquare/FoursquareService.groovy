package de.myvent.foursquare


import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.foursquare.api.Foursquare;
import org.springframework.social.foursquare.api.VenueSearchParams;

import grails.converters.JSON
import grails.util.Environment;

class FoursquareService {
	
	private final Foursquare foursquare
	
	public ConnectionFactoryLocator connectionFactoryLocator() {
		ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry()
		registry.addConnectionFactory(new FoursquareConnectionFactory(grailsApplication.config.grails.plugins.springsocial.foursquare.clientId,
			grailsApplication.config.grails.plugins.springsocial.foursquare.clientSecret)
		return registry;
	}

    def getVenuesAt(lat,lng){
		
//		FoursquareApi foursquareApi = new FoursquareApi("MRBDP1Q4SBHLWYJULJJNO5A22IMSKGBVKJULVPAP1HC0403D", "JXT2GJFG3VYIT0OCLET2ROFFMQ2IDCCXBWA3KXGJ5UTP3CYO","test");
//		// After client has been initialized we can make queries.
//		Result<VenuesSearchResult> result = foursquareApi.venuesSearch(ll, null, null, null, null, null, null, null, null, null, null);
//		
//		if (result.getMeta().getCode() == 200) {
//		  // if query was ok we can finally we do something with the data
//			
//		  result.getResult().getVenues().each {
//			
//		  }
//		  return result.getResult().getVenues()
//		} else {
//		  return null
//		}
		
		
		foursquare.venueOperations().search(new VenueSearchParams().location(lat, lng))
		
	}
	
	def getVenuesNear(near){
		
//		FoursquareApi foursquareApi = new FoursquareApi("MRBDP1Q4SBHLWYJULJJNO5A22IMSKGBVKJULVPAP1HC0403D", "JXT2GJFG3VYIT0OCLET2ROFFMQ2IDCCXBWA3KXGJ5UTP3CYO","test");
//		// After client has been initialized we can make queries.
//		Result<VenuesSearchResult> result = foursquareApi.venuesSearch(null, near, null, null, null, null, null, null);
//		
//		if (result.getMeta().getCode() == 200) {
//		  // if query was ok we can finally we do something with the data
//			
//		  result.getResult().getVenues().each {
//			
//		  }
//		  return result.getResult().getVenues()
//		} else {
//		  return null
//		}
		
	}
}
