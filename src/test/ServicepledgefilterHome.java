// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Servicepledgefilter.
 * @see .Servicepledgefilter
 * @author Hibernate Tools
 */
@Stateless
public class ServicepledgefilterHome {

	private static final Log log = LogFactory.getLog(ServicepledgefilterHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Servicepledgefilter transientInstance) {
		log.debug("persisting Servicepledgefilter instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Servicepledgefilter persistentInstance) {
		log.debug("removing Servicepledgefilter instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Servicepledgefilter merge(Servicepledgefilter detachedInstance) {
		log.debug("merging Servicepledgefilter instance");
		try {
			Servicepledgefilter result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Servicepledgefilter findById(long id) {
		log.debug("getting Servicepledgefilter instance with id: " + id);
		try {
			Servicepledgefilter instance = entityManager.find(Servicepledgefilter.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
