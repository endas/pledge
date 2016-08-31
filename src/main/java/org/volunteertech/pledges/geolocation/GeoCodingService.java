package org.volunteertech.pledges.geolocation;

import com.google.maps.GeoApiContext;
import com.google.maps.model.GeocodingResult;
import com.google.maps.GeocodingApi;

public class GeoCodingService {
	
	
	public void getAddressCoordinates(){
		
		GeoApiContext context = new GeoApiContext().setApiKey("AIzaSyDS9MEtAEdfstGGB48mr5v3qZMY1D-XQ2s");
		try {
			GeocodingResult[] results =  GeocodingApi.geocode(context, "1600 Amphitheatre Parkway Mountain View, CA 94043").await();
			System.out.println(results[0].geometry.location);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
