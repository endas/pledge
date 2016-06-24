
var frmServicePledgePledgeServiceLevelOneBuffer = document.getElementById("frmServicePledgePledgeServiceLevelOne").value;
      
var frmServicePledgePledgeServiceLevelOneTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceLevelOne"));      
      
var frmServicePledgePledgeServiceLevelTwoBuffer = document.getElementById("frmServicePledgePledgeServiceLevelTwo").value;
      
var frmServicePledgePledgeServiceLevelTwoTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceLevelTwo"));      
      
var frmServicePledgePledgeServiceLevelThreeBuffer = document.getElementById("frmServicePledgePledgeServiceLevelThree").value;
      
var frmServicePledgePledgeServiceLevelThreeTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceLevelThree"));      
      
var frmServicePledgeAdditionalInformationBuffer = document.getElementById("frmServicePledgeAdditionalInformation").value;
      
var frmServicePledgePledgeServiceQualificationBuffer = document.getElementById("frmServicePledgePledgeServiceQualification").value;
      
var frmServicePledgePledgeServiceDateAvailableBuffer = document.getElementById("frmServicePledgePledgeServiceDateAvailable").value;

var frmServicePledgePledgeServiceDateAvailableToBuffer = document.getElementById("frmServicePledgePledgeServiceDateAvailableTo").value;
      
var frmServicePledgePledgeServiceHoursPerWeekBuffer = document.getElementById("frmServicePledgePledgeServiceHoursPerWeek").value;
      
var frmServicePledgePledgeServiceHoursPerWeekTextBuffer = getSelectedText(document.getElementById("frmServicePledgePledgeServiceHoursPerWeek"));      
      

$( document ).ready(function() {
	var displayTextAreaCount = false;
	var validateOnKeyEvents = false;
	
	$.ajaxSetup({cache: false});
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	try{
		var feedbackMessage = document.getElementById('frmServicePledgeLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmServicePledgeLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmServicePledgeServicePledgeId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmServicePledge"));



	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker();

	$('.datepicker').on('show.bs.modal', function (event) {
	    event.stopPropagation();
	});
	



	if (displayTextAreaCount){
		
		// Display a count of the characters in the Additional Information textarea input
		$('#frmServicePledgeAdditionalInformationCountBlock').text($('#frmServicePledgeAdditionalInformation').val().length.toString().concat('/').concat('500'));
  
		// Display a count of the characters in the Qualification to provide Service textarea input
		$('#frmServicePledgePledgeServiceQualificationCountBlock').text($('#frmServicePledgePledgeServiceQualification').val().length.toString().concat('/').concat('500'));
  
		registerTextareaCount();
	}

	if (validateOnKeyEvents){
		registerKeyEventListeners();
	}

if ($('#frmServicePledgeMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmServicePledgeServicePledgeViewId').val()
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					//alert(obj.messageKey.substr(-6));
					try{
						if ( ((obj.messageKey.substr(-12) == '.form.header') || (obj.messageKey.substr(-15) == '.form.subheader') || (obj.messageKey.substr(-11) == '.form.title')) && obj.localeReferenceId == selectedLocale){
							//alert('Setting Page Header Title: ' + obj.messageKey + ' with value: ' + obj.message);
							document.getElementById(obj.messageKey + '.localizer.label').innerHTML = obj.message;
						}
						else if ((obj.messageKey.substr(-5) == 'Label') && obj.localeReferenceId == selectedLocale){
							//alert('Setting Label: ' + obj.messageKey + ' with value: ' + obj.message);
							
							document.getElementById(obj.messageKey).innerHTML = obj.message;
							document.getElementById(obj.messageKey + 'LocalizerLabel').innerHTML = obj.message;
						}
						else if ((obj.messageKey.substr(-7) == 'Message') && obj.localeReferenceId == selectedLocale){
							//alert('Setting Message: ' + obj.messageKey + ' with value: ' + obj.message);
							
							document.getElementById(obj.messageKey).innerHTML = obj.message;
							document.getElementById(obj.messageKey + 'LocalizerLabel').innerHTML = obj.message;
						}
						else if ((obj.messageKey.substr(-9) == 'HelpBlock') && obj.localeReferenceId == selectedLocale){
							//alert('Setting HelpBlock: ' + obj.messageKey + ' with value: ' + obj.message);
							
							document.getElementById(obj.messageKey).innerHTML = obj.message;
							document.getElementById(obj.messageKey + 'LocalizerLabel').innerHTML = obj.message;
						}
						else if ((obj.messageKey.substr(-11) == 'PlaceHolder') && obj.localeReferenceId == selectedLocale){
							//alert('Setting PlaceHolder: ' + obj.messageKey + ' with value: ' + obj.message);
							var inputId = obj.messageKey.replace('PlaceHolder', '');
							
							var elementReference = document.getElementById(inputId);
							if (elementReference.type == 'select-one' || elementReference.type == 'select-multiple'){
								removeSelectOptions(elementReference);
								$.ajax({
									dataType: "json",
									url: rootContext + "/restful/referenceslist",
									data: {
									referenceType: elementReference.getAttribute("data-reference-type")
									},
									success: function( data ) {
										var unselectedOption = document.createElement("option");
										unselectedOption.value = -1;
										unselectedOption.textContent = obj.message;
										elementReference.appendChild(unselectedOption);
					
										$.each( data, function( key, val ) {
											var el = document.createElement("option");
					    					el.textContent = val;
											el.value = key;
										
					    					elementReference.appendChild(el);
										});
									}
								});
							}
							
							document.getElementById(inputId).placeholder = obj.message;
							document.getElementById(obj.messageKey + 'LocalizerLabel').innerHTML = obj.message;
						}
						
					}catch(ex){
						//alert('Found a messageKey with no matching inputs: ' + obj.messageKey);
					}
				});
			}
		});

	});
	
	// Fire the existingLocale changed event to load the default locale messages via AJAX
	var existingLocaleChangeEvent = document.createEvent("HTMLEvents");
	existingLocaleChangeEvent.initEvent("change", false, true);
	var existingLocaleSelectInput = document.getElementById("existingLocale");
  	existingLocaleSelectInput.dispatchEvent(existingLocaleChangeEvent);
	
	$('#newLocale').change(function () {
		var selectedLocale = $('#newLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmServicePledgeServicePledgeViewId').val()
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					try{
						//alert(obj.messageKey.substr(-6));
						if ( ((obj.messageKey.substr(-12) == '.form.header') || (obj.messageKey.substr(-15) == '.form.subheader') || (obj.messageKey.substr(-11) == '.form.title') ) && obj.localeReferenceId == selectedLocale){
							//alert('Setting PageHeaderTitle: ' + obj.messageKey + ' with value: ' + obj.message);
						
							document.getElementById(obj.messageKey + '.localizer.input').value = obj.message;
						}
						else if ((obj.messageKey.substr(-5) == 'Label') && obj.localeReferenceId == selectedLocale){
							//alert('Setting Label: ' + obj.messageKey + ' with value: ' + obj.message);
						
							document.getElementById(obj.messageKey + 'Localizer').value = obj.message;
						}
						else if ((obj.messageKey.substr(-7) == 'Message') && obj.localeReferenceId == selectedLocale){
							//alert('Setting Message: ' + obj.messageKey + ' with value: ' + obj.message);
						
							document.getElementById(obj.messageKey + 'Localizer').value = obj.message;
						}
						else if ((obj.messageKey.substr(-9) == 'HelpBlock') && obj.localeReferenceId == selectedLocale){
							//alert('Setting HelpBlock: ' + obj.messageKey + ' with value: ' + obj.message);
						
							document.getElementById(obj.messageKey + 'Localizer').value = obj.message;
						}
						else if ((obj.messageKey.substr(-11) == 'PlaceHolder') && obj.localeReferenceId == selectedLocale){
							//alert('Setting PlaceHolder: ' + obj.messageKey + ' with value: ' + obj.message);
							document.getElementById(obj.messageKey + 'Localizer').value = obj.message;
						}
					}catch(ex){
						//alert('Found a messageKey with no matching inputs: ' + obj.messageKey);
					}
				});
			}
		});

	});

	// Fire the newLocale changed event to load the default locale messages via AJAX
	var newLocaleChangeEvent = document.createEvent("HTMLEvents");
	newLocaleChangeEvent.initEvent("change", false, true);
	var newLocaleSelectInput = document.getElementById("newLocale");
  	newLocaleSelectInput.dispatchEvent(newLocaleChangeEvent);
} // end if ($('#frmServicePledgeMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmServicePledgeExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmServicePledgePledgeServiceLevelOne").value != frmServicePledgePledgeServiceLevelOneBuffer){
			document.getElementById("frmServicePledgePledgeServiceLevelOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceLevelOneHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceLevelOneTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceLevelOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceLevelTwo").value != frmServicePledgePledgeServiceLevelTwoBuffer){
			document.getElementById("frmServicePledgePledgeServiceLevelTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceLevelTwoHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceLevelTwoTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceLevelTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceLevelThree").value != frmServicePledgePledgeServiceLevelThreeBuffer){
			document.getElementById("frmServicePledgePledgeServiceLevelThreeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceLevelThreeHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceLevelThreeTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceLevelThree");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgeAdditionalInformation").value != frmServicePledgeAdditionalInformationBuffer){
			document.getElementById("frmServicePledgeAdditionalInformationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgeAdditionalInformationHelpBlock"), "Previous Value: " + frmServicePledgeAdditionalInformationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgeAdditionalInformation");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceQualification").value != frmServicePledgePledgeServiceQualificationBuffer){
			document.getElementById("frmServicePledgePledgeServiceQualificationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceQualificationHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceQualificationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceQualification");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceDateAvailable").value != frmServicePledgePledgeServiceDateAvailableBuffer){
			document.getElementById("frmServicePledgePledgeServiceDateAvailableFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceDateAvailableHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceDateAvailableBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceDateAvailable");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmServicePledgePledgeServiceDateAvailableTo").value != frmServicePledgePledgeServiceDateAvailableToBuffer){
			document.getElementById("frmServicePledgePledgeServiceDateAvailableToFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceDateAvailableToHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceDateAvailableToBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceDateAvailableTo");
				focusSet = true;
			}
			changedCounter++;
		}
		
		
		if (document.getElementById("frmServicePledgePledgeServiceHoursPerWeek").value != frmServicePledgePledgeServiceHoursPerWeekBuffer){
			document.getElementById("frmServicePledgePledgeServiceHoursPerWeekFormGroup").className += " has-error";
			replaceText(document.getElementById("frmServicePledgePledgeServiceHoursPerWeekHelpBlock"), "Previous Value: " + frmServicePledgePledgeServiceHoursPerWeekTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmServicePledgePledgeServiceHoursPerWeek");
				focusSet = true;
			}
			changedCounter++;
		}
	
	
		if (changedCounter > 0){
	
			BootstrapDialog.confirm({
            	title: 'WARNING',
            	message: 'Warning! You are exiting without saving your work. Exit without saving?',
            	type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
            	closable: false, // <-- Default value is false
            	draggable: true, // <-- Default value is false
            	btnCancelLabel: 'Review my changes!', // <-- Default value is 'Cancel',
            	btnOKLabel: 'Exit without saving!', // <-- Default value is 'OK',
            	btnOKClass: 'btn-warning', // <-- If you didn't specify it, dialog type will be used,
            	callback: function(result) {
                	// result will be true if button was click, while it will be false if users close the dialog directly.
                	if(result) {
                		document.getElementById("frmServicePledge").method = "get";
                    	document.getElementById("frmServicePledge").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmServicePledge").method = "get";
			document.getElementById("frmServicePledge").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

