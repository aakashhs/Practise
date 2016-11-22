function empty(){  
			   if(document.getElementById('message').value.trim() == ''){  
			  document.getElementById('message').style.border='1px solid red'; 
return false ;
}   else { 
			   document.getElementById('message').style.border='1px solid darkgrey';
 return true;  }
  }
