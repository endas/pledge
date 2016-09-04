// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Referencecategory.
 * @see .Referencecategory
 * @author Hibernate Tools
 */
@Stateless
public class ReferencecategoryHome {

	private static final Log log = LogFactory.getLog(ReferencecategoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Referencecategory transientInstance) {
		log.debug("persisting Referencecategory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Referencecategory persistentInstance) {
		log.debug("removing Referencecategory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Referencecategory merge(Referencecategory detachedInstance) {
		log.debug("merging Referencecategory instance");
		try {
			Referencecategory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Referencecategory findById(Long id) {
		log.debug("getting Referencecategory instance with id: " + id);
		try {
			Referencecategory instance = entityManager.find(Referencecategory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
