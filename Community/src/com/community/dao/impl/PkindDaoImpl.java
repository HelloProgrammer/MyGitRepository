package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.PkindDao;
import com.community.model.Pkind;
import com.community.util.GetNewId;
import com.community.util.HibernateSessionFactory;

@Repository("pkindDao")
public class PkindDaoImpl implements PkindDao {

	@Override
	public void addPkind(Pkind pkind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			pkind.setPkindId(GetNewId.getNewPkindId()+"");
			session.save(pkind);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
	}

	@Override
	public List<Pkind> findPkindByName(Pkind pkind) {
		List<Pkind> pkinds = new ArrayList<Pkind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Pkind pkind where pkind.pkindName=?")
					      .setParameter(0, pkind.getPkindName());
			for (Object o : query.list()) {
				Pkind p = (Pkind)o;
				pkinds.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return pkinds;
	}

	@Override
	public List<Pkind> findPkindByName(String pkindName) {
		List<Pkind> pkinds = new ArrayList<Pkind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Pkind pkind where pkind.pkindName=?")
					      .setParameter(0, pkindName);
			for (Object o : query.list()) {
				Pkind p = (Pkind)o;
				pkinds.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return pkinds;
	}

	@Override
	public List<Pkind> findAllPkind() {
		List<Pkind> pkinds = new ArrayList<Pkind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Pkind pkind");
			for (Object o : query.list()) {
				Pkind p = (Pkind)o;
				pkinds.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return pkinds;
	}

	@Override
	public void deletePkind(Pkind pkind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from Pkind p where p.pkindId=?")
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
	public void delSelectKinds(String id) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from Pkind p where p.pkindId=?")
					      .setParameter(0,id);
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
	public void medifyPkind(Pkind pkind) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery
					      ("update Pkind p set p.pkindName=? where p.pkindId=?")
					      .setParameter(0, pkind.getPkindName())
					      .setParameter(1, pkind.getPkindId());
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
	public List<Pkind> findPkindById(Pkind pkind) {
		List<Pkind> pkinds = new ArrayList<Pkind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Pkind pkind where pkind.pkindId=?")
					      .setParameter(0, pkind.getPkindId());
			for (Object o : query.list()) {
				Pkind p = (Pkind)o;
				pkinds.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return pkinds;
	}

	@Override
	public List<Pkind> findPkindById(String pkindId) {
		List<Pkind> pkinds = new ArrayList<Pkind>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Pkind pkind where pkind.pkindId=?")
					      .setParameter(0, pkindId);
			for (Object o : query.list()) {
				Pkind p = (Pkind)o;
				pkinds.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return pkinds;
	}

}
