/**
 * 
 */
package org.volunteertech.pledges.accommodationpledge.dao;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author Keegan
 */
@Entity
@Table(name = "AMENITY", catalog = "netgrains")
public class Amenity {
	private Long Id;
	private String internalName;
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ACCOMMODATION_AMENITY_ID", unique = true, nullable = false)
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	@Column(name = "INTERNAL_NAME", length = 50, unique=true, nullable=false)
	public String getInternalName() {
		return internalName;
	}
	public void setInternalName(String internalName) {
		this.internalName = internalName;
	}
	public Amenity() {
		super();
	}
	
}


