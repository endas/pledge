/**
 * 
 */
package org.volunteertech.pledges.pledge.status;

/**
 * @author Keegan
 *
 */
public enum ActiveStatusEnum {
	ACTIVE("ACTIVE","activestatus.active"),
    TEMPORARILY_INACTIVE("TEMPORARILY_INACTIVE","activestatus.temp.inactive"),
    PERMANENTLY_INACTIVE("PERMANENTLY_INACTIVE","activestatus.perm.inactive");


    private String code;
    private String name;

    private ActiveStatusEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() { return  name;}
    public String getCode() { return  code;}

}
