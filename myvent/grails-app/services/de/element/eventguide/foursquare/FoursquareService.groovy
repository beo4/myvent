package de.element.eventguide.foursquare

import fi.foyt.foursquare.api.FoursquareApi
import fi.foyt.foursquare.api.Result
import fi.foyt.foursquare.api.entities.VenuesSearchResult
import grails.converters.JSON

class FoursquareService {

    def getVenuesAt(ll){
		
		FoursquareApi foursquareApi = new FoursquareApi("MRBDP1Q4SBHLWYJULJJNO5A22IMSKGBVKJULVPAP1HC0403D", "JXT2GJFG3VYIT0OCLET2ROFFMQ2IDCCXBWA3KXGJ5UTP3CYO","test");
		// After client has been initialized we can make queries.
		Result<VenuesSearchResult> result = foursquareApi.venuesSearch(ll, null, null, null, null, null, null, null, null, null, null);
		
		if (result.getMeta().getCode() == 200) {
		  // if query was ok we can finally we do something with the data
			
		  result.getResult().getVenues().each {
			
		  }
		  return result.getResult().getVenues()
		} else {
		  return null
		}
		
	}
}
