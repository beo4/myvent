package de.myvent


import grails.test.mixin.*
import org.junit.*

import de.myvent.foursquare.FoursquareService;

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(FoursquareController)
class FoursquareControllerTests{
	
	def populateValidParams(params) {
		assert params != null
		// TODO: Populate valid properties like...
		params["lat"] = 44.3
		params["lgt"] = 37.2
	  }
	
    void testIndex() {
		controller.index()
    }
	
	void testLocation() {
		defineBeans {
			foursquareService(FoursquareService)
		}
		populateValidParams(params)
		
		def foursquareController = new FoursquareController()
		assert foursquareController.foursquareService
		foursquareController.foursquareService.grailsApplication = grailsApplication
		foursquareController.locationsNear()
		assert response.json
//		assert results
//		results.each {
//			println it.location
//		}
	}
}
