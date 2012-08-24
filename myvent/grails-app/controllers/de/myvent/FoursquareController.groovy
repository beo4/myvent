package de.myvent

import javax.xml.ws.Response
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.social.foursquare.api.Foursquare

import grails.converters.JSON

class FoursquareController {
	def foursquare

	def index() {
		params.lat
		params.lgt
	}
	
	
}
