package com.netgrains.json;

import com.netgrains.json.JsonDateSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.datatype.hibernate3.Hibernate3Module;

import java.text.SimpleDateFormat;
import java.util.Date;
 
public class HibernateAwareObjectMapper extends ObjectMapper {
 
	private static final long serialVersionUID = 1L;

	public HibernateAwareObjectMapper() {
		configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        Hibernate3Module hm = new Hibernate3Module();
        registerModule(hm);

        //The date format to map dates to domain objects as set in ApplicationDef.xml
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    setDateFormat(dateFormat);
        
        final SimpleModule module = new SimpleModule();
        
        module.addSerializer(Date.class, new JsonDateSerializer(Date.class));
        registerModule(module);        
        
    }
}
