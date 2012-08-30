package de.myvent.geolocation;

class GeolocationMyventTagLib {
	static namespace = "geolocation"
	
			
		def locateMe2 =  {attrs, body ->
		  out << render(template:"/templates/geolocation",model:[attrs:attrs, body:body])
		}
		
		
  
}
