package de.myvent.foursquare

import static org.junit.Assert.*
import org.junit.*

class TestGetVenuesTests {
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
    void testGetVenues() {
		assert foursquareService
		def venues = foursquareService.getVenuesAt(44.3,37.2)
		assert venues
    }
}
