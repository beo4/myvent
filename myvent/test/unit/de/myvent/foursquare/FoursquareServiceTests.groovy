package de.myvent.foursquare



import FoursquareService;
import grails.test.mixin.*

import org.apache.log4j.BasicConfigurator;
import org.junit.*
import org.springframework.web.servlet.mvc.BaseCommandController;


/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {
	def grailsApplication
	def foursquareService
	
    def testSomething() {
        assertNotNull(foursquareService.getVenuesAt(40.7,-74))
		//assertNotNull(foursquareService.getVenuesNear("Rosenheim, Germany"))
    }
}
