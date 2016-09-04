// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Landinghistory.
 * @see .Landinghistory
 * @author Hibernate Tools
 */
@Stateless
public class LandinghistoryHome {

	private static final Log log = LogFactory.getLog(LandinghistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Landinghistory transientInstance) {
		log.debug("persisting Landinghistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Landinghistory persistentInstance) {
		log.debug("removing Landinghistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Landinghistory merge(Landinghistory detachedInstance) {
		log.debug("merging Landinghistory instance");
		try {
			Landinghistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Landinghistory findById(Long id) {
		log.debug("getting Landinghistory instance with id: " + id);
		try {
			Landinghistory instance = entityManager.find(Landinghistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
