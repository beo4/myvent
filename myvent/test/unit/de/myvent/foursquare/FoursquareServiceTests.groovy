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
		assert grailsApplication.config.plugins.springsocial.foursquare.clientId
		foursquareService.grailsApplication = grailsApplication
		assert foursquareService.getVenuesAt(20,30)
    }
}
