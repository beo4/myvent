package de.myvent.myvent

import java.awt.Color;

import de.myvent.util.Image;

class Type {

    static constraints = {
		color( widget:"colorpicker", nullable:true)
		typePicture(nullable: true, blank:true)
    }
	
	String name
	
	String color
	
	Image typePicture
}
