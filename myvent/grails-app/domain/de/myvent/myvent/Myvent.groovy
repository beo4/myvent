package de.myvent.myvent

import de.myvent.util.Image;

class Myvent {

    static constraints = {
		name  type: 'text'
		
		
		type()
		description type: 'text', widget: 'textarea'
		eventPicture nullable:true, blank: true
		
    }

	String name
	String description
	Type type
	
	List<Appointment> appointments
	
	
	
	Image eventPicture
	
	List<Category> categories
	List<Image> images
	
}
