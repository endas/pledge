package com.netgrains.json;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
/**
 * Custom Date serializer for formatting <code>java.util.Date</code> according to the format specified in ApplicationDef.xml
 * @author Michael O'Connor
 *
 */
public class JsonDateSerializer extends StdSerializer<Date>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private SimpleDateFormat simpleDateFormat;

	JsonDateSerializer(Class<Date> t){
		super(t);
	}

	@Override
	public void serialize(Date date, JsonGenerator jsonGenerator, SerializerProvider provider) throws IOException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String dateString = dateFormat.format(date);
		jsonGenerator.writeString(dateString);
	}
}