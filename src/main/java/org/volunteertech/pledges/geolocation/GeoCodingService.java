package org.volunteertech.pledges.geolocation;

import com.google.maps.GeoApiContext;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;
import com.google.maps.GeocodingApi;

import java.util.StringJoiner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.volunteertech.pledges.address.dao.Address;

public class GeoCodingService implements IGeocodingService {
	final Logger log = LoggerFactory.getLogger(GeoCodingService.class);
	
	
	public LatLng getLatitudeAndLongitude(Address address){
		
		GeoApiContext context = new GeoApiContext().setApiKey("AIzaSyDS9MEtAEdfstGGB48mr5v3qZMY1D-XQ2s");
		try {
			log.info("Getting the Latitude and Longitude for " + address.toString());
			GeocodingResult[] results =  GeocodingApi.geocode(context, getAddressAsString(address)).await();
			if(results.length > 0){
				log.info(results[0].geometry.location.toString());
				return results[0].geometry.location;
			} else{
				log.warn("No Geocoding results return for address " + address);
				return null;
				
			}
						
			
		} catch (Exception e) {
			log.error(e.toString());
		}
		return null;		
		
	}
	
	private String getAddressAsString(Address address){
		StringJoiner joiner = new StringJoiner(" ");
		joiner.add(address.getAddressOne()).add(address.getAddressTwo()).add(address.getCity()).add(address.getCountryReferenceTranslation());
		return joiner.toString();
	}

}
