class Profile
	def self.profile(client,connection,s)
	username = s.getUsername()
	name = ""
	addr = ""
	email = ""
	coordinates = ""
	result = connection.exec "select * from credentials where username = '#{username}';"
	result.each do |row|
		name = row['name']
		addr = row['address']
		email = row['emailid']
		coordinates = row['coordinates']
	end
			lt = coordinates.split(',')[0]
			ln = coordinates.split(',')[1]
	client.write "<html>
				<head>
				 <meta charset='utf-8'>
				  <meta name='viewport' content='width=device-width, initial-scale=1'>
				<link rel = 'stylesheet' type = 'text/css' href = 'pf.css' >
				<body onload = \"document.getElementById('id01').style.display='block'\">
			
				<div id=\"load\"></div>
				<div id='id01' class='modal'>
				  <form class='modal-content animate'>
				    <div class='imgcontainer'>"
		if @page_update != 'yes'
			client.write("<span onclick=\"history.go(-1);\" class='close' title='Close Modal'>&times;</span>")
		else
			client.write("<span onclick=\"history.go(-2);\" class='close' title='Close Modal'>&times;</span>")
			
		end
			client.write"</div>

				    <div class='container'>
					<center><p id = 'msg'></p><center>
				     <table width = 100% height = 100% cellspacing='5'>
					<caption class = 'size'>#{username.upcase} PROFILE</caption>
					<tr><td class = 'size'>NAME</td><td class = 'size'>#{name}</td></tr>
					
					
					<tr><td class = 'size'>EMAIL-ID</td><td class = 'size'>#{email}</td></tr>
				<form>
					<tr><td class = 'size'>ADDRESS</td><td><textarea rows = 7 cols = 30 style = \"resize:none\" readonly name = \"updateaddress\" id = 'address'>#{addr}</textarea></td>
					
				<td><!--<textarea type=\"text\" placeholder=\"latlang\" style = \"display:none\" readonly id = \"lato\" name=\"latitude\">#{coordinates}</textarea></td>-->
				</head>
				<body>
				

				  <div id=\"mapCanvas\"></div>
				  <div id=\"infoPanel\">
				    <div id=\"markerStatus\"></div>
				   
				    <textarea id=\"info\" style = 'color:yellow;display:none;' name = 'yo' ></textarea>
				    
				  </div></td>

				</tr>
				<tr>
					<td></td><td></td><td><button type = 'button' value = 'Update' class = 'sub' id = 'upd'>Update</button></td>
				</tr>
			
	<script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js?sensor=false\"></script>
				<script type=\"text/javascript\">
				
				var geocoder = new google.maps.Geocoder();
var lt = #{lt};
var ln = #{ln};
var xhttp = new XMLHttpRequest();
var info; 
var params;
var upd = document.getElementById('upd');
upd.onclick = function() {
	xhttp.open(\"GET\" , \"updateaddress\"+document.getElementById('info').value+\"add\"+document.getElementById('address').value, true);
			document.getElementById('msg').innerHTML = 'updated!';
	setTimeout ( function(){document.getElementById('msg').innerHTML = '';}, 30000 );
	xhttp.send();
};
				function geocodePosition(pos) {
				  geocoder.geocode({
				    latLng: pos
				  }, function(responses) {
				    if (responses && responses.length > 0) {
				      updateMarkerAddress(responses[0].formatted_address);
				    } else {
				      updateMarkerAddress('Cannot determine address at this location.');
				    }
				  });
				}

				function updateMarkerStatus(str) {
				  document.getElementById('markerStatus').innerHTML = str;
				}

				function updateMarkerPosition(latLng) {
				  var user_location = document.getElementById('info').innerHTML = [
				    latLng.lat(),
				    latLng.lng()
				  ].join(', ');
				}

				function updateMarkerAddress(str) {
				   var user_address = document.getElementById('address').innerHTML = str;
				}

				function initialize() {
				  var latLng = new google.maps.LatLng(lt, ln);
				  var map = new google.maps.Map(document.getElementById('mapCanvas'), {
				    zoom: 15,
				    center: latLng,
				    mapTypeId: google.maps.MapTypeId.ROADMAP
				  });
				  var marker = new google.maps.Marker({
				    position: latLng,
				    title: '#{name}',
				    map: map,
				    draggable: true
				  });

				  // Update current position info.
				  updateMarkerPosition(latLng);
				  geocodePosition(latLng);

				  // Add dragging event listeners.
				  google.maps.event.addListener(marker, 'dragstart', function() {
				    updateMarkerAddress('Dragging...');
				  });

				  google.maps.event.addListener(marker, 'drag', function() {
				    updateMarkerPosition(marker.getPosition());
				  });

				  google.maps.event.addListener(marker, 'dragend', function() {
				    geocodePosition(marker.getPosition());
				  });
				}

				// Onload handler to fire off the app.
				google.maps.event.addDomListener(window, 'load', initialize);
</script>
				</form>
				</table>
					</h2>
				    </div><script>document.onreadystatechange = function () {
				  var state = document.readyState
				  if (state == 'complete') {
				      setTimeout(function(){
					  document.getElementById('interactive');
					 document.getElementById('load').style.visibility=\"hidden\";
				      },1000);
				  }
				}</script>

				    <div class='container' style='background-color:#f1f1f1'>"
				     client.write" <button type='button' onclick=\"history.go(-1);\" class='cancelbtn'>Go Back</button>"
				    client.write "</div>
				  </form>
				</div>

				</body>
				</html>"

	end

	def self.update(response, connection, s)
		address = CGI.unescape(response.scan(/add(.*) HTTP/).flatten.pop).gsub('\'',' ')
		coordinates = CGI.unescape(response.scan(/updateaddress(.*)add/).flatten.pop)
		connection.exec "update credentials set address = '#{address}', coordinates = '#{coordinates}' where username = '#{s.getUsername()}';"
	end
end


class External_File
	def self.read(client, response)
		file_name = CGI.unescape(response.slice(response.index("/")+1...response.rindex(" ")))
		file = File.read(CGI.unescape(response.slice(response.index(".")+1...response.rindex(" ")))+"/"+file_name)
		client.write(file)
		client.flush()
	end
end
