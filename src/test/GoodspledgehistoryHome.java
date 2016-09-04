// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Goodspledgehistory.
 * @see .Goodspledgehistory
 * @author Hibernate Tools
 */
@Stateless
public class GoodspledgehistoryHome {

	private static final Log log = LogFactory.getLog(GoodspledgehistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Goodspledgehistory transientInstance) {
		log.debug("persisting Goodspledgehistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Goodspledgehistory persistentInstance) {
		log.debug("removing Goodspledgehistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Goodspledgehistory merge(Goodspledgehistory detachedInstance) {
		log.debug("merging Goodspledgehistory instance");
		try {
			Goodspledgehistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Goodspledgehistory findById(Long id) {
		log.debug("getting Goodspledgehistory instance with id: " + id);
		try {
			Goodspledgehistory instance = entityManager.find(Goodspledgehistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
