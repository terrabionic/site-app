var siteApp = (function($) {

	'use strict';

	var menuProfile = function() {
		$('#profile-menu').on('click', function() {
  			$('#drop-down-menu').toggle();
		});
	};

	var setSectorItemActive = function(val) {

		resetSectorItemActive();

		$('#sector-cool').find('[data-val="' + val + '"]').addClass('is-active');

	};

	var sectorCool = function() {

		if (!$('#sector-cool').length) {
			return;
		}

		$('#company_sector_id').on('change', function() {
			setSectorItemActive($(this).val());
		});

		$('#sector-cool').on('click', function() {
			$(this).toggleClass('is-active');
		});

		$('#sector-cool').on('click', '.sector-cool__item', function(evt) {
			$('#company_sector_id')
				.val(
					$(this).data('val')
				)
				.change()
		});

		setSectorItemActive(
			$('#company_sector_id').val()
		);	
		
	};


	var resetSectorItemActive = function() {
		$('#sector-cool').children().removeClass('is-active');
	};

	var wizardForms = function() {

		if ($('#new_reply').length) {
			$("#new_reply").formToWizard({
  				submitButton: 'guardar'
			});
		}

		if ($('#edit_survey_analysis_2').length) {
			$("#edit_survey_analysis_2").formToWizard({
  				submitButton: 'guardar'
			});
		}

		if ($('#edit_survey_analysis_1').length) {
			$("#edit_survey_analysis_1").formToWizard({
  				submitButton: 'guardar'
			});
		}



	};

	var thxReqply = function() {
		if ($('#reply-message').length && $('#reply-message').text() != '') {
			$('#thx-link').click();
		}
	};

	var ready = function() {
		menuProfile();
		sectorCool();
		wizardForms();
		thxReqply();
	};

	return {
		ready: ready
	};

})(jQuery);

// jQuery(siteApp.ready);

jQuery(document).on('turbolinks:load', siteApp.ready);