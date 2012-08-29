package de.myvent.mapbox



import grails.test.mixin.*
import org.junit.*
import grails.plugins.rest.client.RestBuilder;
/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(MapboxService)
class MapboxServiceTests {

    void testGetApi() {

		def service = new MapboxService()
		service.restBuilder = new RestBuilder()
		
		final String authUser = System.getProperty("http.proxyUser")
		final String authPassword =System.getProperty("http.proxyPassword")
		if (authUser&&authPassword) {
			Authenticator.setDefault(
				new Authenticator() {
				   public PasswordAuthentication getPasswordAuthentication() {
					  return new PasswordAuthentication(
							authUser, authPassword.toCharArray());
				   }
				}
			 )
		}
		
		
		
		def resp = service.getApi()
		
		assert !(resp instanceof grails.plugins.rest.client.ErrorResponse) , resp.error
    }
}
