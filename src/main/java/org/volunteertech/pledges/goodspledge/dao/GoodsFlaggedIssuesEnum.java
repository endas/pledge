package org.volunteertech.pledges.goodspledge.dao;

public enum GoodsFlaggedIssuesEnum {

    ON_SITE("ON_SITE","goods.flaggedIssue.onsite"),
    LIMITATION("LIMIT","goods.flaggedIssue.timelimit"),
    OTHER("OTHER","goods.flaggedIssue.other");

    private String code;
    private String name;

    private GoodsFlaggedIssuesEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() { return  name;}
    public String getCode() { return  code;}




}
