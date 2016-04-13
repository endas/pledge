
var frmAddressAddressOneBuffer = document.getElementById("frmAddressAddressOne").value;
      
var frmAddressAddressTwoBuffer = document.getElementById("frmAddressAddressTwo").value;
      
var frmAddressCityBuffer = document.getElementById("frmAddressCity").value;
      
var frmAddressStateProvinceRegionBuffer = document.getElementById("frmAddressStateProvinceRegion").value;
      
var frmAddressPostCodeBuffer = document.getElementById("frmAddressPostCode").value;
      
var frmAddressCountryBuffer = document.getElementById("frmAddressCountry").value;
      
var frmAddressCountryTextBuffer = getSelectedText(document.getElementById("frmAddressCountry"));      
      

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
		var feedbackMessage = document.getElementById('frmAddressLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmAddressLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmAddressAddressId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmAddress"));



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

if ($('#frmAddressMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmAddressAddressViewId').val()
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
			id: $('#frmAddressAddressViewId').val()
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
} // end if ($('#frmAddressMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmAddressExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmAddressAddressOne").value != frmAddressAddressOneBuffer){
			document.getElementById("frmAddressAddressOneFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressAddressOneHelpBlock"), "Previous Value: " + frmAddressAddressOneBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressAddressOne");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressAddressTwo").value != frmAddressAddressTwoBuffer){
			document.getElementById("frmAddressAddressTwoFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressAddressTwoHelpBlock"), "Previous Value: " + frmAddressAddressTwoBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressAddressTwo");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressCity").value != frmAddressCityBuffer){
			document.getElementById("frmAddressCityFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressCityHelpBlock"), "Previous Value: " + frmAddressCityBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressCity");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressStateProvinceRegion").value != frmAddressStateProvinceRegionBuffer){
			document.getElementById("frmAddressStateProvinceRegionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressStateProvinceRegionHelpBlock"), "Previous Value: " + frmAddressStateProvinceRegionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressStateProvinceRegion");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressPostCode").value != frmAddressPostCodeBuffer){
			document.getElementById("frmAddressPostCodeFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressPostCodeHelpBlock"), "Previous Value: " + frmAddressPostCodeBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressPostCode");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmAddressCountry").value != frmAddressCountryBuffer){
			document.getElementById("frmAddressCountryFormGroup").className += " has-error";
			replaceText(document.getElementById("frmAddressCountryHelpBlock"), "Previous Value: " + frmAddressCountryTextBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmAddressCountry");
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
                		document.getElementById("frmAddress").method = "get";
                    	document.getElementById("frmAddress").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmAddress").method = "get";
			document.getElementById("frmAddress").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

