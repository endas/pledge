// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Applicationuserdetails.
 * @see .Applicationuserdetails
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserdetailsHome {

	private static final Log log = LogFactory.getLog(ApplicationuserdetailsHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Applicationuserdetails transientInstance) {
		log.debug("persisting Applicationuserdetails instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Applicationuserdetails persistentInstance) {
		log.debug("removing Applicationuserdetails instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Applicationuserdetails merge(Applicationuserdetails detachedInstance) {
		log.debug("merging Applicationuserdetails instance");
		try {
			Applicationuserdetails result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Applicationuserdetails findById(long id) {
		log.debug("getting Applicationuserdetails instance with id: " + id);
		try {
			Applicationuserdetails instance = entityManager.find(Applicationuserdetails.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
