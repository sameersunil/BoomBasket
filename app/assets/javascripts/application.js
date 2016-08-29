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
	var cartCount = readCookie("count");

	if(cartCount == null){
		createCookie("cartCount", "1", "0");
	}else{
		$("#cartCount").html(readCookie("cartCount"));
	}

	$(".addToCartButton").click(function(){
		createCookie("cartCount", 1, parseInt(readCookie("cartCount")) + 1);
		$("#cartCount").html(readCookie("cartCount"));
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

function createCookie(name,days,value) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
	    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) 
        	return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}