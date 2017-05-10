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

	var passwordMessage = function() {
		if($('#message-link').length) {
			$('#message-link').click();
		}
	};

	var charts = function() {
		google.charts.load('current', {'packages':['corechart']});

		google.charts.setOnLoadCallback(drawCharts);
	};

	var drawCharts = function() {

		var $chartCategories = $('#chart-categories');

		var $chartIndividual = $('.js-chart-category');

		var $chartMonitorEstatal = $('#chart-monitor-estatal');

		var $chartMonitorDetalle = $('#chart-monitor-detalle');

		if ($chartMonitorDetalle.length) {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'Category');

			data.addColumn('number', 'Points');

			data.addRows($chartMonitorDetalle.data('rows'));
			
		    var options = {
				colors:['#032E4D','#032E4D', '#032E4D','#032E4D','#032E4D','#032E4D', '#032E4D','#032E4D'],
				legend: {
					position: 'none'
				},
				tooltip: {
					trigger: 'none'
				},
				chartArea: {
					left: 0,
					top: 0,
					width:'100%',
					height: '100%'
				},
				enableInteractivity: false
		    };

		    var chart = new google.visualization.PieChart(document.getElementById('chart-monitor-detalle'));

		    chart.draw(data, options);	

		}

		if ($chartMonitorEstatal.length) {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'Category');

			data.addColumn('number', 'Points');

			data.addRows($chartMonitorEstatal.data('rows'));
			
		    var options = {
				colors:['#032E4D','#F4F5F7'],
				legend: {
					position: 'none'
				},
				tooltip: {
					trigger: 'none'
				},
				chartArea: {
					left: 0,
					top: 0,
					width:'100%',
					height: '100%'
				},
				enableInteractivity: false
		    };

		    var chart = new google.visualization.PieChart(document.getElementById('chart-monitor-estatal'));

		    chart.draw(data, options);	

		}

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

	var calendar = function() {

		if ($('#calendar').length) {

			$('#calendar').fullCalendar({
				events: siteApp.events,
				eventClick: onClickEvent,
			    eventRender: onEventRender,
			    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
			    buttonText: {
					today: 'Hoy',
					month: 'month',
					week: 'week',
					day: 'day'
		        },
		        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
			});

		}

	};

	var onClickEvent = function(calEvent, jsEvent, view) {
		calEvent.url = calEvent.url.replace('.', '/');
		jsEvent.currentTarget.href = calEvent.url;
	};

	var onEventRender = function(event, element) {
		$(element).addClass(event.level);
	};

	var toggleFiltersEmpresarial = function(event, element) {
		$('.buscador-empresarial strong').click(function() {
			$(this).toggleClass('is-active');
		});
	};

	var buscadorEmpresarial = function() {
		$('.buscador-empresarial #level').change(function() {
			this.form.submit();
		});
	};

	var monitor = function() {
		if ($('.tabs-monitor').length) {
			$('.tabs-monitor').on('change.zf.tabs', function() {
				charts();
			});
		}
	};

	var sliders = function() {
		$('.slider-noticias').slick({
			fade: true,
			prevArrow: '<button type="button" class="slick-prev">Anterior</button>',
			nextArrow: '<button type="button" class="slick-next">Siguiente</button>'
		});
	};

	var introJS = function() {
		if ($('*[data-step]').length && window.location.href.indexOf('commit=Buscar') == -1) {
			if ($(window).width() > 1024) {
				introJs().start();
			}
		}
	};

	var notificaciones = function() {
		$('.menu-notificaciones > span').click(function() {
			$(this).next().toggle();
		});
	};

	var initFieldOptions = function() {
		if (!$('.js-field-group').length) {
			return;
		}

		$('.js-field-group').each(function() {
			createCustomOptions(this);
		});

		setTimeout(function() {
			$('.js-field-group').each(function() {
				selectIfval(this);
			});	
		}, 500);

	};

	var selectIfval = function(ele) {
		
		var select = $(ele).find('select');

		if($(select).val()) {

			var value = $(select).val();
			var optionSelected = $(select).find('option[selected="selected"]');
			var label = optionSelected.parent().attr('label');
			
			var fieldsetGroup = $('.group-wrapper[data-label="' + label + '"]');
			
			fieldsetGroup.show();
			$(select).parent().show();

			fieldsetGroup.find(':radio[value=' + value + ']').attr('checked', 'checked');
		}
	};

	var createCustomOptions = function(ele) {
		$(ele).find('optgroup').each(function() {
			$(ele).after(
				'<fieldset class="group-wrapper" data-label="' + $(this).attr('label') + '" data-select="' + $(this).parent().attr('id') + '">' +
					createControls(this) + 
				'</fieldset>'
			);

		});
	};

	var createControls = function(ele) {
		var html = '';

		$(ele).children('option').each(function() {
			html += '<div class="question-item">'+
						'<p><label class="radio-custom">' + 
							'<input type="radio" value="' + $(this).attr('value') + '">' + 
							'<span></span>' +
							$(this).text() + 
						'</label></p>' + 
					'</div>';
		});

		return html;
	};

	var dependentDropdowns = function() {
		dependentStart();
		dependentStepTwo();

		$('body').on('click', '.group-wrapper :radio', function() {
			// Uncheck other elements
			$(this).parent().parent().parent().siblings().each(function(index, domEle) {
				$(domEle).find(':radio').prop('checked', false);
			});
			// get select selector
			var select = $(this).parent().parent().parent().parent().data('select');
			// get value
			var val = $(this).val();
			// get select domEle
			var selectEle = $('#' + select);
			// change select
			selectEle.val(val).change();
			// find option
			var currentOption = $(selectEle).find('option[value="' + val + '"]');
			// get group name
			var groupName = $(currentOption).text();

			// hide other groups
			selectEle.find('option').each(function() {
				$('.group-wrapper[data-label="' + $(this).text() + '"]').hide();
			});
		
			// get wrapper
			var groupWrapper = $('.group-wrapper').filter('[data-label="' + groupName + '"]');
			// get wrapper
			groupWrapper.show();

			// show group
			$('#' + groupWrapper.data('select')).parent().show()
		});
	};

	var dependentStepTwo = function() {

	};

	var dependentStart = function() {
		if (!$('.js-dependent-start').length) {
			return false;
		}
		$('.js-dependent-start').show();
		var value = $('.js-dependent-start select').val()
		var currentOption = $('.js-dependent-start select').find('option[value="' + value + '"]');
		var groupName = $(currentOption).text();
		
		var groupWrapper = $('.group-wrapper').filter('[data-label="' + groupName + '"]');


		groupWrapper.show();


		var value = $('.js-dependent-start select').on('change', function() {
			var value = $('.js-dependent-start select').val()
			var currentOption = $('.js-dependent-start select').find('option[value="' + value + '"]');
			var groupName = $(currentOption).text();
			
			var groupWrapper = $('.group-wrapper').filter('[data-label="' + groupName + '"]');

			$('.group-wrapper').hide();
			groupWrapper.show();
		});
	};

	var ready = function() {
		menuProfile();
		sectorCool();
		wizardForms();
		thxReqply();
		charts();
		calendar();
		passwordMessage();
		toggleFiltersEmpresarial();
		buscadorEmpresarial();
		monitor();
		sliders();
		introJS();
		notificaciones();
		initFieldOptions();
		dependentDropdowns();
	};

	return {
		ready: ready,
	};

})(jQuery);

// jQuery(siteApp.ready);

jQuery(document).on('turbolinks:load', siteApp.ready);