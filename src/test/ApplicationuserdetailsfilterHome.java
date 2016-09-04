// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Applicationuserdetailsfilter.
 * @see .Applicationuserdetailsfilter
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserdetailsfilterHome {

	private static final Log log = LogFactory.getLog(ApplicationuserdetailsfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Applicationuserdetailsfilter transientInstance) {
		log.debug("persisting Applicationuserdetailsfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Applicationuserdetailsfilter persistentInstance) {
		log.debug("removing Applicationuserdetailsfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Applicationuserdetailsfilter merge(Applicationuserdetailsfilter detachedInstance) {
		log.debug("merging Applicationuserdetailsfilter instance");
		try {
			Applicationuserdetailsfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Applicationuserdetailsfilter findById(long id) {
		log.debug("getting Applicationuserdetailsfilter instance with id: " + id);
		try {
			Applicationuserdetailsfilter instance = entityManager.find(Applicationuserdetailsfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
