package de.myvent.foursquare


import grails.test.mixin.*
import org.junit.*



/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	
    void testGetVenuesAt(){

		def service = new FoursquareService()
		service.grailsApplication = grailsApplication
		//def venues = foursquareService.getVenuesAt(44.3,37.2)
		def venues = service.getVenuesAt(44.3,37.2)
		assert venues
		assertNull(venues.geoCode)
		
		venues.venues.each {
			println it.name
		}
		
    }
	
	void testGetVenuesNear(){
		
		def service = new FoursquareService()
		service.grailsApplication = grailsApplication
		//def venues = foursquareService.getVenuesAt(44.3,37.2)
		def venues = service.getVenuesNear('Rosenheim')
		assert venues
		assert venues.geoCode
		
		venues.venues.each {
			println it.location
		}
		
	}
	
	
}
