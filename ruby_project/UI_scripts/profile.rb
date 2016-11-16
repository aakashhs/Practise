class Profile
	def self.profile(client,connection,username)
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
			
	client.write "<html>
				<head>
				 <meta charset='utf-8'>
				  <meta name='viewport' content='width=device-width, initial-scale=1'>
				<style>
				#load{
				    width:100%;
				    height:100%;
				    position:fixed;
				    z-index:9999;
				    background:url(\"https://www.creditmutuel.fr/cmne/fr/banques/webservices/nswr/images/loading.gif\") no-repeat center center rgba(0,0,0,0.25)
				}
				input[type=text], input[type=password] {
				    width: 100%;
				    padding: 12px 20px;
				    margin: 8px 0;
				    display: inline-block;
				    border: 1px solid #ccc;
				    box-sizing: border-box;
				}


				button {
				    background-color: #4CAF50;
				    color: white;
				    padding: 14px 20px;
				    margin: 8px 0;
				    border: none;
				    cursor: pointer;
				    width: 100%;
				}


				.cancelbtn {
				    width: auto;
				    padding: 10px 18px;
				    background-color: #f44336;
				}


				.imgcontainer {
				    text-align: center;
				    margin: 24px 0 12px 0;
				    position: relative;
				}

				img.avatar {
				    width: 40%;
				    border-radius: 50%;
				}

				.container {
				    padding: 16px;
				}

				span.psw {
				    float: right;
				    padding-top: 16px;
				}


				.modal {
				    display: none; 
				    position: fixed; 
				    z-index: 1; 
				    left: 0;
				    top: 0;
				    width: 100%; 
				    height: 100%; 
				    overflow: auto; 
				    background-color: rgb(0,0,0); 
				    background-color: rgba(0,0,0,0.4); 
				    
				}


				.modal-content {
				    background-color: #fefefe;
				    margin: 5% auto 15% auto; 
				    border: 1px solid #888;
				    width: 80%; 
				}


				.close {
				    position: absolute;
				    right: 25px;
				    top: 0;
				    color: #000;
				    font-size: 35px;
				    font-weight: bold;
				}

				.close:hover,
				.close:focus {
				    color: red;
				    cursor: pointer;
				}


				.animate {
				    -webkit-animation: animatezoom 0.6s;
				    animation: animatezoom 0.6s
				}

				@-webkit-keyframes animatezoom {
				    from {-webkit-transform: scale(0)}
				    to {-webkit-transform: scale(1)}
				}
				    
				@keyframes animatezoom {
				    from {transform: scale(0)}
				    to {transform: scale(1)}
				}

				@media screen and (max-width: 300px) {
				    span.psw {
				       display: block;
				       float: none;
				    }
				    .cancelbtn {
				       width: 100%;
				    }
				}
				.size{
					font-size:20px;
				}
				input[type = 'submit']{
				    width: 100px;
				    height: 35px;
				    border: 0;
				    border-radius: 5px;
				    background-color: #00A79D;
				    font-weight: bolder;
				    color:white;
				    
				   
				}
				</style>
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
	
				     <table width = 100% height = 100% cellspacing='5'>
					<caption class = 'size'>#{username.upcase} PROFILE</caption>
					<tr><td class = 'size'>NAME</td><td class = 'size'>#{name}</td></tr>
					
					
					<tr><td class = 'size'>EMAIL-ID</td><td class = 'size'>#{email}</td></tr>
				<form>
					<tr><td class = 'size'>ADDRESS</td><td><textarea rows = 7 cols = 30 style = \"resize:none\" readonly name = \"updateaddress\" id = 'address'>#{addr}</textarea></td>

				<td><script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js?sensor=false\"></script>
				<script type=\"text/javascript\">
				var geocoder = new google.maps.Geocoder();

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
				  var latLng = new google.maps.LatLng(#{coordinates});
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
				</head>
				<body>
				  <style>
				  #mapCanvas {
				    width: 500px;
				    height: 400px;
				    float: left;
				  }
				  #infoPanel {
				    float: left;
				    margin-left: 10px;
				  }
				  #infoPanel div {
				    margin-bottom: 5px;
				  }
				  </style>

				  <div id=\"mapCanvas\"></div>
				  <div id=\"infoPanel\">
				    <div id=\"markerStatus\"></div>
				   
				    <textarea id=\"info\" style = 'color:yellow;display:none;' name = 'yo' ></textarea>
				    
				  </div></td>

				</tr>
				<tr>
					<td></td><td></td><td><input type = 'submit' value = 'Update' class = 'sub'></td>
				</tr>
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
				if @page_update != 'yes'
				     client.write" <button type='button' onclick=\"history.go(-1);\" class='cancelbtn'>Go Back</button>"
				else
					client.write" <button type='button' onclick=\"history.go(-2);\" class='cancelbtn'>Go Back</button>"
				end
				    client.write "</div>
				  </form>
				</div>

				<script>
				
				var modal = document.getElementById('id01');

				var btn = document.getElementById('myBtn');
				btn.onclick = function() {
				    modal.style.display = 'block';
				}
				
				</script>
				</body>
				</html>"
		@page_update = 'no'
	end

	def self.update(response, connection, username)
		address = CGI.unescape(response.scan(/updateaddress=(.*)&yo/).flatten.pop).gsub('\'',' ')
		coordinates = CGI.unescape(response.scan(/&yo=(.*) /).flatten.pop)
		connection.exec "update credentials set address = '#{address}', coordinates = '#{coordinates}' where username = '#{username}';"
		@page_update = 'yes'
	end

	def self.get_cookie(client)
		puts "yo----------"+client.readline
		while line = client.readline do 
			puts line
			if line =~ /Cookie/ 
				return line.scan(/username=(.*); count=/).flatten.pop, line.scan(/count=(.*); /).flatten.pop, CGI.unescape(line.scan(/challenge_name=(.*)\r\n/).flatten.pop)
				break
			end
			break if line == "\r\n"
		end
	end

end

