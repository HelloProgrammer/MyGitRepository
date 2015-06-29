package com.community.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.KindDao;
import com.community.dao.PkindDao;
import com.community.model.Pkind;
import com.community.service.PkindService;

@Service("pkindService")
public class PkindServiceImpl implements PkindService {

	private PkindDao pkindDao;
	private KindDao kindDao;
	
	public PkindDao getPkindDao() {
		return pkindDao;
	}
    @Resource(name="pkindDao")
	public void setPkindDao(PkindDao pkindDao) {
		this.pkindDao = pkindDao;
	}
	public KindDao getKindDao() {
		return kindDao;
	}
	@Resource(name="kindDao")
	public void setKindDao(KindDao kindDao) {
		this.kindDao = kindDao;
	}
	
	@Override
	public void addPkind(Pkind pkind) {
		pkindDao.addPkind(pkind);
	}
	@Override
	public List<Pkind> findPkindByName(Pkind pkind) {
		List<Pkind> pkinds = pkindDao.findPkindByName(pkind);
		return pkinds;
	}
	@Override
	public List<Pkind> findPkindByName(String pkindName) {
		List<Pkind> pkinds = pkindDao.findPkindByName(pkindName);
		return pkinds;
	}
	@Override
	public List<Pkind> findAllPkind() {
		List<Pkind> pkinds = pkindDao.findAllPkind();
		return pkinds;
	}
	@Override
	public void deletePkind(Pkind pkind) {
		kindDao.deleteKindByPkind(pkind);
		pkindDao.deletePkind(pkind);
	}
	@Override
	public void medifyPkind(Pkind pkind) {
		pkindDao.medifyPkind(pkind);
	}
	@Override
	public List<Pkind> findPkindById(Pkind pkind) {
		List<Pkind> pkinds = pkindDao.findPkindById(pkind);
		return pkinds;
	}
	@Override
	public List<Pkind> findPkindById(String pkindId) {
		List<Pkind> pkinds = pkindDao.findPkindById(pkindId);
		return pkinds;
	}
	@Override
	public boolean delSelectKinds(String[] pds) {
		// TODO Auto-generated method stub
		for(int i=0;i<pds.length;i++)
		{
			pkindDao.delSelectKinds(pds[i]);
		}
		return true;
	}
	

}
