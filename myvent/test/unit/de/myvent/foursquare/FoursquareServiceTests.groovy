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
		assert grailsApplication.config.plugins.springsocial.foursquare.clientSecret
		println grailsApplication.config.plugins.springsocial.foursquare.clientId
		println grailsApplication.config.plugins.springsocial.foursquare.clientSecret
		foursquareService.grailsApplication = grailsApplication
		assert foursquareService.getVenuesAt(44.3,37.2)
    }
}
