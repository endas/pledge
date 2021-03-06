// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Registerofpledgesfilter.
 * @see .Registerofpledgesfilter
 * @author Hibernate Tools
 */
@Stateless
public class RegisterofpledgesfilterHome {

	private static final Log log = LogFactory.getLog(RegisterofpledgesfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Registerofpledgesfilter transientInstance) {
		log.debug("persisting Registerofpledgesfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Registerofpledgesfilter persistentInstance) {
		log.debug("removing Registerofpledgesfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Registerofpledgesfilter merge(Registerofpledgesfilter detachedInstance) {
		log.debug("merging Registerofpledgesfilter instance");
		try {
			Registerofpledgesfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Registerofpledgesfilter findById(long id) {
		log.debug("getting Registerofpledgesfilter instance with id: " + id);
		try {
			Registerofpledgesfilter instance = entityManager.find(Registerofpledgesfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
