package org.volunteertech.pledges.goodspledge.service;
import com.netgrains.security.Authorisation;
import com.netgrains.security.AuthorisationException;
import com.netgrains.security.InvalidUserIDException;
import org.volunteertech.pledges.goodspledge.dao.GoodsPledge;
import org.volunteertech.pledges.accommodationpledge.dao.AccommodationPledge;
import org.volunteertech.pledges.goodspledge.business.GoodsPledgeBo;
import org.volunteertech.pledges.goodspledge.dao.GoodsPledgeFilter;
import org.volunteertech.pledges.goodspledge.dao.GoodsPledgeHistory;
import org.volunteertech.pledges.goodspledge.dao.GoodsPledgeLoadException;
import org.volunteertech.pledges.goodspledge.dao.GoodsPledgeSaveException;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Locale;

import org.volunteertech.pledges.main.constants.Constants;
import org.springframework.beans.factory.annotation.Autowired;

import org.volunteertech.pledges.reference.service.ReferenceService;
  
import org.volunteertech.pledges.localisation.service.MessageResourceService;
  



/**
 * The goods pledge screen is used to add/edit a new/existing pledge of services
 * This Class has been generated by the XSLT processor from the meta data and represents the
 * implementation of the Service  Layer Object for the GoodsPledge entity. A Business Object
 * is provided in order to provide a seperation from the Data Access implementation. 
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: * $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">>JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
public class GoodsPledgeServiceImpl implements GoodsPledgeService
{
	/**
	 * The Business Object
	 */
	GoodsPledgeBo  goodsPledgeBo;
	
	/**
	 * Reference service for lookups of drop down contents
	 */
    ReferenceService referenceService;	  
	  
	/**
	 * The message resource service that allows access to locale specific messages
	 */
    MessageResourceService messageResourceService;	  
	  
    
    /**
     * Default Constructor for the GoodsPledge Business Object.
     */
    public GoodsPledgeServiceImpl()
    {
    	//Initialise the related Object stores
        
    }
    
	
	/**
	 * Sets the reference Service to perform a user roles lookup
	 */
	public void setReferenceService(ReferenceService referenceService){
		this.referenceService = referenceService;
	}
	
	/**
	 * Returns a reference to reference Service.
	 */
	public ReferenceService getReferenceService(){
		return this.referenceService;
	}	
	  
	/**
	 * Sets the message resource service to perform localization lookups
	 */
	public void setMessageResourceService(MessageResourceService messageResourceService){
		this.messageResourceService = messageResourceService;
	}
	
	/**
	 * Returns a reference to the message resource service.
	 */
	public MessageResourceService getMessageResourceService(){
		return this.messageResourceService;
	}	
      
    
    /**
     * Sets the required Business Object (BO)
     * @param goodsPledgeBo the goodsPledgeBo used to access the goodsPledge entity
     * and it's associations.
     */
    public void setGoodsPledgeBo(GoodsPledgeBo goodsPledgeBo){
    	this.goodsPledgeBo = goodsPledgeBo;
    }

    /**
     * Returns the required Business Object (BO)
     * @return the GoodsPledgeBO used to access the goodsPledge entity
     * and it's associations.     
     */
    public GoodsPledgeBo getGoodsPledgeBo(){
    	return this.goodsPledgeBo;
    }

    /**
     * Loads a GoodsPledge object based on the GOODSPLEDGEID column
     * @param GOODSPLEDGEID the primary key for the underlying record.
     * @param userID the userID is checked for authorisation to view the record
     * @ return a GoodsPledge object matching the parameter or null if none can be found. The
     * method also returns null if the parameter is null.
     */
    public GoodsPledge load(Long goodsPledgeId, Long loggedInUserId) throws GoodsPledgeLoadException, AuthorisationException, InvalidUserIDException
    {
    	GoodsPledge goodsPledge = null;
    	
        if (Authorisation.isAuthorisedView("GoodsPledge", loggedInUserId, goodsPledgeId) == false)
        {
        	throw new AuthorisationException();
        }
    	

        if (goodsPledgeId != null)
        {
        	try
        	{
				goodsPledge = (GoodsPledge)this.getGoodsPledgeBo().load(goodsPledgeId, loggedInUserId);
        	}
			catch (Exception ex)
			{
			     throw new GoodsPledgeLoadException("GoodsPledgeServiceImpl::load(?, ?)", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return goodsPledge;
    }
    
    


    /**
     * Load all existing GoodsPledge objects. 
     * @return List a List of GoodsPledge objects.
     */
    public List<GoodsPledge> listGoodsPledge()
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledge();

        return result;
    }
    
    
    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsCategoryOne
     * @return List a List of GoodsPledge objects that match the goodsCategoryOne property given as parameter.
     * @param goodsCategoryOne the goodsCategoryOne on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsCategoryOne(Long goodsCategoryOne)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsCategoryOne(goodsCategoryOne);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsCategoryTwo
     * @return List a List of GoodsPledge objects that match the goodsCategoryTwo property given as parameter.
     * @param goodsCategoryTwo the goodsCategoryTwo on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsCategoryTwo(Long goodsCategoryTwo)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsCategoryTwo(goodsCategoryTwo);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsCategoryThree
     * @return List a List of GoodsPledge objects that match the goodsCategoryThree property given as parameter.
     * @param goodsCategoryThree the goodsCategoryThree on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsCategoryThree(Long goodsCategoryThree)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsCategoryThree(goodsCategoryThree);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsSize
     * @return List a List of GoodsPledge objects that match the goodsSize property given as parameter.
     * @param goodsSize the goodsSize on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsSize(Long goodsSize)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsSize(goodsSize);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsNewOrUsed
     * @return List a List of GoodsPledge objects that match the goodsNewOrUsed property given as parameter.
     * @param goodsNewOrUsed the goodsNewOrUsed on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsNewOrUsed(Long goodsNewOrUsed)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsNewOrUsed(goodsNewOrUsed);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsCondition
     * @return List a List of GoodsPledge objects that match the goodsCondition property given as parameter.
     * @param goodsCondition the goodsCondition on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsCondition(Long goodsCondition)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsCondition(goodsCondition);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching goodsQuantity
     * @return List a List of GoodsPledge objects that match the goodsQuantity property given as parameter.
     * @param goodsQuantity the goodsQuantity on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByGoodsQuantity(Long goodsQuantity)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByGoodsQuantity(goodsQuantity);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching additionalInformation
     * @return List a List of GoodsPledge objects that match the additionalInformation property given as parameter.
     * @param additionalInformation the additionalInformation on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByAdditionalInformation(String additionalInformation)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByAdditionalInformation(additionalInformation);

        return result;
    }

    /**
     * Returns a <code>List</code> of GoodsPledge objects that have a matching itemSize
     * @return List a List of GoodsPledge objects that match the itemSize property given as parameter.
     * @param itemSize the itemSize on which to match the required records.
     */
    public List<GoodsPledge> listGoodsPledgeByItemSize(String itemSize)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledgeByItemSize(itemSize);

        return result;
    }

    
    /**
     * Load existing GoodsPledge objects from the database that have a createdByID column
     * that matches the userId parameter.
     * @return List a List of GoodsPledge objects that match the userId parameter.
     */
    public List<GoodsPledge> listGoodsPledgeByCreatedById(Long userId)
    {
        List<GoodsPledge> result = this.getGoodsPledgeBo().listGoodsPledge();

        return result;
    }
    
    
    /**
     * Load all existing GoodsPledgeHistory objects for a particular GoodsPledge.
     * The <code>List</code> of GoodsPledgeHistory objects contains all of the changes that have been made to the
     * GoodsPledge object identified by the goodsPledge parameter'
     * @return List a List of GoodsPledgeHistory objects.
     */
    public List<GoodsPledgeHistory> listGoodsPledgeHistory(Long goodsPledge) throws Exception
    {
        List<GoodsPledgeHistory> result = this.getGoodsPledgeBo().listGoodsPledgeHistory(goodsPledge);

        return result;
    }
    
    
    
    /**
     * Either updates an existing entry in the GOODSPLEDGE table or adds a new entry if one does not exist.
     *
     * @param userID the userID of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws GoodsPledgeLoadException if the existing record cannot be loaded
     * @throws GoodsPledgeSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public void storeGoodsPledge(GoodsPledge goodsPledge, Long userId)
        throws GoodsPledgeSaveException, GoodsPledgeLoadException, AuthorisationException, InvalidUserIDException
    {
    	
        if (Authorisation.isAuthorisedUpdate("GoodsPledge", userId, goodsPledge.getId()) == false)
        {
        	throw new AuthorisationException();
        }
    	
		try
		{
			if(goodsPledge.isNew()){
		    	this.getGoodsPledgeBo().createAndStoreGoodsPledge(goodsPledge, userId);
			}else{
		    	this.getGoodsPledgeBo().updateGoodsPledge(goodsPledge, userId);
			}
        }
		catch (Exception ex)
		{
		     throw new GoodsPledgeSaveException("GoodsPledgeEntityDataManager::updateGoodsPledge, GoodsPledgeID: " + goodsPledge.getId(), ex);
		}		
        
    }
    
    
    /**
     * Loads a GoodsPledgeFilter object based on the participantID of the currently logged in user
     * @param userID the userID is checked for authorisation to view the record. It is also the key to load a against the createdByID
     * column of the underlying record. There should only ever be one or zero filter records per GoodsPledge.
     * @ return a GoodsPledgeFilter object matching the parameter or a newly constructed, empty object if none can be found
     */
    public GoodsPledgeFilter loadGoodsPledgeFilter(Long userID) throws GoodsPledgeLoadException, AuthorisationException, InvalidUserIDException
    {
    	GoodsPledgeFilter goodsPledgeFilter = null;
    	
        /*if (Authorisation.isAuthorisedView("GoodsPledge", userID, GOODSPLEDGEID) == false)
        {
        	throw new AuthorisationException();
        }*/
    	

        if (userID != null)
        {
        	
        	try
        	{
				goodsPledgeFilter = (GoodsPledgeFilter)this.getGoodsPledgeBo().loadGoodsPledgeFilter(userID);
        	}
			catch (Exception ex)
			{
			     throw new GoodsPledgeLoadException("GoodsPledgeEntityDataManager::loadGoodsPledgeFilter", ex);
			}		
    		
            // Load all related singular objects
            
        }
    	
        return goodsPledgeFilter;
    }
    
    /**
     * Creates a new entry in the GOODSPLEDGEFILTER table containing the parameters passed here.
     *
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @return the userId which is also the assigned Id for the newly created record.
     * @throws GoodsPledgeSaveException on failure to save.  
     */
    public Long createAndStoreGoodsPledgeFilter(GoodsPledgeFilter goodsPledgeFilter, Long userId)
        throws GoodsPledgeSaveException
    {
    	Long returnValue = Long.valueOf(0);
        

		try
		{
            goodsPledgeFilter.setId(userId);
			goodsPledgeFilter.setCreatedByID(userId);
            goodsPledgeFilter.setUpdatedByID(userId);
            goodsPledgeFilter.setDateCreated(new Date());
            goodsPledgeFilter.setDateUpdated(new Date());

            returnValue = this.getGoodsPledgeBo().createAndStoreGoodsPledgeFilter(goodsPledgeFilter, userId);
		}
		catch (Exception ex)
		{
		     throw new GoodsPledgeSaveException("GoodsPledgeServiceImpl::createAndStoreGoodsPledgeFilter", ex);
		}		
		
		return returnValue;
    }
    
    
    /**
     * Updates an existing entry in the GOODSPLEDGEFILTER table and associated tables 
     * containing the parameters passed here. If the entry denoted by the userID does not exist then one is created.
     *	
     * @param userId the userId of the currently logged in user, this can be retrieved from the session.
     * This value must be set for auditing purposes.
     * @throws GoodsPledgeSaveException if there is an issue populating or saving the updated object
     * @throws AuthorisationException if the user is not authorised to update the object
     * @throws InvalidUserIDException if the userID passed as parameter is not valid
     */
    public Long updateGoodsPledgeFilter(GoodsPledgeFilter goodsPledgeFilter, Long userId)
        throws GoodsPledgeLoadException, GoodsPledgeSaveException, AuthorisationException, InvalidUserIDException
    {
    	Long returnValue = Long.valueOf(0);
    	
        //if (Authorisation.isAuthorisedUpdate("GoodsPledge", userId, GOODSPLEDGEID) == false)
        //{
        //	throw new AuthorisationException();
        //}
    	
		try
		{
        
			goodsPledgeFilter.setUpdatedByID(userId);
            goodsPledgeFilter.setDateUpdated(new Date());
            returnValue = this.getGoodsPledgeBo().updateGoodsPledgeFilter(goodsPledgeFilter, userId);
        }
		catch (Exception ex)
		{
		     throw new GoodsPledgeSaveException("GoodsPledgeServiceImpl::updateGoodsPledgeFilter, userId: " + userId, ex);
		}	
		
		return returnValue;	
        
    }

	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param goodsPledge the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public GoodsPledge translateReferenceValues(GoodsPledge goodsPledge, Locale locale){
    	
			Long goodsCategoryOneReferenceId =  goodsPledge.getGoodsCategoryOne();
			String goodsCategoryOneLocaleReference = null;
			if (goodsCategoryOneReferenceId == null || goodsCategoryOneReferenceId == -1){
				goodsCategoryOneLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsCategoryOneLocaleReference = this.messageResourceService.getMessage(goodsCategoryOneReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsCategoryOneReferenceTranslation(goodsCategoryOneLocaleReference);

			Long goodsCategoryTwoReferenceId =  goodsPledge.getGoodsCategoryTwo();
			String goodsCategoryTwoLocaleReference = null;
			if (goodsCategoryTwoReferenceId == null || goodsCategoryTwoReferenceId == -1){
				goodsCategoryTwoLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsCategoryTwoLocaleReference = this.messageResourceService.getMessage(goodsCategoryTwoReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsCategoryTwoReferenceTranslation(goodsCategoryTwoLocaleReference);

			Long goodsCategoryThreeReferenceId =  goodsPledge.getGoodsCategoryThree();
			String goodsCategoryThreeLocaleReference = null;
			if (goodsCategoryThreeReferenceId == null || goodsCategoryThreeReferenceId == -1){
				goodsCategoryThreeLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsCategoryThreeLocaleReference = this.messageResourceService.getMessage(goodsCategoryThreeReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsCategoryThreeReferenceTranslation(goodsCategoryThreeLocaleReference);

			Long goodsSizeReferenceId =  goodsPledge.getGoodsSize();
			String goodsSizeLocaleReference = null;
			if (goodsSizeReferenceId == null || goodsSizeReferenceId == -1){
				goodsSizeLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsSizeLocaleReference = this.messageResourceService.getMessage(goodsSizeReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsSizeReferenceTranslation(goodsSizeLocaleReference);

			Long goodsNewOrUsedReferenceId =  goodsPledge.getGoodsNewOrUsed();
			String goodsNewOrUsedLocaleReference = null;
			if (goodsNewOrUsedReferenceId == null || goodsNewOrUsedReferenceId == -1){
				goodsNewOrUsedLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsNewOrUsedLocaleReference = this.messageResourceService.getMessage(goodsNewOrUsedReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsNewOrUsedReferenceTranslation(goodsNewOrUsedLocaleReference);

			Long goodsConditionReferenceId =  goodsPledge.getGoodsCondition();
			String goodsConditionLocaleReference = null;
			if (goodsConditionReferenceId == null || goodsConditionReferenceId == -1){
				goodsConditionLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsConditionLocaleReference = this.messageResourceService.getMessage(goodsConditionReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsConditionReferenceTranslation(goodsConditionLocaleReference);

			Long goodsQuantityReferenceId =  goodsPledge.getGoodsQuantity();
			String goodsQuantityLocaleReference = null;
			if (goodsQuantityReferenceId == null || goodsQuantityReferenceId == -1){
				goodsQuantityLocaleReference = this.messageResourceService.getMessage("global.select.noselection", new String[0], locale);
			}else{
				goodsQuantityLocaleReference = this.messageResourceService.getMessage(goodsQuantityReferenceId, new String[0], locale);
			}
			
			goodsPledge.setGoodsQuantityReferenceTranslation(goodsQuantityLocaleReference);

			GoodsPledge pledge= goodsPledge;
			if (pledge.getStatus() == null || pledge.getStatus() == -1){
				pledge.setStatusReferenceTranslation(this.messageResourceService.getMessage("global.select.noselection", new String[0], locale));
			}else{
				pledge.setStatusReferenceTranslation(this.messageResourceService.getMessage(pledge.getStatus(), new String[0], locale));
			}
				
    	return goodsPledge;
    }
    
	/**
	 * Translates the referenceId type properties into the locale specific text for display on the front-end.
	 * @param goodsPledgeList the dto object to be updated with the locale specific translations
	 * @param locale the Locale to be displayed
	 */    
    public List<GoodsPledge> translateReferenceValues(List<GoodsPledge> goodsPledgeList, Locale locale){
    	for (GoodsPledge goodsPledge :  goodsPledgeList){
    		goodsPledge = translateReferenceValues(goodsPledge, locale);
    	}
    	
    	return goodsPledgeList;
    }
    
	
    
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
        super.finalize();
        
    }    
    
    
}
    
