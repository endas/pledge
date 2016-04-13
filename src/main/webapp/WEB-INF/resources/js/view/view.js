
var frmViewViewNameBuffer = document.getElementById("frmViewViewName").value;
      
var frmMessageResourceCreateUpdateMessageKeyBuffer = null;
    
var frmMessageResourceCreateUpdateLocaleBuffer = null;
    
var frmMessageResourceCreateUpdateLocaleReferenceIdBuffer = null;
    
var frmMessageResourceCreateUpdateMessageBuffer = null;
    

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
		var feedbackMessage = document.getElementById('frmViewLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmViewLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmViewViewId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmView"));



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


	var messageResourceTableBody = document.getElementById("messageResourceTableBody");
	
	if (mainFormObjectId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: mainFormObjectId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					var cell = document.createElement("td");
					var editModalAnchorText = "<a href='#' class='btn btn-info btn-sm' data-toggle='modal' data-backdrop='static' data-target='#messageResourceCreateUpdateModal' data-id='" + obj.id + "' data-modal-title='Add Message' data-callback-table-body-id='messageResourceTableBody' data-property-url='messageresource' data-callback-display-type='table' aria-label='view'><span class='glyphicon glyphicon-edit'></a>";
					var editAnchorURI = rootContext + "/messageresource/" + obj.id + "/update";
					var editAnchorText = "<a href='" + editAnchorURI + "' class='btn btn-primary btn-sm' aria-label='view'><span class='glyphicon glyphicon-pencil'></a>";
					cell.innerHTML = "<div class='btn-group-vertical' role='group'>" + editModalAnchorText + editAnchorText + "</div>";
					row.appendChild(cell);
					
								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.messageKey);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.locale);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.message);
								cell.appendChild(cellText);
								row.appendChild(cell);
					messageResourceTableBody.appendChild(row);
				});
			}
		});
	}


		var frmMessageResourceCreateUpdateLaddaSubmitButtonHandler = null;
		

		$('#messageResourceCreateUpdateModal').modal('handleUpdate');
		
		$('#messageResourceCreateUpdateModal').on('show.bs.modal', function (event) {
  			var button = $(event.relatedTarget); // Button that triggered the modal
  			var id = button.data('id'); // Extract info from data-* attributes
  			var modalTitle = button.data('modal-title');
  			var callBackDisplayType = button.data('callback-display-type');
  			var callBackTableId = button.data('callback-table-body-id');
  			var propertyUrl = button.data('property-url');

  			var modal = $(this);
  			modal.find('.modal-title').text(modalTitle);
  			modal.find('#frmMessageResourceCreateUpdateLoadedObjectId').val(id);
  			modal.find('#frmMessageResourceCreateUpdateParentObjectId').val(mainFormObjectId);
  			modal.find('#frmMessageResourceCreateUpdateCallBackDisplayType').val(callBackDisplayType);
  			modal.find('#frmMessageResourceCreateUpdateCallBackTableBodyId').val(callBackTableId);
  			modal.find('#frmMessageResourceCreateUpdatePropertyUrl').val(propertyUrl);
  			
		
			if (mainFormObjectId == ''){
				var invalidParentIdMessage = button.data('invalid-parent-id-message'); // Extract info from data-* attributes
				$('#messageResourceCreateUpdateModal').find('.modal-body').html('<p>' + invalidParentIdMessage + '</p>');
				$("#frmMessageResourceCreateUpdateSubmitButton").hide();
				return;
			}
			
			if (frmMessageResourceCreateUpdateLaddaSubmitButtonHandler == null){
				frmMessageResourceCreateUpdateLaddaSubmitButtonHandler = Ladda.create(document.querySelector("#frmMessageResourceCreateUpdateSubmitButton"));
			}
			
			frmMessageResourceCreateUpdateLaddaSubmitButtonHandler.start();

   			

		// Reset all of the input contents.
		$( modal.find("input[type=text], input[type=tel], input[type=email], input[type=checkbox], textarea, select")).each(function(){
			var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
   			var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
			var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
				
			if ($(this).is('select')){
				var selectType = $(this).data('select-type');
				if (selectType == 'child'){
					removeSelectOptions(document.getElementById($(this).attr('id')));
				}
				else{
					$(this).val(-1);
				} 
			}
			else if ($(this).is(':checkbox')){
				$(this).prop('checked', false); 
			}
			else{
            	$(this).val("");
			}
			//$(feedbackHelpBlockId).text('');
			$(containerId).toggleClass('has-warning', false);
			$(feedbackIconContainerId).toggleClass('glyphicon-warning-sign', false);
			$(containerId).toggleClass('has-success', false);
			$(feedbackIconContainerId).toggleClass('glyphicon-ok', false);
			$(containerId).toggleClass('has-error', false);
			$(feedbackIconContainerId).toggleClass('glyphicon-remove', false);
       	});
   			
   		if (id != null){
			$.ajax({
				dataType: "json",
				url: rootContext + "/restful/messageresource",
				data: {
					id: id
				},
				success: function( data ) {
					
					//modal.find('#frmMessageResourceCreateUpdateMessageKey').focus();
  
					modal.find('#frmMessageResourceCreateUpdateMessageKey').val(data.messageKey);
					frmMessageResourceCreateUpdateMessageKeyBuffer = data.messageKey;
    
					modal.find('#frmMessageResourceCreateUpdateLocale').val(data.locale);
					frmMessageResourceCreateUpdateLocaleBuffer = data.locale;
    
					modal.find('#frmMessageResourceCreateUpdateLocaleReferenceId').val(data.localeReferenceId);
					frmMessageResourceCreateUpdateLocaleReferenceIdBuffer = data.localeReferenceId;
    
					modal.find('#frmMessageResourceCreateUpdateMessage').val(data.message);
					frmMessageResourceCreateUpdateMessageBuffer = data.message;
    
				}
			});
		}

		
		});	
		
		$('#messageResourceCreateUpdateModal').on('shown.bs.modal', function (event) {
			if (frmMessageResourceCreateUpdateLaddaSubmitButtonHandler != null){
				frmMessageResourceCreateUpdateLaddaSubmitButtonHandler.stop();
			}
			$('#frmMessageResourceCreateUpdateMessageKey').focus()
		});	
		
		
			
		
		
		
		$("#frmMessageResourceCreateUpdateSubmitButton").click(function( event ) {
			frmMessageResourceCreateUpdateLaddaSubmitButtonHandler.start();
			var validationSuccess = true;
			var mode = null;
			var modal = $('#messageResourceCreateUpdateModal');
			var modalTitle = modal.find('#frmMessageResourceCreateUpdateTitle').val();
			var callBackDisplayType = modal.find('#frmMessageResourceCreateUpdateCallBackDisplayType').val();
			
			$( modal.find("input[type=text], input[type=tel], input[type=email], input[type=checkbox][aria-describedby], textarea, select")).each(function(){
				var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    			var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    			var feedbackAlertBlockId = ('#').concat($(this).attr('id')).concat('AlertBlock');
    			var feedbackAlertBlockTextId = ('#').concat($(this).attr('id')).concat('AlertBlockText');
    			var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
    			
    			if ($(this).data('required') == true){
    				if ( ( !$(this).is(':checkbox') && ($(this).val() == -1 || $(this).val() == '') ) || ( $(this).is(':checkbox') && !$(this).is(':checked') ) ){
    					if ($(this).is(':checkbox')){
    						$(feedbackHelpBlockId).text('Please check the ' + $(this).data('display-name') + ' checkbox');
							//showalert(feedbackAlertBlockId, feedbackAlertBlockTextId, 'Please check the ' + $(this).data('display-name') + ' checkbox', 'alert-danger')    					
    					}else{
    						$(feedbackHelpBlockId).text('Please enter a value for ' + $(this).data('display-name'));
    						//showalert(feedbackAlertBlockId, feedbackAlertBlockTextId, 'Please enter a value for ' + $(this).data('display-name'), 'alert-danger')
    					}
						$(containerId).toggleClass('has-error', true);
						if (!$(this).is(':checkbox')){
							$(feedbackIconContainerId).toggleClass('glyphicon-remove', true);
						}
    					validationSuccess = false;
					}
    			}
				
        	});
        	
        	if (validationSuccess == false){
        		frmMessageResourceCreateUpdateLaddaSubmitButtonHandler.stop();
        		return false;
        	}
			

			if (modal.find('#frmMessageResourceCreateUpdateLoadedObjectId').val().length > 0){
				mode = "update";
			}
			else{
				mode="new";
			}


			
			
			var messageResource = {
				parentObjectId : modal.find('#frmMessageResourceCreateUpdateParentObjectId').val(),
				id : modal.find('#frmMessageResourceCreateUpdateLoadedObjectId').val(),
				messageKey : modal.find('#frmMessageResourceCreateUpdateMessageKey').val(),
				locale : modal.find('#frmMessageResourceCreateUpdateLocale').val(),
				localeReferenceId : modal.find('#frmMessageResourceCreateUpdateLocaleReferenceId').val(),
				message : modal.find('#frmMessageResourceCreateUpdateMessage').val()
			};
			
			var propertyUrl = modal.find('#frmMessageResourceCreateUpdatePropertyUrl').val();
			var url = rootContext + "/restful/view/" + propertyUrl + "/" + mode;
			
			$.ajax({
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				method: "post",
				url: url,
				data: JSON.stringify(messageResource),
				success: function( data ) {
					if ( ($('#frmViewMode').val() == 'ADD') || ($('#frmViewMode').val() == 'UPDATE')){
						if (callBackDisplayType == "table"){
							var new_tbody = document.createElement('tbody');
							var callBackTableBodyId = modal.find('#frmMessageResourceCreateUpdateCallBackTableBodyId').val();
							var callBackTableBody = document.getElementById(callBackTableBodyId);
						
							$.each(data, function(idx, obj) {
								var row = document.createElement("tr");
								var cell = document.createElement("td");
								var editModalAnchorText = "<a href='#' class='btn btn-info btn-sm' data-toggle='modal' data-backdrop='static' data-target='#messageResourceCreateUpdateModal' data-id='" + obj.id + "' data-modal-title='" + modalTitle + "' data-callback-table-body-id='" + callBackTableBodyId + "' data-property-url='messageresource' data-callback-display-type='table' aria-label='view'><span class='glyphicon glyphicon-edit'></a>";
								var editAnchorURI = rootContext + "/messageresource/" + obj.id + "/update";
								var editAnchorText = "<a href='" + editAnchorURI + "' class='btn btn-primary btn-sm' aria-label='view'><span class='glyphicon glyphicon-pencil'></a>";
								cell.innerHTML = "<div class='btn-group-vertical' role='group'>" + editModalAnchorText + editAnchorText + "</div>";
								row.appendChild(cell);
								
								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.messageKey);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.locale);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.message);
								cell.appendChild(cellText);
								row.appendChild(cell);

								new_tbody.appendChild(row);
							});
						
							callBackTableBody.parentNode.replaceChild(new_tbody, callBackTableBody);
							new_tbody.id = callBackTableBodyId;
						}
						else if (callBackDisplayType == "inline"){
							$.each(data, function(idx, obj) {
								
								document.getElementById("frmMessageResourceMessageKeyMessage").innerHTML = obj.messageKey;

								document.getElementById("frmMessageResourceLocaleMessage").innerHTML = obj.locale;

								document.getElementById("frmMessageResourceMessageMessage").innerHTML = obj.message;

							});
						}
					}
					
					modal.modal('hide');
				},
				error: function(jqXHR, textStatus, errorThrown) {
					if(jqXHR.status==403) {
            			alert('403 returned');
        			}
					
					console.log(textStatus, errorThrown);
				}
			});
		});


		$("#frmMessageResourceCreateUpdateCloseButton").click(function( event ) {
			var mode = null;
			var modal = $('#messageResourceCreateUpdateModal');
			var callBackTableBodyId = modal.find('#frmMessageResourceCreateUpdateCallBackTableBodyId').val();
			var callBackTableBody = document.getElementById(callBackTableBodyId);
			var modalTitle = modal.find('#frmMessageResourceCreateUpdateTitle').val();
	

			modal.modal('hide');
		});

			


if ($('#frmViewMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmViewViewViewId').val()
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
			id: $('#frmViewViewViewId').val()
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
} // end if ($('#frmViewMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmViewExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmViewViewName").value != frmViewViewNameBuffer){
			document.getElementById("frmViewViewNameFormGroup").className += " has-error";
			replaceText(document.getElementById("frmViewViewNameHelpBlock"), "Previous Value: " + frmViewViewNameBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmViewViewName");
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
                		document.getElementById("frmView").method = "get";
                    	document.getElementById("frmView").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmView").method = "get";
			document.getElementById("frmView").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

