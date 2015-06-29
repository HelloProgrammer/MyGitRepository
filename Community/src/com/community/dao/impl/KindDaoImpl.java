package com.community.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.KindDao;
import com.community.model.Kind;
import com.community.model.Pkind;
import com.community.util.GetNewId;
import com.community.util.HibernateSessionFactory;

@Repository("kindDao")
public class KindDaoImpl implements KindDao {

	@Override
	public void addKind(Kind kind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			kind.setKindId(GetNewId.getNewKindId()+"");
			session.save(kind);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Kind> findKindByName(Kind kind) {
		List<Kind> kinds = new ArrayList<Kind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Kind kind where kind.kindName=?")
			              .setParameter(0, kind.getKindName());
			for(Object o : query.list()){
				Kind k = (Kind)o;
				kinds.add(k);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return kinds;
	}

	@Override
	public List<Kind> findKindByName(String kindName) {
		List<Kind> kinds = new ArrayList<Kind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Kind kind where kind.kindName=?")
			              .setParameter(0, kindName);
			for(Object o : query.list()){
				Kind k = (Kind)o;
				kinds.add(k);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return kinds;
	}

	@Override
	public List<Kind> findAllKind() {
		List<Kind> kinds = new ArrayList<Kind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Kind");
			for(Object o : query.list()){
				Kind k = (Kind)o;
				kinds.add(k);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return kinds;
	}
	
	@Override
	public void deleteKind(Kind kind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from Kind kind where kind.kindId=?")
					      .setParameter(0, kind.getKindId());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}
	
	@Override
	public void deleteKind(String kindid) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from Kind kind where kind.kindId=?")
					      .setParameter(0, kindid);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void medifyKind(Kind kind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update Kind kind set kind.kindName=?,kind.pkind.pkindId=? where kind.kindId=?")
					      .setParameter(0, kind.getKindName())
					      .setParameter(1, kind.getPkind().getPkindId())
					      .setParameter(2, kind.getKindId());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Kind> findKindById(Kind kind) {
		List<Kind> kinds = new ArrayList<Kind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Kind kind where kind.kindId=?")
			              .setParameter(0, kind.getKindId());
			for(Object o : query.list()){
				Kind k = (Kind)o;
				kinds.add(k);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return kinds;
	}

	@Override
	public void deleteKindByPkind(Pkind pkind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from Kind kind where kind.pkind.pkindId=?")
					      .setParameter(0, pkind.getPkindId());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Kind> findKindByPkindId(Pkind pkind) {
		List<Kind> kinds = new ArrayList<Kind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Kind kind where kind.pkind.pkindId=?")
			              .setParameter(0, pkind.getPkindId());
			for(Object o : query.list()){
				Kind k = (Kind)o;
				kinds.add(k);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return kinds;
	}

}
