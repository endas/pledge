
var frmApplicationUserDetailsContactNameBuffer = document.getElementById("frmApplicationUserDetailsContactName").value;
      
var frmApplicationUserDetailsRepresentOrganisationBuffer = document.getElementById("frmApplicationUserDetailsRepresentOrganisation").value;
      
var frmApplicationUserDetailsRepresentOrganisationTextBuffer = getSelectedText(document.getElementById("frmApplicationUserDetailsRepresentOrganisation"));      
      
var frmApplicationUserDetailsTelephoneNumberBuffer = document.getElementById("frmApplicationUserDetailsTelephoneNumber").value;
      
var frmApplicationUserDetailsAddressOneBuffer = document.getElementById("frmApplicationUserDetailsAddressOne").value;
      
var frmApplicationUserDetailsAddressTwoBuffer = document.getElementById("frmApplicationUserDetailsAddressTwo").value;
      
var frmApplicationUserDetailsCityBuffer = document.getElementById("frmApplicationUserDetailsCity").value;
      
var frmApplicationUserDetailsStateProvinceRegionBuffer = document.getElementById("frmApplicationUserDetailsStateProvinceRegion").value;
      
var frmApplicationUserDetailsPostCodeBuffer = document.getElementById("frmApplicationUserDetailsPostCode").value;
      
var frmApplicationUserDetailsCountryBuffer = document.getElementById("frmApplicationUserDetailsCountry").value;
      
var frmApplicationUserDetailsCountryTextBuffer = getSelectedText(document.getElementById("frmApplicationUserDetailsCountry"));      
      
var frmApplicationUserDetailsEmailAddressBuffer = document.getElementById("frmApplicationUserDetailsEmailAddress").value;
      

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
		var feedbackMessage = document.getElementById('frmApplicationUserDetailsLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmApplicationUserDetailsLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmApplicationUserDetailsApplicationUserDetailsId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmApplicationUserDetails"));



	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker();

	$('.datepicker').on('show.bs.modal', function (event) {
	    event.stopPropagation();
	});
	



	if (displayTextAreaCount){
		
		registerTextareaCount();
	}

	if (validateOnKeyEvents){
		registerKeyEventListeners();
	}

if ($('#frmApplicationUserDetailsMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmApplicationUserDetailsApplicationUserDetailsViewId').val()
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
			id: $('#frmApplicationUserDetailsApplicationUserDetailsViewId').val()
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
} // end if ($('#frmApplicationUserDetailsMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmApplicationUserDetailsExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmApplicationUserDetailsContactName").value != frmApplicationUserDetailsContactNameBuffer){
			document.getElementById("frmApplicationUserDetailsContactNameFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsContactNameHelpBlock"), "Previous Value: " + frmApplicationUserDetailsContactNameBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsContactName");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsRepresentOrganisation").value != frmApplicationUserDetailsRepresentOrganisationBuffer){
			document.getElementById("frmApplicationUserDetailsRepresentOrganisationFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsRepresentOrganisationHelpBlock"), "Previous Value: " + frmApplicationUserDetailsRepresentOrganisationTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsRepresentOrganisation");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsTelephoneNumber").value != frmApplicationUserDetailsTelephoneNumberBuffer){
			document.getElementById("frmApplicationUserDetailsTelephoneNumberFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsTelephoneNumberHelpBlock"), "Previous Value: " + frmApplicationUserDetailsTelephoneNumberBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsTelephoneNumber");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsAddressOne").value != frmApplicationUserDetailsAddressOneBuffer){
			document.getElementById("frmApplicationUserDetailsAddressOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsAddressOneHelpBlock"), "Previous Value: " + frmApplicationUserDetailsAddressOneBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsAddressOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsAddressTwo").value != frmApplicationUserDetailsAddressTwoBuffer){
			document.getElementById("frmApplicationUserDetailsAddressTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsAddressTwoHelpBlock"), "Previous Value: " + frmApplicationUserDetailsAddressTwoBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsAddressTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsCity").value != frmApplicationUserDetailsCityBuffer){
			document.getElementById("frmApplicationUserDetailsCityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsCityHelpBlock"), "Previous Value: " + frmApplicationUserDetailsCityBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsCity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsStateProvinceRegion").value != frmApplicationUserDetailsStateProvinceRegionBuffer){
			document.getElementById("frmApplicationUserDetailsStateProvinceRegionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsStateProvinceRegionHelpBlock"), "Previous Value: " + frmApplicationUserDetailsStateProvinceRegionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsStateProvinceRegion");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsPostCode").value != frmApplicationUserDetailsPostCodeBuffer){
			document.getElementById("frmApplicationUserDetailsPostCodeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsPostCodeHelpBlock"), "Previous Value: " + frmApplicationUserDetailsPostCodeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsPostCode");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsCountry").value != frmApplicationUserDetailsCountryBuffer){
			document.getElementById("frmApplicationUserDetailsCountryFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsCountryHelpBlock"), "Previous Value: " + frmApplicationUserDetailsCountryTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsCountry");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserDetailsEmailAddress").value != frmApplicationUserDetailsEmailAddressBuffer){
			document.getElementById("frmApplicationUserDetailsEmailAddressFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserDetailsEmailAddressHelpBlock"), "Previous Value: " + frmApplicationUserDetailsEmailAddressBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserDetailsEmailAddress");
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
                		document.getElementById("frmApplicationUserDetails").method = "get";
                    	document.getElementById("frmApplicationUserDetails").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmApplicationUserDetails").method = "get";
			document.getElementById("frmApplicationUserDetails").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

