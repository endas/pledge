// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class ApplicationuserUserroles.
 * @see .ApplicationuserUserroles
 * @author Hibernate Tools
 */
@Stateless
public class ApplicationuserUserrolesHome {

	private static final Log log = LogFactory.getLog(ApplicationuserUserrolesHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(ApplicationuserUserroles transientInstance) {
		log.debug("persisting ApplicationuserUserroles instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(ApplicationuserUserroles persistentInstance) {
		log.debug("removing ApplicationuserUserroles instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public ApplicationuserUserroles merge(ApplicationuserUserroles detachedInstance) {
		log.debug("merging ApplicationuserUserroles instance");
		try {
			ApplicationuserUserroles result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ApplicationuserUserroles findById(ApplicationuserUserrolesId id) {
		log.debug("getting ApplicationuserUserroles instance with id: " + id);
		try {
			ApplicationuserUserroles instance = entityManager.find(ApplicationuserUserroles.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
