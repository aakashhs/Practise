function readSingleFile(evt) {          
var f = evt.target.files[0];   			        
if (f) {  	 
			  var r = new FileReader();  	 
r.onload = function(e) {        
var contents = e.target.result;  	 
			 			  
 document.getElementById('area').value=  contents;  	
			 }  				 
			  r.readAsText(f);  		
	        } else {   				
 alert('Failed to load file');  		 
			 }
  }   
document.getElementById('fileinput').addEventListener('change', readSingleFile, false);
