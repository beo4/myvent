package de.myvent.foursquare

class TestService {
	def grailsApplication
	
			def readFoo() {
					assert grailsApplication.config
					def paramter = grailsApplication.config.plugins.springsocial.foursquare.clientId
					return parameter
			}
   
}
