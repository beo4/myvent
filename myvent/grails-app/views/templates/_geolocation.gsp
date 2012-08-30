<script type="text/javascript">
function foundLocation(position) { 
var objx = {timestamp:position.timestamp,coords:{latitude:position.coords.latitude,longitude:position.coords.longitude,accuracy:position.coords.accuracy,speed:position.coords.speed}}; 
var jsonPos = JSON.stringify(objx); 
${remoteFunction(controller: 'geolocation',action:'setGeoPosition',params:'\'val=\' + jsonPos')} } 

if (navigator.geolocation) {
    var location_timeout = setTimeout("geolocFail()", 10000);
    navigator.geolocation.getCurrentPosition(
	function(position) {
		foundLocation(position);
		geolocSuccess();
    	},
    function(error) {
        clearTimeout(location_timeout);
        geolocFail();
    });
} else {
    // Fallback for no geolocation
    geolocFail();
}

</script>