// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Applicationuser.
 * @see .Applicationuser
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserHome {

	private static final Log log = LogFactory.getLog(ApplicationuserHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Applicationuser transientInstance) {
		log.debug("persisting Applicationuser instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Applicationuser persistentInstance) {
		log.debug("removing Applicationuser instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Applicationuser merge(Applicationuser detachedInstance) {
		log.debug("merging Applicationuser instance");
		try {
			Applicationuser result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Applicationuser findById(Long id) {
		log.debug("getting Applicationuser instance with id: " + id);
		try {
			Applicationuser instance = entityManager.find(Applicationuser.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
