// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Addresshistory.
 * @see .Addresshistory
 * @author Hibernate Tools
 */
@Stateless
public class AddresshistoryHome {

	private static final Log log = LogFactory.getLog(AddresshistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Addresshistory transientInstance) {
		log.debug("persisting Addresshistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Addresshistory persistentInstance) {
		log.debug("removing Addresshistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Addresshistory merge(Addresshistory detachedInstance) {
		log.debug("merging Addresshistory instance");
		try {
			Addresshistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Addresshistory findById(Long id) {
		log.debug("getting Addresshistory instance with id: " + id);
		try {
			Addresshistory instance = entityManager.find(Addresshistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
