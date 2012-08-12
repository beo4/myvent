package de.myvent.util

class Image {

    static constraints = {
		image(maxSize:6843546)
    }
	
	
	String name
	String fileType
	byte[] image
}
