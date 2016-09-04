// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Referencehistory.
 * @see .Referencehistory
 * @author Hibernate Tools
 */
@Stateless
public class ReferencehistoryHome {

	private static final Log log = LogFactory.getLog(ReferencehistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Referencehistory transientInstance) {
		log.debug("persisting Referencehistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Referencehistory persistentInstance) {
		log.debug("removing Referencehistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Referencehistory merge(Referencehistory detachedInstance) {
		log.debug("merging Referencehistory instance");
		try {
			Referencehistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Referencehistory findById(Long id) {
		log.debug("getting Referencehistory instance with id: " + id);
		try {
			Referencehistory instance = entityManager.find(Referencehistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
