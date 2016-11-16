var siteApp = (function($) {
	'use strict';

	var menuProfile = function() {
		$('#profile-menu').on('click', function() {
  			$('#drop-down-menu').toggle();
		});
		$('#drop-down-menu').on('click', function(evt) {
			evt.stopPropagation();
		});
	}

	var ready = function() {
		menuProfile();
	}

	return {
		ready: ready
	}

}(jQuery));

jQuery(siteApp.ready);