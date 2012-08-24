package de.myvent.foursquare



import grails.plugins.springsocial.config.foursquare.FoursquareConfig
import grails.test.mixin.*
import org.junit.*


/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	FoursquareConfig foursquareConfig
	
    void testGetVenuesAt(){
		def foursquareService = new FoursquareService()
		foursquareService.grailsApplication = grailsApplication
		foursquareConfig = new FoursquareConfig();
		foursquareService.foursquareConfig = foursquareConfig
		assert foursquareService.getVenuesAt(44.3,37.2)
    }
}
