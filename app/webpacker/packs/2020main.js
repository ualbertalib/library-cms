
import 'jquery'
import 'popper.js'
import 'bootstrap'
import '../src/stylesheets/2020main.css';
import '../src/javascripts/2020custom.js';

$(function() {

    $('[data-toggle-second="tooltip"]').tooltip();

	var mode = localStorage.getItem('mode');

	 if (mode == 'dark') {
	 	$("body").addClass( "dark-mode");
	 	$( "#dark-mode-toggle" ).click(function() {
			$( "body" ).toggleClass( "dark-mode");
			localStorage.setItem('mode', 'lite');
			mode = localStorage.getItem('mode');
		});
	}else{
			$( "#dark-mode-toggle" ).click(function() {
			$( "body" ).toggleClass( "dark-mode");
			localStorage.setItem('mode', 'dark');
			mode = localStorage.getItem('mode');
		});
	}

    
});
 
