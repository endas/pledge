package org.volunteertech.pledges.pledge.status;

public enum PledgeTakenStatusEnum {

	NOT_TAKEN("NOT_TAKEN","pledgeTakenStatus.notTaken"),
    TAKEN("TAKEN","pledgeTakenStatus.taken"),
    ON_HOLD("ON_HOLD","pledgeTakenStatus.onHold");
	
	private String code;
    private String name;

    private PledgeTakenStatusEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() { return  name;}
    public String getCode() { return  code;}

}
