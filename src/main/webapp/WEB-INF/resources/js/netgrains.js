
/**
 * Returns the text of the selected option in a select box
 * @param input an input of type select
 */
function getSelectedText(input){
	var selectedText = null;
	
	try{
		selectedText = input[input.selectedIndex].text;
	}
	catch(ex){
		// Do nothing
	}
	
	return selectedText;
}

/**
 * Replaces the text in a span or div with the text passed as parameter. Use this function as opposed
 * to directly inserting HTML into the DOM in order to avoid hacking attacks.
 * @param el the id of a span or div
 * @param str the text to place inside the span ir div
 */
function replaceText( el, str ) {
	if (el != null){
		el.textContent ? el.textContent = str : el.innerText = str;
	}
}


/**
 * Checks the form passed as parameter for the first focusable control on that form
 * and focuses on it. Useful for onLoad call
 */
function checkFocus(form)
{
	
	for (var i=0; i < form.elements.length; i++)
	{

		if (form.elements[i].type != "hidden")
		{
			if (form.elements[i].disabled == false)
			form.elements[i].focus();
			break;
		}
	}
	return;
}



/**
 * Load the contents of a child select when a parentSelect changes
 * @param parentSelect a reference to the parent select input object
 * @param childSelect a reference to the child select input object
 * @param selectedValue the value that should be selected in the child select input after it is rendered
 * @param referenceType the referenceType of the child select input
 * @param unselectedText the text of the first option in the select, the text displayed when no option is selected.
 */
function loadChildSelectAndSelectValue(parentSelect, childSelect, selectedValue, referenceType, unselectedText){
	childSelect.options.selectedIndex = 0;
	var parentSelectValue = null;
	
	try{
		parentSelectValue = parentSelect.options[parentSelect.selectedIndex].value;
	}
	catch(ex){
		parentSelectValue= -1;
	}
	
	removeSelectOptions(childSelect);
	var formGroupId = childSelect.id.concat('FormGroup');

	$.ajax({
		dataType: "json",
		method: "GET",
		url: rootContext + "/restful/referenceslistbyparent",
		data: {
		parentId: parentSelectValue,
		referenceType: referenceType
		},
		success: function( data ) {
			$('#' + formGroupId).collapse('show');

			$.each( data, function( key, val ) {
				var el = document.createElement("option");
				el.textContent = val;
				el.value = key;
				
				if (key == selectedValue){
					el.selected = true;
				}

				childSelect.appendChild(el);
			});
		},
		error: function( data ){
			$('#' + formGroupId).collapse('hide');
			
		}
	});
}

function removeSelectOptions(selectbox)
{
    var i;
    for(i=selectbox.options.length-1;i >=0;i--)
    {
        selectbox.remove(i);
    }
}

/**
 * Show a bootstrap alert that will be displayed for five seconds
 * Example of useage: showalert(feedbackAlertBlockId, feedbackAlertBlockTextId, 'Please enter a value for ' + $(this).data('display-name'), 'alert-danger')
 */
function showalert(containerId, containerTextId, message, alerttype) {
	$(containerId).toggleClass(alerttype, true);
	$(containerId).toggleClass("hidden", false);
	$(containerTextId).text(message);
	
	setTimeout(function() { // this will automatically close the alert and remove this if the users does not close it in 5 secs
		$(containerId).toggleClass(alerttype, false);
		$(containerId).toggleClass("hidden", true);
	}, 5000);
}

/**
 * Calls the hidden logout form declared in footer.jsp allowing a POST logout action to logout where csrf tokens are used.
 */
function logoutFormSubmit() {
	document.getElementById("logoutForm").submit();
}

/**
 * Displays a bootstrap floating alert to provide feedback to the user.
 * @param displayMessage the message to be displayed inside the floating alert.
 * @param mode one of the bootstrap alert types: alert-success, alert-info, alert-warning, alert-danger.
 * @param delayTime the time in milliseconds that the alert will be visible before closing automatically. If the delayTime
 * is passed as null then the alert will be displayed until dismissed by the user
 */
function writeAlert(displayMessage, mode, delayTime){
	var message = $('<div class="alert ' + mode + ' floating-message-top">');
	// a close button
	var closeButton = $('<button type="button" class="close" data-dismiss="alert">&times</button>');
	message.append(closeButton); // adding the close button to the message
	message.append(displayMessage);
	var closeDiv = $('</div>');
	message.append(closeDiv); // adding the close button to the message
	// add the message element to the body, fadein, wait delayTime, fadeout
	message.appendTo($('body')).fadeIn(300).delay(delayTime).fadeOut(500);

}



function writeAlertCentred(displayMessage, mode, delayTime){
	var message = $('<div class="alert ' + mode + ' floating-message-center">');
	// a close button
	var closeButton = $('<button type="button" class="close" data-dismiss="alert">&times</button>');
	message.append(closeButton); // adding the close button to the message
	message.append(displayMessage);
	var closeDiv = $('</div>');
	message.append(closeDiv); // adding the close button to the message
	// add the message element to the body, fadein, wait delayTime, fadeout
	message.appendTo($('body')).fadeIn(300).delay(delayTime).fadeOut(500);

}


/**
 * Given the id of a div as parameter, usually with class .row, this function will resize all of the
 * descendant divs with class panel-body to be the height of the tallest div with class .panel-body.
 * Useful for re-sizing the divs with class .panel-body of panels in a div with class .row 
 * @param rowId the id of the containg .row element as a String
 */
function resizePanelsInGridRow(rowId){
	var tallest = 0;
	var children = $('#' + rowId).find('div.panel-body');

	children.each(function() {
		if ($(this).height() > tallest){
			tallest = $(this).height(); 
		}
	});

	children.each(function() {
		$(this).height(tallest);
	});
}

/**
 * Registers a listener on textarea type inputs so that a character count of the current number of entered and maximum allowed
 * characters are displayed to the user as they type.
 */
function registerTextareaCount(){
	$('textarea').keyup(function(event) {
    	var feedbackCountBlockId = ('#').concat($(this).attr('id')).concat('CountBlock');
		var charCount = $(this).val().length;
		var maxLength = $(this).attr('maxlength');		
		
		$(feedbackCountBlockId).text(charCount.toString().concat('/').concat(maxLength));
	});
}


/**
 * The realtime javascript validation listeners are registered here. editing this function will affect the form handling for all forms across
 * the entire application.
 */
function registerKeyEventListeners(){

	$('.datepicker').on('changeDate', function (event) {
		onKeyDownFeedbackSet = false;
		
		var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    	var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    	var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
    	
		if (onKeyDownFeedbackSet == false){
			//$(feedbackHelpBlockId).text('');
	    	$(containerId).toggleClass('has-warning', false);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-warning-sign', false);
	    	$(containerId).toggleClass('has-error', false);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-remove', false);
    		$(containerId).toggleClass('has-success', true);
    		$(feedbackIconContainerId).toggleClass('glyphicon-ok', true);
		}
		else{
	    	$(containerId).toggleClass('has-warning', true);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-warning-sign', true);
		}

    	return true;
	});

	$('input[type=text], [type=tel], [type=email], textarea').keydown(function(event) {
		onKeyDownFeedbackSet = false;

    	var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    	var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    	var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
    	
    	$(containerId).toggleClass('has-error', false);
    	$(feedbackIconContainerId).toggleClass('glyphicon-remove', false);
		var charsAdded = ((event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16) ? -1 : +1);
		var minLength = $(this).data('minlength');
		var charCount = parseInt($(this).val().length + charsAdded);
		var isRequired = (($(this).data('required') == true) ? true : false);
		var minLength = $(this).data('minlength');
		var maxLength = $(this).attr('maxlength');
		
    	
		if (parseInt($(this).val().length + charsAdded) > maxLength){
			onKeyDownFeedbackSet = true;
	    	$(feedbackHelpBlockId).text('Please enter no more than ' + $(this).attr('maxlength') + ' characters');
	    	return false;
		}
		
    	return true;
	});
	


	$('input[type=text], [type=tel], [type=email]').keypress(function(event) {
    	var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    	var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    	var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');

		if (  (($(this).data('data-type') == 'long') && (($(this).data('validate-key-press') == true)) )  ){
			var isTelephoneNumber = (($(this).attr('type') == 'tel') ? true : false);
			if (checkIntegerOrPhoneKeyPress(event, $(this), isTelephoneNumber) == false){
				onKeyDownFeedbackSet = true;
				var alertMessage = ((isTelephoneNumber) ? 'The ' + $(this).data('display-name') + ' can only accept an optional + character followed by the digits 0-9' : 'The '  + $(this).data('display-name') + ' can only accept digits 0-9');
    	    	$(feedbackHelpBlockId).text(alertMessage);
    	    	return false;
				
			}
		}


    	return true;
	});

	$('input[type=text], [type=tel], [type=email], textarea').keyup(function(event) {
    	
    	var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    	var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    	var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
    	var feedbackCountBlockId = ('#').concat($(this).attr('id')).concat('CountBlock');
    	
		var isRequired = (($(this).data('required') == true) ? true : false);
		var minLength = $(this).data('minlength');
    	
	
		var charCount = $(this).val().length;
		var maxLength = $(this).attr('maxlength');		
		
		
		if (($(this).data('validate-key-press') == true)){
			if (  ((isRequired && charCount < minLength) || (!isRequired && charCount > 0 && charCount < minLength)) && (onKeyDownFeedbackSet == false)   ){
				onKeyDownFeedbackSet = true;
	    		$(containerId).toggleClass('has-warning', true);
	    		$(feedbackIconContainerId).toggleClass('glyphicon-warning-sign', true);
	    		if (isRequired){
	    			$(feedbackHelpBlockId).text($(this).data('display-name') + ' must be a minimum of ' + minLength + ' characters');
	    		}
	    		else{
	    			$(feedbackHelpBlockId).text($(this).data('display-name') + ' is optional but if you do provide this information, please enter a minimum of ' + minLength + ' characters');
	    		}
	    	
	    		return true;
			}
		}
		
		
		if (onKeyDownFeedbackSet == false){
			$(feedbackHelpBlockId).text('');
	    	$(containerId).toggleClass('has-warning', false);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-warning-sign', false);
    		$(containerId).toggleClass('has-success', true);
    		$(feedbackIconContainerId).toggleClass('glyphicon-ok', true);
		}
		else{
	    	$(containerId).toggleClass('has-warning', true);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-warning-sign', true);
		}

    	return true;
	});


	$('select').change(function () {
    	var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    	var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    	var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
    	
    	var isRequired = (($(this).data('required') == true) ? true : false);
    	
    	$(feedbackHelpBlockId).text('');
    	$(containerId).toggleClass('has-error', false);
    	$(feedbackIconContainerId).toggleClass('glyphicon-remove', false);
    	
		var optionSelected = $(this).find("option:selected");
		var valueSelected  = optionSelected.val();
		var textSelected   = optionSelected.text();

		if (isRequired && valueSelected == -1){
    		$(containerId).toggleClass('has-success', false);
    		$(feedbackIconContainerId).toggleClass('glyphicon-ok', false);
    		$(feedbackHelpBlockId).text('Please select a value for ' + $(this).data('display-name'));
    		
	    	$(containerId).toggleClass('has-error', true);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-remove', true);
		}
		else {
	    	$(feedbackHelpBlockId).text('');
	    	$(containerId).toggleClass('has-error', false);
	    	$(feedbackIconContainerId).toggleClass('glyphicon-remove', false);
    		$(containerId).toggleClass('has-success', true);
    		$(feedbackIconContainerId).toggleClass('glyphicon-ok', true);
		}

    	return true;
	});


	$('input[type=checkbox][aria-describedby]').click(function () {
    	var containerId = ('#').concat($(this).attr('id')).concat('FormGroup');
    	var feedbackIconContainerId = ('#').concat($(this).attr('id')).concat('FeedbackIcon');
    	var feedbackHelpBlockId = ('#').concat($(this).attr('id')).concat('HelpBlock');
    	
    	$(feedbackHelpBlockId).text('');
    	$(containerId).toggleClass('has-error', false);

		if ($(this).data('required') == true){
    		if ($(this).is(':checkbox') && !$(this).is(':checked')){
		    	$(feedbackHelpBlockId).text('Please check the ' + $(this).data('display-name') + ' checkbox');
    			$(containerId).toggleClass('has-error', true);
    		}
    		else{
		    	$(feedbackHelpBlockId).text('');
    			$(containerId).toggleClass('has-success', true);
    		}
    	}else{
	    	$(feedbackHelpBlockId).text('');
    		$(containerId).toggleClass('has-success', true);
    	}

    	return true;
	});
}

