
var frmApplicationUserUsernameBuffer = document.getElementById("frmApplicationUserUsername").value;
      
var frmApplicationUserPasswordBuffer = document.getElementById("frmApplicationUserPassword").value;
      
var frmApplicationUserEnabledBuffer = document.getElementById("frmApplicationUserEnabled").checked;
      
var userRolesBuffer1 = document.getElementById("userRoles1").checked;
      
var userRolesBuffer2 = document.getElementById("userRoles2").checked;
      
var userRolesBuffer3 = document.getElementById("userRoles3").checked;
      
var userRolesBuffer4 = document.getElementById("userRoles4").checked;
      

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
		var feedbackMessage = document.getElementById('frmApplicationUserLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmApplicationUserLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmApplicationUserApplicationUserId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmApplicationUser"));



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

if ($('#frmApplicationUserMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmApplicationUserApplicationUserViewId').val()
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
			id: $('#frmApplicationUserApplicationUserViewId').val()
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
} // end if ($('#frmApplicationUserMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmApplicationUserExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmApplicationUserUsername").value != frmApplicationUserUsernameBuffer){
			document.getElementById("frmApplicationUserUsernameFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserUsernameHelpBlock"), "Previous Value: " + frmApplicationUserUsernameBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserUsername");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserPassword").value != frmApplicationUserPasswordBuffer){
			document.getElementById("frmApplicationUserPasswordFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserPasswordHelpBlock"), "Previous Value: " + frmApplicationUserPasswordBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserPassword");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmApplicationUserEnabled").checked != frmApplicationUserEnabledBuffer){
			document.getElementById("frmApplicationUserEnabledFormGroup").className += " has-error";
			replaceText(document.getElementById("frmApplicationUserEnabledHelpBlock"), "Previous Value: " + frmApplicationUserEnabledBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmApplicationUserEnabled");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("userRoles1").checked != userRolesBuffer1){
			$('label[for="userRoles1"]').css("color", "#d9534f");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles1");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("userRoles2").checked != userRolesBuffer2){
			$('label[for="userRoles2"]').css("color", "#d9534f");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles2");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("userRoles3").checked != userRolesBuffer3){
			$('label[for="userRoles3"]').css("color", "#d9534f");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles3");
				focusSet = true;
			}
			changedCounter++;
		}
      
		if (document.getElementById("userRoles4").checked != userRolesBuffer4){
			$('label[for="userRoles4"]').css("color", "#d9534f");
			if (focusSet == false){
				focusControl = document.getElementById("userRoles4");
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
                		document.getElementById("frmApplicationUser").method = "get";
                    	document.getElementById("frmApplicationUser").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmApplicationUser").method = "get";
			document.getElementById("frmApplicationUser").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

