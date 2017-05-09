// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require foundation.js
//= require slick.js
//= require intro.js
//= require vex.combined.js
//= require underscore
//= require gmaps/google
//= require moment
//= require fullcalendar
//= require_tree .

//Override the default confirm dialog by rails
$.rails.allowAction = function(link){
	if (link.data('confirm') == undefined){
   		return true;
  	}
  	$.rails.showConfirmationDialog(link);
  	return false;
};

//User click confirm button
$.rails.confirmed = function(link){
	link.data('confirm', null);
	link.trigger('click.rails');
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){

	var message = link.data('confirm');

	vex.dialog.confirm({
	    message: message,
	    showCloseButton: true,
	    buttons: [
        	$.extend({}, vex.dialog.buttons.YES, { text: 'Ok' }),
        	$.extend({}, vex.dialog.buttons.NO, { text: 'Cancelar' })
    	],
	    callback: function (value) {
	        if (value) {
                $.rails.confirmed(link);  
    		}
	    },
	    className: 'vex-theme-default',
	});

};
