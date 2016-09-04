// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Accommodationpledge.
 * @see .Accommodationpledge
 * @author Hibernate Tools
 */
@Stateless
public class AccommodationpledgeHome {

	private static final Log log = LogFactory.getLog(AccommodationpledgeHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Accommodationpledge transientInstance) {
		log.debug("persisting Accommodationpledge instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Accommodationpledge persistentInstance) {
		log.debug("removing Accommodationpledge instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Accommodationpledge merge(Accommodationpledge detachedInstance) {
		log.debug("merging Accommodationpledge instance");
		try {
			Accommodationpledge result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Accommodationpledge findById(Long id) {
		log.debug("getting Accommodationpledge instance with id: " + id);
		try {
			Accommodationpledge instance = entityManager.find(Accommodationpledge.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
