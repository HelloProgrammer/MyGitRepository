package com.community.service;

import java.util.List;

import com.community.model.Pkind;

public interface PkindService {

	public void addPkind(Pkind pkind);
	public List<Pkind> findPkindByName(Pkind pkind);
	public List<Pkind> findPkindByName(String pkindName);
	public List<Pkind> findPkindById(Pkind pkind);
	public List<Pkind> findPkindById(String pkindId);
	public List<Pkind> findAllPkind();
	public void deletePkind(Pkind pkind);
	public void medifyPkind(Pkind pkind);
	public boolean delSelectKinds(String[] pds);
}
