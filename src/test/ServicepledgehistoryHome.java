// default package
// Generated Jul 14, 2016 11:10:18 PM by Hibernate Tools 5.1.0.Alpha1

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Servicepledgehistory.
 * @see .Servicepledgehistory
 * @author Hibernate Tools
 */
@Stateless
public class ServicepledgehistoryHome {

	private static final Log log = LogFactory.getLog(ServicepledgehistoryHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Servicepledgehistory transientInstance) {
		log.debug("persisting Servicepledgehistory instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Servicepledgehistory persistentInstance) {
		log.debug("removing Servicepledgehistory instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Servicepledgehistory merge(Servicepledgehistory detachedInstance) {
		log.debug("merging Servicepledgehistory instance");
		try {
			Servicepledgehistory result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Servicepledgehistory findById(Long id) {
		log.debug("getting Servicepledgehistory instance with id: " + id);
		try {
			Servicepledgehistory instance = entityManager.find(Servicepledgehistory.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
