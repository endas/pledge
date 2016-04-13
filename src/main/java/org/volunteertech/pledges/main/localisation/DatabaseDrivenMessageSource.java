package org.volunteertech.pledges.main.localisation;

import org.volunteertech.pledges.localisation.dao.MessageResourceDao;
import org.volunteertech.pledges.localisation.dao.MessageResource;
import org.volunteertech.pledges.localisation.dao.MessageResourceImpl;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.context.ResourceLoaderAware;  
import org.springframework.context.support.AbstractMessageSource;  
import org.springframework.core.io.DefaultResourceLoader;  
import org.springframework.core.io.ResourceLoader;

import java.text.MessageFormat;  
import java.util.HashMap;  
import java.util.List;  
import java.util.Locale;  
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The DatabaseDrivenMessage source to handle database driven localisation 
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">>JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public class DatabaseDrivenMessageSource extends AbstractMessageSource implements ResourceLoaderAware {

    final Logger logger = LoggerFactory.getLogger(DatabaseDrivenMessageSource.class);
    
    private ResourceLoader resourceLoader;

    private final Map<String, Map<String, String>> properties = new HashMap<String, Map<String, String>>();

    @Autowired
    private MessageResourceDao messageResourceDao;

    public DatabaseDrivenMessageSource() {
        reload();
    }

    public DatabaseDrivenMessageSource(MessageResourceDao messageResourceDao) {
        this.messageResourceDao = messageResourceDao;
        reload();
    }

    @Override
    protected MessageFormat resolveCode(String code, Locale locale) {
        String msg = getText(code, locale);
        MessageFormat result = createMessageFormat(msg, locale);
        return result;
    }

    @Override
    protected String resolveCodeWithoutArguments(String code, Locale locale) {
        return getText(code, locale);
    }

    private String getText(String code, Locale locale) {
    	logger.debug("reconcile code: " + code);
    	logger.debug("Locale: " + locale.toString());
        Map<String, String> localized = properties.get(code);
        String textForCurrentLanguage = null;
        if (localized != null) {
            textForCurrentLanguage = localized.get(locale.getLanguage());
            if (textForCurrentLanguage == null) {
                textForCurrentLanguage = localized.get(Locale.UK.getLanguage());
            }
        }
        if (textForCurrentLanguage==null) {
            //Check parent message
            logger.debug("Fallback to properties message");
            try {
                textForCurrentLanguage = getParentMessageSource().getMessage(code, null, locale);
            } catch (Exception e) {
                logger.error("Cannot find message with code: " + code);
            }
        }
        return textForCurrentLanguage != null ? textForCurrentLanguage : code;
    }

    public void reload() {
        properties.clear();
        properties.putAll(loadTexts());
    }

    protected Map<String, Map<String, String>> loadTexts() {
        logger.debug("loadTexts");
        Map<String, Map<String, String>> m = new HashMap<String, Map<String, String>>();
        List<MessageResource> texts = messageResourceDao.listMessageResource();
        for (MessageResource text : texts) {
            Map<String, String> v = new HashMap<String, String>();
            
            if (m.get(text.getMessageKey()) != null){
            	v = m.get(text.getMessageKey());
            }
            else{
            	m.put(text.getMessageKey(), v);
            }
            
            v.put(text.getLocale(), text.getMessage());
        }
        return m;
    }
    
    public void updateTexts(List<MessageResource> messageResourceList, Long userId) {
        logger.debug("updateTexts");
         
        
        for (MessageResource messageResource : messageResourceList) {
        	Map<String, String> messageMap = null;
        	
        	if (messageResource.getMessageKey() != null && messageResource.getLocale() != null){
	        	if ((messageMap = properties.get(messageResource.getMessageKey())) != null){
					messageMap.put(messageResource.getLocale(), messageResource.getMessage());
					try{
						MessageResource dbMessageResource = messageResourceDao.loadMessageResourceForLocale(messageResource.getMessageKey(), messageResource.getLocale());
						if (dbMessageResource == null){
							dbMessageResource = new MessageResourceImpl();
							dbMessageResource.setLocale(messageResource.getLocale());
							dbMessageResource.setMessageKey(messageResource.getMessageKey());
						}
						
						dbMessageResource.setMessage(messageResource.getMessage());
			
						if(dbMessageResource.isNew()){
		    				this.messageResourceDao.createAndStoreMessageResource(dbMessageResource, userId);
						}else{
		    				this.messageResourceDao.updateMessageResource(dbMessageResource, userId);
						}
					}
					catch(Exception ex){
						logger.error("Saving messageResource: ", ex);
					}
				}
        	}
		}

        return;
    }
    

    @Override
    public void setResourceLoader(ResourceLoader resourceLoader) {
        this.resourceLoader = (resourceLoader != null ? resourceLoader : new DefaultResourceLoader());
    }
}

