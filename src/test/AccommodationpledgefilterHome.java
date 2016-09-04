// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Accommodationpledgefilter.
 * @see .Accommodationpledgefilter
 * @author Hibernate Tools
 */
@Stateless
public class AccommodationpledgefilterHome {

	private static final Log log = LogFactory.getLog(AccommodationpledgefilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Accommodationpledgefilter transientInstance) {
		log.debug("persisting Accommodationpledgefilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Accommodationpledgefilter persistentInstance) {
		log.debug("removing Accommodationpledgefilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Accommodationpledgefilter merge(Accommodationpledgefilter detachedInstance) {
		log.debug("merging Accommodationpledgefilter instance");
		try {
			Accommodationpledgefilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Accommodationpledgefilter findById(long id) {
		log.debug("getting Accommodationpledgefilter instance with id: " + id);
		try {
			Accommodationpledgefilter instance = entityManager.find(Accommodationpledgefilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
