package de.myvent.foursquare

import org.codehaus.groovy.grails.commons.GrailsApplication;

class TestService {
	GrailsApplication grailsApplication
	
			def readFoo() {
					assert grailsApplication.config
					def paramter = grailsApplication.config.plugins.springsocial.foursquare.clientId
					return parameter
			}
   
}
