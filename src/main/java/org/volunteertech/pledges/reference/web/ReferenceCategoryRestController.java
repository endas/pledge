package org.volunteertech.pledges.reference.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.SortedMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

import org.volunteertech.pledges.reference.dao.ReferenceCategory;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryImpl;
import org.volunteertech.pledges.reference.service.ReferenceCategoryService;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryLoadException;
import org.volunteertech.pledges.reference.dao.ReferenceCategorySaveException;
import org.volunteertech.pledges.reference.validator.ReferenceCategoryFormValidator;
import org.volunteertech.pledges.main.web.BaseController;
import org.volunteertech.pledges.users.security.SecurityUser;
import org.volunteertech.pledges.main.constants.Constants;
import org.volunteertech.pledges.main.localisation.DatabaseDrivenMessageSource;
import org.volunteertech.pledges.reference.ReferenceStore;


import org.volunteertech.pledges.reference.dao.Reference;
import org.volunteertech.pledges.reference.dao.ReferenceImpl;




/**
 * The reference category screen is used to add/edit new/existing reference category entries. The reference entries are used to populate dropdowns where a group of reference entries with a common column-value can be associated with a dropdown.
 * The Spring ReferenceCategoryRestController to handle restful web service requests.
 * This class has been generated by the XSLT processor from the metadata and represents the
 * the Spring ReferenceCategoryRestController to handle restful web service requests.
 * <P> 
 * It is essential that methods added to this class are given JavaDoc comments to allow
 * documentation to be generated. For a description of JavaDoc refer to The JavaDoc documentation.
 * A link is provided below.
 * <P>
 * @author Michael O'Connor
 * @version $Revision$
 * Date: $Date$
 * @see <a href="http://java.sun.com/j2se/javadoc/writingdoccomments/index.html">>JavaDoc Documentation</a> 
 * Change Log
 * ----------
 * $Log$
 *
 */
@RestController
public class ReferenceCategoryRestController extends BaseController
{
	final Logger logger = LoggerFactory.getLogger(ReferenceCategoryRestController.class);
	
	@Autowired
	private ReferenceStore referenceStore;
	
	@Autowired
	private ReferenceCategoryService referenceCategoryService;
	

    @Autowired
    private DatabaseDrivenMessageSource messageSource;
	


	/**
	 * Returns a JSON representation of all ReferenceCategory records
	 * @return the JSON representation of all ReferenceCategory.
	 */
	@RequestMapping(value = "/restful/referencecategory/list", method = RequestMethod.GET)
	@ResponseBody
    public List<ReferenceCategory> showAllReferenceCategory(Authentication authentication, Locale locale) {
		logger.info("Inside restful getReferenceCategory method...");
		List <ReferenceCategory> referenceCategoryList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	referenceCategoryList = referenceCategoryService.listReferenceCategory();
	    	referenceCategoryList = referenceCategoryService.translateReferenceValues(referenceCategoryList, locale);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return referenceCategoryList;
    }


	
	/**
	 * Returns a JSON representation of the ReferenceCategory record that matches the id parameter
	 * @param id the primary key by which to search
	 * @return the ReferenceCategory with the relevant primary key.
	 */
	@RequestMapping(value = "/restful/referencecategory", method = RequestMethod.GET)
	@ResponseBody
    public ReferenceCategory getReferenceCategory(Authentication authentication, @RequestParam(value="id") String id) {
		logger.info("Inside restful getReferenceCategory method...");
		ReferenceCategory referenceCategory = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();		
		
		try{
			// TODO: Needs exception handling policy
	    	referenceCategory = referenceCategoryService.load(Long.valueOf(id), userId);
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return referenceCategory;
    }
    
    @RequestMapping(value = "/restful/referencecategory/update", method = RequestMethod.POST)
    @ResponseBody
    public List<ReferenceCategory> updateReferenceCategory(Authentication authentication, @RequestBody ReferenceCategory referenceCategory) {
        logger.debug("In the updateReferenceCategory controller and got Id: " + referenceCategory.getId());

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
        
		try{
			// TODO needs security update
			referenceCategoryService.storeReferenceCategory(referenceCategory, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<ReferenceCategory> referenceCategoryList = referenceCategoryService.listReferenceCategory();
        
        return referenceCategoryList;
    }
    
    
    @RequestMapping(value = "/restful/referencecategory/new", method = RequestMethod.POST)
    @ResponseBody
    public List<ReferenceCategory> addReferenceCategory(Authentication authentication, @RequestBody ReferenceCategory referenceCategory) {
        logger.debug("In the addReferenceCategory controller and got Id: " + referenceCategory.getId());
        SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();

		try{
			// TODO needs security update
			referenceCategoryService.storeReferenceCategory(referenceCategory, userId);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
    	List<ReferenceCategory> referenceCategoryList = referenceCategoryService.listReferenceCategory();
        
        return referenceCategoryList;
    }
    
    
    
	/**
	 * Returns a JSON representation of the <code>List</code> of Reference records that
	 * are linked to the ReferenceCategory identified by the id parameter.
	 * @param id the primary key of the ReferenceCategory by which to search for the associated Reference records.
	 * @return A <code>List</code>of ReferenceCategory records that are associated with the ReferenceCategory
	 * identified by the id parameter.
	 */
	@RequestMapping(value = "/restful/referencecategory/references/list", method = RequestMethod.GET)
    public List<Reference> getReferences(Authentication authentication, @RequestParam(value="id") String referenceCategoryId, Locale locale) {
		logger.info("Inside restful getReferences method...");
		List<Reference> referenceList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
		
		try{
			// TODO: Needs exception handling policy and calls moved inside the business object.
	    	referenceList = referenceCategoryService.getReferences(Long.valueOf(referenceCategoryId), userId);
	    	referenceList = this.referenceCategoryService.translateReferenceReferenceValues(referenceList, locale);
			
		}
		catch (Exception ex){
			logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}		
		
		
    	return referenceList;
    }
    
    @RequestMapping(value = "/restful/referencecategory/references/new", method = RequestMethod.POST)
    @ResponseBody
    public List<Reference> addReferences(Authentication authentication, @RequestBody ReferenceImpl reference, Locale locale) {
        logger.debug("In the addReferences controller and got Id: " + reference.getId());
		List<Reference> referenceList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();
        		
		try{
			// TODO needs security update and move processing inside the business object
			referenceList = referenceCategoryService.addReferenceToReferences(reference, reference.getParentObjectId(), userId);
			referenceList = this.referenceCategoryService.translateReferenceReferenceValues(referenceList, locale);
		}
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
        return referenceList;
    }
    

    @RequestMapping(value = "/restful/referencecategory/references/update", method = RequestMethod.POST)
    @ResponseBody
    public List<Reference> updateReferences(Authentication authentication, @RequestBody ReferenceImpl reference, Locale locale) {
        logger.debug("In the updateReferences controller and got Id: " + reference.getId());
        List<Reference> referenceList = null;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
        Long userId = user.getApplicationUser().getId();        

		try{
			// TODO needs security update and move processing inside the business object
			
			referenceList = referenceCategoryService.getReferenceCategoryBo().getReferenceCategoryDao().updateReferences(reference.getParentObjectId(), reference, userId);
			referenceList = this.referenceCategoryService.translateReferenceReferenceValues(referenceList, locale);
	    }
		catch (Exception ex){
		// TODO needs custom exception handling
		logger.error("Exception caught !!!!!!!!!!!!!!", ex);
		}
        
        return referenceList;
    }

	/**
	 * Returns a JSON representation of a list of reference entries that can be used to populate a select input.
	 * @param referenceType the referenceType indicating the refType of the returned reference entries
	 * @return a <code>SortedMap<Long,String></code> containing the reference entries that match the referenceType parameter.
	 */
	@RequestMapping(value = "/restful/referenceslist", method = RequestMethod.GET)
    public SortedMap<Long,String> getReferencesByType(@RequestParam(value="referenceType") String referenceType, Locale locale) {
		logger.info("Inside getReferencesByType() method...");
		SortedMap<Long,String> returnValue = new TreeMap<Long,String>();
		
		switch (referenceType) {
		
			case("IrelandCounty"):
				Map<Long, String> irelandCountyMap = referenceStore.getIrelandCounty(); 
				SortedMap<Long, String> localizedIrelandCountyMap = new TreeMap<Long, String>(irelandCountyMap);
				for (Map.Entry<Long, String> entry : localizedIrelandCountyMap.entrySet()) {
					localizedIrelandCountyMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedIrelandCountyMap;
				break;
		  
		
			case("AccommodationType"):
				Map<Long, String> accommodationTypeMap = referenceStore.getAccommodationType(); 
				SortedMap<Long, String> localizedAccommodationTypeMap = new TreeMap<Long, String>(accommodationTypeMap);
				for (Map.Entry<Long, String> entry : localizedAccommodationTypeMap.entrySet()) {
					localizedAccommodationTypeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedAccommodationTypeMap;
				break;
		  
		
			case("AccommodationCondition"):
				Map<Long, String> accommodationConditionMap = referenceStore.getAccommodationCondition(); 
				SortedMap<Long, String> localizedAccommodationConditionMap = new TreeMap<Long, String>(accommodationConditionMap);
				for (Map.Entry<Long, String> entry : localizedAccommodationConditionMap.entrySet()) {
					localizedAccommodationConditionMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedAccommodationConditionMap;
				break;
		  
		
			case("NumberOfBeds"):
				Map<Long, String> numberOfBedsMap = referenceStore.getNumberOfBeds(); 
				SortedMap<Long, String> localizedNumberOfBedsMap = new TreeMap<Long, String>(numberOfBedsMap);
				for (Map.Entry<Long, String> entry : localizedNumberOfBedsMap.entrySet()) {
					localizedNumberOfBedsMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedNumberOfBedsMap;
				break;
		  
		
			case("VacantOrShared"):
				Map<Long, String> vacantOrSharedMap = referenceStore.getVacantOrShared(); 
				SortedMap<Long, String> localizedVacantOrSharedMap = new TreeMap<Long, String>(vacantOrSharedMap);
				for (Map.Entry<Long, String> entry : localizedVacantOrSharedMap.entrySet()) {
					localizedVacantOrSharedMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedVacantOrSharedMap;
				break;
		  
		
			case("YouCanAccommodate"):
				Map<Long, String> youCanAccommodateMap = referenceStore.getYouCanAccommodate(); 
				SortedMap<Long, String> localizedYouCanAccommodateMap = new TreeMap<Long, String>(youCanAccommodateMap);
				for (Map.Entry<Long, String> entry : localizedYouCanAccommodateMap.entrySet()) {
					localizedYouCanAccommodateMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedYouCanAccommodateMap;
				break;
		  
		
			case("LocalAmenity"):
				Map<Long, String> localAmenityMap = referenceStore.getLocalAmenity(); 
				SortedMap<Long, String> localizedLocalAmenityMap = new TreeMap<Long, String>(localAmenityMap);
				for (Map.Entry<Long, String> entry : localizedLocalAmenityMap.entrySet()) {
					localizedLocalAmenityMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedLocalAmenityMap;
				break;
		  
		
			case("MonthRange"):
				Map<Long, String> monthRangeMap = referenceStore.getMonthRange(); 
				SortedMap<Long, String> localizedMonthRangeMap = new TreeMap<Long, String>(monthRangeMap);
				for (Map.Entry<Long, String> entry : localizedMonthRangeMap.entrySet()) {
					localizedMonthRangeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedMonthRangeMap;
				break;
		  
		
			case("Yes_No"):
				Map<Long, String> yes_NoMap = referenceStore.getYes_No(); 
				SortedMap<Long, String> localizedYes_NoMap = new TreeMap<Long, String>(yes_NoMap);
				for (Map.Entry<Long, String> entry : localizedYes_NoMap.entrySet()) {
					localizedYes_NoMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedYes_NoMap;
				break;
		  
		
			case("EuropeCountry"):
				Map<Long, String> europeCountryMap = referenceStore.getEuropeCountry(); 
				SortedMap<Long, String> localizedEuropeCountryMap = new TreeMap<Long, String>(europeCountryMap);
				for (Map.Entry<Long, String> entry : localizedEuropeCountryMap.entrySet()) {
					localizedEuropeCountryMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedEuropeCountryMap;
				break;
		  
		
			case("Facilities"):
				Map<Long, String> facilitiesMap = referenceStore.getFacilities(); 
				SortedMap<Long, String> localizedFacilitiesMap = new TreeMap<Long, String>(facilitiesMap);
				for (Map.Entry<Long, String> entry : localizedFacilitiesMap.entrySet()) {
					localizedFacilitiesMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedFacilitiesMap;
				break;
		  
		
			case("IntegerCount1to40"):
				Map<Long, String> integerCount1to40Map = referenceStore.getIntegerCount1to40(); 
				SortedMap<Long, String> localizedIntegerCount1to40Map = new TreeMap<Long, String>(integerCount1to40Map);
				for (Map.Entry<Long, String> entry : localizedIntegerCount1to40Map.entrySet()) {
					localizedIntegerCount1to40Map.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedIntegerCount1to40Map;
				break;
		  
		
			case("PledgeServiceLevelOne"):
				Map<Long, String> pledgeServiceLevelOneMap = referenceStore.getPledgeServiceLevelOne(); 
				SortedMap<Long, String> localizedPledgeServiceLevelOneMap = new TreeMap<Long, String>(pledgeServiceLevelOneMap);
				for (Map.Entry<Long, String> entry : localizedPledgeServiceLevelOneMap.entrySet()) {
					localizedPledgeServiceLevelOneMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedPledgeServiceLevelOneMap;
				break;
		  
		
			case("PledgeServiceLevelTwo"):
				Map<Long, String> pledgeServiceLevelTwoMap = referenceStore.getPledgeServiceLevelTwo(); 
				SortedMap<Long, String> localizedPledgeServiceLevelTwoMap = new TreeMap<Long, String>(pledgeServiceLevelTwoMap);
				for (Map.Entry<Long, String> entry : localizedPledgeServiceLevelTwoMap.entrySet()) {
					localizedPledgeServiceLevelTwoMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedPledgeServiceLevelTwoMap;
				break;
		  
		
			case("GoodsCategoryOne"):
				Map<Long, String> goodsCategoryOneMap = referenceStore.getGoodsCategoryOne(); 
				SortedMap<Long, String> localizedGoodsCategoryOneMap = new TreeMap<Long, String>(goodsCategoryOneMap);
				for (Map.Entry<Long, String> entry : localizedGoodsCategoryOneMap.entrySet()) {
					localizedGoodsCategoryOneMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsCategoryOneMap;
				break;
		  
		
			case("GoodsCategoryTwo"):
				Map<Long, String> goodsCategoryTwoMap = referenceStore.getGoodsCategoryTwo(); 
				SortedMap<Long, String> localizedGoodsCategoryTwoMap = new TreeMap<Long, String>(goodsCategoryTwoMap);
				for (Map.Entry<Long, String> entry : localizedGoodsCategoryTwoMap.entrySet()) {
					localizedGoodsCategoryTwoMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsCategoryTwoMap;
				break;
		  
		
			case("GoodsCondition"):
				Map<Long, String> goodsConditionMap = referenceStore.getGoodsCondition(); 
				SortedMap<Long, String> localizedGoodsConditionMap = new TreeMap<Long, String>(goodsConditionMap);
				for (Map.Entry<Long, String> entry : localizedGoodsConditionMap.entrySet()) {
					localizedGoodsConditionMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsConditionMap;
				break;
		  
		
			case("OwnerOccupierType"):
				Map<Long, String> ownerOccupierTypeMap = referenceStore.getOwnerOccupierType(); 
				SortedMap<Long, String> localizedOwnerOccupierTypeMap = new TreeMap<Long, String>(ownerOccupierTypeMap);
				for (Map.Entry<Long, String> entry : localizedOwnerOccupierTypeMap.entrySet()) {
					localizedOwnerOccupierTypeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedOwnerOccupierTypeMap;
				break;
		  
		
			case("Locale"):
				Map<Long, String> localeMap = referenceStore.getLocale(); 
				SortedMap<Long, String> localizedLocaleMap = new TreeMap<Long, String>(localeMap);
				for (Map.Entry<Long, String> entry : localizedLocaleMap.entrySet()) {
					localizedLocaleMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedLocaleMap;
				break;
		  
		
			case("UserRole"):
				Map<Long, String> userRoleMap = referenceStore.getUserRole(); 
				SortedMap<Long, String> localizedUserRoleMap = new TreeMap<Long, String>(userRoleMap);
				for (Map.Entry<Long, String> entry : localizedUserRoleMap.entrySet()) {
					localizedUserRoleMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedUserRoleMap;
				break;
		  
		
			case("PledgeServiceLevelThree"):
				Map<Long, String> pledgeServiceLevelThreeMap = referenceStore.getPledgeServiceLevelThree(); 
				SortedMap<Long, String> localizedPledgeServiceLevelThreeMap = new TreeMap<Long, String>(pledgeServiceLevelThreeMap);
				for (Map.Entry<Long, String> entry : localizedPledgeServiceLevelThreeMap.entrySet()) {
					localizedPledgeServiceLevelThreeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedPledgeServiceLevelThreeMap;
				break;
		  
		
			case("GoodsCategoryThree"):
				Map<Long, String> goodsCategoryThreeMap = referenceStore.getGoodsCategoryThree(); 
				SortedMap<Long, String> localizedGoodsCategoryThreeMap = new TreeMap<Long, String>(goodsCategoryThreeMap);
				for (Map.Entry<Long, String> entry : localizedGoodsCategoryThreeMap.entrySet()) {
					localizedGoodsCategoryThreeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsCategoryThreeMap;
				break;
		  
		
			case("GoodsSize"):
				Map<Long, String> goodsSizeMap = referenceStore.getGoodsSize(); 
				SortedMap<Long, String> localizedGoodsSizeMap = new TreeMap<Long, String>(goodsSizeMap);
				for (Map.Entry<Long, String> entry : localizedGoodsSizeMap.entrySet()) {
					localizedGoodsSizeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsSizeMap;
				break;
		  
		
			case("GoodsQuantity"):
				Map<Long, String> goodsQuantityMap = referenceStore.getGoodsQuantity(); 
				SortedMap<Long, String> localizedGoodsQuantityMap = new TreeMap<Long, String>(goodsQuantityMap);
				for (Map.Entry<Long, String> entry : localizedGoodsQuantityMap.entrySet()) {
					localizedGoodsQuantityMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsQuantityMap;
				break;
		  
		
			case("NewOrUsed"):
				Map<Long, String> newOrUsedMap = referenceStore.getNewOrUsed(); 
				SortedMap<Long, String> localizedNewOrUsedMap = new TreeMap<Long, String>(newOrUsedMap);
				for (Map.Entry<Long, String> entry : localizedNewOrUsedMap.entrySet()) {
					localizedNewOrUsedMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedNewOrUsedMap;
				break;
				
			case("TravelAbility"):
				Map<Long, String> travelAbilityMap = referenceStore.getTravelAbilities(); 
				SortedMap<Long, String> localizedTravelAbilityMap = new TreeMap<Long, String>(travelAbilityMap);
				for (Map.Entry<Long, String> entry : localizedTravelAbilityMap.entrySet()) {
					localizedTravelAbilityMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedTravelAbilityMap;
				break;
				
			case("PledgeStatus"):
				Map<Long, String> sMap = referenceStore.getPledgeStatuses(); 
				SortedMap<Long, String> localizedsMap = new TreeMap<Long, String>(sMap);
				for (Map.Entry<Long, String> entry : localizedsMap.entrySet()) {
					localizedsMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedsMap;
				break;
		  
		
			default:
				returnValue.put(Long.valueOf(-1), "Internal Fault");
     	}

    	return returnValue;
    }
	
	/**
	 * Returns a JSON representation of a list of reference entries that can be used to populate a child select input.
	 * @param parentId the id option that is selected in the parent select input
	 * @param referenceType the referenceType indicating the refType of the returned reference entries
	 * @return a <code>SortedMap<Long,String></code> containing the reference entries that match the parentId
	 * and referenceTyoe parameters
	 */
	@RequestMapping(value = "/restful/referenceslistbyparent", method = RequestMethod.GET)
    public SortedMap<Long,String> getReferencesByParentId(@RequestParam(value="parentId") String parentId, @RequestParam(value="referenceType") String referenceType, Locale locale) {
		logger.info("Inside getReferencesByParentId() method...");
		SortedMap<Long,String> returnValue = new TreeMap<Long,String>();
		
		switch (referenceType) {
				  
			case("IrelandCounty"):
				Map<Long, String> irelandCountyMap = referenceStore.getIrelandCountyByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedIrelandCountyMap = new TreeMap<Long, String>(irelandCountyMap);
				for (Map.Entry<Long, String> entry : localizedIrelandCountyMap.entrySet()) {
					localizedIrelandCountyMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedIrelandCountyMap;
				break;
		  
				  
			case("AccommodationType"):
				Map<Long, String> accommodationTypeMap = referenceStore.getAccommodationTypeByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedAccommodationTypeMap = new TreeMap<Long, String>(accommodationTypeMap);
				for (Map.Entry<Long, String> entry : localizedAccommodationTypeMap.entrySet()) {
					localizedAccommodationTypeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedAccommodationTypeMap;
				break;
		  
				  
			case("AccommodationCondition"):
				Map<Long, String> accommodationConditionMap = referenceStore.getAccommodationConditionByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedAccommodationConditionMap = new TreeMap<Long, String>(accommodationConditionMap);
				for (Map.Entry<Long, String> entry : localizedAccommodationConditionMap.entrySet()) {
					localizedAccommodationConditionMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedAccommodationConditionMap;
				break;
		  
				  
			case("NumberOfBeds"):
				Map<Long, String> numberOfBedsMap = referenceStore.getNumberOfBedsByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedNumberOfBedsMap = new TreeMap<Long, String>(numberOfBedsMap);
				for (Map.Entry<Long, String> entry : localizedNumberOfBedsMap.entrySet()) {
					localizedNumberOfBedsMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedNumberOfBedsMap;
				break;
		  
				  
			case("VacantOrShared"):
				Map<Long, String> vacantOrSharedMap = referenceStore.getVacantOrSharedByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedVacantOrSharedMap = new TreeMap<Long, String>(vacantOrSharedMap);
				for (Map.Entry<Long, String> entry : localizedVacantOrSharedMap.entrySet()) {
					localizedVacantOrSharedMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedVacantOrSharedMap;
				break;
		  
				  
			case("YouCanAccommodate"):
				Map<Long, String> youCanAccommodateMap = referenceStore.getYouCanAccommodateByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedYouCanAccommodateMap = new TreeMap<Long, String>(youCanAccommodateMap);
				for (Map.Entry<Long, String> entry : localizedYouCanAccommodateMap.entrySet()) {
					localizedYouCanAccommodateMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedYouCanAccommodateMap;
				break;
		  
				  
			case("LocalAmenity"):
				Map<Long, String> localAmenityMap = referenceStore.getLocalAmenityByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedLocalAmenityMap = new TreeMap<Long, String>(localAmenityMap);
				for (Map.Entry<Long, String> entry : localizedLocalAmenityMap.entrySet()) {
					localizedLocalAmenityMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedLocalAmenityMap;
				break;
		  
				  
			case("MonthRange"):
				Map<Long, String> monthRangeMap = referenceStore.getMonthRangeByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedMonthRangeMap = new TreeMap<Long, String>(monthRangeMap);
				for (Map.Entry<Long, String> entry : localizedMonthRangeMap.entrySet()) {
					localizedMonthRangeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedMonthRangeMap;
				break;
		  
				  
			case("Yes_No"):
				Map<Long, String> yes_NoMap = referenceStore.getYes_NoByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedYes_NoMap = new TreeMap<Long, String>(yes_NoMap);
				for (Map.Entry<Long, String> entry : localizedYes_NoMap.entrySet()) {
					localizedYes_NoMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedYes_NoMap;
				break;
		  
				  
			case("EuropeCountry"):
				Map<Long, String> europeCountryMap = referenceStore.getEuropeCountryByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedEuropeCountryMap = new TreeMap<Long, String>(europeCountryMap);
				for (Map.Entry<Long, String> entry : localizedEuropeCountryMap.entrySet()) {
					localizedEuropeCountryMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedEuropeCountryMap;
				break;
		  
				  
			case("Facilities"):
				Map<Long, String> facilitiesMap = referenceStore.getFacilitiesByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedFacilitiesMap = new TreeMap<Long, String>(facilitiesMap);
				for (Map.Entry<Long, String> entry : localizedFacilitiesMap.entrySet()) {
					localizedFacilitiesMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedFacilitiesMap;
				break;
		  
				  
			case("IntegerCount1to40"):
				Map<Long, String> integerCount1to40Map = referenceStore.getIntegerCount1to40ByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedIntegerCount1to40Map = new TreeMap<Long, String>(integerCount1to40Map);
				for (Map.Entry<Long, String> entry : localizedIntegerCount1to40Map.entrySet()) {
					localizedIntegerCount1to40Map.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedIntegerCount1to40Map;
				break;
		  
				  
			case("PledgeServiceLevelOne"):
				Map<Long, String> pledgeServiceLevelOneMap = referenceStore.getPledgeServiceLevelOneByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedPledgeServiceLevelOneMap = new TreeMap<Long, String>(pledgeServiceLevelOneMap);
				for (Map.Entry<Long, String> entry : localizedPledgeServiceLevelOneMap.entrySet()) {
					localizedPledgeServiceLevelOneMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedPledgeServiceLevelOneMap;
				break;
		  
				  
			case("PledgeServiceLevelTwo"):
				Map<Long, String> pledgeServiceLevelTwoMap = referenceStore.getPledgeServiceLevelTwoByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedPledgeServiceLevelTwoMap = new TreeMap<Long, String>(pledgeServiceLevelTwoMap);
				for (Map.Entry<Long, String> entry : localizedPledgeServiceLevelTwoMap.entrySet()) {
					localizedPledgeServiceLevelTwoMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedPledgeServiceLevelTwoMap;
				break;
		  
				  
			case("GoodsCategoryOne"):
				Map<Long, String> goodsCategoryOneMap = referenceStore.getGoodsCategoryOneByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedGoodsCategoryOneMap = new TreeMap<Long, String>(goodsCategoryOneMap);
				for (Map.Entry<Long, String> entry : localizedGoodsCategoryOneMap.entrySet()) {
					localizedGoodsCategoryOneMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsCategoryOneMap;
				break;
		  
				  
			case("GoodsCategoryTwo"):
				Map<Long, String> goodsCategoryTwoMap = referenceStore.getGoodsCategoryTwoByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedGoodsCategoryTwoMap = new TreeMap<Long, String>(goodsCategoryTwoMap);
				for (Map.Entry<Long, String> entry : localizedGoodsCategoryTwoMap.entrySet()) {
					localizedGoodsCategoryTwoMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsCategoryTwoMap;
				break;
		  
				  
			case("GoodsCondition"):
				// Mods MOC 24/06/2016: Hard coded reference relationships for goods pledge dropdowns
				if (parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__TRANSPORT)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__SPECIALIST_ITEMS))){
					parentId = Long.toString(Constants.REFERENCE_GOODSCATEGORYONE__TECHNOLOGY);
				}
				
				Map<Long, String> goodsConditionMap = referenceStore.getGoodsConditionByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedGoodsConditionMap = new TreeMap<Long, String>(goodsConditionMap);
				for (Map.Entry<Long, String> entry : localizedGoodsConditionMap.entrySet()) {
					localizedGoodsConditionMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsConditionMap;
				break;
		  
				  
			case("OwnerOccupierType"):
				Map<Long, String> ownerOccupierTypeMap = referenceStore.getOwnerOccupierTypeByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedOwnerOccupierTypeMap = new TreeMap<Long, String>(ownerOccupierTypeMap);
				for (Map.Entry<Long, String> entry : localizedOwnerOccupierTypeMap.entrySet()) {
					localizedOwnerOccupierTypeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedOwnerOccupierTypeMap;
				break;
		  
				  
			case("Locale"):
				Map<Long, String> localeMap = referenceStore.getLocaleByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedLocaleMap = new TreeMap<Long, String>(localeMap);
				for (Map.Entry<Long, String> entry : localizedLocaleMap.entrySet()) {
					localizedLocaleMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedLocaleMap;
				break;
		  
				  
			case("UserRole"):
				Map<Long, String> userRoleMap = referenceStore.getUserRoleByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedUserRoleMap = new TreeMap<Long, String>(userRoleMap);
				for (Map.Entry<Long, String> entry : localizedUserRoleMap.entrySet()) {
					localizedUserRoleMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedUserRoleMap;
				break;
		  
				  
			case("PledgeServiceLevelThree"):
				Map<Long, String> pledgeServiceLevelThreeMap = referenceStore.getPledgeServiceLevelThreeByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedPledgeServiceLevelThreeMap = new TreeMap<Long, String>(pledgeServiceLevelThreeMap);
				for (Map.Entry<Long, String> entry : localizedPledgeServiceLevelThreeMap.entrySet()) {
					localizedPledgeServiceLevelThreeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedPledgeServiceLevelThreeMap;
				break;
		  
				  
			case("GoodsCategoryThree"):
				Map<Long, String> goodsCategoryThreeMap = referenceStore.getGoodsCategoryThreeByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedGoodsCategoryThreeMap = new TreeMap<Long, String>(goodsCategoryThreeMap);
				for (Map.Entry<Long, String> entry : localizedGoodsCategoryThreeMap.entrySet()) {
					localizedGoodsCategoryThreeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsCategoryThreeMap;
				break;
		  
				  
			case("GoodsSize"):
				Map<Long, String> goodsSizeMap = referenceStore.getGoodsSizeByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedGoodsSizeMap = new TreeMap<Long, String>(goodsSizeMap);
				for (Map.Entry<Long, String> entry : localizedGoodsSizeMap.entrySet()) {
					localizedGoodsSizeMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsSizeMap;
				break;
		  
				  
			case("GoodsQuantity"):
				// Mods MOC 24/06/2016: Hard coded reference relationships for goods pledge dropdowns
				if (parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__BABIES_AND_CHILDRENS_CLOTHES))){
					parentId = Long.toString(Constants.REFERENCE_GOODSCATEGORYONE__ADULT_CLOTHING);
				}

				// Mods MOC 24/06/2016: Hard coded reference relationships for goods pledge dropdowns
				if (parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__BABIES_AND_CHILDRENS_FOOTWEAR)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__ADULT_FOOTWEAR)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__FURNITURE)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__BABIES_AND_CHILDRENS_ITEMS)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__TRANSPORT)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__OUTDOOR_LIVING)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__PERSONAL)) || parentId.equals(String.valueOf(Constants.REFERENCE_GOODSCATEGORYONE__SPECIALIST_ITEMS))){
					parentId = Long.toString(Constants.REFERENCE_GOODSCATEGORYONE__TECHNOLOGY);
				}
			
				Map<Long, String> goodsQuantityMap = referenceStore.getGoodsQuantityByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedGoodsQuantityMap = new TreeMap<Long, String>(goodsQuantityMap);
				for (Map.Entry<Long, String> entry : localizedGoodsQuantityMap.entrySet()) {
					localizedGoodsQuantityMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedGoodsQuantityMap;
				break;
		  
				  
			case("NewOrUsed"):
				Map<Long, String> newOrUsedMap = referenceStore.getNewOrUsedByParentId(Long.valueOf(parentId));
				SortedMap<Long, String> localizedNewOrUsedMap = new TreeMap<Long, String>(newOrUsedMap);
				for (Map.Entry<Long, String> entry : localizedNewOrUsedMap.entrySet()) {
					localizedNewOrUsedMap.replace(entry.getKey(), messageSource.getMessage(entry.getValue(), new String[0], locale));
				}
				returnValue = localizedNewOrUsedMap;
				break;
		  
		
			default:
				returnValue.put(Long.valueOf(-1), "Internal Fault");
     	}

    	return returnValue;
    }
	
}
