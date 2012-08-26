package de.myvent.foursquare


import grails.plugins.springsocial.config.foursquare.FoursquareConfig;
import grails.test.mixin.*
import org.junit.*



/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	
    void testGetVenuesAt(){
		defineBeans {
			foursquareConfig(FoursquareConfig)
		}
		def service = new FoursquareService()
		//def venues = foursquareService.getVenuesAt(44.3,37.2)
		assert service.getVenuesAt(44.3,37.2)
		
    }
}
