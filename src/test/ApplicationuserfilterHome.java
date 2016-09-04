// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Applicationuserfilter.
 * @see .Applicationuserfilter
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserfilterHome {

	private static final Log log = LogFactory.getLog(ApplicationuserfilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Applicationuserfilter transientInstance) {
		log.debug("persisting Applicationuserfilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Applicationuserfilter persistentInstance) {
		log.debug("removing Applicationuserfilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Applicationuserfilter merge(Applicationuserfilter detachedInstance) {
		log.debug("merging Applicationuserfilter instance");
		try {
			Applicationuserfilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Applicationuserfilter findById(long id) {
		log.debug("getting Applicationuserfilter instance with id: " + id);
		try {
			Applicationuserfilter instance = entityManager.find(Applicationuserfilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
