package org.volunteertech.pledges.users.view;

import org.volunteertech.pledges.users.dao.ApplicationUser;
import java.io.Serializable;





/**
 * The User Model for controlling user access
 * The ApplicationUserTranslationBacking Bean supports the localisation of the ApplicationUser Screen
 * This class has been generated by the XSLT processor from the metadata and represents the
 * DataBase access handler for the ApplicationUser entity.
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public interface ApplicationUserTranslationBackingBean extends ApplicationUser{ 

    
    /*
     * Returns the Id for the underlying database table record
     */
	public Long getId();
	
    
    /*
     * Sets the Id. This allows front-end forms to bind the id property
     */
	public void setId(Long id);
	
	
    /*
     * Returns the parentObjectId when this object has been populated via a restful webservice JSON mapping
     */
	public Long getParentObjectId();
	

    /*
     * Sets the parentObjectId. This allows restful web services to bind the parentId property when adding a new record.
     */
	public void setParentObjectId(Long parentObjectId);
	

    
    
    /**
     * Sets the usernameLabelMessageKey
     * @param usernameLabelMessageKey
     */
    public void setUsernameLabelMessageKey(String usernameLabelMessageKey);
    
    
    /**
     * Returns the usernameLabelMessageKey
     * @return the usernameLabelMessageKey
     */
    public String getUsernameLabelMessageKey();
    
    
    /**
     * Sets the usernameLabel
     * @param usernameLabel
     */
    public void setUsernameLabel(String usernameLabel);
    
    
    /**
     * Returns the usernameLabel
     * @return the usernameLabel
     */
    public String getUsernameLabel();
    
    
    /**
     * Sets the usernamePlaceHolderMessageKey
     * @param usernamePlaceHolderMessageKey
     */
    public void setUsernamePlaceHolderMessageKey(String usernamePlaceHolderMessageKey);
    
    
    /**
     * Returns the usernamePlaceHolderMessageKey
     * @return the usernamePlaceHolderMessageKey
     */
    public String getUsernamePlaceHolderMessageKey();
    
    
    /**
     * Sets the usernamePlaceHolder
     * @param usernamePlaceHolder
     */
    public void setUsernamePlaceHolder(String usernamePlaceHolder);
    
    
    /**
     * Returns the usernamePlaceHolder
     * @return the usernamePlaceHolder
     */
    public String getUsernamePlaceHolder();
    
    
    /**
     * Sets the usernameHelpTextMessageKey
     * @param usernameHelpTextMessageKey
     */
    public void setUsernameHelpTextMessageKey(String usernameHelpTextMessageKey);
    
    
    /**
     * Returns the usernameHelpTextMessageKey
     * @return the usernameHelpTextMessageKey
     */
    public String getUsernameHelpTextMessageKey();
    
    
    /**
     * Sets the usernameHelpText
     * @param usernameHelpText
     */
    public void setUsernameHelpText(String usernameHelpText);
    
    
    /**
     * Returns the usernameHelpText
     * @return the usernameHelpText
     */
    public String getUsernameHelpText();
    
    
    /**
     * Sets the usernameTooltipMessageKey
     * @param usernameTooltipMessageKey
     */
    public void setUsernameTooltipMessageKey(String usernameTooltipMessageKey);
    
    
    /**
     * Returns the usernameTooltipMessageKey
     * @return the usernameTooltipMessageKey
     */
    public String getUsernameTooltipMessageKey();
    
    
    /**
     * Sets the usernameTooltip
     * @param usernameTooltip
     */
    public void setUsernameTooltip(String usernameTooltip);
    
    
    /**
     * Returns the usernameTooltip
     * @return the usernameTooltip
     */
    public String getUsernameTooltip();
    
        

    
    /**
     * Sets the passwordLabelMessageKey
     * @param passwordLabelMessageKey
     */
    public void setPasswordLabelMessageKey(String passwordLabelMessageKey);
    
    
    /**
     * Returns the passwordLabelMessageKey
     * @return the passwordLabelMessageKey
     */
    public String getPasswordLabelMessageKey();
    
    
    /**
     * Sets the passwordLabel
     * @param passwordLabel
     */
    public void setPasswordLabel(String passwordLabel);
    
    
    /**
     * Returns the passwordLabel
     * @return the passwordLabel
     */
    public String getPasswordLabel();
    
    
    /**
     * Sets the passwordPlaceHolderMessageKey
     * @param passwordPlaceHolderMessageKey
     */
    public void setPasswordPlaceHolderMessageKey(String passwordPlaceHolderMessageKey);
    
    
    /**
     * Returns the passwordPlaceHolderMessageKey
     * @return the passwordPlaceHolderMessageKey
     */
    public String getPasswordPlaceHolderMessageKey();
    
    
    /**
     * Sets the passwordPlaceHolder
     * @param passwordPlaceHolder
     */
    public void setPasswordPlaceHolder(String passwordPlaceHolder);
    
    
    /**
     * Returns the passwordPlaceHolder
     * @return the passwordPlaceHolder
     */
    public String getPasswordPlaceHolder();
    
    
    /**
     * Sets the passwordHelpTextMessageKey
     * @param passwordHelpTextMessageKey
     */
    public void setPasswordHelpTextMessageKey(String passwordHelpTextMessageKey);
    
    
    /**
     * Returns the passwordHelpTextMessageKey
     * @return the passwordHelpTextMessageKey
     */
    public String getPasswordHelpTextMessageKey();
    
    
    /**
     * Sets the passwordHelpText
     * @param passwordHelpText
     */
    public void setPasswordHelpText(String passwordHelpText);
    
    
    /**
     * Returns the passwordHelpText
     * @return the passwordHelpText
     */
    public String getPasswordHelpText();
    
    
    /**
     * Sets the passwordTooltipMessageKey
     * @param passwordTooltipMessageKey
     */
    public void setPasswordTooltipMessageKey(String passwordTooltipMessageKey);
    
    
    /**
     * Returns the passwordTooltipMessageKey
     * @return the passwordTooltipMessageKey
     */
    public String getPasswordTooltipMessageKey();
    
    
    /**
     * Sets the passwordTooltip
     * @param passwordTooltip
     */
    public void setPasswordTooltip(String passwordTooltip);
    
    
    /**
     * Returns the passwordTooltip
     * @return the passwordTooltip
     */
    public String getPasswordTooltip();
    
        

    
    /**
     * Sets the enabledLabelMessageKey
     * @param enabledLabelMessageKey
     */
    public void setEnabledLabelMessageKey(String enabledLabelMessageKey);
    
    
    /**
     * Returns the enabledLabelMessageKey
     * @return the enabledLabelMessageKey
     */
    public String getEnabledLabelMessageKey();
    
    
    /**
     * Sets the enabledLabel
     * @param enabledLabel
     */
    public void setEnabledLabel(String enabledLabel);
    
    
    /**
     * Returns the enabledLabel
     * @return the enabledLabel
     */
    public String getEnabledLabel();
    
    
    /**
     * Sets the enabledPlaceHolderMessageKey
     * @param enabledPlaceHolderMessageKey
     */
    public void setEnabledPlaceHolderMessageKey(String enabledPlaceHolderMessageKey);
    
    
    /**
     * Returns the enabledPlaceHolderMessageKey
     * @return the enabledPlaceHolderMessageKey
     */
    public String getEnabledPlaceHolderMessageKey();
    
    
    /**
     * Sets the enabledPlaceHolder
     * @param enabledPlaceHolder
     */
    public void setEnabledPlaceHolder(String enabledPlaceHolder);
    
    
    /**
     * Returns the enabledPlaceHolder
     * @return the enabledPlaceHolder
     */
    public String getEnabledPlaceHolder();
    
    
    /**
     * Sets the enabledHelpTextMessageKey
     * @param enabledHelpTextMessageKey
     */
    public void setEnabledHelpTextMessageKey(String enabledHelpTextMessageKey);
    
    
    /**
     * Returns the enabledHelpTextMessageKey
     * @return the enabledHelpTextMessageKey
     */
    public String getEnabledHelpTextMessageKey();
    
    
    /**
     * Sets the enabledHelpText
     * @param enabledHelpText
     */
    public void setEnabledHelpText(String enabledHelpText);
    
    
    /**
     * Returns the enabledHelpText
     * @return the enabledHelpText
     */
    public String getEnabledHelpText();
    
    
    /**
     * Sets the enabledTooltipMessageKey
     * @param enabledTooltipMessageKey
     */
    public void setEnabledTooltipMessageKey(String enabledTooltipMessageKey);
    
    
    /**
     * Returns the enabledTooltipMessageKey
     * @return the enabledTooltipMessageKey
     */
    public String getEnabledTooltipMessageKey();
    
    
    /**
     * Sets the enabledTooltip
     * @param enabledTooltip
     */
    public void setEnabledTooltip(String enabledTooltip);
    
    
    /**
     * Returns the enabledTooltip
     * @return the enabledTooltip
     */
    public String getEnabledTooltip();
    
        

    
    /**
     * Sets the userRolesLabelMessageKey
     * @param userRolesLabelMessageKey
     */
    public void setUserRolesLabelMessageKey(String userRolesLabelMessageKey);
    
    
    /**
     * Returns the userRolesLabelMessageKey
     * @return the userRolesLabelMessageKey
     */
    public String getUserRolesLabelMessageKey();
    
    
    /**
     * Sets the userRolesLabel
     * @param userRolesLabel
     */
    public void setUserRolesLabel(String userRolesLabel);
    
    
    /**
     * Returns the userRolesLabel
     * @return the userRolesLabel
     */
    public String getUserRolesLabel();
    
    
    /**
     * Sets the userRolesPlaceHolderMessageKey
     * @param userRolesPlaceHolderMessageKey
     */
    public void setUserRolesPlaceHolderMessageKey(String userRolesPlaceHolderMessageKey);
    
    
    /**
     * Returns the userRolesPlaceHolderMessageKey
     * @return the userRolesPlaceHolderMessageKey
     */
    public String getUserRolesPlaceHolderMessageKey();
    
    
    /**
     * Sets the userRolesPlaceHolder
     * @param userRolesPlaceHolder
     */
    public void setUserRolesPlaceHolder(String userRolesPlaceHolder);
    
    
    /**
     * Returns the userRolesPlaceHolder
     * @return the userRolesPlaceHolder
     */
    public String getUserRolesPlaceHolder();
    
    
    /**
     * Sets the userRolesHelpTextMessageKey
     * @param userRolesHelpTextMessageKey
     */
    public void setUserRolesHelpTextMessageKey(String userRolesHelpTextMessageKey);
    
    
    /**
     * Returns the userRolesHelpTextMessageKey
     * @return the userRolesHelpTextMessageKey
     */
    public String getUserRolesHelpTextMessageKey();
    
    
    /**
     * Sets the userRolesHelpText
     * @param userRolesHelpText
     */
    public void setUserRolesHelpText(String userRolesHelpText);
    
    
    /**
     * Returns the userRolesHelpText
     * @return the userRolesHelpText
     */
    public String getUserRolesHelpText();
    
    
    /**
     * Sets the userRolesTooltipMessageKey
     * @param userRolesTooltipMessageKey
     */
    public void setUserRolesTooltipMessageKey(String userRolesTooltipMessageKey);
    
    
    /**
     * Returns the userRolesTooltipMessageKey
     * @return the userRolesTooltipMessageKey
     */
    public String getUserRolesTooltipMessageKey();
    
    
    /**
     * Sets the userRolesTooltip
     * @param userRolesTooltip
     */
    public void setUserRolesTooltip(String userRolesTooltip);
    
    
    /**
     * Returns the userRolesTooltip
     * @return the userRolesTooltip
     */
    public String getUserRolesTooltip();
    
        


    /**
     * Checks for a newly created entity object
     * @return true if this is a newly created entity object meaning that it has not yet been persisted, otherwise false
     */
	public boolean isNew();
	
    
    
     @Override
     public String toString();
     
}
    
    
    

