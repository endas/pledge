// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Applicationuserdetailshistory.
 * @see .Applicationuserdetailshistory
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserdetailshistoryHome {

	private static final Log log = LogFactory.getLog(ApplicationuserdetailshistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Applicationuserdetailshistory transientInstance) {
		log.debug("persisting Applicationuserdetailshistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Applicationuserdetailshistory persistentInstance) {
		log.debug("removing Applicationuserdetailshistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Applicationuserdetailshistory merge(Applicationuserdetailshistory detachedInstance) {
		log.debug("merging Applicationuserdetailshistory instance");
		try {
			Applicationuserdetailshistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Applicationuserdetailshistory findById(Long id) {
		log.debug("getting Applicationuserdetailshistory instance with id: " + id);
		try {
			Applicationuserdetailshistory instance = entityManager.find(Applicationuserdetailshistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
