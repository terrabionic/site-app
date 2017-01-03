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

		if ($('#edit_reply_4').length) {
			$("#edit_reply_4").formToWizard({
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

	var charts = function() {
		google.charts.load('current', {'packages':['corechart']});

		google.charts.setOnLoadCallback(drawCharts);
	};

	var drawCharts = function() {

		var $chartCategories = $('#chart-categories');

		var $chartIndividual = $('.js-chart-category');

		if ($chartCategories.length) {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'Category');

			data.addColumn('number', 'Points');

			data.addRows($chartCategories.data('rows'));
			
		    var options = {
				colors:['#22A89E','#5F9731', '#1E5E3E', '#043050'],
				legend: {
					position: 'left'
				},
				chartArea: {
					left: 0,
					top: 0,
					width:'100%',
					height: '100%'
				}
		    };

		    var chart = new google.visualization.PieChart(document.getElementById('chart-categories'));

		    chart.draw(data, options);	

		}

		if ($chartIndividual.length) {

			$chartIndividual.each(function() {

				var data = new google.visualization.DataTable();

				data.addColumn('string', 'Category');

				data.addColumn('number', 'Points');

				// console.log($(this).data('rows'));

				data.addRows($(this).data('rows'));

				var options = {
					colors:['#22A89E','#E6E7E9'],
					legend: {
						position: 'none'
					}
			    };

			    var chart = new google.visualization.PieChart(this);

			    chart.draw(data, options);	

			});

		}
	};



	var ready = function() {
		menuProfile();
		sectorCool();
		wizardForms();
		thxReqply();
		charts();
	};

	return {
		ready: ready
	};

})(jQuery);

// jQuery(siteApp.ready);

jQuery(document).on('turbolinks:load', siteApp.ready);