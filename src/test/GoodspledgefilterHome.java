// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Goodspledgefilter.
 * @see .Goodspledgefilter
 * @author Hibernate Tools
 */
@Stateless
public class GoodspledgefilterHome {

	private static final Log log = LogFactory.getLog(GoodspledgefilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Goodspledgefilter transientInstance) {
		log.debug("persisting Goodspledgefilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Goodspledgefilter persistentInstance) {
		log.debug("removing Goodspledgefilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Goodspledgefilter merge(Goodspledgefilter detachedInstance) {
		log.debug("merging Goodspledgefilter instance");
		try {
			Goodspledgefilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Goodspledgefilter findById(long id) {
		log.debug("getting Goodspledgefilter instance with id: " + id);
		try {
			Goodspledgefilter instance = entityManager.find(Goodspledgefilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
