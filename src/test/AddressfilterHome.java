// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Addressfilter.
 * @see .Addressfilter
 * @author Hibernate Tools
 */
@Stateless
public class AddressfilterHome {

	private static final Log log = LogFactory.getLog(AddressfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Addressfilter transientInstance) {
		log.debug("persisting Addressfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Addressfilter persistentInstance) {
		log.debug("removing Addressfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Addressfilter merge(Addressfilter detachedInstance) {
		log.debug("merging Addressfilter instance");
		try {
			Addressfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Addressfilter findById(long id) {
		log.debug("getting Addressfilter instance with id: " + id);
		try {
			Addressfilter instance = entityManager.find(Addressfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
