package de.myvent.event

import twitter.bootstrap.scaffolding.Address;
import de.myvent.util.Image;

class Event {

    static constraints = {
    }

	String name
	String description
	Type type
	
	Address adress
	
	Image eventPicture
	
	List<Category> categories
	List<Image> images
	
}
