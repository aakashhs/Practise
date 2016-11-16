class Tasklist
	def self.load_task_list(client, connection, username = "Guest", count_login = "", flash = false)
		index = 0
		client.write("<html><body><script>document.body.innerHTML = \"\";</script></body></html>")
		client.write("<html><head> <meta charset=\"utf-8\">
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><style>		
		#wrapper {
			min-height:100%;
			position:relative;
		}
		#header {
			border-radius: 8px;
			background:black;
			padding:10px;
		}
		#content {
			padding-bottom:50px; /* Height of the footer element */
		}
		#footer {
padding-top:10px;
			border-radius: 8px;
			background:black;
			width:100%;
			height:50px;
			position:absolute;
			bottom:0;
			left:0;
		}
		ul {
                list-style-type: none;
                margin: 0;
                overflow: hidden;
                background-color: black;
            }

            li {
                float: right;
            }

            li a, .dropbtn {
                display: inline-block;
                color: white;
                text-align: left;
		min-width: 120px;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover, .dropdown:hover .dropbtn {
                background-color: #eecffa;color:black;
            }

            li.dropdown {
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 120px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            .dropdown-content a:hover {background-color: #FFE4B5;}

            .dropdown:hover .dropdown-content {
                display: block;
            }
	input[type=button]{
		width: 100%;
		    background-color: black;
		    color: whitesmoke;
		    padding: 9px 8px;
		    margin: 2px 0;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
	}
		#goog:hover, #twit:hover {background-color: #eecffa;border-radius: 4px;}
	td button.i { background-color : ghostwhite; border-radius:4px;}
	td button.i:hover{background-color:gainsboro;}
            td button.i:active{text-decoration:none;}
	</style></head><div id = \"wrapper\">
			<body bgcolor = #eecffa><div id = \"header\" style=\"height:70px;\">
			<header>
			<table bgcolor = 'black' style=\"width:100%\"><tr >
<td style = \"text-align:left;width:6%;color:white;\"><h1 style=\"padding-top: 3%;\">RUBY</h1></td>
<td  style = \"text-align:center;width:88%;color:white;\">
			<h1 style = \"padding-top:1%;padding-left:4vw;\">Challenges List</h1></td><td style = \"width:6%;\">
			<ul>
              <li class='dropdown'>")
		if username == "Guest"
			client.write("<a href='#' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align: sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["msuser1.jpg"]}' alt='logo' />Guest</a>")
		else
			if Encoding::Images.include?("#{username}.jpg")
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["#{username}.jpg"]}' alt='logo' />#{username}</a>")
			else
			client.write("<a href='profile' class='dropbtn' style = \"font-size:112%;\"><img style = 'width: 20px;height: 20px;background: #555;vertical-align:sub;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["msuser1.jpg"]}' alt='logo' />#{username}</a>")
			end
		end
                client.write("<div class='dropdown-content'>
		<a href = 'contactus'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src = 'data:image/jpeg;base64,#{Encoding::Images["contact_us.png"]}' /> Contact Us</a>")
		if username != "Guest"
                 client.write(" <a href='userhistory' id = 'userhistory'><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/jpeg;base64,#{Encoding::Images["history.jpg"]}' alt='logo' /> User History(#{count_login})</a>
		<a href='tasklist'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/jpeg;base64,#{Encoding::Images["logout.jpg"]}' />Log out</a>") 
		else
		client.write("<a href='login$fromKlingon$' id><img style = 'float: left;width: 20px;height: 20px;background: #555;' 
                  src='data:image/png;base64,#{Encoding::Images["login.png"]}' alt='logo' /> Log In</a>
		<a href='signup$fromKlingon$'><img style = 'float: left;width: 20px;height: 20px;background: #555;' src='data:image/png;base64,#{Encoding::Images["signup.png"]}' /> Sign Up</a>")
		end
		client.write("
		
                </div>
              </li>
            </ul></td></tr></table>
			</header></div><br><div id = \"content\">
			<article>
			<br><br>")
		if(flash)
			client.write("<div id=\"Text\" style=\"color : red;\"><center><p>Sorry! A connection problem occured! Inconvenience is regretted.</p></center></div><script type = \"text/javascript\">    		setTimeout ( \"vanish()\", 30000 );		function vanish(){			document.getElementById(\"Text\").style.display = \"none\";		}		</script>")
		end
		 res = connection.exec("select challenge_name from challenges order by challenge_name")
			result = res.each_slice(8)
			 index = 1
		client.write("<center><script type=\"text/javascript\">
		   
		function sort(ascending, columnClassName, tableId) {
			var myTable = document.getElementById(tableId);
			var index = parseInt(myTable.rows[1].cells[0].innerHTML);
			var tbody = document.getElementById(tableId).getElementsByTagName(
				'tbody')[0];
			var rows = tbody.getElementsByTagName('tr');
			var columns = tbody.getElementsByTagName('td');
			var unsorted = true;

			while (unsorted) {
			    unsorted = false;

			    for (var r = 0; r < rows.length - 1; r++) {
				var row = rows[r];
				var nextRow = rows[r + 1];

				var value = row.getElementsByClassName(columnClassName)[0].innerHTML;
				var nextValue = nextRow.getElementsByClassName(columnClassName)[0].innerHTML;

				value = value.replace(',', '.'); // in case a comma is used in float number
				nextValue = nextValue.replace(',', '.');

				if (!isNaN(value)) {
				    value = parseFloat(value);
				    nextValue = parseFloat(nextValue);
				}

				if (ascending ? value > nextValue : value < nextValue) {
				    tbody.insertBefore(nextRow, row);
				    unsorted = true;
				}
			    }
			}
	
			for(var i = 1; i <= 8; i++){
		myTable.rows[i].cells[0].innerHTML = index;
		index = index + 1;}
		    };
			</script>
	
			")
	resindex = 1
	result.each{ |result|
				client.write("<div id = \"res#{resindex}\" style = 'padding-left: 5%;'>
				<table border = '1' id = 'content-table#{resindex}' width = '45%' data-page-length='10'>
					<thead>
						<tr>
							<th style = 'width:5%'>S.No</th>
			    	        <th style = 'padding-left:3%;'><h3 style='display: inline-block;'>Challenge Name</h3>
		<a href=\"javascript:sort(true, 'country', 'content-table#{resindex}');\"><img src='data:image/jpeg;base64,#{Encoding::Images["ascend.png"]}' style = 'width: 30px;height: 30px;vertical-align: middle;' /></a>
		<a href=\"javascript:sort(false, 'country', 'content-table#{resindex}');\"><img src='data:image/jpeg;base64,#{Encoding::Images["descend.png"]}' style = 'width: 30px;height: 30px;vertical-align: middle;' /></a></th>
							<th style = 'width:5%'>Action</th>
						</tr>
					</thead>
					<tbody>")
		result.each do |row|
		       client.write("<tr>
									<td align='center' > #{index}</td>
					 	           <td  align='center' class=\"country\" >#{row['challenge_name']} </td>
		                    	<td align='center' > <a href=\"/exec$#{row['challenge_name']}%\"><input type = \"button\" value = \"Go To Challenge\"></a></td>
								</tr>")
               index  += 1
		end
		client.write("</tbody></table></div>")
		resindex += 1 
	}
	client.write("<br><br><table><tr><td ><button type = \"button\" class = 'i'  id = \"prev\"  value = \"#{resindex - 1}\">\<\<</button></td>")
(resindex-1).times { |i| client.write("<td ><button type = \"button\" class = 'i'  id = \"#{i+1}\" onclick = 'loadTable(#{i+1})' value = \"1\">#{i+1}</button></td>")}
client.write("<td ><button type = \"button\" class = 'i' id = \"next\" value = \"4\">\>\></button>
  </td></tr></table></center>
	<script>
    	var cur_page = 1;
	var btncount = document.getElementById('prev').value;
    	window.onload = function(){
	document.getElementById('prev').style.display = 'none';
	document.getElementById('res1').style.display = 'block';

	for (var i = 2; i<=btncount;i++){document.getElementById('res'+i).style.display = 'none';}
	document.getElementById('next').style.display = 'block';
	};
	document.getElementById('prev').onclick = function(){ 

	cur_page--;
	for(var i = 1; i <= btncount; i++){
	document.getElementById('res'+i).style.display = 'none';}
	document.getElementById('res'+cur_page).style.display = 'block';

	if(cur_page == btncount){document.getElementById('next').style.display = 'none';}
	else {document.getElementById('next').style.display = 'block';}
	if(cur_page == 1){document.getElementById('prev').style.display = 'none';}
	else {document.getElementById('prev').style.display = 'block';}
	};
	document.getElementById('next').onclick = function(){ 

	cur_page++;

	for(var i = 1; i <= btncount; i++){
	document.getElementById('res'+i).style.display = 'none';}
	document.getElementById('res'+cur_page).style.display = 'block';

	if(cur_page == btncount){document.getElementById('next').style.display = 'none';}
	else {document.getElementById('next').style.display = 'block';}
	if(cur_page == 1){document.getElementById('prev').style.display = 'none';}
	else {document.getElementById('prev').style.display = 'block';}
	};
	function loadTable(page) {

	cur_page = page;
		for(var i = 1; i <= btncount; i++){
	document.getElementById('res'+i).style.display = 'none';}
	document.getElementById('res'+cur_page).style.display = 'block';

	if(cur_page == btncount){document.getElementById('next').style.display = 'none';}
	else {document.getElementById('next').style.display = 'block';}
	if(cur_page == 1){document.getElementById('prev').style.display = 'none';}
	else {document.getElementById('prev').style.display = 'block';}
	}	
    </script>")

client.write("</center><br/><br/></article></div><div id = \"footer\"><footer><table bgcolor = 'black' style=\"width:98%\"><tr><td style = \"width: 92%;\"><div style = \"align:left; color:white;\"><i>&copy; Developed by - Aakash Hs</i></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://plus.google.com/u/0/117600849507101148331'><input type=\"image\" src='data:image/jpeg;base64,#{Encoding::Images["google_plus.png"]}' height = \"30\" width = \"30\" id = 'goog'></a></div></td><td  style = \"width: 4%;\"><div align='right'><a target=\"_blank\" href = 'https://twitter.com/stuart771995'><input type=\"image\" src=\"data:image/jpeg;base64,#{Encoding::Images["Twitter_logo.png"]}\" height = \"30\" width = \"30\" id = 'twit'></div></a></td></tr></table></footer></div></body></div></html>")
	return username
	end
end

