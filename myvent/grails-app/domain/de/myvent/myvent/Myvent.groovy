package de.myvent.myvent

import de.myvent.util.Image;

class Myvent {

    static constraints = {
		place()
		name  type: 'text'
		
		periods()
		
		type()
		description type: 'text', widget: 'textarea'
		eventPicture nullable:true, blank: true
		
    }

	String name
	String description
	Type type
	
	Place place
	List<Period> periods
	
	Image eventPicture
	
	List<Category> categories
	List<Image> images
	
}
