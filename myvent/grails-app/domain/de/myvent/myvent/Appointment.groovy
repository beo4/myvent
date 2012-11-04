package de.myvent.myvent

import org.joda.time.LocalDateTime;

class Appointment {
	static belongsTo = [myvent: Myvent]

   static constraints = {
		start (validator: { val, obj ->
        val?.isAfter(new LocalDateTime())})
		stop(validator: { val, obj ->
        val?.isAfter(obj.start)})
    }
	
	LocalDateTime start
	LocalDateTime stop
	
	
	Place place;
}
