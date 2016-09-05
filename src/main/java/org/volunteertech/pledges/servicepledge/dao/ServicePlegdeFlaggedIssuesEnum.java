package org.volunteertech.pledges.servicepledge.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.volunteertech.pledges.main.localisation.DatabaseDrivenMessageSource;

public enum ServicePlegdeFlaggedIssuesEnum {

    LANGUAGE("LANGUAGE","serviceplegde.flaggedIssue.language"),
    ACCREDITED("ACCREDITED","serviceplegde.flaggedIssue.accredited"),
    LIMITATION("LIMIT","serviceplegde.flaggedIssue.timelimit"),
    OTHER("OTHER","serviceplegde.flaggedIssue.other");

    private String code;
    private String name;

    private ServicePlegdeFlaggedIssuesEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() { return  name;}
    public String getCode() { return  code;}




}
