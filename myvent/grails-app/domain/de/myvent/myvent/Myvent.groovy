package de.myvent.myvent

import de.myvent.util.Image;

class Myvent {

    static constraints = {
		place()
		description type: 'text'
		name  type: 'text'
    }

	String name
	String description
	Type type
	
	Place place
	Period period
	
	Image eventPicture
	
	List<Category> categories
	List<Image> images
	
}
