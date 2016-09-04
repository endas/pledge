// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Landing.
 * @see .Landing
 * @author Hibernate Tools
 */
@Stateless
public class LandingHome {

	private static final Log log = LogFactory.getLog(LandingHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Landing transientInstance) {
		log.debug("persisting Landing instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Landing persistentInstance) {
		log.debug("removing Landing instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Landing merge(Landing detachedInstance) {
		log.debug("merging Landing instance");
		try {
			Landing result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Landing findById(Long id) {
		log.debug("getting Landing instance with id: " + id);
		try {
			Landing instance = entityManager.find(Landing.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
