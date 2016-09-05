package org.volunteertech.pledges.accommodationpledge.dao;

public enum AccommodationFlaggedIssuesEnum {

    RURAL_NO_PUBLIC("RURAL_NO_PUBLIC","accommodation.flaggedIssue.rural_no_public"),
    RURAL_LIMIT_PUBLIC("RURAL_LIMIT_PUBLIC","accommodation.flaggedIssue.rural_limit"),
    SIZE("SIZE","accommodation.flaggedIssue.size"),
    LIMITED_MOBILITY("LIMITED_MOBILITY","accommodation.flaggedIssue.limited_mobility"),
    LIMITATION("LIMIT","accommodation.flaggedIssue.timelimit"),
    OTHER("OTHER","accommodation.flaggedIssue.other");

    private String code;
    private String name;

    private AccommodationFlaggedIssuesEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() { return  name;}
    public String getCode() { return  code;}




}
