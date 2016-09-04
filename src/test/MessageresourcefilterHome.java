// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Messageresourcefilter.
 * @see .Messageresourcefilter
 * @author Hibernate Tools
 */
@Stateless
public class MessageresourcefilterHome {

	private static final Log log = LogFactory.getLog(MessageresourcefilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Messageresourcefilter transientInstance) {
		log.debug("persisting Messageresourcefilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Messageresourcefilter persistentInstance) {
		log.debug("removing Messageresourcefilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Messageresourcefilter merge(Messageresourcefilter detachedInstance) {
		log.debug("merging Messageresourcefilter instance");
		try {
			Messageresourcefilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Messageresourcefilter findById(long id) {
		log.debug("getting Messageresourcefilter instance with id: " + id);
		try {
			Messageresourcefilter instance = entityManager.find(Messageresourcefilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
