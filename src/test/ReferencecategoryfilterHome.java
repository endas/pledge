// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Referencecategoryfilter.
 * @see .Referencecategoryfilter
 * @author Hibernate Tools
 */
@Stateless
public class ReferencecategoryfilterHome {

	private static final Log log = LogFactory.getLog(ReferencecategoryfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Referencecategoryfilter transientInstance) {
		log.debug("persisting Referencecategoryfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Referencecategoryfilter persistentInstance) {
		log.debug("removing Referencecategoryfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Referencecategoryfilter merge(Referencecategoryfilter detachedInstance) {
		log.debug("merging Referencecategoryfilter instance");
		try {
			Referencecategoryfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Referencecategoryfilter findById(long id) {
		log.debug("getting Referencecategoryfilter instance with id: " + id);
		try {
			Referencecategoryfilter instance = entityManager.find(Referencecategoryfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
