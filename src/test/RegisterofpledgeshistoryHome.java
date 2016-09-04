// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Registerofpledgeshistory.
 * @see .Registerofpledgeshistory
 * @author Hibernate Tools
 */
@Stateless
public class RegisterofpledgeshistoryHome {

	private static final Log log = LogFactory.getLog(RegisterofpledgeshistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Registerofpledgeshistory transientInstance) {
		log.debug("persisting Registerofpledgeshistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Registerofpledgeshistory persistentInstance) {
		log.debug("removing Registerofpledgeshistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Registerofpledgeshistory merge(Registerofpledgeshistory detachedInstance) {
		log.debug("merging Registerofpledgeshistory instance");
		try {
			Registerofpledgeshistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Registerofpledgeshistory findById(Long id) {
		log.debug("getting Registerofpledgeshistory instance with id: " + id);
		try {
			Registerofpledgeshistory instance = entityManager.find(Registerofpledgeshistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
