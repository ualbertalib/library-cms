// Importing and adding jQuery which is required for our legacy js (pre-bootstrap 5 layouts), remove one fully migrated.
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

import '@popperjs/core'
import 'bootstrap'
import '../src/stylesheets/2020main-bootstrap-v5.css';

$(function() {
	$('[data-toggle-second="tooltip"]').tooltip();
	$('[data-toggle-second="tooltip"]').on('click', function() {
		$(this).tooltip('hide')
	})

	var mode = localStorage.getItem('mode');
	if (mode == 'dark') {
		$('body').addClass('dark-mode');
		$('#dark-mode-toggle').click(function() {
			$('body').toggleClass('dark-mode');
			localStorage.setItem('mode', 'lite');
			mode = localStorage.getItem('mode');
		});
	} else {
		$('#dark-mode-toggle').click(function() {
			$('body').toggleClass('dark-mode');
			localStorage.setItem('mode', 'dark');
			mode = localStorage.getItem('mode');
		});
	}
});
