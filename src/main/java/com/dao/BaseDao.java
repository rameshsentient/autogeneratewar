package com.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;


public interface BaseDao<PK extends Serializable, T> {
	public T getByKey(PK key);
	public void persist(T entity);
	public void delete(T entity);
	public Criteria createEntityCriteria();
	public void saveOrUpdate(T entity);
	public List<T> findByCriteria(Criteria criteria);
	public T findByUniqueCriteria(Criteria criteria);	
	public List<T> findByHQL(String query);
	public List findBySQL(String query);
	public Criteria createEntityCriteria(String name);
	public Criteria getExecutableCriteria(DetachedCriteria criteria);
}
