function checkFill() {
					var contentto = document.getElementById('tomail').value;
					var contentcc = document.getElementById('ccid').value;
					var contentbcc = document.getElementById('bccid').value;
					if (contentto.length < 1 && contentcc.length < 1 && contentbcc.length<1)
					{ alert("Atleast one of the to-mail or cc or bcc fields must be filled"); 
					return false;} else { return true; }
					}
