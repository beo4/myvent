package de.myvent

import static org.junit.Assert.*
import groovy.util.GroovyTestCase;

import org.junit.*

class FoursquareControllerInjectTests extends GroovyTestCase{
	def foursquareService
    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testSomething() {
        def foursquareController = new FoursquareController()
		assert foursquareService
		foursquareController.foursquareService = foursquareService
		assert foursquareController.locationsNear()
    }
}
