package de.myvent.social

import org.springframework.social.connect.ConnectionRepository;

import de.myvent.users.User;

class SocialRequestService {
	def springSecurityService
	def socialService
	static scope = "request"

	/**
	 * Request-scoped data access object providing access to the current user's connections.
	 */
	def ConnectionRepository connectionRepository() {
		User user = springSecurityService.getCurrentUser()
		if (user) {
			return socialService.usersConnectionRepository().createConnectionRepository(user.id())
		} else {
			return socialService.usersConnectionRepository().createConnectionRepository();
		}
	}
}
