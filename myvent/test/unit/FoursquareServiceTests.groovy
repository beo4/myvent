


import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	def grailsApplication
	def foursquareService
	
    void testSomething() {
        assertNotNull(foursquareService.getVenuesAt(40.7,-74))
		//assertNotNull(foursquareService.getVenuesNear("Rosenheim, Germany"))
    }
}
