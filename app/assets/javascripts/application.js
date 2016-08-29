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


$(function(){
	var cartCount = localStorage.getItem("count");

	if(cartCount == null){
		localStorage.setItem("count", "0");
	}

	$(".addToCartButton").click(function(){
		var count = parseInt(localStorage.get("count"));
		$("#cartCount").html((count + 1) + "");
		console.log((count + 1) + "");
		alert("Fuck");
	});

	$(".removeFromCartButton").click(function(){
		var cartCount = parseInt(readCookie("cartCount"));
		if(cartCount != null){
			if(cartCount != 0){
				createCookie("cartCount", 1, parseInt(readCookie("cartCount")) - 1);
				$("#cartCount").html(readCookie("cartCount"));
			}
		}
	});
});