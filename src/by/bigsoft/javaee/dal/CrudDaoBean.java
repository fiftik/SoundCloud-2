package by.bigsoft.javaee.dal;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.bigsoft.javaee.dal.CrudDao;
import by.bigsoft.javaee.entity.User;
import by.bigsoft.javaee.hibUtil.HibernateUtil;

/**
 * Hibernate crud dao interface implementation
 * 
 * @author harchevnikov_m Date: 18.09.11 Time: 21:20
 */
@Repository
@Transactional
public class CrudDaoBean implements CrudDao {
	
	@Autowired(required=false)
	private SessionFactory sessionFactory;

	/**
	 * Default constructor
	 */
	public CrudDaoBean() {
	}

	@SuppressWarnings("unchecked")
	public <T> T merge(T t) {
		return (T) currentSession().merge(t);
	}

	@SuppressWarnings("unchecked")
	public <T, PK extends Serializable> T find(Class<T> type, PK id) {
		return (T) currentSession().get(type, id);
	}

	public <T, PK extends Serializable> void delete(Class<T> type, PK id) {
		Session currentSession = currentSession();
		Object object = currentSession.get(type, id);
		currentSession.delete(object);
	}

	@SuppressWarnings({ "unchecked" })
	public <T> List<T> list(Class<T> type) {
		return currentSession().createCriteria(type).list();
	}

	private Session currentSession() {
		Session currentSession = sessionFactory.getCurrentSession();
		// Session currentSession = sessionFactory.openSession();
		return currentSession;
	}
	
}