// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Viewfilter.
 * @see .Viewfilter
 * @author Hibernate Tools
 */
@Stateless
public class ViewfilterHome {

	private static final Log log = LogFactory.getLog(ViewfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Viewfilter transientInstance) {
		log.debug("persisting Viewfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Viewfilter persistentInstance) {
		log.debug("removing Viewfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Viewfilter merge(Viewfilter detachedInstance) {
		log.debug("merging Viewfilter instance");
		try {
			Viewfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Viewfilter findById(long id) {
		log.debug("getting Viewfilter instance with id: " + id);
		try {
			Viewfilter instance = entityManager.find(Viewfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
