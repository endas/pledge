// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Referencefilter.
 * @see .Referencefilter
 * @author Hibernate Tools
 */
@Stateless
public class ReferencefilterHome {

	private static final Log log = LogFactory.getLog(ReferencefilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Referencefilter transientInstance) {
		log.debug("persisting Referencefilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Referencefilter persistentInstance) {
		log.debug("removing Referencefilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Referencefilter merge(Referencefilter detachedInstance) {
		log.debug("merging Referencefilter instance");
		try {
			Referencefilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Referencefilter findById(long id) {
		log.debug("getting Referencefilter instance with id: " + id);
		try {
			Referencefilter instance = entityManager.find(Referencefilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
