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
			   document.getElementById('next').style.display = 'none';   
}	else    {   
			   document.getElementById('next').style.display = 'block';   
	}
	if(cur_page == 1)   {   
		document.getElementById('prev').style.display = 'none';   
	}
   	else    {   
		document.getElementById('prev').style.display = 'block';   
	}
}

	      
document.getElementById('prev').onclick = function(){    	
	cur_page--;   	      
	loadTable(cur_page - 1);	
};	      

document.getElementById('next').onclick = function(){
	cur_page++;
	loadTable(cur_page - 1);
};

$(document).ready(function() 
    { 
        $("#content-table").tablesorter({headers: {0:{sorter:false},2:{sorter:false}}}); 
    } 
);

