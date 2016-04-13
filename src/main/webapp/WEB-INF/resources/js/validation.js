function addStyleClass(displayContainer, errorStyle){
	displayContainer.className = displayContainer.className.concat(" ").concat(errorStyle);
}

function removeStyleClass(displayContainer, style){
	var re = new RegExp(style, 'g');
	str = displayContainer.className.replace(re, '');
	displayContainer.className = str;
}

/**
 * Checks the number of characters entered into a textarea against the maximum number of characters allowed and
 * displays feedback to the user.
 * @param length The maximum number of digits that are allowed in the textarea
 * @param control A reference to the control to be checked.
 * @param displayArea A reference to the area element where the feedback should be displayed
 */

 function check_textarea_length(length, control, displayArea)
 {
	 var allowedChars = "/".concat(length.toString());
	 
	 replaceText(displayArea, control.value.length.toString().concat(allowedChars));
	 
	 return;
 }
 
 
 /**
  * Trap a keyPress event and validate a character is valid in an Integer. This method can be called on the onkeypress
  * event of an input using onkeypress="return checkIntegerKeyPress(event, this)".
  * @param eventObj the event object that was triggered by the keypress
  * @param obj the input where the keypress occurred     
  */
 function checkIntegerKeyPress(eventObj, obj)
 {
   var keyCode;

   if(window.event) // IE
   {
  	 keyCode = eventObj.keyCode;
   }
   else if(eventObj.which) // Netscape/Firefox/Opera
   {
  	 keyCode = eventObj.which;
   }

   // 32 = ' '     (' ' is the first alphanumeric character in the ascii codeset)
   // 126 = '~'    ('~' is the last  alphanumeric character in the ascii codeset)
   // let all non-alphanumeric key through
   if ( keyCode < 32 || keyCode > 126 )
   {
       return true;
   }


   if((keyCode < 48 || keyCode > 57))
   {
     // Allow only int
     return false;
   }

   return true;
 }

 /**
  * Trap a keyPress event and validate a character is valid in an Integer. This method can be called on the onkeypress
  * event of an input using onkeypress="return checkIntegerKeyPress(event, this)".
  * @param eventObj the event object that was triggered by the keypress
  * @param obj the input where the keypress occurred
  * @param errorMessage an error message to be displayed.     
  * @param errorDisplayLocation a reference to the location where the errorMessage parameter should be displayed.
  */
 function checkIntegerOrPhoneKeyPress(eventObj, obj, isTelephone)
 {
   var keyCode;

   if(window.event) // IE
   {
  	 keyCode = eventObj.keyCode;
   }
   else if(eventObj.which) // Netscape/Firefox/Opera
   {
  	 keyCode = eventObj.which;
   }
   
   // 32 = ' '     (' ' is the first alphanumeric character in the ascii codeset)
   // 126 = '~'    ('~' is the last  alphanumeric character in the ascii codeset)
   // let all non-alphanumeric key through
   if ( keyCode < 32 || keyCode > 126 )
   {
       return true;
   }
   
   if((keyCode < 48 || keyCode > 57))
   {
	 if (isTelephone){
		// Allow the + character at the start of the text
		 
		 // 43 = '+' character
		 if (keyCode == 43){
			 var str = obj.val();
	          if (str.indexOf("+") != -1)
	          {
	        		     return false;
	          }
	          else if (getCursorPosition(obj) != 0){
    		     return false;
	          }
			 
			   // Clear any existing error message
			   return true;
		 }
	 }
     // Allow only int
     return false;
   }

   return true;
 } 

  
  /**
   * Trap a keyPress event and validate a character is valid in a Float.
   * This function can be used to stop the user from entering a character other than
   * a digit or a period(.) into an input field.
   * usage:  onKeyPress="return checkFloatKeyPress(event, this)" 
   * @param eventObj the keypress event passed in the above usage example
   * @param obj the input receiving the keypress event as shown in the above usage example
   */
  function checkFloatKeyPress(eventObj, obj)
  {
      var keyCode;

      if(window.event) // IE
      {
     	 keyCode = eventObj.keyCode;
      }
      else if(eventObj.which) // Netscape/Firefox/Opera
      {
     	 keyCode = eventObj.which;
      }
      
      var str = obj.value;

      if(keyCode==46)
      {
          if (str.indexOf(".") != -1)
          {
              return false;
          }
      }

      // Do not allow the euro symbol either.
 	 if ( keyCode == 8364)
      {
          return false;
      }
      
      // 32 = ' '     (' ' is the first alphanumeric character in the ascii codeset)
      // 126 = '~'    ('~' is the last  alphanumeric character in the ascii codeset)
      // let all non-alphanumeric key through
      if ( keyCode < 32 || keyCode > 126 )
      {
          return true;
      }


      // 46 = '.'
      // 48 = '0'
      // 57 = '9'
      // if key is neither numeric nor '.'
      if((keyCode <48 || keyCode > 57)   &&   (keyCode != 46))
      {
          // Allow only integers and decimal points
          return false;
      }
      
 	    return true;
  } 
 
  
  /**
   * Trap a keyPress event and validate a character is valid in a Float.
   * This function can be used to stop the user from entering a character other than
   * a digit or a period(.) into an input field.
   * usage:  onKeyPress="return checkFloatKeyPress(event, this)" 
   * @param eventObj the keypress event passed in the above usage example
   * @param obj the input receiving the keypress event as shown in the above usage example
   * @param errorMessage an error message to be displayed.     
   * @param errorDisplayLocation a reference to the location where the errorMessage parameter should be displayed.
   */
  function checkFloatKeyPressAndRenderErrorMessage(eventObj, obj, errorDisplayLocation, errorDisplayContainer, errorMessage, errorStyle, validMessage, restrictScale)
  {
      var keyCode;

      if(window.event) // IE
      {
     	 keyCode = eventObj.keyCode;
      }
      else if(eventObj.which) // Netscape/Firefox/Opera
      {
     	 keyCode = eventObj.which;
      }
      
      var str = obj.value;

      if(keyCode==46)
      {
          if (str.indexOf(".") != -1)
          {   // There is already a . in the existing text 
        	  addStyleClass(errorDisplayContainer, errorStyle);
        	  replaceText( errorDisplayLocation, '. error' );
              return false;
          }
      }

      // Do not allow the euro symbol either.
 	 if ( keyCode == 8364)
      {
		 addStyleClass(errorDisplayContainer, errorStyle);
		 replaceText( errorDisplayLocation, errorMessage );
	     return false;
      }
      
      // 32 = ' '     (' ' is the first alphanumeric character in the ascii codeset)
      // 126 = '~'    ('~' is the last  alphanumeric character in the ascii codeset)
      // let all non-alphanumeric key through
      if ( keyCode < 32 || keyCode > 126 )
      {
    	  removeStyleClass(errorDisplayContainer, errorStyle);
          return true;
      }


      // 46 = '.'
      // 48 = '0'
      // 57 = '9'
      // if key is neither numeric nor '.'
      if((keyCode <48 || keyCode > 57)   &&   (keyCode != 46))
      {
          // Allow only integers and decimal points
			 addStyleClass(errorDisplayContainer, errorStyle);
			 replaceText( errorDisplayLocation, errorMessage );
		     return false;
      }
      
      // Clear any existing error message
      removeStyleClass(errorDisplayContainer, errorStyle);
      return true;
  }
  
  
  
  
/**
 * Trap a paste event and validate that the pasated text is a number.
 * This function can be used to stop the user from pasting a value other than
 * a number into an input field.
 * usage:  onKeyPress="return checkFloatKeyPress(event, this)" 
 * @param eventObj the keypress event passed in the above usage example
 * @param obj the input receiving the keypress event as shown in the above usage example
 * @param errorMessage an error message to be displayed.     
 * @param errorDisplayLocation a reference to the location where the errorMessage parameter should be displayed.
 */
function checkPastedDataIsNumberValidAndRenderErrorMessage(eventObj, obj, errorDisplayLocation, errorMessage, validMessage)
{
	var pastedData = eventObj.clipboardData && eventObj.clipboardData.getData ?
			eventObj.clipboardData.getData('text/plain') :                // Standard
			window.clipboardData && window.clipboardData.getData ?
			window.clipboardData.getData('Text') :                 // MS
			false;
		    
	if(pastedData) {
		if (isNaN(pastedData)){
			replaceText( errorDisplayLocation, errorMessage );    	  
			return false;
		}
	}
	  
	return true;
}



/**
 * Returns the caret (cursor) position of the specified text field.
 * Return value range is 0-oField.value.length.
 */
function getCursorPosition (oField) {

  // Initialize
  var iCaretPos = 0;

  // IE Support
  if (document.selection) {
		alert('ie');
    // Set focus on the element
    oField.focus();

    // To get cursor position, get empty selection range
    var oSel = document.selection.createRange();

    // Move selection start to 0 position
    oSel.moveStart('character', -oField.value.length);

    // The caret position is selection length
    iCaretPos = oSel.text.length;
  }

  // Firefox support
  else if (oField.selectionStart || oField.selectionStart == '0')
  {	alert('firefox');
    iCaretPos = oField.selectionStart;
  }

  // Return results
  alert(iCaretPos);
  return iCaretPos;
}

