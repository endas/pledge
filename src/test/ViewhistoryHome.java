// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Viewhistory.
 * @see .Viewhistory
 * @author Hibernate Tools
 */
@Stateless
public class ViewhistoryHome {

	private static final Log log = LogFactory.getLog(ViewhistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Viewhistory transientInstance) {
		log.debug("persisting Viewhistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Viewhistory persistentInstance) {
		log.debug("removing Viewhistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Viewhistory merge(Viewhistory detachedInstance) {
		log.debug("merging Viewhistory instance");
		try {
			Viewhistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Viewhistory findById(Long id) {
		log.debug("getting Viewhistory instance with id: " + id);
		try {
			Viewhistory instance = entityManager.find(Viewhistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
