// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Messageresource.
 * @see .Messageresource
 * @author Hibernate Tools
 */
@Stateless
public class MessageresourceHome {

	private static final Log log = LogFactory.getLog(MessageresourceHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Messageresource transientInstance) {
		log.debug("persisting Messageresource instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Messageresource persistentInstance) {
		log.debug("removing Messageresource instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Messageresource merge(Messageresource detachedInstance) {
		log.debug("merging Messageresource instance");
		try {
			Messageresource result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Messageresource findById(Long id) {
		log.debug("getting Messageresource instance with id: " + id);
		try {
			Messageresource instance = entityManager.find(Messageresource.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
