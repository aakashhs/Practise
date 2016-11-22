var btncount = 0;
var cur_page = 1;
var xhttp = new XMLHttpRequest();
var tab = document.getElementById('content-table');
window.onload = function(){   	
	btncount = document.getElementById("prev").value;
	document.getElementById('prev').style.display = 'none';   	   
        document.getElementById('next').style.display = 'block';   	
};



function loadTable(i){ 
cur_page = i+1;
xhttp.open("GET" , " page" +i, true);
 xhttp.onreadystatechange = function() {
     if ((this.readyState == 3 || this.readyState == 4) && this.status == 200) {
 	tab.getElementsByTagName('tbody')[0].innerHTML = this.response;
     }
   };
xhttp.send();
if(cur_page == btncount){      
			   document.getElementById('next').style.display = 'none';   }
	else    {   
			   document.getElementById('next').style.display = 'block';   }
	if(cur_page == 1)   {   
		document.getElementById('prev').style.display = 'none';   }
   	else    {   
		document.getElementById('prev').style.display = 'block';   }
}

	      
document.getElementById('prev').onclick = function(){    	
	cur_page--;   	      
	loadTable(cur_page - 1);	
};	      

document.getElementById('next').onclick = function(){
	cur_page++;
	loadTable(cur_page - 1);
};   	

function sort(ascending, columnClassName, tableId) {
	var myTable = document.getElementById(tableId);   
	var index = parseInt(myTable.rows[1].cells[0].innerHTML);   
	var tbody = document.getElementById(tableId).getElementsByTagName('tbody')[0];
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
			value = value.replace(',', '.');
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
		index = index + 1;
	} 
};

