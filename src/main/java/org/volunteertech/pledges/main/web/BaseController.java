package org.volunteertech.pledges.main.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.dao.MessageResourceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * The Spring BaseController handling for the project
 * <p>
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <p>
 *
 * @author Michael O'Connor
 * @version $Revision$
 *          Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">>JavaDoc Documentation</a>
 * Change Log
 * ----------
 * $Log$
 */
@Controller
public class BaseController {
    final Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * Date Conversion Property Editor
     */
    @InitBinder
    private void dateBinder(WebDataBinder binder) {
        //The date format to parse or output your dates as set in ApplicationDef.xml
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        //Create a new CustomDateEditor
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        //Register it as custom editor for the Date type
        binder.registerCustomEditor(Date.class, editor);
    }


    protected MessageResource populateMessageResource(String messageKey, String locale, Long localeReferenceId,
            String message) {
        MessageResource messageResource = new MessageResourceImpl();
        messageResource.setMessageKey(messageKey);
        messageResource.setLocale(locale);
        messageResource.setLocaleReferenceId(localeReferenceId);
        messageResource.setMessage(message);


        return messageResource;

    }

}
