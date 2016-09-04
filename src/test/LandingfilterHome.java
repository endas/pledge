// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Landingfilter.
 * @see .Landingfilter
 * @author Hibernate Tools
 */
@Stateless
public class LandingfilterHome {

	private static final Log log = LogFactory.getLog(LandingfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Landingfilter transientInstance) {
		log.debug("persisting Landingfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Landingfilter persistentInstance) {
		log.debug("removing Landingfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Landingfilter merge(Landingfilter detachedInstance) {
		log.debug("merging Landingfilter instance");
		try {
			Landingfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Landingfilter findById(long id) {
		log.debug("getting Landingfilter instance with id: " + id);
		try {
			Landingfilter instance = entityManager.find(Landingfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
