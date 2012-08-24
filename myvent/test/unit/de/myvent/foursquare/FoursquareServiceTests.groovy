package de.myvent.foursquare



import grails.test.mixin.*
import org.junit.*


/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	
    void testGetVenuesAt(){
		def foursquareService = new FoursquareService()
		foursquareService.grailsApplication = grailsApplication
		def venues = foursquareService.getVenuesAt(44.3,37.2)
		assert venues
		
    }
}
