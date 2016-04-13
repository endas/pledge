
var frmReferenceCategoryReferenceCategoryDescBuffer = document.getElementById("frmReferenceCategoryReferenceCategoryDesc").value;
      
var frmReferenceCategoryParentCategoryIdBuffer = document.getElementById("frmReferenceCategoryParentCategoryId").value;
      
var frmReferenceCategoryDescriptionBuffer = document.getElementById("frmReferenceCategoryDescription").value;
      
var frmReferenceCreateUpdateRefTypeBuffer = null;
    
var frmReferenceCreateUpdateRefDescBuffer = null;
    
var frmReferenceCreateUpdateParentIdBuffer = null;
    
var frmReferenceCreateUpdateRefIndexBuffer = null;
    
var frmReferenceCreateUpdateDescriptionBuffer = null;
    

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
		var feedbackMessage = document.getElementById('frmReferenceCategoryLoadedFeedbackMessage').value
		var feedbackCss = document.getElementById('frmReferenceCategoryLoadedFeedbackCss').value
	
		if (feedbackMessage != "" && feedbackCss != ""){
			writeAlert(feedbackMessage, feedbackCss, 5000);
		}
	}
	catch (ex){
		// Do nothing
	}
	
	var mainFormObjectId = document.getElementById("frmReferenceCategoryReferenceCategoryId").value;
	// focus on the first input capable of receiving focus.
	checkFocus(document.getElementById("frmReferenceCategory"));



	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.autoclose = true;
	$('.datepicker').datepicker();

	$('.datepicker').on('show.bs.modal', function (event) {
	    event.stopPropagation();
	});
	



	if (displayTextAreaCount){
		
		// Display a count of the characters in the Long Description textarea input
		$('#frmReferenceCategoryDescriptionCountBlock').text($('#frmReferenceCategoryDescription').val().length.toString().concat('/').concat('200'));
  
		registerTextareaCount();
	}

	if (validateOnKeyEvents){
		registerKeyEventListeners();
	}


	var referencesTableBody = document.getElementById("referencesTableBody");
	
	if (mainFormObjectId.length > 0){
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/referencecategory/references/list",
			data: {
			id: mainFormObjectId
			},
			success: function( data ) {
				$.each(data, function(idx, obj) {
					var row = document.createElement("tr");
					var cell = document.createElement("td");
					var editModalAnchorText = "<a href='#' class='btn btn-info btn-sm' data-toggle='modal' data-backdrop='static' data-target='#referenceCreateUpdateModal' data-id='" + obj.id + "' data-modal-title='Add Reference' data-callback-table-body-id='referencesTableBody' data-property-url='references' data-callback-display-type='table' aria-label='view'><span class='glyphicon glyphicon-edit'></a>";
					var editAnchorURI = rootContext + "/reference/" + obj.id + "/update";
					var editAnchorText = "<a href='" + editAnchorURI + "' class='btn btn-primary btn-sm' aria-label='view'><span class='glyphicon glyphicon-pencil'></a>";
					cell.innerHTML = "<div class='btn-group-vertical' role='group'>" + editModalAnchorText + editAnchorText + "</div>";
					row.appendChild(cell);
					
								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.refType);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.refDesc);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.description);
								cell.appendChild(cellText);
								row.appendChild(cell);
					referencesTableBody.appendChild(row);
				});
			}
		});
	}


		var frmReferenceCreateUpdateLaddaSubmitButtonHandler = null;
		

		$('#referenceCreateUpdateModal').modal('handleUpdate');
		
		$('#referenceCreateUpdateModal').on('show.bs.modal', function (event) {
  			var button = $(event.relatedTarget); // Button that triggered the modal
  			var id = button.data('id'); // Extract info from data-* attributes
  			var modalTitle = button.data('modal-title');
  			var callBackDisplayType = button.data('callback-display-type');
  			var callBackTableId = button.data('callback-table-body-id');
  			var propertyUrl = button.data('property-url');

  			var modal = $(this);
  			modal.find('.modal-title').text(modalTitle);
  			modal.find('#frmReferenceCreateUpdateLoadedObjectId').val(id);
  			modal.find('#frmReferenceCreateUpdateParentObjectId').val(mainFormObjectId);
  			modal.find('#frmReferenceCreateUpdateCallBackDisplayType').val(callBackDisplayType);
  			modal.find('#frmReferenceCreateUpdateCallBackTableBodyId').val(callBackTableId);
  			modal.find('#frmReferenceCreateUpdatePropertyUrl').val(propertyUrl);
  			
		
			if (mainFormObjectId == ''){
				var invalidParentIdMessage = button.data('invalid-parent-id-message'); // Extract info from data-* attributes
				$('#referenceCreateUpdateModal').find('.modal-body').html('<p>' + invalidParentIdMessage + '</p>');
				$("#frmReferenceCreateUpdateSubmitButton").hide();
				return;
			}
			
			if (frmReferenceCreateUpdateLaddaSubmitButtonHandler == null){
				frmReferenceCreateUpdateLaddaSubmitButtonHandler = Ladda.create(document.querySelector("#frmReferenceCreateUpdateSubmitButton"));
			}
			
			frmReferenceCreateUpdateLaddaSubmitButtonHandler.start();

   			

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
				url: rootContext + "/restful/reference",
				data: {
					id: id
				},
				success: function( data ) {
					
					//modal.find('#frmReferenceCreateUpdateRefType').focus();
  
					modal.find('#frmReferenceCreateUpdateRefType').val(data.refType);
					frmReferenceCreateUpdateRefTypeBuffer = data.refType;
    
					modal.find('#frmReferenceCreateUpdateRefDesc').val(data.refDesc);
					frmReferenceCreateUpdateRefDescBuffer = data.refDesc;
    
					modal.find('#frmReferenceCreateUpdateParentId').val(data.parentId);
					frmReferenceCreateUpdateParentIdBuffer = data.parentId;
    
					modal.find('#frmReferenceCreateUpdateRefIndex').val(data.refIndex);
					frmReferenceCreateUpdateRefIndexBuffer = data.refIndex;
    
					modal.find('#frmReferenceCreateUpdateDescription').val(data.description);
					frmReferenceCreateUpdateDescriptionBuffer = data.description;
    
					// Display a count of the characters in the Long Description textarea input
					$('#frmReferenceCreateUpdateDescriptionCountBlock').text($('#frmReferenceCreateUpdateDescription').val().length.toString().concat('/').concat('200'));
    
    
				}
			});
		}

		
					// Display a count of the characters in the Long Description textarea input
					$('#frmReferenceCreateUpdateDescriptionCountBlock').text($('#frmReferenceCreateUpdateDescription').val().length.toString().concat('/').concat('200'));
    
    
		});	
		
		$('#referenceCreateUpdateModal').on('shown.bs.modal', function (event) {
			if (frmReferenceCreateUpdateLaddaSubmitButtonHandler != null){
				frmReferenceCreateUpdateLaddaSubmitButtonHandler.stop();
			}
			$('#frmReferenceCreateUpdateRefType').focus()
		});	
		
		
			
		
		
		
		$("#frmReferenceCreateUpdateSubmitButton").click(function( event ) {
			frmReferenceCreateUpdateLaddaSubmitButtonHandler.start();
			var validationSuccess = true;
			var mode = null;
			var modal = $('#referenceCreateUpdateModal');
			var modalTitle = modal.find('#frmReferenceCreateUpdateTitle').val();
			var callBackDisplayType = modal.find('#frmReferenceCreateUpdateCallBackDisplayType').val();
			
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
        		frmReferenceCreateUpdateLaddaSubmitButtonHandler.stop();
        		return false;
        	}
			

			if (modal.find('#frmReferenceCreateUpdateLoadedObjectId').val().length > 0){
				mode = "update";
			}
			else{
				mode="new";
			}


			
			
			var reference = {
				parentObjectId : modal.find('#frmReferenceCreateUpdateParentObjectId').val(),
				id : modal.find('#frmReferenceCreateUpdateLoadedObjectId').val(),
				refType : modal.find('#frmReferenceCreateUpdateRefType').val(),
				refDesc : modal.find('#frmReferenceCreateUpdateRefDesc').val(),
				parentId : modal.find('#frmReferenceCreateUpdateParentId').val(),
				refIndex : modal.find('#frmReferenceCreateUpdateRefIndex').val(),
				description : modal.find('#frmReferenceCreateUpdateDescription').val()
			};
			
			var propertyUrl = modal.find('#frmReferenceCreateUpdatePropertyUrl').val();
			var url = rootContext + "/restful/referencecategory/" + propertyUrl + "/" + mode;
			
			$.ajax({
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				method: "post",
				url: url,
				data: JSON.stringify(reference),
				success: function( data ) {
					if ( ($('#frmReferenceCategoryMode').val() == 'ADD') || ($('#frmReferenceCategoryMode').val() == 'UPDATE')){
						if (callBackDisplayType == "table"){
							var new_tbody = document.createElement('tbody');
							var callBackTableBodyId = modal.find('#frmReferenceCreateUpdateCallBackTableBodyId').val();
							var callBackTableBody = document.getElementById(callBackTableBodyId);
						
							$.each(data, function(idx, obj) {
								var row = document.createElement("tr");
								var cell = document.createElement("td");
								var editModalAnchorText = "<a href='#' class='btn btn-info btn-sm' data-toggle='modal' data-backdrop='static' data-target='#referenceCreateUpdateModal' data-id='" + obj.id + "' data-modal-title='" + modalTitle + "' data-callback-table-body-id='" + callBackTableBodyId + "' data-property-url='references' data-callback-display-type='table' aria-label='view'><span class='glyphicon glyphicon-edit'></a>";
								var editAnchorURI = rootContext + "/reference/" + obj.id + "/update";
								var editAnchorText = "<a href='" + editAnchorURI + "' class='btn btn-primary btn-sm' aria-label='view'><span class='glyphicon glyphicon-pencil'></a>";
								cell.innerHTML = "<div class='btn-group-vertical' role='group'>" + editModalAnchorText + editAnchorText + "</div>";
								row.appendChild(cell);
								
								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.refType);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.refDesc);
								cell.appendChild(cellText);
								row.appendChild(cell);

								var cell = document.createElement("td");
								var cellText = document.createTextNode(obj.description);
								cell.appendChild(cellText);
								row.appendChild(cell);

								new_tbody.appendChild(row);
							});
						
							callBackTableBody.parentNode.replaceChild(new_tbody, callBackTableBody);
							new_tbody.id = callBackTableBodyId;
						}
						else if (callBackDisplayType == "inline"){
							$.each(data, function(idx, obj) {
								
								document.getElementById("frmReferenceRefTypeMessage").innerHTML = obj.refType;

								document.getElementById("frmReferenceRefDescMessage").innerHTML = obj.refDesc;

								document.getElementById("frmReferenceDescriptionMessage").innerHTML = obj.description;

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


		$("#frmReferenceCreateUpdateCloseButton").click(function( event ) {
			var mode = null;
			var modal = $('#referenceCreateUpdateModal');
			var callBackTableBodyId = modal.find('#frmReferenceCreateUpdateCallBackTableBodyId').val();
			var callBackTableBody = document.getElementById(callBackTableBodyId);
			var modalTitle = modal.find('#frmReferenceCreateUpdateTitle').val();
	

			modal.modal('hide');
		});

			


if ($('#frmReferenceCategoryMode').val() == 'LOCALIZE'){
	$('#existingLocale').change(function () {
		var selectedLocale = $('#existingLocale option:selected').val();
		$.ajax({
			dataType: "json",
			url: rootContext + "/restful/view/messageresource/list",
			data: {
			id: $('#frmReferenceCategoryReferenceCategoryViewId').val()
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
			id: $('#frmReferenceCategoryReferenceCategoryViewId').val()
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
} // end if ($('#frmReferenceCategoryMode').val() == 'LOCALIZE')

});


	/**
	 * Called when the exitButton is clicked
	 */
	function frmReferenceCategoryExitButtonClicked(){
		var changedCounter = 0;
		var returnValue = false;
		var focusSet = false;
		var focusControl;
	
		if (document.getElementById("frmReferenceCategoryReferenceCategoryDesc").value != frmReferenceCategoryReferenceCategoryDescBuffer){
			document.getElementById("frmReferenceCategoryReferenceCategoryDescFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategoryReferenceCategoryDescHelpBlock"), "Previous Value: " + frmReferenceCategoryReferenceCategoryDescBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategoryReferenceCategoryDesc");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceCategoryParentCategoryId").value != frmReferenceCategoryParentCategoryIdBuffer){
			document.getElementById("frmReferenceCategoryParentCategoryIdFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategoryParentCategoryIdHelpBlock"), "Previous Value: " + frmReferenceCategoryParentCategoryIdBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategoryParentCategoryId");
				focusSet = true;
			}
			changedCounter++;
		}
	
		if (document.getElementById("frmReferenceCategoryDescription").value != frmReferenceCategoryDescriptionBuffer){
			document.getElementById("frmReferenceCategoryDescriptionFormGroup").className += " has-error";
			replaceText(document.getElementById("frmReferenceCategoryDescriptionHelpBlock"), "Previous Value: " + frmReferenceCategoryDescriptionBuffer);
			
			if (focusSet == false){
				focusControl = document.getElementById("frmReferenceCategoryDescription");
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
                		document.getElementById("frmReferenceCategory").method = "get";
                    	document.getElementById("frmReferenceCategory").submit();
                	}else {
                    	returnValue = false;
                	}
            	}
			});
	  
		}
		else{
			document.getElementById("frmReferenceCategory").method = "get";
			document.getElementById("frmReferenceCategory").submit();
		}
		
		if (focusSet == true){
			focusControl.focus();
		}
		
  		return returnValue;
	}

