package com.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;


public abstract class AbstractDao<PK extends Serializable, T> implements BaseDao<PK,T>{
	
	private final Class<T> persistentClass;
	
	@SuppressWarnings("unchecked")
	public AbstractDao(){
		this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	}
	
	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public T getByKey(PK key) {
		return (T) getSession().get(persistentClass, key);
	}

	public void persist(T entity) {
		getSession().persist(entity);
	}

	public void delete(T entity) {
		getSession().delete(entity);
	}
	
	public Criteria createEntityCriteria(){
		return getSession().createCriteria(persistentClass);
	}
	
	public Criteria createEntityCriteria(String name){
		return getSession().createCriteria(persistentClass, name);
	}

	public void saveOrUpdate(T entity) {
		getSession().saveOrUpdate(entity);
	}
	
	public List<T> findByCriteria(Criteria criteria){
		return (List<T>)criteria.list();
	}
	public T findByUniqueCriteria(Criteria criteria){
		return (T)criteria.uniqueResult();
	}
	
	public List<T> findByHQL(String query){
		return (List<T>)getSession().createQuery(query).list();
	}
	
	public List findBySQL(String query){
		return getSession().createSQLQuery(query).list();
	}
	
	public Criteria getExecutableCriteria(DetachedCriteria criteria)
	{
		return criteria.getExecutableCriteria(getSession());
	}

}
