/**
 * 
 */
package org.volunteertech.pledges.pledge.status;

/**
 * @author Keegan
 *
 */
public enum VerificationProgressEnum {
	READY_TO_PROGRESS("READY_TO_PROGRESS","verificationProgress.ready"),
    NOT_READY_TO_PROGRESS("TEMPORARILY_INACTIVE","verificationProgress.notready"),
    ON_HOLD("PERMANENTLY_INACTIVE","verificationProgress.onhold");


    private String code;
    private String name;

    private VerificationProgressEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() { return  name;}
    public String getCode() { return  code;}

}
