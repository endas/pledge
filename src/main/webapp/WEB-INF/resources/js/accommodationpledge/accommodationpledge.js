
var frmAccommodationPledgeAddressOneBuffer = document.getElementById("frmAccommodationPledgeAddressOne").value;
      
var frmAccommodationPledgeAddressTwoBuffer = document.getElementById("frmAccommodationPledgeAddressTwo").value;
      
var frmAccommodationPledgeCityBuffer = document.getElementById("frmAccommodationPledgeCity").value;
      
var frmAccommodationPledgeStateProvinceRegionBuffer = document.getElementById("frmAccommodationPledgeStateProvinceRegion").value;
      
var frmAccommodationPledgePostCodeBuffer = document.getElementById("frmAccommodationPledgePostCode").value;
      
var frmAccommodationPledgeCountryBuffer = document.getElementById("frmAccommodationPledgeCountry").value;
      
var frmAccommodationPledgeCountryTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeCountry"));      
      
var frmAccommodationPledgeOwnerOccupierBuffer = document.getElementById("frmAccommodationPledgeOwnerOccupier").value;
      
var frmAccommodationPledgeOwnerOccupierTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeOwnerOccupier"));      
      
var frmAccommodationPledgeAccommodationDateFromBuffer = document.getElementById("frmAccommodationPledgeAccommodationDateFrom").value;
      
var frmAccommodationPledgeAccommodationDateToBuffer = document.getElementById("frmAccommodationPledgeAccommodationDateTo").value;
      
var frmAccommodationPledgeAccommodationTypeBuffer = document.getElementById("frmAccommodationPledgeAccommodationType").value;
      
var frmAccommodationPledgeAccommodationTypeTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeAccommodationType"));      
      
var frmAccommodationPledgeAccommodationConditionBuffer = document.getElementById("frmAccommodationPledgeAccommodationCondition").value;
      
var frmAccommodationPledgeAccommodationConditionTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeAccommodationCondition"));      
      
var frmAccommodationPledgeNumberOfBedsBuffer = document.getElementById("frmAccommodationPledgeNumberOfBeds").value;
      
var frmAccommodationPledgeNumberOfBedsTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeNumberOfBeds"));      
      
var frmAccommodationPledgeVacantOrSharedBuffer = document.getElementById("frmAccommodationPledgeVacantOrShared").value;
      
var frmAccommodationPledgeVacantOrSharedTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeVacantOrShared"));      
      
var frmAccommodationPledgeOtherAmenitiesBuffer = document.getElementById("frmAccommodationPledgeOtherAmenities").value;
      
var frmAccommodationPledgeCanYouAccommodateBuffer = document.getElementById("frmAccommodationPledgeCanYouAccommodate").value;
      
var frmAccommodationPledgeCanYouAccommodateTextBuffer = getSelectedText(document.getElementById("frmAccommodationPledgeCanYouAccommodate"));      
      
var frmAccommodationPledgeAdditionalInformationBuffer = document.getElementById("frmAccommodationPledgeAdditionalInformation").value;
      

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
		var feedbackMessage = document.getElementById('frmAccommodationPledgeLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmAccommodationPledgeLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmAccommodationPledgeAccommodationPledgeId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmAccommodationPledge"));



	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker();

	$('.datepicker').on('show.bs.modal', function (event) {
	    event.stopPropagation();
	});
	



	if (displayTextAreaCount){
		
		// Display a count of the characters in the Description of other Amenities textarea input
		$('#frmAccommodationPledgeOtherAmenitiesCountBlock').text($('#frmAccommodationPledgeOtherAmenities').val().length.toString().concat('/').concat('500'));
  
		// Display a count of the characters in the Is there anything else that you would like to say about the accommodation? textarea input
		$('#frmAccommodationPledgeAdditionalInformationCountBlock').text($('#frmAccommodationPledgeAdditionalInformation').val().length.toString().concat('/').concat('500'));
  
		registerTextareaCount();
	}

	if (validateOnKeyEvents){
		registerKeyEventListeners();
	}

if ($('#frmAccommodationPledgeMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmAccommodationPledgeAccommodationPledgeViewId').val()
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
			id: $('#frmAccommodationPledgeAccommodationPledgeViewId').val()
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
} // end if ($('#frmAccommodationPledgeMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmAccommodationPledgeExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmAccommodationPledgeAddressOne").value != frmAccommodationPledgeAddressOneBuffer){
			document.getElementById("frmAccommodationPledgeAddressOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAddressOneHelpBlock"), "Previous Value: " + frmAccommodationPledgeAddressOneBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAddressOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAddressTwo").value != frmAccommodationPledgeAddressTwoBuffer){
			document.getElementById("frmAccommodationPledgeAddressTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAddressTwoHelpBlock"), "Previous Value: " + frmAccommodationPledgeAddressTwoBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAddressTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeCity").value != frmAccommodationPledgeCityBuffer){
			document.getElementById("frmAccommodationPledgeCityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeCityHelpBlock"), "Previous Value: " + frmAccommodationPledgeCityBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeCity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeStateProvinceRegion").value != frmAccommodationPledgeStateProvinceRegionBuffer){
			document.getElementById("frmAccommodationPledgeStateProvinceRegionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeStateProvinceRegionHelpBlock"), "Previous Value: " + frmAccommodationPledgeStateProvinceRegionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeStateProvinceRegion");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgePostCode").value != frmAccommodationPledgePostCodeBuffer){
			document.getElementById("frmAccommodationPledgePostCodeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgePostCodeHelpBlock"), "Previous Value: " + frmAccommodationPledgePostCodeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgePostCode");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeCountry").value != frmAccommodationPledgeCountryBuffer){
			document.getElementById("frmAccommodationPledgeCountryFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeCountryHelpBlock"), "Previous Value: " + frmAccommodationPledgeCountryTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeCountry");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeOwnerOccupier").value != frmAccommodationPledgeOwnerOccupierBuffer){
			document.getElementById("frmAccommodationPledgeOwnerOccupierFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeOwnerOccupierHelpBlock"), "Previous Value: " + frmAccommodationPledgeOwnerOccupierTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeOwnerOccupier");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationDateFrom").value != frmAccommodationPledgeAccommodationDateFromBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationDateFromFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationDateFromHelpBlock"), "Previous Value: " + frmAccommodationPledgeAccommodationDateFromBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationDateFrom");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationDateTo").value != frmAccommodationPledgeAccommodationDateToBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationDateToFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationDateToHelpBlock"), "Previous Value: " + frmAccommodationPledgeAccommodationDateToBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationDateTo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationType").value != frmAccommodationPledgeAccommodationTypeBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationTypeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationTypeHelpBlock"), "Previous Value: " + frmAccommodationPledgeAccommodationTypeTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationType");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAccommodationCondition").value != frmAccommodationPledgeAccommodationConditionBuffer){
			document.getElementById("frmAccommodationPledgeAccommodationConditionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAccommodationConditionHelpBlock"), "Previous Value: " + frmAccommodationPledgeAccommodationConditionTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAccommodationCondition");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeNumberOfBeds").value != frmAccommodationPledgeNumberOfBedsBuffer){
			document.getElementById("frmAccommodationPledgeNumberOfBedsFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeNumberOfBedsHelpBlock"), "Previous Value: " + frmAccommodationPledgeNumberOfBedsTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeNumberOfBeds");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeVacantOrShared").value != frmAccommodationPledgeVacantOrSharedBuffer){
			document.getElementById("frmAccommodationPledgeVacantOrSharedFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeVacantOrSharedHelpBlock"), "Previous Value: " + frmAccommodationPledgeVacantOrSharedTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeVacantOrShared");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeOtherAmenities").value != frmAccommodationPledgeOtherAmenitiesBuffer){
			document.getElementById("frmAccommodationPledgeOtherAmenitiesFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeOtherAmenitiesHelpBlock"), "Previous Value: " + frmAccommodationPledgeOtherAmenitiesBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeOtherAmenities");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeCanYouAccommodate").value != frmAccommodationPledgeCanYouAccommodateBuffer){
			document.getElementById("frmAccommodationPledgeCanYouAccommodateFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeCanYouAccommodateHelpBlock"), "Previous Value: " + frmAccommodationPledgeCanYouAccommodateTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeCanYouAccommodate");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAccommodationPledgeAdditionalInformation").value != frmAccommodationPledgeAdditionalInformationBuffer){
			document.getElementById("frmAccommodationPledgeAdditionalInformationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAccommodationPledgeAdditionalInformationHelpBlock"), "Previous Value: " + frmAccommodationPledgeAdditionalInformationBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAccommodationPledgeAdditionalInformation");
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
                		document.getElementById("frmAccommodationPledge").method = "get";
                    	document.getElementById("frmAccommodationPledge").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmAccommodationPledge").method = "get";
			document.getElementById("frmAccommodationPledge").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

