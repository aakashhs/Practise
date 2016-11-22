var geocoder = new google.maps.Geocoder(); 			 
function geocodePosition(pos) { 					  
geocoder.geocode({latLng: pos }, function(responses) { 					 
			     if (responses && responses.length > 0) { 					    
			    updateMarkerAddress(responses[0].formatted_address); 					    }
			 else { 				 
			 	      updateMarkerAddress('Cannot determine address at this location.'); 					    } 			 
			 		  }); 
					} 					
function updateMarkerStatus(str) { 				 
			 	  document.getElementById('markerStatus').innerHTML = str; 					} 					 
			
 function updateMarkerPosition(latLng) { 					  
var user_location = document.getElementById('info').innerHTML = [latLng.lat(), latLng.lng()].join(', '); 					} 		
		 
			 	
function updateMarkerAddress(str) { 					 
			    var user_address = document.getElementById('address').innerHTML = str; 	
				} 	 
			 				
function initialize() { 					  
var latLng = new google.maps.LatLng(12.994182,77.6657547 ); 
			  					 
 var map = new google.maps.Map(document.getElementById('mapCanvas'), { 					 
			     zoom: 8, 					    center: latLng, 					    
mapTypeId: google.maps.MapTypeId.ROADMAP  }); 					  
var marker = new google.maps.Marker({ position: latLng,title: 'Point A',   map: map, draggable: true }); 					  updateMarkerPosition(latLng); 
			  					  geocodePosition(latLng); 					 
			   google.maps.event.addListener(marker, 'dragstart', function() { 					 
			     updateMarkerAddress('Dragging...'); 					  }); 					 
			   google.maps.event.addListener(marker, 'drag', function() { 				 
			 	    updateMarkerPosition(marker.getPosition()); 					  }); 	 
			 				  google.maps.event.addListener(marker, 'dragend', function() { 				 
			 	    geocodePosition(marker.getPosition()); 					  }); 					} 	 
			 				google.maps.event.addDomListener(window, 'load', initialize); 				
