package de.myvent.foursquare



import grails.test.mixin.*
import org.junit.*

import de.myvent.foursquare.FoursquareService;


/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	
    void testGetVenuesAt(){
		service
		def venues = foursquareService.getVenuesAt(44.3,37.2)
		assert venues
		
    }
}
