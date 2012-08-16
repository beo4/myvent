package de.element.eventguide.foursquare



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareService)
class FoursquareServiceTests {

    void testSomething() {
		FoursquareService foursquareService = new FoursquareService();
        assertNotNull(foursquareService.getVenuesAt("40.7,-74"))
    }
}
