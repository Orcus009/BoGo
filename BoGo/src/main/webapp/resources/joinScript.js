/**
 * 
 */
    function password1Maxlength(){
    	let p1 = document.getElementById('password1').value;
    		
    	if(p1.length < 6){
    		alert('비밀번호는 6글자 이상으로 입력해주세요');
    		document.getElementById('password1').focus();
    	}
    	if(p1.length > 20){
    		alert('비밀번호는 20글자 이하로 입력해주세요');
    		document.getElementById('password1').value = null;
    	}
    }
    	
    function phoneMaxCheck(){
		let phoneCheck = document.getElementById('phone').value;
		if(phoneCheck.length !== 13){
			alert('핸드폰 번호를 다시 입력해주세요');
			document.getElementById('phone').focus();
			document.getElementById('phone').value = null;
		} 
	}
	
	function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

		let cellPhone = document.getElementById('phone');
		cellPhone.onkeyup = function(event){
        event = event || window.event;
        let _val = this.value.trim();
        this.value = autoHypenPhone(_val);
        console.log(this.value.length);
        console.log(this.value);
}
	
	function idCheck(){
		window.open("idCheck","idwin","resizable=no, top=400px, left=750px, height=250px, width=350px");
	}
    	
    function idMaxCheck(){
    	let id = document.getElementById(id).value;
    		
    	if(id.length > 14){
    		alert('아이디는 14글자 이하로 입력해주세요');
   			document.getElementById('id').focus();
    		document.getElementById('id').value = null;
   		}
   	}
   	
   	function nameMaxCheck(){
		let name = document.getElementById('name').value;
		
		if(name.length > 20){
			alert('이름은 20글자 이하로 입력해주세요');
			document.getElementById('name').focus();
			document.getElementById('name').value = null;
		}
	}
    	
    function passwordCheck(){
   		
   		let p1 = document.getElementById('password1').value;
   		let p2 = document.getElementById('password2').value;
   		console.log(p1);
    		
    	if(p1 === ''){
    		alert('비밀번호 먼저 입력해주세요');
    		document.getElementById('password1').focus();
   			document.getElementById('password2').value = null;
    			
   		} else {
   			if(p2.length < 6){
   				alert('비밀번호는 6글자 이상으로 입력해주세요');
    			document.getElementById('password2').focus();
    			document.getElementById('password2').value = null;
    			return false;
    		}
    		if(p2.length > 20){
    			alert('비밀번호는 20글자 이하로 입력해주세요');
    			document.getElementById('password1').value = null;
   				document.getElementById('password2').value = null;
   			}  		
    		if(p1 != p2){
    			alert("비밀번호 불일치");
    			document.getElementById('password1').value = null;
    			document.getElementById('password2').value = null;
   			} else {
   				return true;
   			}
    			
    	}
    		
  	}
     
$(document).ready(function(){

  // Click event of the showPassword button
  $('#showPassword').on('click', function(){

    // Get the password field
    var passwordField = $('#password1');

    // Get the current type of the password field will be password or text
    var passwordFieldType = passwordField.attr('type');

    // Check to see if the type is a password field
    if(passwordFieldType == 'password')
    {
        // Change the password field to text
        passwordField.attr('type', 'text');

        // Change the Text on the show password button to Hide
        $(this).val('Hide');
    } else {
        // If the password field type is not a password field then set it to password
        passwordField.attr('type', 'password');

        // Change the value of the show password button to Show
        $(this).val('Show');
    }
  });
});

$(document).ready(function(){

  // Click event of the showPassword button
  $('#showPassword2').on('click', function(){

    // Get the password field
    var passwordField = $('#password2');

    // Get the current type of the password field will be password or text
    var passwordFieldType = passwordField.attr('type');

    // Check to see if the type is a password field
    if(passwordFieldType == 'password')
    {
        // Change the password field to text
        passwordField.attr('type', 'text');

        // Change the Text on the show password button to Hide
        $(this).val('Hide');
    } else {
        // If the password field type is not a password field then set it to password
        passwordField.attr('type', 'password');

        // Change the value of the show password button to Show
        $(this).val('Show');
    }
  });
});

function check(){
	const id = document.getElementById('id').value;
	const pw1 = document.getElementById('password1').value;
	const pw2 = document.getElementById('password2').value;
	
	
	if(id === ""){
		alert("아이디를 입력해주세요");
		return false;
	} else if(pw1 === ""){
		alert("비밀번호를 입력해 주세요");
		return false;
	} else if(pw2 === ""){
		alert("비밀번호를 입력해 주세요");
		return false;
	} else if(id !=="" && pw1 !== "" && pw2 !== ""){
		return true;
	}
}