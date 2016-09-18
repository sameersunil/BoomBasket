// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
	$('#signUpButtonModal').click(function(e){
		if(!checkFieldsSignUp()){
			e.preventDefault();
		}
	});
	$('#loginButtonModal').click(function(e){
		if(!checkFieldsLogin()){
			e.preventDefault();
		}
	});
});

function hideLogin(){
	$('#login').modal('toggle');
}

function checkFieldsSignUp(){
	if($('#emailSignUp').val() == ""){
		$("#emailSignUp").notify("Please enter email!", { position: "right bottom" });
		return false;
	}
	else if($('#fname').val() == ""){
		$('#fname').notify("Please enter your first name!", { position: "right bottom" });
		return false;
	}
	else if($('#lname').val() == ""){
		$('#lname').notify("Please enter your last name!", { position: "right bottom" });
		return false;
	}
	else if($('#pwdSignUp').val() == ""){
		$('#pwdSignUp').notify("Please enter password!", { position: "right bottom" });
		return false;
	}
	else if($('#pwdSignUpR').val() == ""){
		$('#pwdSignUpR').notify("Please enter password again!", { position: "right bottom" });
		return false;
	}else if($("#pwdSignUp").val() != $('#pwdSignUpR').val()){
		$("#pwdSignUpR").notify("Re-entered password does not match", { position: "right bottom" });
		return false;
	}
	else if($('#country').val() == ""){
		$('#country').notify("Please enter country!", { position: "right bottom" });
		return false;
	}

	return true;
}

function checkFieldsLogin(){
	if($('#email').val() == ""){
		$("#email").notify("Please enter email!", { position: "right bottom" });
		return false;
	}
	else if($('#pwd').val() == ""){
		$('#pwd').notify("Please enter password!", { position: "right bottom" });
		return false;
	}

	return true;
}