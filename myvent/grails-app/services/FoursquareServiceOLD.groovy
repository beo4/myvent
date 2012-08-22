

import org.springframework.social.foursquare.api.VenueSearchParams
import org.springframework.social.foursquare.connect.FoursquareServiceProvider




class FoursquareServiceOLD {
	def grailsApplication
	
	private FoursquareServiceProvider foursquareServiceProvider
	
	def getFoursquareServiceProvider() {
		if (!foursquareServiceProvider)
			foursquareServiceProvider = new FoursquareServiceProvider( grailsApplication.config.plugins.springsocial.foursquare.clientId, grailsApplication.config.plugins.springsocial.foursquare.clientSecret)
		return foursquareServiceProvider
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

		getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams().location(lat,lng))

		//foursquare.venueOperations().search(new VenueSearchParams().location(lat, lng))

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
		
		getFoursquareServiceProvider().getApi().venueOperations().search(new VenueSearchParams(near))

	}
}
