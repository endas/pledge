// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Messageresourcehistory.
 * @see .Messageresourcehistory
 * @author Hibernate Tools
 */
@Stateless
public class MessageresourcehistoryHome {

	private static final Log log = LogFactory.getLog(MessageresourcehistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Messageresourcehistory transientInstance) {
		log.debug("persisting Messageresourcehistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Messageresourcehistory persistentInstance) {
		log.debug("removing Messageresourcehistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Messageresourcehistory merge(Messageresourcehistory detachedInstance) {
		log.debug("merging Messageresourcehistory instance");
		try {
			Messageresourcehistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Messageresourcehistory findById(Long id) {
		log.debug("getting Messageresourcehistory instance with id: " + id);
		try {
			Messageresourcehistory instance = entityManager.find(Messageresourcehistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
