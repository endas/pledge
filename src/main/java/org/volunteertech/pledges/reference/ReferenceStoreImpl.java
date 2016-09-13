package org.volunteertech.pledges.reference;
import org.volunteertech.pledges.main.constants.Constants;
import org.volunteertech.pledges.reference.dao.ReferenceCategoryDao;
import org.volunteertech.pledges.reference.dao.ReferenceDao;
import org.volunteertech.pledges.reference.dao.Reference;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.SortedMap;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


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
public class ReferenceStoreImpl implements ReferenceStore
{
    final static Logger logger = LoggerFactory.getLogger(ReferenceStore.class);
    
    /**
     * The data access object used to access the ReferenceCategory data
     */
    private ReferenceCategoryDao referenceCategoryDao;

    /**
     * The data access object used to access the Reference data
     */
    private ReferenceDao referenceDao;
    
    /**
     * The Look up Map used to access all Reference data
     */
    private Map<Long, Reference> referenceMap;
    
    
	
	/**
	 * Map to hold values related to the IrelandCounty Reference Type
	 */
	private SortedMap<Long,String> irelandCounty = null;
	
	/**
	 * Map to hold values related to the IrelandCounty Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> irelandCountyByParentId = null;
	
	
	/**
	 * Map to hold values related to the AccommodationType Reference Type
	 */
	private SortedMap<Long,String> accommodationType = null;
	
	/**
	 * Map to hold values related to the AccommodationType Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> accommodationTypeByParentId = null;
	
	
	/**
	 * Map to hold values related to the AccommodationCondition Reference Type
	 */
	private SortedMap<Long,String> accommodationCondition = null;
	
	/**
	 * Map to hold values related to the AccommodationCondition Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> accommodationConditionByParentId = null;
	
	
	/**
	 * Map to hold values related to the NumberOfBeds Reference Type
	 */
	private SortedMap<Long,String> numberOfBeds = null;
	
	/**
	 * Map to hold values related to the NumberOfBeds Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> numberOfBedsByParentId = null;
	
	
	/**
	 * Map to hold values related to the VacantOrShared Reference Type
	 */
	private SortedMap<Long,String> vacantOrShared = null;
	
	/**
	 * Map to hold values related to the VacantOrShared Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> vacantOrSharedByParentId = null;
	
	
	/**
	 * Map to hold values related to the YouCanAccommodate Reference Type
	 */
	private SortedMap<Long,String> youCanAccommodate = null;
	
	/**
	 * Map to hold values related to the YouCanAccommodate Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> youCanAccommodateByParentId = null;
	
	
	/**
	 * Map to hold values related to the LocalAmenity Reference Type
	 */
	private SortedMap<Long,String> localAmenity = null;
	
	/**
	 * Map to hold values related to the LocalAmenity Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> localAmenityByParentId = null;
	
	
	/**
	 * Map to hold values related to the MonthRange Reference Type
	 */
	private SortedMap<Long,String> monthRange = null;
	
	/**
	 * Map to hold values related to the MonthRange Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> monthRangeByParentId = null;
	
	
	/**
	 * Map to hold values related to the Yes_No Reference Type
	 */
	private SortedMap<Long,String> yes_No = null;
	
	/**
	 * Map to hold values related to the Yes_No Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> yes_NoByParentId = null;
	
	
	/**
	 * Map to hold values related to the EuropeCountry Reference Type
	 */
	private SortedMap<Long,String> europeCountry = null;
	
	/**
	 * Map to hold values related to the EuropeCountry Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> europeCountryByParentId = null;
	
	
	/**
	 * Map to hold values related to the Facilities Reference Type
	 */
	private SortedMap<Long,String> facilities = null;
	
	/**
	 * Map to hold values related to the Facilities Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> facilitiesByParentId = null;
	
	
	/**
	 * Map to hold values related to the IntegerCount1to40 Reference Type
	 */
	private SortedMap<Long,String> integerCount1to40 = null;
	
	/**
	 * Map to hold values related to the IntegerCount1to40 Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> integerCount1to40ByParentId = null;
	
	
	/**
	 * Map to hold values related to the PledgeServiceLevelOne Reference Type
	 */
	private SortedMap<Long,String> pledgeServiceLevelOne = null;
	
	/**
	 * Map to hold values related to the PledgeServiceLevelOne Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> pledgeServiceLevelOneByParentId = null;
	
	
	/**
	 * Map to hold values related to the PledgeServiceLevelTwo Reference Type
	 */
	private SortedMap<Long,String> pledgeServiceLevelTwo = null;
	
	/**
	 * Map to hold values related to the PledgeServiceLevelTwo Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> pledgeServiceLevelTwoByParentId = null;
	
	
	/**
	 * Map to hold values related to the GoodsCategoryOne Reference Type
	 */
	private SortedMap<Long,String> goodsCategoryOne = null;
	
	/**
	 * Map to hold values related to the GoodsCategoryOne Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> goodsCategoryOneByParentId = null;
	
	
	/**
	 * Map to hold values related to the GoodsCategoryTwo Reference Type
	 */
	private SortedMap<Long,String> goodsCategoryTwo = null;
	
	/**
	 * Map to hold values related to the GoodsCategoryTwo Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> goodsCategoryTwoByParentId = null;
	
	
	/**
	 * Map to hold values related to the GoodsCondition Reference Type
	 */
	private SortedMap<Long,String> goodsCondition = null;
	
	/**
	 * Map to hold values related to the GoodsCondition Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> goodsConditionByParentId = null;
	
	
	/**
	 * Map to hold values related to the OwnerOccupierType Reference Type
	 */
	private SortedMap<Long,String> ownerOccupierType = null;
	
	/**
	 * Map to hold values related to the OwnerOccupierType Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> ownerOccupierTypeByParentId = null;
	
	
	/**
	 * Map to hold values related to the Locale Reference Type
	 */
	private SortedMap<Long,String> locale = null;
	
	/**
	 * Map to hold values related to the Locale Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> localeByParentId = null;
	
	
	/**
	 * Map to hold values related to the UserRole Reference Type
	 */
	private SortedMap<Long,String> userRole = null;
	
	/**
	 * Map to hold values related to the UserRole Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> userRoleByParentId = null;
	
	
	/**
	 * Map to hold values related to the PledgeServiceLevelThree Reference Type
	 */
	private SortedMap<Long,String> pledgeServiceLevelThree = null;
	
	/**
	 * Map to hold values related to the PledgeServiceLevelThree Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> pledgeServiceLevelThreeByParentId = null;
	
	
	/**
	 * Map to hold values related to the GoodsCategoryThree Reference Type
	 */
	private SortedMap<Long,String> goodsCategoryThree = null;
	
	/**
	 * Map to hold values related to the GoodsCategoryThree Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> goodsCategoryThreeByParentId = null;
	
	
	/**
	 * Map to hold values related to the GoodsSize Reference Type
	 */
	private SortedMap<Long,String> goodsSize = null;
	
	/**
	 * Map to hold values related to the GoodsSize Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> goodsSizeByParentId = null;
	
	
	/**
	 * Map to hold values related to the GoodsQuantity Reference Type
	 */
	private SortedMap<Long,String> goodsQuantity = null;
	
	/**
	 * Map to hold values related to the GoodsQuantity Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> goodsQuantityByParentId = null;
	
	
	/**
	 * Map to hold values related to the NewOrUsed Reference Type
	 */
	private SortedMap<Long,String> newOrUsed = null;
	
	/**
	 * Map to hold values related to the NewOrUsed Reference Type but sorted by parentId to provide
	 * caching for parent driven select boxes
	 */
	private SortedMap<Long,TreeMap<Long,String>> newOrUsedByParentId = null;
	
	/**
	 * Map to hold values related to the Travel Ability Reference Type
	 */
	private SortedMap<Long,String> travelAbilities = null;
	

	/**
	 * I'm adding this to be consistent.. but really, I think its all ridiculous.. The whole thing.
	 */
	private SortedMap<Long,String> pledgeStatuses = null;
	
    /**
     * Default Constructor for the ReferenceStore class
     */
     
    public ReferenceStoreImpl()
    {
	}
	
	/**
	 *	Perform class post processing initialisation
	 */    
    public void initialiseReferenceStore(){
		try
		{
			referenceMap = new HashMap<Long, Reference>();
			// Load all Reference values
			List<Reference> referenceRecords = this.referenceDao.listReference();
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				Reference dataRow =(Reference)it.next();
				referenceMap.put(dataRow.getId(), dataRow);
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of referenceMap failed", ex);
		}
    
    
		irelandCounty = initialiseIrelandCounty();		
		accommodationType = initialiseAccommodationType();		
		accommodationCondition = initialiseAccommodationCondition();		
		numberOfBeds = initialiseNumberOfBeds();		
		vacantOrShared = initialiseVacantOrShared();		
		youCanAccommodate = initialiseYouCanAccommodate();		
		localAmenity = initialiseLocalAmenity();		
		monthRange = initialiseMonthRange();		
		yes_No = initialiseYes_No();		
		europeCountry = initialiseEuropeCountry();		
		facilities = initialiseFacilities();		
		integerCount1to40 = initialiseIntegerCount1to40();		
		pledgeServiceLevelOne = initialisePledgeServiceLevelOne();		
		pledgeServiceLevelTwo = initialisePledgeServiceLevelTwo();		
		goodsCategoryOne = initialiseGoodsCategoryOne();		
		goodsCategoryTwo = initialiseGoodsCategoryTwo();		
		goodsCondition = initialiseGoodsCondition();		
		ownerOccupierType = initialiseOwnerOccupierType();		
		locale = initialiseLocale();		
		userRole = initialiseUserRole();		
		pledgeServiceLevelThree = initialisePledgeServiceLevelThree();		
		goodsCategoryThree = initialiseGoodsCategoryThree();		
		goodsSize = initialiseGoodsSize();		
		goodsQuantity = initialiseGoodsQuantity();		
		newOrUsed = initialiseNewOrUsed();		
		travelAbilities = initialiseTravelAbilities();
		pledgeStatuses = initialisePledgeStatuses();
    }
	
    /**
     * Allows the injection of the ReferenceCategoryDao data access object
     */
    public void setReferenceCategoryDao(ReferenceCategoryDao referenceCategoryDao){
    	this.referenceCategoryDao = referenceCategoryDao;
    }
	
    /**
     * Allows the injection of the ReferenceDao data access object
     */
    public void setReferenceDao(ReferenceDao referenceDao){
        this.referenceDao = referenceDao;
    }
    
    /**
     * Returns the reference description of the reference record with the primary key denoted by the referenceId parameter.
     * @param referenceId the referenceId for which the corresponding reference description will be returned.
     */
    public String getRefDesc(Long referenceId){
    
    	try {
			String refDesc = referenceMap.get(referenceId).getRefDesc(); 
			return refDesc;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
    }
	
	
	/**
	 * Returns the Sorted Map that represents the values of the IrelandCounty RefType
	 * @return
	 */
	public SortedMap<Long,String> getIrelandCounty()
	{
		if (irelandCounty == null)
		{
			initialiseIrelandCounty();
		}
		return irelandCounty;
	}

	/**
	 * Returns the Sorted Map that represents the values of the IrelandCounty RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getIrelandCountyByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (irelandCountyByParentId == null)
		{
			initialiseIrelandCounty();
		}
		
		if (parentId != null){
			returnValue = irelandCountyByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for IrelandCounty
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseIrelandCounty()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the IrelandCounty dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc IrelandCounty
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_IRELANDCOUNTY, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("IrelandCounty");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of IrelandCounty dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the IrelandCountyByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc IrelandCounty and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.irelandCountyByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of IrelandCounty dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the AccommodationType RefType
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationType()
	{
		if (accommodationType == null)
		{
			initialiseAccommodationType();
		}
		return accommodationType;
	}

	/**
	 * Returns the Sorted Map that represents the values of the AccommodationType RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationTypeByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (accommodationTypeByParentId == null)
		{
			initialiseAccommodationType();
		}
		
		if (parentId != null){
			returnValue = accommodationTypeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for AccommodationType
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseAccommodationType()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the AccommodationType dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc AccommodationType
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_ACCOMMODATIONTYPE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("AccommodationType");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of AccommodationType dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the AccommodationTypeByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc AccommodationType and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.accommodationTypeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of AccommodationType dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the AccommodationCondition RefType
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationCondition()
	{
		if (accommodationCondition == null)
		{
			initialiseAccommodationCondition();
		}
		return accommodationCondition;
	}

	/**
	 * Returns the Sorted Map that represents the values of the AccommodationCondition RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getAccommodationConditionByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (accommodationConditionByParentId == null)
		{
			initialiseAccommodationCondition();
		}
		
		if (parentId != null){
			returnValue = accommodationConditionByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for AccommodationCondition
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseAccommodationCondition()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the AccommodationCondition dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc AccommodationCondition
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_ACCOMMODATIONCONDITION, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("AccommodationCondition");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of AccommodationCondition dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the AccommodationConditionByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc AccommodationCondition and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.accommodationConditionByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of AccommodationCondition dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the NumberOfBeds RefType
	 * @return
	 */
	public SortedMap<Long,String> getNumberOfBeds()
	{
		if (numberOfBeds == null)
		{
			initialiseNumberOfBeds();
		}
		return numberOfBeds;
	}

	/**
	 * Returns the Sorted Map that represents the values of the NumberOfBeds RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getNumberOfBedsByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (numberOfBedsByParentId == null)
		{
			initialiseNumberOfBeds();
		}
		
		if (parentId != null){
			returnValue = numberOfBedsByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for NumberOfBeds
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseNumberOfBeds()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the NumberOfBeds dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc NumberOfBeds
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_NUMBEROFBEDS, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("NumberOfBeds");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of NumberOfBeds dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the NumberOfBedsByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc NumberOfBeds and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.numberOfBedsByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of NumberOfBeds dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the VacantOrShared RefType
	 * @return
	 */
	public SortedMap<Long,String> getVacantOrShared()
	{
		if (vacantOrShared == null)
		{
			initialiseVacantOrShared();
		}
		return vacantOrShared;
	}

	/**
	 * Returns the Sorted Map that represents the values of the VacantOrShared RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getVacantOrSharedByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (vacantOrSharedByParentId == null)
		{
			initialiseVacantOrShared();
		}
		
		if (parentId != null){
			returnValue = vacantOrSharedByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for VacantOrShared
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseVacantOrShared()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the VacantOrShared dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc VacantOrShared
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_VACANTORSHARED, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("VacantOrShared");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of VacantOrShared dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the VacantOrSharedByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc VacantOrShared and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.vacantOrSharedByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of VacantOrShared dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the YouCanAccommodate RefType
	 * @return
	 */
	public SortedMap<Long,String> getYouCanAccommodate()
	{
		if (youCanAccommodate == null)
		{
			initialiseYouCanAccommodate();
		}
		return youCanAccommodate;
	}

	/**
	 * Returns the Sorted Map that represents the values of the YouCanAccommodate RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getYouCanAccommodateByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (youCanAccommodateByParentId == null)
		{
			initialiseYouCanAccommodate();
		}
		
		if (parentId != null){
			returnValue = youCanAccommodateByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for YouCanAccommodate
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseYouCanAccommodate()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the YouCanAccommodate dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc YouCanAccommodate
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_YOUCANACCOMMODATE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("YouCanAccommodate");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of YouCanAccommodate dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the YouCanAccommodateByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc YouCanAccommodate and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.youCanAccommodateByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of YouCanAccommodate dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the LocalAmenity RefType
	 * @return
	 */
	public SortedMap<Long,String> getLocalAmenity()
	{
		if (localAmenity == null)
		{
			initialiseLocalAmenity();
		}
		return localAmenity;
	}

	/**
	 * Returns the Sorted Map that represents the values of the LocalAmenity RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getLocalAmenityByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (localAmenityByParentId == null)
		{
			initialiseLocalAmenity();
		}
		
		if (parentId != null){
			returnValue = localAmenityByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for LocalAmenity
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseLocalAmenity()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the LocalAmenity dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc LocalAmenity
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_LOCALAMENITY, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("LocalAmenity");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of LocalAmenity dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the LocalAmenityByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc LocalAmenity and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.localAmenityByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of LocalAmenity dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the MonthRange RefType
	 * @return
	 */
	public SortedMap<Long,String> getMonthRange()
	{
		if (monthRange == null)
		{
			initialiseMonthRange();
		}
		return monthRange;
	}

	/**
	 * Returns the Sorted Map that represents the values of the MonthRange RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getMonthRangeByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (monthRangeByParentId == null)
		{
			initialiseMonthRange();
		}
		
		if (parentId != null){
			returnValue = monthRangeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for MonthRange
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseMonthRange()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the MonthRange dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc MonthRange
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_MONTHRANGE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("MonthRange");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of MonthRange dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the MonthRangeByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc MonthRange and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.monthRangeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of MonthRange dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the Yes_No RefType
	 * @return
	 */
	public SortedMap<Long,String> getYes_No()
	{
		if (yes_No == null)
		{
			initialiseYes_No();
		}
		return yes_No;
	}

	/**
	 * Returns the Sorted Map that represents the values of the Yes_No RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getYes_NoByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (yes_NoByParentId == null)
		{
			initialiseYes_No();
		}
		
		if (parentId != null){
			returnValue = yes_NoByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for Yes_No
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseYes_No()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the Yes_No dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Yes_No
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_YES_NO, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("Yes_No");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Yes_No dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the Yes_NoByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Yes_No and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.yes_NoByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Yes_No dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the EuropeCountry RefType
	 * @return
	 */
	public SortedMap<Long,String> getEuropeCountry()
	{
		if (europeCountry == null)
		{
			initialiseEuropeCountry();
		}
		return europeCountry;
	}

	/**
	 * Returns the Sorted Map that represents the values of the EuropeCountry RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getEuropeCountryByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (europeCountryByParentId == null)
		{
			initialiseEuropeCountry();
		}
		
		if (parentId != null){
			returnValue = europeCountryByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for EuropeCountry
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseEuropeCountry()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the EuropeCountry dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc EuropeCountry
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_EUROPECOUNTRY, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("EuropeCountry");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of EuropeCountry dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the EuropeCountryByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc EuropeCountry and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.europeCountryByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of EuropeCountry dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the Facilities RefType
	 * @return
	 */
	public SortedMap<Long,String> getFacilities()
	{
		if (facilities == null)
		{
			initialiseFacilities();
		}
		return facilities;
	}

	/**
	 * Returns the Sorted Map that represents the values of the Facilities RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getFacilitiesByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (facilitiesByParentId == null)
		{
			initialiseFacilities();
		}
		
		if (parentId != null){
			returnValue = facilitiesByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for Facilities
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseFacilities()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the Facilities dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Facilities
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_FACILITIES, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("Facilities");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Facilities dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the FacilitiesByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Facilities and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.facilitiesByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Facilities dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	
	/**
	 * Initialise the possible choices for Facilities
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseTravelAbilities()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the Travel Abilities dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Facilities
			
//			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_TRAVEL_ABILITIES, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("TravelAbility");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Travel Ability dropdown buffer failed", ex);
		}
		
		return map;
	}    
	/**
	 * Initialise the possible choices for Facilities
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeStatuses()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;
		logger.debug("Initialising the thing wot we want to make! YEH");
		try
		{
			referenceRecords = this.referenceDao.listReferenceByRefType("PledgeStatus");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of yer thing failed. Deal with that!", ex);
		}
		return map;
	}  
	
	
	

	/**
	 * Returns the Sorted Map that represents the values of the IntegerCount1to40 RefType
	 * @return
	 */
	public SortedMap<Long,String> getIntegerCount1to40()
	{
		if (integerCount1to40 == null)
		{
			initialiseIntegerCount1to40();
		}
		return integerCount1to40;
	}

	/**
	 * Returns the Sorted Map that represents the values of the IntegerCount1to40 RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getIntegerCount1to40ByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (integerCount1to40ByParentId == null)
		{
			initialiseIntegerCount1to40();
		}
		
		if (parentId != null){
			returnValue = integerCount1to40ByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for IntegerCount1to40
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseIntegerCount1to40()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the IntegerCount1to40 dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc IntegerCount1to40
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_INTEGERCOUNT1TO40, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("IntegerCount1to40");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of IntegerCount1to40 dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the IntegerCount1to40ByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc IntegerCount1to40 and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.integerCount1to40ByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of IntegerCount1to40 dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the PledgeServiceLevelOne RefType
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelOne()
	{
		if (pledgeServiceLevelOne == null)
		{
			initialisePledgeServiceLevelOne();
		}
		return pledgeServiceLevelOne;
	}

	/**
	 * Returns the Sorted Map that represents the values of the PledgeServiceLevelOne RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelOneByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (pledgeServiceLevelOneByParentId == null)
		{
			initialisePledgeServiceLevelOne();
		}
		
		if (parentId != null){
			returnValue = pledgeServiceLevelOneByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for PledgeServiceLevelOne
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeServiceLevelOne()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the PledgeServiceLevelOne dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc PledgeServiceLevelOne
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_PLEDGESERVICELEVELONE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("PledgeServiceLevelOne");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of PledgeServiceLevelOne dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the PledgeServiceLevelOneByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc PledgeServiceLevelOne and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.pledgeServiceLevelOneByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of PledgeServiceLevelOne dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the PledgeServiceLevelTwo RefType
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelTwo()
	{
		if (pledgeServiceLevelTwo == null)
		{
			initialisePledgeServiceLevelTwo();
		}
		return pledgeServiceLevelTwo;
	}

	/**
	 * Returns the Sorted Map that represents the values of the PledgeServiceLevelTwo RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelTwoByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (pledgeServiceLevelTwoByParentId == null)
		{
			initialisePledgeServiceLevelTwo();
		}
		
		if (parentId != null){
			returnValue = pledgeServiceLevelTwoByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for PledgeServiceLevelTwo
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeServiceLevelTwo()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the PledgeServiceLevelTwo dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc PledgeServiceLevelTwo
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_PLEDGESERVICELEVELTWO, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("PledgeServiceLevelTwo");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of PledgeServiceLevelTwo dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the PledgeServiceLevelTwoByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc PledgeServiceLevelTwo and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.pledgeServiceLevelTwoByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of PledgeServiceLevelTwo dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCategoryOne RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryOne()
	{
		if (goodsCategoryOne == null)
		{
			initialiseGoodsCategoryOne();
		}
		return goodsCategoryOne;
	}

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCategoryOne RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryOneByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (goodsCategoryOneByParentId == null)
		{
			initialiseGoodsCategoryOne();
		}
		
		if (parentId != null){
			returnValue = goodsCategoryOneByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for GoodsCategoryOne
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCategoryOne()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the GoodsCategoryOne dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCategoryOne
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_GOODSCATEGORYONE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("GoodsCategoryOne");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCategoryOne dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the GoodsCategoryOneByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCategoryOne and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.goodsCategoryOneByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCategoryOne dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCategoryTwo RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryTwo()
	{
		if (goodsCategoryTwo == null)
		{
			initialiseGoodsCategoryTwo();
		}
		return goodsCategoryTwo;
	}

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCategoryTwo RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryTwoByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (goodsCategoryTwoByParentId == null)
		{
			initialiseGoodsCategoryTwo();
		}
		
		if (parentId != null){
			returnValue = goodsCategoryTwoByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for GoodsCategoryTwo
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCategoryTwo()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the GoodsCategoryTwo dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCategoryTwo
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_GOODSCATEGORYTWO, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("GoodsCategoryTwo");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCategoryTwo dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the GoodsCategoryTwoByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCategoryTwo and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.goodsCategoryTwoByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCategoryTwo dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCondition RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCondition()
	{
		if (goodsCondition == null)
		{
			initialiseGoodsCondition();
		}
		return goodsCondition;
	}

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCondition RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsConditionByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (goodsConditionByParentId == null)
		{
			initialiseGoodsCondition();
		}
		
		if (parentId != null){
			returnValue = goodsConditionByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for GoodsCondition
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCondition()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the GoodsCondition dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCondition
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_GOODSCONDITION, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("GoodsCondition");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCondition dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the GoodsConditionByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCondition and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.goodsConditionByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCondition dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the OwnerOccupierType RefType
	 * @return
	 */
	public SortedMap<Long,String> getOwnerOccupierType()
	{
		if (ownerOccupierType == null)
		{
			initialiseOwnerOccupierType();
		}
		return ownerOccupierType;
	}

	/**
	 * Returns the Sorted Map that represents the values of the OwnerOccupierType RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getOwnerOccupierTypeByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (ownerOccupierTypeByParentId == null)
		{
			initialiseOwnerOccupierType();
		}
		
		if (parentId != null){
			returnValue = ownerOccupierTypeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for OwnerOccupierType
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseOwnerOccupierType()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the OwnerOccupierType dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc OwnerOccupierType
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_OWNEROCCUPIERTYPE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("OwnerOccupierType");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of OwnerOccupierType dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the OwnerOccupierTypeByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc OwnerOccupierType and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.ownerOccupierTypeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of OwnerOccupierType dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the Locale RefType
	 * @return
	 */
	public SortedMap<Long,String> getLocale()
	{
		if (locale == null)
		{
			initialiseLocale();
		}
		return locale;
	}

	/**
	 * Returns the Sorted Map that represents the values of the Locale RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getLocaleByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (localeByParentId == null)
		{
			initialiseLocale();
		}
		
		if (parentId != null){
			returnValue = localeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for Locale
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseLocale()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the Locale dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Locale
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_LOCALE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("Locale");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Locale dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the LocaleByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc Locale and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.localeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of Locale dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the UserRole RefType
	 * @return
	 */
	public SortedMap<Long,String> getUserRole()
	{
		if (userRole == null)
		{
			initialiseUserRole();
		}
		return userRole;
	}

	/**
	 * Returns the Sorted Map that represents the values of the UserRole RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getUserRoleByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (userRoleByParentId == null)
		{
			initialiseUserRole();
		}
		
		if (parentId != null){
			returnValue = userRoleByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for UserRole
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseUserRole()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the UserRole dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc UserRole
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_USERROLE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("UserRole");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of UserRole dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the UserRoleByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc UserRole and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.userRoleByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of UserRole dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the PledgeServiceLevelThree RefType
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelThree()
	{
		if (pledgeServiceLevelThree == null)
		{
			initialisePledgeServiceLevelThree();
		}
		return pledgeServiceLevelThree;
	}

	/**
	 * Returns the Sorted Map that represents the values of the PledgeServiceLevelThree RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getPledgeServiceLevelThreeByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (pledgeServiceLevelThreeByParentId == null)
		{
			initialisePledgeServiceLevelThree();
		}
		
		if (parentId != null){
			returnValue = pledgeServiceLevelThreeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for PledgeServiceLevelThree
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialisePledgeServiceLevelThree()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the PledgeServiceLevelThree dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc PledgeServiceLevelThree
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_PLEDGESERVICELEVELTHREE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("PledgeServiceLevelThree");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of PledgeServiceLevelThree dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the PledgeServiceLevelThreeByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc PledgeServiceLevelThree and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.pledgeServiceLevelThreeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of PledgeServiceLevelThree dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCategoryThree RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryThree()
	{
		if (goodsCategoryThree == null)
		{
			initialiseGoodsCategoryThree();
		}
		return goodsCategoryThree;
	}

	/**
	 * Returns the Sorted Map that represents the values of the GoodsCategoryThree RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsCategoryThreeByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (goodsCategoryThreeByParentId == null)
		{
			initialiseGoodsCategoryThree();
		}
		
		if (parentId != null){
			returnValue = goodsCategoryThreeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for GoodsCategoryThree
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsCategoryThree()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the GoodsCategoryThree dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCategoryThree
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_GOODSCATEGORYTHREE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("GoodsCategoryThree");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCategoryThree dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the GoodsCategoryThreeByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsCategoryThree and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.goodsCategoryThreeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsCategoryThree dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the GoodsSize RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsSize()
	{
		if (goodsSize == null)
		{
			initialiseGoodsSize();
		}
		return goodsSize;
	}

	/**
	 * Returns the Sorted Map that represents the values of the GoodsSize RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsSizeByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (goodsSizeByParentId == null)
		{
			initialiseGoodsSize();
		}
		
		if (parentId != null){
			returnValue = goodsSizeByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for GoodsSize
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsSize()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the GoodsSize dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsSize
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_GOODSSIZE, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("GoodsSize");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsSize dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the GoodsSizeByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsSize and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.goodsSizeByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsSize dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the GoodsQuantity RefType
	 * @return
	 */
	public SortedMap<Long,String> getGoodsQuantity()
	{
		if (goodsQuantity == null)
		{
			initialiseGoodsQuantity();
		}
		return goodsQuantity;
	}

	/**
	 * Returns the Sorted Map that represents the values of the GoodsQuantity RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getGoodsQuantityByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (goodsQuantityByParentId == null)
		{
			initialiseGoodsQuantity();
		}
		
		if (parentId != null){
			returnValue = goodsQuantityByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for GoodsQuantity
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseGoodsQuantity()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the GoodsQuantity dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsQuantity
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_GOODSQUANTITY, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("GoodsQuantity");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsQuantity dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the GoodsQuantityByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc GoodsQuantity and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.goodsQuantityByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of GoodsQuantity dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	/**
	 * Returns the Sorted Map that represents the values of the NewOrUsed RefType
	 * @return
	 */
	public SortedMap<Long,String> getNewOrUsed()
	{
		if (newOrUsed == null)
		{
			initialiseNewOrUsed();
		}
		return newOrUsed;
	}

	/**
	 * Returns the Sorted Map that represents the values of the NewOrUsed RefType
	 * sorted by parentId
	 * @return
	 */
	public SortedMap<Long,String> getNewOrUsedByParentId(Long parentId)
	{
		SortedMap<Long,String> returnValue = null;
		
		if (newOrUsedByParentId == null)
		{
			initialiseNewOrUsed();
		}
		
		if (parentId != null){
			returnValue = newOrUsedByParentId.get(parentId);
		}
		return returnValue;
	}
	
	
	/**
	 * Initialise the possible choices for NewOrUsed
	 * from the REFERENCE table
	 */ 
	public SortedMap<Long,String> initialiseNewOrUsed()
	{
		TreeMap<Long,String> map = new TreeMap<Long,String>();
		TreeMap<Long,TreeMap<Long,String>> parentIdMap = new TreeMap<Long,TreeMap<Long,String>>();
		List<Reference> referenceRecords = null;
		Reference dataRow = null;

		logger.debug("Initialising the NewOrUsed dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc NewOrUsed
			
			referenceRecords = this.referenceCategoryDao.getReferences(Constants.REFERENCE_CATEGORY_NEWORUSED, new Long(1));
			referenceRecords = this.referenceDao.listReferenceByRefType("NewOrUsed");
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				map.put(dataRow.getId(), dataRow.getRefDesc());
	        }
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of NewOrUsed dropdown buffer failed", ex);
		}
		
		logger.debug("Initialising the NewOrUsedByParentId dropdown buffer");
		
		try
		{
			// Load all values of referenceCategoryDesc NewOrUsed and sort by parentId
			Iterator<Reference> it = referenceRecords.iterator();
			
			while(it.hasNext())
	        {
				dataRow =(Reference)it.next();
				Long parentId = dataRow.getParentId();
				
				if (parentId != 0){
					if (parentIdMap.get(parentId) == null){
						parentIdMap.put(parentId, new TreeMap<Long,String>());
					}
	
					parentIdMap.get(parentId).put(dataRow.getId(), dataRow.getRefDesc());
				}
 	        }
 	        
 	        this.newOrUsedByParentId = parentIdMap;
		}
		catch(Exception ex)
		{
    		logger.error("Initialisation of NewOrUsed dropdown buffer failed", ex);
		}
		
		
		return map;
	}    
	
	

	
    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    public void clear()
    {
    	
    	logger.debug("Clearing IrelandCounty dropdown buffer in clear()");
        irelandCounty.clear();
		
    	logger.debug("Clearing AccommodationType dropdown buffer in clear()");
        accommodationType.clear();
		
    	logger.debug("Clearing AccommodationCondition dropdown buffer in clear()");
        accommodationCondition.clear();
		
    	logger.debug("Clearing NumberOfBeds dropdown buffer in clear()");
        numberOfBeds.clear();
		
    	logger.debug("Clearing VacantOrShared dropdown buffer in clear()");
        vacantOrShared.clear();
		
    	logger.debug("Clearing YouCanAccommodate dropdown buffer in clear()");
        youCanAccommodate.clear();
		
    	logger.debug("Clearing LocalAmenity dropdown buffer in clear()");
        localAmenity.clear();
		
    	logger.debug("Clearing MonthRange dropdown buffer in clear()");
        monthRange.clear();
		
    	logger.debug("Clearing Yes_No dropdown buffer in clear()");
        yes_No.clear();
		
    	logger.debug("Clearing EuropeCountry dropdown buffer in clear()");
        europeCountry.clear();
		
    	logger.debug("Clearing Facilities dropdown buffer in clear()");
        facilities.clear();
		
    	logger.debug("Clearing IntegerCount1to40 dropdown buffer in clear()");
        integerCount1to40.clear();
		
    	logger.debug("Clearing PledgeServiceLevelOne dropdown buffer in clear()");
        pledgeServiceLevelOne.clear();
		
    	logger.debug("Clearing PledgeServiceLevelTwo dropdown buffer in clear()");
        pledgeServiceLevelTwo.clear();
		
    	logger.debug("Clearing GoodsCategoryOne dropdown buffer in clear()");
        goodsCategoryOne.clear();
		
    	logger.debug("Clearing GoodsCategoryTwo dropdown buffer in clear()");
        goodsCategoryTwo.clear();
		
    	logger.debug("Clearing GoodsCondition dropdown buffer in clear()");
        goodsCondition.clear();
		
    	logger.debug("Clearing OwnerOccupierType dropdown buffer in clear()");
        ownerOccupierType.clear();
		
    	logger.debug("Clearing Locale dropdown buffer in clear()");
        locale.clear();
		
    	logger.debug("Clearing UserRole dropdown buffer in clear()");
        userRole.clear();
		
    	logger.debug("Clearing PledgeServiceLevelThree dropdown buffer in clear()");
        pledgeServiceLevelThree.clear();
		
    	logger.debug("Clearing GoodsCategoryThree dropdown buffer in clear()");
        goodsCategoryThree.clear();
		
    	logger.debug("Clearing GoodsSize dropdown buffer in clear()");
        goodsSize.clear();
		
    	logger.debug("Clearing GoodsQuantity dropdown buffer in clear()");
        goodsQuantity.clear();
		
    	logger.debug("Clearing NewOrUsed dropdown buffer in clear()");
        newOrUsed.clear();
		
        travelAbilities.clear();
        return;
    }    

    /**
     * Cleans up any Collection Objects created by the Class instance
     */
    protected void finalize() throws Throwable
    {
    	this.clear();
        return;
    }
    @Override
    public SortedMap<Long,String> getTravelAbilities()
	{
		if (travelAbilities == null)
		{
			initialiseTravelAbilities();
		}
		return travelAbilities;
	}

	@Override
	public SortedMap<Long, String> getPledgeStatuses() {
		if (pledgeStatuses == null)
		{
			initialisePledgeStatuses();
		}
		return pledgeStatuses;
	}
	
}
