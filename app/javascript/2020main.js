
import 'jquery'
import 'popper.js'
import 'bootstrap-v462'

$(function() {

    $('[data-toggle-second="tooltip"]').tooltip();
    $('[data-toggle-second="tooltip"]').on('click', function () {
    	$(this).tooltip('hide')
	})

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

