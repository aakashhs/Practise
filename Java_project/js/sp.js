function validateForm() {     
var x = document.getElementById('email').value;     
var atpos = x.indexOf("@");      
var dotpos = x.lastIndexOf(".");     
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {        
			   alert("Not a valid e-mail address");         
return false;     
} 
} 

function redden(field) { 
			  if(field.value == ''){ 	
field.style.borderColor = "red";
} 
else{
 field.style.borderColor = "#ccc"; 
			 } 
}  
			  var modal = document.getElementById('myModal'); var btn = document.getElementById('modalin'); 
			  var pass = document.getElementById('pass').innerHTML; var cpass = document.getElementById('cpass').innerHTML; 
			  var span = document.getElementsByClassName('close')[0]; var submit = document.getElementById('submit'); 
			  window.onload = function() {     modal.style.display = 'block'; 	 
			  } 
submit.onclick = function() {     
			  modal.style.display = 'none'; 
} 
document.onreadystatechange = function () {   
var state = document.readyState; 
			
   if (state == 'complete') {	 	
		       document.getElementById('interactive'); 			 
			 		 document.getElementById('load').style.visibility='hidden' ; 				
  } } 
