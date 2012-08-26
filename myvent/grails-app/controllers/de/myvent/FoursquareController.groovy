package de.myvent

import javax.xml.ws.Response
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.social.foursquare.api.Foursquare

import de.myvent.foursquare.FoursquareService
import grails.converters.JSON

class FoursquareController {
	def foursquareService

	def index() {
		params.lat
		params.lgt
	}
	
	def locationsNear() {
		render foursquareService.getVenuesAt(params.lat,params.lgt) as JSON
	}
	
	
}
