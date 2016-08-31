package org.volunteertech.pledges.geolocation;

import com.google.maps.model.LatLng;
import org.volunteertech.pledges.address.dao.Address;

public interface IGeocodingService {
	
	public LatLng getLatitudeAndLongitude(Address address);

}
