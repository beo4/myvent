package de.myvent.mapbox

import grails.plugins.rest.client.RestBuilder;

class MapboxService {
	def restBuilder
	
    def getApi() {
		def resp = restBuilder.get("http://a.tiles.mapbox.com/v3/admiral49.map-ytobe2ij.jsonp")
		return resp
    }
}
