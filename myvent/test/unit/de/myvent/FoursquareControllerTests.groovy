package de.myvent



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareController)
class FoursquareControllerTests {
	
	def populateValidParams(params) {
		assert params != null
		// TODO: Populate valid properties like...
		params["lat"] = 40.3
		params["lgt"] = 40.3
	  }
	
    void testIndex() {
		controller.index()
    }
}
