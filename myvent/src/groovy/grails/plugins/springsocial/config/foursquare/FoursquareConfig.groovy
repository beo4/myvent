package grails.plugins.springsocial.config.foursquare

import de.myvent.users.User
import grails.plugins.springsecurity.SpringSecurityService;

import javax.inject.Inject

import org.codehaus.groovy.grails.commons.GrailsApplication;
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Scope
import org.springframework.context.annotation.ScopedProxyMode
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.connect.Connection
import org.springframework.social.connect.ConnectionFactory
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository
import org.springframework.social.connect.NotConnectedException;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.foursquare.api.Foursquare
import org.springframework.social.foursquare.api.impl.FoursquareTemplate
import org.springframework.social.foursquare.connect.FoursquareConnectionFactory
import org.springframework.util.Assert

@Configuration
class FoursquareConfig {
  @Inject
  ConnectionRepository connectionRepository
  GrailsApplication grailsApplication
  SpringSecurityService springSecurityService
  
  /**
   * When a new provider is added to the app, register its {@link ConnectionFactory} here.
   * @see FoursquareConnectionFactory
   */
  @Bean
  public ConnectionFactoryLocator connectionFactoryLocator() {
	  ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
	  registry.addConnectionFactory(foursquareConnectionFactory());
	  return registry;
  }

  @Bean
  ConnectionFactory foursquareConnectionFactory() {
	println "Configuring SpringSocial Foursquare"
	String clientId = grailsApplication.config.plugins.springsocial.foursquare.clientId ?: ""
	String clientSecret = grailsApplication.config.plugins.springsocial.foursquare.clientSecret ?: ""
	Assert.hasText(clientId, "The Foursquare clientId is necessary, please add to the Config.groovy as follows: plugins.springsocial.foursquare.clientId='yourClientId'")
	Assert.hasText(clientSecret, "The Foursquare clientSecret is necessary, please add to the Config.groovy as follows: plugins.springsocial.foursquare..clientSecret='yourClientSecret'")
	new FoursquareConnectionFactory(clientId, clientSecret)
  }
  
  @Bean
  @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
  public Foursquare foursquare() {
	Connection<Foursquare> foursquare = connectionRepository.findPrimaryConnection(Foursquare)
	foursquare != null ? foursquare.getApi() : new FoursquareTemplate()
  }
}
