package de.myvent.social

import de.myvent.users.SimpleConnectionSignUp

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository
import org.springframework.social.connect.support.ConnectionFactoryRegistry
import org.springframework.social.connect.web.ConnectController;

class SocialService {
	def dataSource
	def connectionRepository
	def foursquare

    /**
	 * When a new provider is added to the app, register its {@link ConnectionFactory} here.
	 * @see FoursquareConnectionFactory
	 */
	def ConnectionFactoryLocator connectionFactoryLocator() {
		ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
		registry.addConnectionFactory(foursquare());
		return registry;
	}
	
	@Bean
	public ConnectController connectController() {
		return new ConnectController(connectionFactoryLocator(),
			connectionRepository());
	}
	
	
	/**
	 * Singleton data access object providing access to connections across all users.
	 */
	def UsersConnectionRepository usersConnectionRepository() {
		JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(dataSource,
				connectionFactoryLocator(), Encryptors.noOpText())
		repository.setConnectionSignUp(new SimpleConnectionSignUp())
		return repository;
	}
}
