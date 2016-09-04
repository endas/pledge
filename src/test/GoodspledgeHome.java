// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Goodspledge.
 * @see .Goodspledge
 * @author Hibernate Tools
 */
@Stateless
public class GoodspledgeHome {

	private static final Log log = LogFactory.getLog(GoodspledgeHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Goodspledge transientInstance) {
		log.debug("persisting Goodspledge instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Goodspledge persistentInstance) {
		log.debug("removing Goodspledge instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Goodspledge merge(Goodspledge detachedInstance) {
		log.debug("merging Goodspledge instance");
		try {
			Goodspledge result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Goodspledge findById(Long id) {
		log.debug("getting Goodspledge instance with id: " + id);
		try {
			Goodspledge instance = entityManager.find(Goodspledge.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
