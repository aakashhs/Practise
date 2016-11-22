function empty(){ 
if(document.getElementById('area').value == ''){ 
			  document.getElementById('out').style.border='1px solid darkgrey';  
			 document.getElementById('area').style.border='3px solid red';
 return false;}  
			  if(document.getElementById('out').value != ''){ 
document.getElementById('out').value = '';  
			 return true; 
}
 }
 function validate(){
 var inp = document.getElementById('area');  
			 var out = document.getElementById('out'); 
if(inp.value == '' && out.value == '') {  
			 inp.style.border='3px solid red'; 
out.style.border='3px solid red';
 return false;
 }  
			 else if (inp.value == '') { 
inp.style.border='3px solid red'; 
out.style.border='1px solid darkgrey'; 
			  return false;
 } else if(out.value == ''){ 
inp.style.border='1px solid darkgrey';  
			 out.style.border='3px solid red'; return false; 
} 
}
