// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Applicationuserhistory.
 * @see .Applicationuserhistory
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserhistoryHome {

	private static final Log log = LogFactory.getLog(ApplicationuserhistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Applicationuserhistory transientInstance) {
		log.debug("persisting Applicationuserhistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Applicationuserhistory persistentInstance) {
		log.debug("removing Applicationuserhistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Applicationuserhistory merge(Applicationuserhistory detachedInstance) {
		log.debug("merging Applicationuserhistory instance");
		try {
			Applicationuserhistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Applicationuserhistory findById(Long id) {
		log.debug("getting Applicationuserhistory instance with id: " + id);
		try {
			Applicationuserhistory instance = entityManager.find(Applicationuserhistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
