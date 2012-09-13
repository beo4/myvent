package de.myvent.myvent


class Place {

    static constraints = {
		venueName  blank: true, nullable: true
		address blank: true, nullable: true
		crossStreet blank: true, nullable: true
		city blank: true, nullable: true
		state blank: true, nullable: true
		postalCode blank: true, nullable: true
		country blank: true, nullable: true
    }
	
	//Venue venue
	String venueId;
	String venueName;
	
	double latitude;
	double longitude;
	
	String address;
	String crossStreet;
	String city;
	String state;
	String postalCode;
	String country;
	
}
