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
	$('#signUpButton').click(function(e){
		console.log($('#email').val());
		console.log($('#fname').val());
		console.log($('#lname').val());
		console.log($('#pwd').val());
		console.log($('#pwdR').val());
		console.log($('#country').val());
		if(!checkFields()){
			e.preventDefault();
			return false;
		}else{
			console.log("equal");
			return true;
		}
	});
});

function hideLogin(){
	$('#login').modal('toggle');
}

function checkFields(){
	if($('#email').val() == ""){
		$("#email").notify("Please enter email!");
		return false;
	}
	else if($('#fname').val() == ""){
		$('#fname').notify("Please enter your first name!");
		return false;
	}
	else if($('#lname').val() == ""){
		$('#lname').notify("Please enter your last name!");
		return false;
	}
	else if($('#pwd').val() == ""){
		$('#pwd').notify("Please enter password!");
		return false;
	}
	else if($('#pwdR').val() == ""){
		$('#pwdR').notify("Please enter password again!");
		return false;
	}else if($("#pwd").val() != $('#pwdR').val()){
		$("#pwdR").notify("Re-entered password does not match");
		return false;
	}
	else if($('#country').val() == ""){
		$('#country').notify("Please enter country!");
		return false;
	}

	return true;
}