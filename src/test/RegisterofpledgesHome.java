// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Registerofpledges.
 * @see .Registerofpledges
 * @author Hibernate Tools
 */
@Stateless
public class RegisterofpledgesHome {

	private static final Log log = LogFactory.getLog(RegisterofpledgesHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Registerofpledges transientInstance) {
		log.debug("persisting Registerofpledges instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Registerofpledges persistentInstance) {
		log.debug("removing Registerofpledges instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Registerofpledges merge(Registerofpledges detachedInstance) {
		log.debug("merging Registerofpledges instance");
		try {
			Registerofpledges result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Registerofpledges findById(Long id) {
		log.debug("getting Registerofpledges instance with id: " + id);
		try {
			Registerofpledges instance = entityManager.find(Registerofpledges.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
