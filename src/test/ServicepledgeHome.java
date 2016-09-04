// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Servicepledge.
 * @see .Servicepledge
 * @author Hibernate Tools
 */
@Stateless
public class ServicepledgeHome {

	private static final Log log = LogFactory.getLog(ServicepledgeHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Servicepledge transientInstance) {
		log.debug("persisting Servicepledge instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Servicepledge persistentInstance) {
		log.debug("removing Servicepledge instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Servicepledge merge(Servicepledge detachedInstance) {
		log.debug("merging Servicepledge instance");
		try {
			Servicepledge result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Servicepledge findById(Long id) {
		log.debug("getting Servicepledge instance with id: " + id);
		try {
			Servicepledge instance = entityManager.find(Servicepledge.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
