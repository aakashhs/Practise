 
var modal = document.getElementById('myModal'); 
var btn = document.getElementById('downloadpdf');  
var span = document.getElementsByClassName('close')[0]; 
var submit = document.getElementById('ok');  
					 
btn.onclick = function() {     
modal.style.display = 'block'; 
}
submit.onclick = function() {     
modal.style.display = 'none'; 
} 
span.onclick = function() {    
 modal.style.display = 'none'; 
} 
window.onclick = function(event) {     
if (event.target == modal) {         
	modal.style.display = 'none';   
	} 
} 
