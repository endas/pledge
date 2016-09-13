package org.volunteertech.pledges.reference;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryDao;
import org.volunteertech.pledges.reference.dao.ReferenceDao;

import java.util.SortedMap;
import java.util.List;


/**
 * Static Singleton class that holds TreeMaps (SortedMap) representing a Collection of RefTypes from the
 * REFERENCE table. The TreeMaps (SortedMap) are used to load the contents of drop-downs on screens directly
 * from the database. Each <default-value> that is entered against the Reference bean in Application.xml
 * is loaded into a Map and made available here.
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
public interface ReferenceStore
{
    /**
     * Allows the injection of the ReferenceCategoryDao data access object
     */
    public void setReferenceCategoryDao(ReferenceCategoryDao ReferenceCategoryDao);

    /**
     * Allows the injection of the ReferenceDao data access object
     */
    public void setReferenceDao(ReferenceDao referenceDao);

	/**
	 *	Perform class post processing initialisation
	 */    
    public void initialiseReferenceStore();    
    
	
	/**
	 * Returns the Sorted Map that represents the values of the irelandCounty RefType
	 * @return
	 */
	public SortedMap<Long,String> getIrelandCounty();	
	
	/**
	 * Initialise the possible choices for IrelandCounty
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseIrelandCounty();
	
	/**
	 * Returns the Sorted Map that represents the values of the irelandCounty RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getIrelandCountyByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the accommodationType RefType
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationType();	
	
	/**
	 * Initialise the possible choices for AccommodationType
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseAccommodationType();
	
	/**
	 * Returns the Sorted Map that represents the values of the accommodationType RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationTypeByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the accommodationCondition RefType
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationCondition();	
	
	/**
	 * Initialise the possible choices for AccommodationCondition
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseAccommodationCondition();
	
	/**
	 * Returns the Sorted Map that represents the values of the accommodationCondition RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationConditionByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the numberOfBeds RefType
	 * @return
	 */
	public SortedMap<Long,String> getNumberOfBeds();	
	
	/**
	 * Initialise the possible choices for NumberOfBeds
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseNumberOfBeds();
	
	/**
	 * Returns the Sorted Map that represents the values of the numberOfBeds RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getNumberOfBedsByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the vacantOrShared RefType
	 * @return
	 */
	public SortedMap<Long,String> getVacantOrShared();	
	
	/**
	 * Initialise the possible choices for VacantOrShared
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseVacantOrShared();
	
	/**
	 * Returns the Sorted Map that represents the values of the vacantOrShared RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getVacantOrSharedByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the youCanAccommodate RefType
	 * @return
	 */
	public SortedMap<Long,String> getYouCanAccommodate();	
	
	/**
	 * Initialise the possible choices for YouCanAccommodate
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseYouCanAccommodate();
	
	/**
	 * Returns the Sorted Map that represents the values of the youCanAccommodate RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getYouCanAccommodateByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the localAmenity RefType
	 * @return
	 */
	public SortedMap<Long,String> getLocalAmenity();	
	
	/**
	 * Initialise the possible choices for LocalAmenity
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseLocalAmenity();
	
	/**
	 * Returns the Sorted Map that represents the values of the localAmenity RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getLocalAmenityByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the monthRange RefType
	 * @return
	 */
	public SortedMap<Long,String> getMonthRange();	
	
	/**
	 * Initialise the possible choices for MonthRange
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseMonthRange();
	
	/**
	 * Returns the Sorted Map that represents the values of the monthRange RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getMonthRangeByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the yes_No RefType
	 * @return
	 */
	public SortedMap<Long,String> getYes_No();	
	
	/**
	 * Initialise the possible choices for Yes_No
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseYes_No();
	
	/**
	 * Returns the Sorted Map that represents the values of the yes_No RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getYes_NoByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the europeCountry RefType
	 * @return
	 */
	public SortedMap<Long,String> getEuropeCountry();	
	
	/**
	 * Initialise the possible choices for EuropeCountry
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseEuropeCountry();
	
	/**
	 * Returns the Sorted Map that represents the values of the europeCountry RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getEuropeCountryByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the facilities RefType
	 * @return
	 */
	public SortedMap<Long,String> getFacilities();	
	
	/**
	 * Initialise the possible choices for Facilities
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseFacilities();
	
	/**
	 * Returns the Sorted Map that represents the values of the facilities RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getFacilitiesByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the integerCount1to40 RefType
	 * @return
	 */
	public SortedMap<Long,String> getIntegerCount1to40();	
	
	/**
	 * Initialise the possible choices for IntegerCount1to40
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseIntegerCount1to40();
	
	/**
	 * Returns the Sorted Map that represents the values of the integerCount1to40 RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getIntegerCount1to40ByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the pledgeServiceLevelOne RefType
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelOne();	
	
	/**
	 * Initialise the possible choices for PledgeServiceLevelOne
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeServiceLevelOne();
	
	/**
	 * Returns the Sorted Map that represents the values of the pledgeServiceLevelOne RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelOneByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the pledgeServiceLevelTwo RefType
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelTwo();	
	
	/**
	 * Initialise the possible choices for PledgeServiceLevelTwo
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeServiceLevelTwo();
	
	/**
	 * Returns the Sorted Map that represents the values of the pledgeServiceLevelTwo RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelTwoByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the goodsCategoryOne RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryOne();	
	
	/**
	 * Initialise the possible choices for GoodsCategoryOne
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCategoryOne();
	
	/**
	 * Returns the Sorted Map that represents the values of the goodsCategoryOne RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryOneByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the goodsCategoryTwo RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryTwo();	
	
	/**
	 * Initialise the possible choices for GoodsCategoryTwo
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCategoryTwo();
	
	/**
	 * Returns the Sorted Map that represents the values of the goodsCategoryTwo RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryTwoByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the goodsCondition RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCondition();	
	
	/**
	 * Initialise the possible choices for GoodsCondition
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCondition();
	
	/**
	 * Returns the Sorted Map that represents the values of the goodsCondition RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsConditionByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the ownerOccupierType RefType
	 * @return
	 */
	public SortedMap<Long,String> getOwnerOccupierType();	
	
	/**
	 * Initialise the possible choices for OwnerOccupierType
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseOwnerOccupierType();
	
	/**
	 * Returns the Sorted Map that represents the values of the ownerOccupierType RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getOwnerOccupierTypeByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the locale RefType
	 * @return
	 */
	public SortedMap<Long,String> getLocale();	
	
	/**
	 * Initialise the possible choices for Locale
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseLocale();
	
	/**
	 * Returns the Sorted Map that represents the values of the locale RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getLocaleByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the userRole RefType
	 * @return
	 */
	public SortedMap<Long,String> getUserRole();	
	
	/**
	 * Initialise the possible choices for UserRole
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseUserRole();
	
	/**
	 * Returns the Sorted Map that represents the values of the userRole RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getUserRoleByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the pledgeServiceLevelThree RefType
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelThree();	
	
	/**
	 * Initialise the possible choices for PledgeServiceLevelThree
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeServiceLevelThree();
	
	/**
	 * Returns the Sorted Map that represents the values of the pledgeServiceLevelThree RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelThreeByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the goodsCategoryThree RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryThree();	
	
	/**
	 * Initialise the possible choices for GoodsCategoryThree
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCategoryThree();
	
	/**
	 * Returns the Sorted Map that represents the values of the goodsCategoryThree RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryThreeByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the goodsSize RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsSize();	
	
	/**
	 * Initialise the possible choices for GoodsSize
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsSize();
	
	/**
	 * Returns the Sorted Map that represents the values of the goodsSize RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsSizeByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the goodsQuantity RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsQuantity();	
	
	/**
	 * Initialise the possible choices for GoodsQuantity
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsQuantity();
	
	/**
	 * Returns the Sorted Map that represents the values of the goodsQuantity RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsQuantityByParentId(Long parentId);	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the newOrUsed RefType
	 * @return
	 */
	public SortedMap<Long,String> getNewOrUsed();	
	
	/**
	 * Initialise the possible choices for NewOrUsed
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseNewOrUsed();
	
	/**
	 * Returns the Sorted Map that represents the values of the newOrUsed RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getNewOrUsedByParentId(Long parentId);	
	
	

	
    /**
     * Returns the reference description of the reference record with the primary key denoted by the referenceId parameter.
     * @param referenceId the referenceId for which the corresponding reference description will be returned.
     */
    public String getRefDesc(Long referenceId);
	
    
    public SortedMap<Long,String> getTravelAbilities();	
    
    public SortedMap<Long,String> getPledgeStatuses();	
}
