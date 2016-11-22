function checkFill(){
 					
var contentto = document.getElementById('tomail').value; 					 
			
 var contentcc = document.getElementById('ccid').value; 
var contentbcc = document.getElementById('bccid').value; 
			  					
if (contentto.trim() == '' && contentcc.trim() == '' && contentbcc.trim() == ''){ 
alert('Atleast one of the to-mail or cc or bcc fields must be filled');  	
return false;
 } 
  else  {  
return true;  }
 	}
