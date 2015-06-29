package com.community.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.KindDao;
import com.community.model.Kind;
import com.community.model.Pkind;
import com.community.service.KindService;

@Service("kindService")
public class KindServiceImpl implements KindService {

	private KindDao kindDao;
	
	public KindDao getKindDao() {
		return kindDao;
	}
    @Resource(name="kindDao")
	public void setKindDao(KindDao kindDao) {
		this.kindDao = kindDao;
	}

	@Override
	public void addKind(Kind kind) {
		kindDao.addKind(kind);
	}
	@Override
	public List<Kind> findKindByName(Kind kind) {
		List<Kind> kinds = kindDao.findKindByName(kind);
		return kinds;
	}
	@Override
	public List<Kind> findKindByName(String kindName) {
		List<Kind> kinds = kindDao.findKindByName(kindName);
		return kinds;
	}
	@Override
	public List<Kind> findAllKind() {
		List<Kind> kinds = kindDao.findAllKind();
		return kinds;
	}
	@Override
	public void deleteKind(Kind kind) {
		kindDao.deleteKind(kind);
	}
	@Override
	public void medifyKind(Kind kind) {
		kindDao.medifyKind(kind);
	}
	@Override
	public List<Kind> findKindById(Kind kind) {
		List<Kind> kinds = kindDao.findKindById(kind);
		return kinds;
	}
	@Override
	public List<Kind> findKindByPkindId(Pkind pkind) {
		List<Kind> kinds = kindDao.findKindByPkindId(pkind);
		return kinds;
	}
	@Override
	public boolean delSelectKinds(String[] sds) {
		// TODO Auto-generated method stub
		System.out.println("------------------------------"+sds.length);
		for(int i=0;i<sds.length;i++)
		{
			System.out.println("-------------------"+sds[i]);
			kindDao.deleteKind(sds[i]);
		}
		
		
		return true;
	}
	
}
